class User < ActiveRecord::Base
  has_secure_password

  attr_accessor :current_password


  has_many :posts,    dependent: :nullify
  has_many :comments, dependent: :nullify

  has_many :favourites, dependent: :destroy
  has_many :favourited_posts, through: :favourites, source: :post

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true,
            format:  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
            unless:   :from_omniauth?

  serialize :twitter_raw_data

  def full_name
    "#{first_name} #{last_name}"
  end

  def generate_password_reset_data
    generate_password_reset_token
    self.password_reset_requested_at = Time.now
    save
  end

  def password_reset_expired?
    password_reset_requested_at <= 60.minutes.ago
  end

  private

  def generate_password_reset_token
    begin
      self.password_reset_token = SecureRandom.hex(32)
    end while User.exists?(password_reset_token: self.password_reset_token)
  end

  def from_omniauth?
    uid.present? && provider.present?
  end

  def self.find_from_omniauth(omniauth_data)
  User.where(provider: omniauth_data["provider"],
             uid:      omniauth_data["uid"]).first
           end

  def self.create_from_omniauth(omniauth_data)
    full_name = omniauth_data["info"]["name"].split
    User.create(uid:                      omniauth_data["uid"],
                provider:                 omniauth_data["provider"],
                first_name:               full_name[0],
                last_name:                full_name[1],
                twitter_consumer_token:   omniauth_data["credentials"]["token"],
                twitter_consumer_secret:  omniauth_data["credentials"]["secret"],
                twitter_raw_data:         omniauth_data,
                password:                 SecureRandom.hex(16)
                )
  end


end

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
            format:  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i



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



end

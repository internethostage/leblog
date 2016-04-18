class User < ActiveRecord::Base
  has_secure_password

  # attr_accessor :current_password

  #validate current password when the user is updated
  # validate :current_password_is_correct, on: :update

  has_many :posts,    dependent: :nullify
  has_many :comments, dependent: :nullify


  validates :email, presence: true, uniqueness: true,
            format:  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i



  def full_name
    "#{first_name} #{last_name}"
  end

end

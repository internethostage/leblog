class User < ActiveRecord::Base
  has_secure_password

  attr_accessor :current_password

  #validate current password when the user is updated
  validate :current_password_is_correct, on: :update

  has_many :posts,    dependent: :nullify
  has_many :comments, dependent: :nullify

  has_many :favourites, dependent: :destroy
  has_many :favourited_posts, through: :favourites, source: :post


  validates :email, presence: true, uniqueness: true,
            format:  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i



  def full_name
    "#{first_name} #{last_name}"
  end

  # Check if the inputted current password is correct when the user tries to update the password
  def current_password_is_correct
    # Check if the user tried changing password
    if !password.blank?
      #Get a reference to the user since "authenticate" method always returns false when calling on itself
      user = User.find_by_id(id)

      # Check if the user cannot be authenticated with the entered current password
      if (user.authenticate(current_password) == false)
        #Add an error stating that the current password is incorrect
        errors.add(:current_password, "is incorrect.")
      end
    end
  end


end

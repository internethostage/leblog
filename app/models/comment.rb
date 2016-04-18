class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

# This validates that the comment isn't blank and that the comment hasn't been added before
validates :body, {presence: {message: "can't be blank!"}, uniqueness: {message: "already exists, please try a different one!"}}

  def user_full_name
    user ? user.full_name : ""
  end

end

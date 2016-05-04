class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :user

  has_many :comments, dependent: :destroy

  has_many :favourites, dependent: :destroy
  has_many :users, through: :favourites

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings


# This validation ensures that there is a title added and that it doesn't already exist
validates :title, {presence: {message: "can't be blank!"}, length: { minimum: 7 }, uniqueness: {message: "already exists, please try a different one!"}}
validates :body, {presence: {message: "can't be blank!"}}


# Implement the ability to search for a project by a search field that matches with either the title or body of the blog.
  def self.search(search_term)
    where(["title ILIKE ? OR body ILIKE ?" , "%#{search_term}%", "%#{search_term}%"])
  end

# Test drive a method `body_snippet` method that returns a maximum of a 100 characters with "..." of the body if it's more than a 100 characters long.


  def body_snippet
    if body && body.length > 100
      body[0..100] + "..."
    else
      body
    end
  end

  def user_full_name
    user ? user.full_name : ""
  end

  def favourited_by?(user)
  favourites.find_by_user_id(user.id).present?
  end

  def favourites_for(user)
  favourites.find_by_user_id user if user
  end


end

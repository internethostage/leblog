class Post < ActiveRecord::Base


# This validation ensures that there is a title added and that it doesn't already exist
validates :title, {presence: {message: "can't be blank!"}, uniqueness: {message: "already exists, please try a different one!"}}


# Implement the ability to search for a project by a search field that matches with either the title or body of the blog.
 def self.search(search_term)
   where(["title ILIKE ? OR body ILIKE ?" , "%#{search_term}%", "%#{search_term}%"])
 end




end

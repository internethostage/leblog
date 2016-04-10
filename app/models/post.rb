class Post < ActiveRecord::Base


# This validation ensures that there is a title added and that it doesn't already exist
validates :title, {presence: {message: "can't be blank!"}, uniqueness: {message: "already exists, please try a different one!"}}


end

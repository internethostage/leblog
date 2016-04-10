class Comment < ActiveRecord::Base

# This validates that the comment isn't blank and that the comment hasn't been added before
validates :body, {presence: {message: "can't be blank!"}, uniqueness: {message: "already exists, please try a different one!"}}


end

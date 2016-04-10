class Category < ActiveRecord::Base

# This validation ensures that there is a title when adding a category
validates :title, presence: true

end

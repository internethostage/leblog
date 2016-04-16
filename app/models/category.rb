class Category < ActiveRecord::Base
  has_many :posts, dependent: :nullify


# This validation ensures that there is a title when adding a category
validates :title, presence: true, uniqueness: true

end

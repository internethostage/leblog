class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :post

  validates :post_id, uniqueness: {scope: :tag_id}
end

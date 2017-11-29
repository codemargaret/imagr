class Comment < ApplicationRecord
  belongs_to :image
  belongs_to :user

  validates :body, :presence => true

  validates :image_id, :presence => true

  validates :user_id, :presence => true
end

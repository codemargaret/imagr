class Comment < ApplicationRecord
  belongs_to :image
  belongs_to :user
  has_many :favorites

  validates :body, :presence => true

  validates :image_id, :presence => true

  validates :user_id, :presence => true
end

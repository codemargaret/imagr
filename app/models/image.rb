class Image < ApplicationRecord
  belongs_to :user
  has_many :tags
  has_many :comments
  has_many :favorites

  validates :title, :presence => true

  validates :user_id, :presence => true
end

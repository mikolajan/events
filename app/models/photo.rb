class Photo < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :event, :user, :photo, presence: true

  mount_uploader :photo, PhotoUploader

  scope :persisted, -> { where.not(id: nil) }
end

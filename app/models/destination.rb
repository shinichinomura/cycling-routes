class Destination < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader

  has_many :destination_spots
  has_many :spots, through: :destination_spots
end

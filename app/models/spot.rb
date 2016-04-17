class Spot < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
end

class Destination < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
end

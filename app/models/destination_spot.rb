class DestinationSpot < ActiveRecord::Base
  belongs_to :destination
  belongs_to :spot
end

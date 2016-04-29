class Destination < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader

  has_many :destination_spots
  has_many :spots, through: :destination_spots

  def short_description(min_length: 100)
    if description.length < min_length
      description
    else
      index = description.index('。', 100)

      if index
        description[0 .. index]
      else
        description[0 .. 100] + '...'
      end
    end
  end
end

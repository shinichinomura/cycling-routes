class Article < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader

  has_many :article_destinations

  has_many :destinations,
    -> { order('article_destinations.display_order') },
    through: :article_destinations
end

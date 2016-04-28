class ArticleDestination < ActiveRecord::Base
  belongs_to :article
  belongs_to :destination
end

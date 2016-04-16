ActiveAdmin.register Destination do
  permit_params :name, :address, :latitude, :longitude, :description, :photo
end

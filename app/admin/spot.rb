ActiveAdmin.register Spot do
  permit_params :name, :description, :photo, :url
end

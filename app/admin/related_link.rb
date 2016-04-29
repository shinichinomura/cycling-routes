ActiveAdmin.register RelatedLink do
  permit_params :destination_id, :url, :title, :description, :display_order
end

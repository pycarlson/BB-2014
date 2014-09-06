json.array!(@adoptions) do |adoption|
  json.extract! adoption, :id, :drive_id, :user_id, :family_id, :full_name, :street, :city, :state, :zip, :phone, :company, :drop_location_id, :drop_date_id
  json.url adoption_url(adoption, format: :json)
end

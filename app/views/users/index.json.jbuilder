json.array!(@users) do |user|
  json.extract! usern, :id, :first_name, :last_name, :email, :street, :city, :state, :zip, :phone, :company, :drop_location_id, :drop_date_id
 
end

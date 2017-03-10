if @language == "en"
  json.spots @spots, :en_name, :en_address, :distance
else
  json.spots @spots, :name, :address, :distance
end

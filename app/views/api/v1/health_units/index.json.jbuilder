json.current_page @pagination_page
json.per_page @pagination_per_page
json.total_entries @ubs.count
json.entries @ubs do |u|
  json.id u.id
  json.name u.name
  json.address u.address
  json.city u.city
  json.phone u.phone
  json.geocode do
    json.lat u.geocode.lat
    json.long u.geocode.long
  end
  json.scores do
    json.size u.score.size_before_type_cast
    json.adaptation_for_senior u.score.adaptation_for_seniors_before_type_cast
    json.medical_equipament u.score.medical_equipament_before_type_cast
    json.medicine u.score.medicine_before_type_cast
  end
end
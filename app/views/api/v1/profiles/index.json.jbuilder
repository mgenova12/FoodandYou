json.array! @profiles.each do |profile|
  json.id profile.id
  json.height profile.height
  json.weight profile.weight
  json.age profile.age
  json.gender profile.geneder
  json.activity_level profile.activity_level
end
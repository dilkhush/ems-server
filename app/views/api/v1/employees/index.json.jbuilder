json.array! @employees do |employee|
  json.(employee, :id, :name, :email)
end
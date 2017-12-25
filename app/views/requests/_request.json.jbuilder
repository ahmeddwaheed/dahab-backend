# json.pool do
#   json.name pool.name
#   json.request do
#     json.extract!(request, :id, :program, :background, :reason)
#   end
# end

json.request do
  json.extract!(request, :id, :program, :background, :reason)
end

require 'faraday'
require 'oj'

client = Faraday.new(url: 'http://localhost:3000') do |config|
  config.adapter  Faraday.default_adapter
  config.token_auth('dbbf2e3dd317359ea6433bdd96b5580f')
end

# Create user
# response = client.post do |req|
#   req.url '/api/v1/users'
#   req.headers['Content-Type'] = 'application/json'
#   req.body = '{ "user": {"name": "test user"} }'
# end

# Create post
# response = client.post do |req|
#   req.url '/api/v1/posts'
#   req.headers['Content-Type'] = 'application/json'
#   req.body = '{ "post": {"title": "Title", "body": "Text"} }'
# end

# Delete post
response = client.delete do |req|
  req.url '/api/v1/posts/6'
  req.headers['Content-Type'] = 'application/json'
end

puts Oj.load(response.body)
puts response.status

# Token: dbbf2e3dd317359ea6433bdd96b5580f

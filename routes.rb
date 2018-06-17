# GET request to the root directory
get '/' do
  on_root_get
end

# POST request to the root directory
post '/' do
  on_root_post
end

# GET request to a shortened url
get '/:short_url' do
  on_short_url_get
end

get '/frontend' do
  File.read(File.join('public', 'index.html'))
end

not_found do
  on_404_get
end
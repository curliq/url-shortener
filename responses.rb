# what to do when a GET request is made to the root directory
def on_root_get
  # Return a json object with two fields, being instructions on how to use the app, and the currently saved short_urls
  content_type :json
  {:how_to_use => displayed_instructions, :saved_urls => displayed_saved_short_urls}.to_json
end

# what to do when a POST request is made to the root directory
def on_root_post

  # in case someone already read it
  request.body.rewind

  # Get the url passed in the POST body as the key "url"
  @url = params[:url]

  # Get a short url from the original url
  short_url = shorten_url(@url)

  # Return a json object with the original url and the short url
  content_type :json
  {:url => @url, :short_url => "/" + short_url}.to_json
end

def on_short_url_get
  # Get the original url given the short url passed in the url
  @original_url = retrieve_original_url(params['short_url'])

  pass unless @original_url != nil

  # Check if original url has https://, add it otherwise
  unless @original_url.start_with?("http")
    @original_url.prepend("http://")
  end

  # Redirect with 301 code (instead of default which is 302)
  redirect @original_url, 301
end

def on_404_get
  "404 Not Found :["
end
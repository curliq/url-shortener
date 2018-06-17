# Key pair hash to hold the short urls and the original urls,
# Example: [{"/abc123" => "www.farmdrop.com"}, {"/def456" => "www.github.com"}]
# This instance should live until the session end
@@shortened_urls = {}

# Save a short url and the respective original url to our array
def save_short_url(short_url, original_url)
  @@shortened_urls.store(short_url, original_url)
end

# Get the original url given the short url
def retrieve_original_url(short_url)
  @@shortened_urls[short_url]
end

def retrieve_all_short_urls
  @@shortened_urls
end

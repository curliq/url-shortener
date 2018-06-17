require 'securerandom'
require 'json'

# Display instructions on how to use the app
def displayed_instructions
  "To shorten a url make a POST request to \"/\" with the `url` field being your original url, an example using " +
      "cURL:\n\n$ curl localhost:4567 -XPOST -d '{ \"url\": \"http://www.github.com\" }'\n\nAnd the response " +
      "would be `{\"short_url\": \"http://localhost:4567/kg6\"} (kg6 being a randomly generated key) " +
      "and browsing this url will redirect you to www.github.com."
end

# Return all the currently stored short_urls and their original urls
def displayed_saved_short_urls
  retrieve_all_short_urls
end

# take a url, shorten it, and save it
def shorten_url(url)

  # Generate a random string of length $short_url_length using SecureRandom#urlsafe_base64
  @shortened_url = SecureRandom.urlsafe_base64($short_url_length - 1) # -1 because the length starts at 0

  # Check if this random string is already saved, if so keep generating a new one until it's unique,
  # In the unlikely case of running out of combinations (46656) this will be stuck in an infinite loop
  while retrieve_original_url(@shortened_url) != nil do
    @shortened_url = SecureRandom.urlsafe_base64($short_url_length)
  end

  # Save the short url to our storage
  save_short_url(@shortened_url, url)

  # Return the short url
  @shortened_url
end
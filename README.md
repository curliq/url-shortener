# Url Shortener app

## Purpose
A small app that takes a url and returns a short url that redirects to the original url.

## Important note
This was the first time I've used Ruby and I felt like there would be a better way to do certain things, so I welcome you to point them out.

## App structure
Initially I was going to use Rails and decided it would be too much of an overkill so decided to use [Sinatra](http://www.sinatrarb.com).
This app is not trying to follow any particular conventional arquicture by Seperation of Concerns is at its fundemental core (even tho some things could've been seperated in a better way).

`app.rb` - the entry point of the app that starts all the other files by importing them;
`model.rb` - where the temporary storage is, and the functions to access the storage too;
`routes.rb` - where all the routes (i.e. urls) are defined, this only defines the methods we expect and their path;
`responses.rb` - where all the urls are handled, this contains some logic on how to handle the requests;
`controllers.rb` - this contains generic functions to get the necessary information that are used for the requests handling;
`settings.rv` - project settings;
`public/` - a low effort front end page to use the app.

## How to run
This app uses Ruby 2.5 and two gems: `Sinatra` and `json`. To run the app, first install these dependencies:

`gem install sinatra`
`gem install json`

And then run the `app.rb` file:

`ruby app.rb`

# How to use
A `GET` request to the root returns instructions on how to use the app.

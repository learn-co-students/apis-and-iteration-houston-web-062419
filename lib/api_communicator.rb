require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  url = "https://www.swapi.co/api/people/"
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  # binding.pry

    # iterate over the response hash to find the collection of `films` for the given
  #   `character`
      # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  episode_urls = []
  response_hash["results"].each do |character|
    if character["name"].downcase == character_name.downcase
      # episode_urls = character["films"]
      character["films"].each do |film|
        response_string = RestClient.get(film)
        new_hash = JSON.parse(response_string)
        episode_urls << new_hash
      end
    end
  end
  episode_urls
end



  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.

def print_movies(new)
# some iteration magic and puts out the movies in a nice list

    puts get_character_movies_from_api(films)
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  films.each do |n|
    puts n["title"]
  end
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?

#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"
require 'rest-client'
require 'JSON'
require 'pry'

def run
#welcome

character = get_character_from_user
#binding.pry
show_character_movies(character)
end
run

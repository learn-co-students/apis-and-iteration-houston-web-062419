def welcome
   #puts "Please enter a Star Wars character name:"
   get_character_from_user
end

def get_character_from_user
  puts "Please enter a Star Wars character name:"
  gets.chomp # use gets to capture the user's input. This method should return that input, downcased.
end

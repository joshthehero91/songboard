
songs = {}

def add_song
  puts "Please enter a song title: "         # Get song title
  song_title = gets.chomp()
  puts "You have input " + song_title + "."  # Validating input
  puts "Please enter an album: "             # Get album name
  song_album = gets.chomp()
  puts "You have input " + song_album + "."  # Validating input
  puts "Please enter the BPM of the song: "  # Get BPM
  song_bpm = gets.chomp()
  puts "You have input " + song_bpm + "."    # Validating input
end

add_song()


#######
#NOTES#
#######
# CRUD features I'm hoping to implement:
# add - Add a new song 
# delete - Remove an existing song
# modify - Modify an existing song
# list - Show all songs
# find - Search for specific value

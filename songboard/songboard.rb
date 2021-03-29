song_title = "End of the Circus (Death of a Clown)"
song_album = "The Heavy EP"
song_bpm = "95"
song_link = "https://drive.google.com/drive/folders/1CDAL2z-dVjoD1W1CcyAdKW1nTyfZnwy8"


def add_song
  puts "Please enter a song title: "         # Get song title
  song_title = gets.chomp()
  puts "You have input " + song_title + "."  # Validating input
  puts "Please enter an album: "             # Get album name
  song_album = gets.chomp()
  puts "You have input " + song_album + "."  # Validating input
  puts "Please enter the BPM of the song: "  # Get BPM
  song_bpm = gets.chomp()
  puts "You have input " + song_bpm + "."  # Validating input
end

add_song()


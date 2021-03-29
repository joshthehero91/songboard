require 'json'

class Song                                   # create the Song class
  attr_accessor :title, :album, :bpm         # require title, album, and BPM
end

def add_song()                               # function to add a new song to music library
  puts "Please enter a song title:"          # get song title
  title = gets.chomp().to_s                  # convert title to string
  puts "Please enter an album:"              # get album name
  album = gets.chomp().to_s                  # convert album to string
  puts "Please enter the BPM of the song:"   # get BPM
  bpm = gets.chomp().to_s                    # convert BPM to string

  s = Song.new                               # create instance
  s.title = title                            # set title
  s.album = album                            # set album
  s.bpm   = bpm                              # set bpm
  
  if File.exist? "library.json"
    file = File.read("library.json")
    library = JSON.parse(file)
  else
    library = {}
  end

  song_count = library.keys.count
  song_number = song_count + 1 
  song = { "title" => s.title, "album" => s.album, "bpm" => s.bpm  }
  temp_library = { song_number => song }
  library.merge!(temp_library)

  puts "TITLE: " + s.title                   # verify title
  puts "ALBUM: " + s.album                   # verify album
  puts "BPM:   " + s.bpm                     # verify BPM
  
  puts "Is this correct? (y/n)"
  answer = gets.chomp().downcase.to_s
  if answer == "y"
    puts "Writing to file..."
    File.write("library.json",library.to_json)
    puts ""
  elsif answer == "n"
    puts "Please try again."
    puts ""
    add_song()
  else
    puts "Please enter y or n."
    puts ""
  end
end

add_song()                                   # run to add a new song

require 'json'                                                  # nessecary to write json files
require_relative 'main_menu'
require_relative 'delete_song'
require_relative 'modify_song'
require_relative 'list_songs'
require_relative 'modify_song'

class Song                                                      # create the Song class
  attr_accessor :title, :album, :bpm                            # require title, album, and BPM
end

def add_song                                                    # function to add a new song to music library
  puts "Please enter a song title:"                             # get song title
  title = gets.chomp().to_s                                     # convert title to string
  puts "Please enter an album:"                                 # get album name
  album = gets.chomp().to_s                                     # convert album to string
  puts "Please enter the BPM of the song:"                      # get BPM
  bpm = gets.chomp().to_s                                       # convert BPM to string

  s = Song.new                                                  # create instance
  s.title = title                                               # set title
  s.album = album                                               # set album
  s.bpm   = bpm                                                 # set bpm

  if
    File.exist? "library.json"                                  # check if library.json exists
    file = File.read("library.json")                            # open file
    library = JSON.parse(file)                                  # read file
  else                                                          # otherwise make an empty hash
    library = {}
  end

  track_count = library.keys.count                              # calculate total amount of songs
  song_number = track_count + 1                                 # increment on total songs
  song = {                                                      # create a hash with song details
  "title" => s.title,                                           # set song title
  "album" => s.album,                                           # set album song is on
  "bpm" => s.bpm                                                # set BPM of the song
  }

  track = { song_number => song }                               # create a hash for the song
  library.merge!(track)                                         # add the song to the library

  puts "TITLE: " + s.title                                      # verify title
  puts "ALBUM: " + s.album                                      # verify album
  puts "BPM:   " + s.bpm                                        # verify BPM

  puts "Is this correct? (y/n)"                                 # allow user to verify data
  answer = gets.chomp().downcase.to_s
  if
    answer == "y"                                               # if everything looks correct
    puts "Saving to library..."                                   # write to library.json file
    File.write("library.json",library.to_json)
    puts ""
  elsif
    answer == "n"                                               # or allow user to retry
    puts "Please try again."
    puts ""
    add_song()
  else                                                          # otherwise verify it's only "y" or "n"
    puts "Please enter y or n."
    puts ""
  end
  puts ""
  main_menu()
end

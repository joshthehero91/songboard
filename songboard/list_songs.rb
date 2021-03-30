require 'json'                                                  # nessecary to write json files
require_relative 'add_song'
require_relative 'delete_song'
require_relative 'modify_song'
require_relative 'main_menu'
require_relative 'modify_song'

def list_songs                                                  # function to list out all the songs in music library
  if
    !File.exist? "library.json"                                 # check if library.json does not exists
    puts "There are no songs in SongBoard."                     # there are no songs to read
  else                                                          # if library.json does exist 
    file = File.read("library.json")                            # open file
    library = JSON.parse(file)                                  # read file  
    library.each do |track, song|
      puts "|------------------------------------------------"  # starting pretty formatting
      song.each do |attr, v|
        puts "| " + attr.upcase.to_s + ": " + v.to_s            # print out all song pretty-ily
      end
    end
    puts "|------------------------------------------------"    # closing off the pretty formatting
  end
  puts ""
  main_menu()
end

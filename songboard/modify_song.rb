require 'json'                                                  # nessecary to write json files
require_relative 'add_song'
require_relative 'delete_song'
require_relative 'modify_song'
require_relative 'list_songs'
require_relative 'main_menu'

class Song                                                      # create the Song class
  attr_accessor :title, :album, :bpm                            # require title, album, and BPM
end

def modify_song
  if
    !File.exist? "library.json"                                 # check if library.json does not exists
    puts "There are no songs in SongBoard."                     # there are no songs to read
    main_menu()
  else                                                          # if library.json does exist
    file = File.read("library.json")                            # open file
    library = JSON.parse(file)                                  # read file
  end
 
  puts "Please provide the name of the song being modified or use \"back\" to return to the main menu: "
  choice = gets.chomp().to_s

  if
    choice == "back"
    main_menu()
  elsif
    library.each do |track, song|
      if
        song.has_value? choice == false
        next
      elsif
        song.has_value? choice
        title, album, bpm = song.values
        puts "Is this the song you would like to modify?"
        puts ""
        puts "           |------------------------------------------------"
        puts "           | TITLE: " + title.to_s
        puts "           | ALBUM: " + album.to_s
        puts "           | BPM:   " + bpm.to_s
        puts "           |------------------------------------------------"
        puts ""

        puts "Is this correct? (y/n)"
        answer = gets.chomp().downcase.to_s
        if
          answer == "y"                                         # if everything looks correct 
          puts "Please enter a new song title:"                             # get song title
          title = gets.chomp().to_s                                     # convert title to string
          puts "Please enter a new album:"                                 # get album name
          album = gets.chomp().to_s                                     # convert album to string
          puts "Please enter the new BPM of the song:"                      # get BPM
          bpm = gets.chomp().to_s                                       # convert BPM to string

          s = Song.new                                                  # create instance
          s.title = title                                               # set title
          s.album = album                                               # set album
          s.bpm   = bpm                                                 # set bpm

          song = {                                                      # create a hash with song details
          "title" => s.title,                                           # set song title
          "album" => s.album,                                           # set album song is on
          "bpm" => s.bpm                                                # set BPM of the song
          } 

          puts "TITLE: " + s.title                                      # verify title
          puts "ALBUM: " + s.album                                      # verify album
          puts "BPM:   " + s.bpm                                        # verify BPM

          puts "Is this correct? (y/n)"                                 # allow user to verify data
          answer = gets.chomp().downcase.to_s
          if
            answer == "y"                                               # if everything looks correct
            new_libray = {}
            library[track].each do |k, value|
              puts k
              puts value
              song.each do |k, new_value|
              puts new_value
              end
            end 
            puts "Saving to library..."                                   # write to library.json file
            File.write("library.json",library.to_json)
            puts ""
          elsif
            answer == "n"                                               # or allow user to retry
            puts "Please try again."
            puts ""
            modify_song()
          else                                                          # otherwise verify it's only "y" or "n"
          puts "Please enter y or n."
          puts ""
          end
        elsif
          answer == "n"                                               # or allow user to retry
          puts "Please try again."
          puts ""
          modify_song()
        else                                                          # otherwise verify it's only "y" or "n"
          puts "Please enter y or n."
          puts ""
        end
      end
    end
  list_songs()
  end
  puts "No Results found. Please try again."
  puts "" 
  main_menu
end

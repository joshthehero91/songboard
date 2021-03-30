require 'json'                                                  # nessecary to write json files
require 'add_song'
require 'main_menu'
require 'modify_song'
require 'list_songs'
require 'modify_song'

def delete_song
  if
    !File.exist? "library.json"                                 # check if library.json does not exists
    puts "There are no songs in SongBoard."                     # there are no songs to read
    main_menu()
  else                                                          # if library.json does exist 
    file = File.read("library.json")                            # open file
    library = JSON.parse(file)                                  # read file    
  end

  puts "Please provide the name of the song being removed or use \"back\" to return to the main menu: "
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
        puts "Is this the song you would like to remove?"
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
          library.delete(track)
        elsif
          answer == "n"                                               # or allow user to retry
          puts "Please try again."
          puts ""
          delete_song()
        else                                                          # otherwise verify it's only "y" or "n"
          puts "Please enter y or n."
          puts ""
        end
      end
    end
  puts "Removing from library..."                                   # write to library.json file
  File.write("library.json",library.to_json)
  puts ""
  list_songs()
  end
  puts "No Results found. Please try again."
  puts ""
  main_menu()
end


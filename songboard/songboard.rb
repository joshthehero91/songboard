require 'json'                                                  # nessecary to write json files

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
    puts "Writing to file..."                                   # write to library.json file
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

def delete_song
  if 
    !File.exist? "library.json"                                 # check if library.json does not exists
    puts "There are no songs in SongBoard."                     # there are no songs to read
    main_menu()
  else                                                          # if library.json does exist 
    file = File.read("library.json")                            # open file
    library = JSON.parse(file)                                  # read file    
  end
  
  puts """
  Please provide the name of the song being removed
  or use \"back\" to return to the main menu:
  """
  choice = gets.chomp().to_s
  
  if 
    choice == "back"
    main_menu()
  else
    library.each do |track, song| 
      if
        song.has_value? choice == false
        next
      elsif  
        song.has_value? choice
        title, album, bpm = song.values
        puts "Is this the song you would like to remove?"    
        puts "|------------------------------------------------"
        puts "| TITLE: " + title.to_s
        puts "| ALBUM: " + album.to_s
        puts "| BPM:   " + bpm.to_s
        puts "|------------------------------------------------"
      end 
    end
  end
  main_menu()
end

def modify_song
  puts "Option not yet available. Please select another option."
  main_menu
end

def main_menu
    puts """
           |------------------------------------------------
           | Please select an option:                           
           |------------------------------------------------
           | add - Add a new song to the library              
           | del - Remove an existing song from the library
           | mod - Modify an exsiting song in the library       
           | see - List all the songs in the library
           |------------------------------------------------
           | Type 'quit' to exit.     
           |------------------------------------------------

             Select option:

    """
    choice = gets.chomp().downcase.to_s
    
    if choice == 'add'
        add_song()
    elsif choice == 'del'
        delete_song()
    elsif choice == 'mod'
        modify_song()
    elsif choice == 'see'
        list_songs()
    elsif choice == 'quit'
        exit
    else
        print('The option selected is not avaible. Please try again.')
        main_menu()
    end
end

main_menu()
#list_songs()                                   # list all the current songs in the library
#add_song()                                     # run to add a new song

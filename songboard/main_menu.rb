require 'json'                                                  # nessecary to write json files
require_relative 'add_song'
require_relative 'delete_song'
require_relative 'modify_song'
require_relative 'list_songs'
require_relative 'modify_song'

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

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
  puts "TITLE: " + s.title                   # verify title
  puts "ALBUM: " + s.album                   # verify album
  puts "BPM:   " + s.bpm                     # verify BPM
end

add_song()                                   # run to add a new song

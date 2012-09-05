#!/usr/local/bin/ruby -w

File.open("songdata") do |song_file|

  songs = SongList.new

  song_file.each do |line|
    file, length, name, title = line.chomp.split(/\s*\|\s*/)
    name.squeeze!(" ")
    songs.append(Song.new(title, name, length))
  end

  puts songs[1]

end

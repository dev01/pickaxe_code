#!/usr/local/bin/ruby -w

File.open("songdata") do |song_file|

  songs = SongList.new

  song_file.each do |line|
    file, length, name, title = line.chomp.split(/\s*\|\s*/)
    name.squeeze!(" ")
    mins, secs = length.scan(/\d+/)
    songs.append(Song.new(title, name, mins.to_i*60+secs.to_i))
  end

  puts songs.lookup("Fats")
  puts songs.lookup("ain't")
  puts songs.lookup("RED")
  puts songs.lookup("WoRlD")

end

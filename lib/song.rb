require 'pry'

class Song

  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end

  def self.all
    @@all
  end

  def self.new_by_filename(filename)
    artist, song, genre = filename.delete_suffix('.mp3').split(' - ')
    new_song = Song.new(song)
    new_song.artist_name = artist
    new_song
  end

end
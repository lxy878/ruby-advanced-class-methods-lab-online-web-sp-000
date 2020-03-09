
require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song == nil
      song = self.create_by_name(name)
    end
    song
  end
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    # song = self.new
    # parts = filename.gsub(/\.mp3/).split(" - ")
    # song.name = parts[1]
    # song.artist_name = parts[0]
    # song
  end

  def self.create_from_filename(filename)
    parts = filename.split(" - ")
    song = self.new
    binding.pry
    song.name = parts[1].gsub(/.mp3/)
    song.artist_name = parts[0]
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end

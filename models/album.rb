require('pg')
require_relative('../db/sql_helper.rb')
require_relative('artist.rb')

class Album

  attr_accessor :title, :genre, :artist_id
  attr_reader :id

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @title = details['title']
    @genre = details['genre']
    @artist_id = details['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums (title, genre, artist_id) VALUES ($1, $2, $3) RETURNING id"
    values = [@title, @genre, @artist_id]
    result = SqlHelper.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def get_artist()
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    result = SqlHelper.run(sql, values)
    return result.map{ |artist| Artist.new(artist) }
  end

  def update()
    sql = "UPDATE albums SET (title, genre) = ($1, $2) WHERE id = $3"
    values = [@title, @genre, @id]
    SqlHelper.run(sql, values)
  end

  def Album.read_all()
    sql = "SELECT * FROM albums"
    result = SqlHelper.run(sql)
    return result.map { |album| Album.new(album) }
  end

end

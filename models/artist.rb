require('pg')
require_relative('../db/sql_helper.rb')
require_relative('album.rb')

class Artist

  attr_accessor :name
  attr_reader :id

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @name = details['name']
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id"
    values = [@name]
    result = SqlHelper.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def get_albums()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    results = SqlHelper.run(sql, values)
    return results.map { |album| Album.new(album)}
  end

  def update()
    sql = "UPDATE artists SET name = $1 WHERE id = $2"
    values = [@name,@id]
    SqlHelper.run(sql, values)
  end

  def Artist.read_all()
    sql = "SELECT * FROM artists"
    artists = SqlHelper.run(sql)
    return artists.map { |artist| Artist.new(artist) }
  end

  def Artist.delete_all()
    sql = "DELETE FROM artists"
    SqlHelper.run(sql)
  end

end

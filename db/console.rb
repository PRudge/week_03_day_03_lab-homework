require('pry')
require_relative('../models/album.rb')
require_relative('../models/artist.rb')

Album.delete_all()
Artist.delete_all()

artist_1 = Artist.new({
  'name' => 'Queen'
})

artist_1.save()

artist_2 = Artist.new({
  'name' => 'Coldplay'
})

artist_2.save()

artist_3 = Artist.new({
  'name' => 'Genesis'
})

artist_3.save()

album_1 = Album.new({
  'title' => 'Innuendo',
  'genre' => 'rock',
  'artist_id' => artist_1.id
  })

album_1.save()

album_2 = Album.new({
  'title' => 'A Night at the Opera',
  'genre' => 'rock',
  'artist_id' => artist_1.id
  })

album_2.save()

album_3 = Album.new({
  'title' => 'A Head Full of Dreams',
  'genre' => 'classical',
  'artist_id' => artist_2.id
  })

album_3.save()

album_4 = Album.new({
  'title' => 'Parachutes',
  'genre' => 'classical',
  'artist_id' => artist_2.id
  })

album_4.save()

artists = Artist.read_all()
albums = Album.read_all()
artist_1_albums = artist_1.get_albums()
artist_details = album_3.get_artist()
album_3.title = 'A Rush of Blood to the Head'
album_3.update()
artist_1.name = "Freddie Mercury"
artist_1.update()


album_find = Album.find(12)
artist_find = Artist.find(41)

album_3.delete()
artist_3.delete()


binding.pry
nil

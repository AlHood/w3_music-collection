require('pry-byebug')
require_relative('Album')
require_relative('Artist')
require_relative('../db/sql_runner')



artist1 = Artist.new( 'name' => 'Coldplay')
artist2 = Artist.new( 'name' => 'Oasis')
artist3 = Artist.new( 'name' => 'Manics')

artist1.save
artist2.save
artist3.save

album1 = Album.new( 'title' => 'Parachutes', 'genre' => 'Alt rock', 'performer_id' => artist1.id)
album2 = Album.new( 'title' => 'Definitely Maybe', 'genre' => 'Rock', 'performer_id' => artist2.id )
album3 = Album.new( 'title' => 'The Holy Bible', 'genre' => 'Rock', 'performer_id' => artist3.id)

album1.save
album2.save
album3.save


binding.pry

nil

# And eventually -
# puts "   ================== | Main Menu | ================== "
# puts " Select option:"
# puts "[1] Create Album "
# puts "[2] Create Artist "
# puts "[3] List something or other etc
#




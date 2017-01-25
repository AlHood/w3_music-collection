require( 'pg')
require_relative('../db/sql_runner')

class Album

  attr_reader :id, :title, :genre, :performer_id

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @performer_id = options['performer_id'].to_i

  end


def save()
sql = "INSERT INTO albums (title, genre, performer_id) VALUES ('#{@title}', '#{@genre}', #{@performer_id}) returning *;"
result = SqlRunner.run(sql)
@id = result.first['id'].to_i

end

def self.list()
   sql = "SELECT * FROM albums;"
    albums = SqlRunner.run(sql)
    return albums.map { |album| Album.new( album ) }
  end




def identify_artist()

end

# def save()
#   sql = "INSERT INTO customers (name) VALUES ('#{@name}') returning *;"
#   result = SqlRunner.run(sql)

#   @id = result.first['id'].to_i

# end


# def self.all()
#   sql = "SELECT * FROM customers;"
#   customers = SqlRunner.run(sql)
#   return customers.map { |person| Customer.new( person ) }
# end






end



require( 'pg')
require_relative('../db/sql_runner')

class Artist

  attr_reader :id, :name

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

def save()
  sql = "INSERT INTO artists (name) VALUES ('#{@name}') returning *;"
  result = SqlRunner.run(sql)
  @id = result.first['id'].to_i
end

def self.list()
   sql = "SELECT * FROM albums;"
    albums = SqlRunner.run(sql)
    return albums.map { |album| Album.new( album ) }
  end



def list_by_artist

end



end



require( 'pg')
require_relative('../db/sql_runner')

class Artist

  attr_reader :id, :name

  def initialize (options)
    @id = options['id'].to_i if options['id'] !=nil
    @name = options['name']
  end

def save()
  sql = "INSERT INTO artists (name) VALUES ('#{@name}') returning *;"
  result = SqlRunner.run(sql)
  @id = result.first['id'].to_i
end

def self.list()
   sql = "SELECT * FROM artists;"
    artists = SqlRunner.run(sql)
    return albums.map { |album| Album.new( album ) }
  end



def list_works
sql = "SELECT * FROM albums WHERE performer_id = #{@id};"
albums = SqlRunner.run(sql)
result = albums.map { |album| Album.new ( album )}
return result
end


def delete()
sql2 = "DELETE FROM albums WHERE performer_id = #{@id};"
SqlRunner.run(sql2)
sql = "DELETE FROM artists WHERE id = #{@id};"
SqlRunner.run(sql)
end

# NOTE the above function was a dirty method to achieve deletion. I was actually supposed to just delete artists, but table albums was dependent on it. So it got deleted first. Hey, it worked.

def edit()
sql = "UPDATE artists SET (name) = (#{@name}) WHERE id = #{@id}"
SqlRunner.run(sql)

end

def self.find(ident)
sql = "SELECT * FROM artists WHERE id = #{ident.to_i};"
result1 = SqlRunner.run(sql).first 
result2 = Artist.new( result1 )
return result2
end




end



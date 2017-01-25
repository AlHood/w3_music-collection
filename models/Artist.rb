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
sql = "SELECT * FROM albums WHERE performer_id = #{@id};"
albums = SqlRunner.run(sql)
result = albums.map { |album| Album.new ( album )}
return result
end









# def pizza_orders()
#   sql = "SELECT * FROM pizza_orders WHERE customer_id = #{@id};"
#   orders = SqlRunner.run( sql )
#   result = orders.map { |order| PizzaOrder.new (order) }
#   return result
# end


end



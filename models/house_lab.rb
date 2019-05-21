require('pg')

class House

attr_accessor :address, :value, :num_bedrooms, :year
attr_reader :id

def initialize(options)
@id = options('id').to_i if options['id']
@address = options ['address']
@value = options ['value'].to_i()
@num_bedrooms = options ['num_bedrooms'].to_i()
@year = options ['year']
end

#this saves object into database

def save()
  db = PG.connect({
    dbname: 'houses',
    host: 'localhost'
    })

sql = "INSERT INTO houses
(address, value, num_bedrooms, year) VALUES
($1, $2, $3, $4) RETURNING *"
values = [@address, @value, @num_bedrooms, @year]
db.prepare("save", sql)
result = db.exec_prepared("save", values)
@id = result[0]['id'].to_i()

db.close()
end

def delete
  db = PG.connect({dbname: 'houses',
    host: 'localhost'})
    sql = "DELETE FROM houses WHERE id = $1"
    values = [@id]
    db.prepare("delete_house", sql)
    db.exec_prepared("delete_house", values)
    db.close()
  end

def update
  db = PG.connect({dbname: 'houses',
    host: 'localhost'})
    sql = "UPDATE houses SET (address, value, num_bedrooms, year) = ($1, $2,$3, $4) WHERE id = $5"
    values = [@address, @value, @num_bedrooms, @year, @id]
    db.prepare("update", sql)
    db.exec_prepared("update", values)
    db.close()
    end


end

require_relative('../db/sql_runner')

class Director

  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO directors
    ( name ) VALUES ($1) RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result.first['id']
  end

  def update()
    sql = "UPDATE directors SET name = $1 WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM directors WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def production_companys()
  sql = "SELECT p.* FROM production_companies p INNER JOIN films f ON f.production_company_id = p.id WHERE f.director_id = $1;"
  values = [@id]
  results = SqlRunner.run(sql, values)
  return results.map { |production_company| ProductionCompany.new(production_company) }
  end


  def self.all()
    sql = "SELECT * FROM directors"
    hashes_of_directors = SqlRunner.run(sql)
    director_hashes = hashes_of_directors.map { |director_hash| Director.new(director_hash)  }
    return director_hashes
  end

  def self.find(id)
    sql = "SELECT * FROM directors
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    director = Director.new(result)
    return director
  end

  def self.find_film_by_director(id)
    sql = "SELECT films.* FROM films WHERE director_id = $1"
    values = [id]
    result = SqlRunner.run( sql,values )
    return result.map{ |film| Film.new(film)}
  end



end

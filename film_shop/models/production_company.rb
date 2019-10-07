require_relative('../db/sql_runner')

class ProductionCompany

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO production_companies
    ( name ) VALUES
    ( $1 ) RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result.first['id']
  end

  def update()
    sql = "UPDATE production_companies SET
    name = $1 WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM production_companies
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM production_companies"
    hashes_of_companies = SqlRunner.run(sql)
    company_hashes = hashes_of_companies.map { |company_hash| ProductionCompany.new(company_hash) }
    return company_hashes
  end

  def self.find(id)
    sql = "SELECT * FROM production_companies
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    production_company = ProductionCompany.new(result)
    return production_company
  end

  def self.find_film(id)
    sql = "SELECT films.* FROM films WHERE production_company_id = $1"
    values = [id]
    result = SqlRunner.run( sql,values )
    return result.map{ |film| Film.new(film)}
  end

end

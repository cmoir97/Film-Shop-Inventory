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

end

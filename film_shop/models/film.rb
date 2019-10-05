require_relative('../db/sql_runner')

class Film

  attr_accessor :title, :quantity, :buy_cost, :sell_price, :production_company_id
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @quantity = options['quantity'].to_i
    @sell_price = options['sell_price'].to_i
    @production_company_id = options['production_company_id'].to_i
  end

  def save()
    sql = "INSERT INTO films
    (
      title,
      quantity,
      sell_price,
      production_company_id
    ) VALUES
    (
      $1, $2, $3, $4
    ) RETURNING id"
    values = [@title, @quantity, @sell_price, @production_company_id]
    result = SqlRunner.run(sql, values)
    @id = result.first['id']
  end

  
end

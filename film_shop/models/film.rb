require_relative('../db/sql_runner')

class Film

  attr_accessor :title, :director, :quantity, :buy_cost, :sell_price, :production_company_id
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @director = options['director']
    @quantity = options['quantity'].to_i
    @sell_price = options['sell_price'].to_i
    @production_company_id = options['production_company_id'].to_i
  end

  def save()
    sql = "INSERT INTO films
    (
      title,
      director,
      quantity,
      sell_price,
      production_company_id
      ) VALUES
      (
        $1, $2, $3, $4, $5
        ) RETURNING id"
        values = [@title, @director, @quantity, @sell_price, @production_company_id]
        result = SqlRunner.run(sql, values)
        @id = result.first['id']
  end

  def update()
    sql = "UPDATE films SET
    (
      title,
      director,
      quantity,
      sell_price,
      production_company_id
      ) = (
        $1, $2, $3, $4, $5
        ) WHERE id = $6"
        values = [@title, @director, @quantity, @sell_price, @production_company_id, @id]
        SqlRunner.run(sql, values)
  end


end

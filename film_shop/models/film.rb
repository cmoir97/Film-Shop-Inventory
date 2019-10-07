require_relative('../db/sql_runner')

class Film

  attr_accessor :title, :director, :quantity, :purchase_cost, :sell_price, :production_company_id
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @director = options['director']
    @quantity = options['quantity'].to_i
    @purchase_cost = options['purchase_cost'].to_i
    @sell_price = options['sell_price'].to_i
    @production_company_id = options['production_company_id'].to_i
  end

  def save()
    sql = "INSERT INTO films
    (
      title,
      director,
      quantity,
      purchase_cost,
      sell_price,
      production_company_id
      ) VALUES
      (
        $1, $2, $3, $4, $5, $6
        ) RETURNING id"
        values = [@title, @director, @quantity, @purchase_cost, @sell_price, @production_company_id]
        result = SqlRunner.run(sql, values)
        @id = result.first['id']
  end

  def update()
    sql = "UPDATE films SET
    (
      title,
      director,
      quantity,
      purchase_cost,
      sell_price,
      production_company_id
      ) = (
        $1, $2, $3, $4, $5, $6
        ) WHERE id = $7"
        values = [@title, @director, @quantity, @purchase_cost, @sell_price, @production_company_id, @id]
        SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM films
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def production_company()
  sql = "SELECT * FROM production_companies
  WHERE id = $1"
  values = [@production_company_id]
  results = SqlRunner.run( sql, values )
  return ProductionCompany.new( results.first )
  end

  def self.all()
    sql = "SELECT * FROM films"
    hashes_of_films = SqlRunner.run(sql)
    film_hashes = hashes_of_films.map { |film_hash| Film.new(film_hash) }
    return film_hashes
  end

  def self.find(id)
  sql = "SELECT * FROM films
  WHERE id = $1"
  values = [id]
  result = SqlRunner.run(sql, values).first
  film = Film.new(result)
  return film
  end

  def stock_check()
    return "Out of Stock" if @quantity == 0
    return "Stock Level OK" if @quantity > 2
    return "low stock" if @quantity <= 2
  end

  def stock_check_css()
    return "green" if @quantity > 2
    return "orange" if @quantity <=2
    return "red" if @quantity == 0
  end

  def markup()
  markup = (@sell_price - @purchase_cost)/10
  return "£#{markup}"
  end

  def purchase_cost_converter()
    new_purchase_cost = @purchase_cost/10
    return "£#{new_purchase_cost}"
  end

  def sell_price_converter()
    new_sell_price = @sell_price/10
    return "£#{new_sell_price}"
  end

end

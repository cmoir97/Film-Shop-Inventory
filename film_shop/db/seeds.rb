require('pry')
require_relative('../models/film')
require_relative('../models/production_company')
require_relative('../models/director')

director1 = Director.new({'name' => 'Paul Thomas Anderson'})
director2 = Director.new({'name' => 'David Lynch'})
director3 = Director.new({'name' => 'Sergio Leone'})

director1.save()
director2.save()
director3.save()


production_company1 = ProductionCompany.new('name' => 'Criterion')
production_company2 = ProductionCompany.new('name' => 'A24')

production_company1.save()
production_company2.save()


film1 = Film.new({'title' => 'There Will be Blood', 'director' => 'Paul Thomas Anderson', 'quantity' => 10, 'purchase_cost' => 700, 'sell_price' => 1000, 'director_id' => director1.id(), 'production_company_id' => production_company1.id()})

film2 = Film.new({'title' => 'Blue Velvet', 'quantity' => 15, 'purchase_cost' => 300, 'sell_price' => 500, 'director_id' => director1.id(), 'production_company_id' => production_company1.id()})

film3 = Film.new({'title' => 'Once Upon A Time In America', 'quantity' => 0, 'purchase_cost' => 300, 'sell_price' => 500, 'director_id' => director3.id(), 'production_company_id' => production_company1.id()})

film1.save()
film2.save()
film3.save()




binding.pry()
nil

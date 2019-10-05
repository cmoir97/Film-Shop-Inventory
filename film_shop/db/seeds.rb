require('pry')
require_relative('../models/film')
require_relative('../models/production_company')


production_company1 = ProductionCompany.new('name' => 'Criterion')
production_company2 = ProductionCompany.new('name' => 'A24')

production_company1.save()
production_company2.save()


film1 = Film.new({'title' => 'There Will be Blood', 'director' => 'Paul Thomas Anderson', 'quantity' => 10, 'purchase_cost' => 700, 'sell_price' => 1000, 'production_company_id' => production_company1.id()})

film2 = Film.new({'title' => 'Blue Velvet', 'director' => 'David Lynch', 'quantity' => 15, 'purchase_cost' => 300, 'sell_price' => 500, 'production_company_id' => production_company1.id()})

film1.save()
film2.save()






binding.pry()
nil

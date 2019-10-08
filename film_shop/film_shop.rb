require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/films_controller.rb')
require_relative('controllers/production_companies_controller.rb')
require_relative('controllers/directors_controller')
also_reload( '../models/*' )


get '/' do
  erb(:index)
end

require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/films_controller.rb')
require_relative('controllers/production_companies_controller.rb')

get '/' do
  erb(:index)
end

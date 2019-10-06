require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/film' )
require_relative( '../models/production_company')
also_reload( '../models/*' )


get '/films' do
  @films = Film.all()
  erb ( :"film/index" )
end

get '/films/new' do
  @production_companies = ProductionCompany.all
  erb(:"film/new")
end

post '/films' do
  Film.new(params).save
  redirect to '/films'
end

get '/films/:id' do
  @film = Film.find(params['id'])
  erb(:"film/show")
end

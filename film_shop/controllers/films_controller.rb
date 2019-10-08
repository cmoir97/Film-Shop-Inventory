require_relative('../film_shop')
require_relative( '../models/film' )
require_relative( '../models/production_company')
require_relative( '../models/director')
also_reload( '../models/*' )


get '/films' do
  @films = Film.all()
  erb ( :"film/index" )
end

get '/films/new' do
  @directors = Director.all
  @production_companies = ProductionCompany.all
  @films = Film.all
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

get '/films/:id/edit' do
  @directors = Director.all
  @production_companies = ProductionCompany.all
  @film = Film.find(params['id'])
  erb(:"film/edit")
end

post '/films/:id' do
  film = Film.new(params)
  film.update
  redirect to "/films/#{params['id']}"
end

post '/films/:id/delete' do
  film = Film.find(params['id'])
  film.delete
  redirect to '/films'
end

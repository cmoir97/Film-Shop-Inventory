require_relative( '../film_shop' )
require_relative( '../models/film' )
require_relative( '../models/production_company')
require_relative( '../models/director')

get '/directors' do
  @directors = Director.all()
  erb (:"director/index")
end

get '/directors/new' do
  @directors = Director.all
  erb(:"director/new")
end

post '/directors' do
  Director.new(params).save
  redirect to '/directors'
end

get '/directors/:id' do
  @director = Director.find(params['id'])
  @films = Director.find_film_by_director(@director.id)
  erb(:"director/show")
end

get '/directors/:id/edit' do
  @director = Director.find(params['id'])
  erb(:"director/edit")
end

post '/directors/:id' do
  director = Director.new(params)
  director.update
  redirect to "/directors/#{params['id']}"
end

post '/directors/:id/delete' do
  director = Director.find(params['id'])
  director.delete
  redirect to '/directors'
end

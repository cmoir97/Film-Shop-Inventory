require_relative('../film_shop')
require_relative( '../models/film' )
require_relative( '../models/production_company')
require_relative( '../models/director')
also_reload( '../models/*' )

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

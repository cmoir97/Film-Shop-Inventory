require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/film' )
require_relative( '../models/production_company')
also_reload( '../models/*' )

get '/production-company' do
  @production_companies = ProductionCompany.all
  erb(:"production_company/index")
end

get '/production-company/new' do
  @production_companies = ProductionCompany.all
  erb(:"production_company/new")
end

post '/production-company' do
  ProductionCompany.new(params).save
  redirect to '/production-company'
end

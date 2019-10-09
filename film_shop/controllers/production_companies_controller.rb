require_relative('../film_shop')
require_relative( '../models/film' )
require_relative( '../models/production_company')

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

get '/production-company/:id' do
  @production_company = ProductionCompany.find(params['id'])
  @films = ProductionCompany.find_film(@production_company.id)
  erb(:"production_company/show")
end

get '/production-company/:id/edit' do
  @production_company = ProductionCompany.find(params['id'])
  erb(:"production_company/edit")
end

post '/production-company/:id' do
  production_company = ProductionCompany.new(params)
  production_company.update
  redirect to "/production-company/#{params['id']}"
end

post '/production-company/:id/delete' do
  production_company = ProductionCompany.find(params['id'])
  production_company.delete
  redirect to '/production-company'
end

require "sinatra"
require "sinatra/reloader"

get("/howdy") do
erb(:hello)
end

get("/square/new") do
  erb(:new_square_calc)
end

get '/square/results' do
  @the_num = params.fetch("users_number").to_f

  @the_result = @the_num ** 2
  erb(:square_results)
end
 
get("/square_root/new") do
  erb(:new_root_calc)
end

get '/square_root/results' do
  @the_num = params.fetch("users_number").to_f

  @the_result = @the_num ** 0.5
  erb(:square_root_results)
end

get("/payment/new") do
  erb(:new_payment_calc)
end

get '/payment/results' do
  @the_apr = params.fetch("users_apr").to_f / 100

  @the_year = params.fetch("users_year").to_f

  @the_principal = params.fetch("users_principal").to_f

  monthly_rate = @the_apr / 12
  number_of_months = @the_year * 12

  @the_payment = (monthly_rate * @the_principal) / (1 - (1 + monthly_rate) ** - number_of_months)

  erb(:payment_results)
end

get("/random/new") do
  erb(:new_random_calc)
end

get '/random/results' do
  @the_min = params.fetch("users_max").to_f

  @the_max = params.fetch("users_min").to_f

  @the_random = rand(@the_min..@the_max).

  erb(:random_results)
end

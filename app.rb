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
  @the_apr = params.fetch("users_apr").to_f.to_fs(:percentage)

  @the_year = params.fetch("users_year").to_f

  @the_principal = params.fetch("users_principal").to_f.to_fs(:currency)

  @the_payment = (@the_apr * @the_principal)/(1 - (1 + @the_apr) ** -@the_year).to_f.to_fs(:currency)

  erb(:payment_results)
end

get("/random/new") do
  erb(:new_random_calc)
end

get '/random/results' do
  @the_min = params.fetch("users_max").to_f

  @the_max = params.fetch("users_min").to_f

  @the_random = rand(@the_min..@the_max).to_f

  erb(:random_results)
end

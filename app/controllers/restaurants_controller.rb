class RestaurantsController < ApplicationController

    get '/restaurants' do 
        @restaurants = Restaurant.all
        erb :'/restaurants/index'
    end 
    
    get '/restaurants/new' do 
        erb :'/restaurants/new'
    end 

    post '/restaurants' do 
        restaurant = Restaurant.create(params)
        user = Helpers.current_user(session)
        restaurant.user = user 
        restaurant.save
        redirect to "/users/#{user.id}"
    end 

end 
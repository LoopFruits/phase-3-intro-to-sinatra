require 'sinatra'

class App < Sinatra::Base
  # Add this line to set the Content-Type header for all responses
  set :default_content_type, 'application/json'  # this creates an application json, populated with out /dice because we connected a json method to it 

  get '/hello' do
    '<h2>Hello <em>World</em>!</h2>'
  end
  
  get '/potato' do
    "<p>Boil 'em, mash 'em, stick 'em in a stew</p>"
  end

  get '/dice' do
    dice_roll = rand(1..6)
    { roll: dice_roll }.to_json
  end # using the .to_json method to convert a Ruby hash or array to a valid JSON string.

  #DYNAMIC ROUTES 
  get '/add/1/2' do
    sum = 1 + 2
    { result: sum }.to_json
  end

 # :num1 and :num2 are named parameters
 get '/add/:num1/:num2' do
  num1 = params[:num1].to_i
  num2 = params[:num2].to_i

  sum = num1 + num2
  { result: sum }.to_json
end

get '/games/:id' do
  game = Game.find(params[:id])
  game.to_json
end
# gives us a name error because we dont have game set up 
  

end

run App

# In the App class above, we're inheriting this routing DSL from the Sinatra::Base class, which allows us to define routes like this inside the class:










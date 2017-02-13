require 'sinatra'

class HiSinatra < Sinatra::Base
   
   # root da aplicação
   get '/' do
       
       'Hi Sinatra'
   end 
   
   get '/rota' do
       
       'rota'
   end
   
   get '/:age' do
       
       "Hi, I'm #{params[:age]} years old"
   end
end
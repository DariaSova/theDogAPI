require 'sinatra'
require 'pry-byebug'
require 'giphy'
require 'rmagick'
require 'json'

get '/' do
  "Hello, Dog!"
end

get '/dog.png' do
 #erb :main
  content_type 'image/gif'
  url = Giphy.random('funny pets').image_original_url
  img = Magick::Image.read("#{url}").first #Magick::Image.read('dog.jpeg').first
  #img.format = 'jpeg'
  #img.to_blob
  redirect url
  #url
  #send_file("#{url}")
  #send_file 'dog.jpeg', :type => 'image/jpeg', :disposition => 'inline'
end

require 'sinatra'
require 'pry-byebug'
require 'giphy'
require 'mini_magick'
require 'json'

get '/' do
  "Hello, Dog!"
end

get '/dog.gif' do
 #erb :main
  content_type 'image/gif'
  cache_control :public, :max_age => 60
  url = Giphy.random('funny dogs').image_original_url
  img = MiniMagick::Image.open("#{url}")
  img.write 'dog.gif'
  send_file 'dog.gif', :type => 'image/gif', :disposition => 'inline'
  #img = Magick::Image.read("#{url}").first #Magick::Image.read('dog.jpeg').first
  #img.format = 'jpeg'
  #img.to_blob
  #redirect url
  #url
  #send_file("#{url}")
  #send_file url, :type => 'image/jpeg', :disposition => 'inline'
end

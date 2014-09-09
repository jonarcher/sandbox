require 'sinatra'

get '/' do
  "Hello, world"
end

get '/:name' do |name|
  "Hello, #{name}"
end

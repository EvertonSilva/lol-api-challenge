require 'haml'

get '/' do
	@name = "Home"
	haml :index
end

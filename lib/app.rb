require_relative 'data_handler'

get '/' do
	dh = DataHandler.new

  @champs = dh.champions
  @items = dh.items

	haml :index
end

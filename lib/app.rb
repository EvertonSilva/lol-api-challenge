require_relative 'data_handler'

before do
  dh = DataHandler.new
  @champs = dh.champions
  @items = dh.items
end

get '/' do
	haml :index
end

get '/champions/:id' do
  @champion = @champs.select { |c| c.id.to_s == params[:id] }[0]
  pass if @champion.nil?

  haml :champion
end

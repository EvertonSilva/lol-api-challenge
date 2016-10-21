require 'json'
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

get '/champions/:id/recommended/?' do
  content_type :json

  champion = @champs.select { |c| c.id.to_s == params[:id] }[0]
  begin
    recommended = champion.recommended_list(Integer(params[:index]))
    resp = { map: recommended.game_map, size: champion.recommended_size }
    resp.merge!(recommended.group_items)
    resp.to_json
  rescue => e
    { error: e.message }.to_json
  end
end
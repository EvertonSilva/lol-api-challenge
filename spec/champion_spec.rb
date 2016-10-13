require 'json'

describe Champion do
	subject(:champs) { Champion.new }
	
	before do 
		jchamps = File.read('../lol_champions_sample_data')
		data = JSON.parse(jchamps)
	end

end

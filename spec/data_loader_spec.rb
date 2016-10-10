require_relative '../lib/data_loader'

describe DataLoader do
	
	context "with a valid request" do
		resp = DataLoader.fetch_data
		
		it { expect(resp.code).to eq("200") }
	end
end

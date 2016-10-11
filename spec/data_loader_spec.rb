require_relative '../lib/data_loader'

describe DataLoader do
	subject(:loader) { DataLoader.new }
	before { loader.set_path }

	context "with a valid request url" do

		describe "#make_request" do
			it { expect(loader.make_request.code).to eq("200") }
		end
	end
end

require 'rails_helper'

RSpec.describe 'origin API' do

  let(:order_a) { create(:order) }
  let!(:origin_a) { create(:origin, order: order_a) }
  let!(:destination_a) { create(:destination, order: order_a) }

  let(:order_b) { create(:order) }
  let!(:origin_b) { create(:origin, order: order_b) }
  let!(:destination_b) { create(:destination, order: order_b) }

  let(:destination_id) { destination_a.id }

  describe 'GET /destinations' do
    before { get '/destinations' }

    it 'returns orders' do
      expect(json).not_to be_empty
      expect(json.size).to eq(2)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /destinations/:destination_id' do
    before { get "/destinations/#{destination_id}" }

    context 'when the record exists' do
      it 'returns the order' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(destination_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:destination_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Destination/)
      end
    end
  end


  # describe 'PUT /orders/:order_id/origin/:id' do
  #   it "routes /widgets to the widgets controller" do
  #     post "/origins"
  #     response
  #     expect(response).not_to be_routable
  #   end
  # end

end
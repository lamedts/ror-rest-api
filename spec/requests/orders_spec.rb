require 'rails_helper'

RSpec.describe 'Order API', type: :request do
  # let(:order_a) { create(:order) }
  # let!(:origin_a) { create(:origin, order: order_a) }
  # let!(:destination_a) { create(:destination, order: order_a) }

  # let(:order_b) { create(:order) }
  # let!(:origin_b) { create(:origin, order: order_b) }
  # let!(:destination_b) { create(:destination, order: order_b) }

  # let(:order_c) { create(:order) }
  # let!(:origin_c) { create(:origin, order: order_c) }
  # let!(:destination_c) { create(:destination, order: order_c) }

  # let(:order_id) { order_c.id }

  # 50.times do
  #   let(:order_d) { create(:order) }
  #   let!(:origin_d) { create(:origin, order: order_d) }
  #   let!(:destination_d) { create(:destination, order: order_d) }
  # end

  let(:orders) { create_list(:order, 10) }
  let!(:origins) { create_list(:origin, 10) }
  let!(:destinations) { create_list(:destination, 10) }
  let(:order_id) { orders.first.id }
  let(:per_page) { 2 }
  let(:page) { 2 }

  describe 'GET /orders' do
    before { get '/orders' }

    it 'returns orders' do
      expect(json).not_to be_empty
      expect(json.size).to eq(20)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /orders with paginate' do
    before { get "/orders?page=#{page}&per_page=#{per_page}" }

    context 'when valid paginat param' do
      it 'returns orders' do
        expect(json).not_to be_empty
        expect(json.size).to eq(2)
      end
  
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when invalid paginat param' do
      let(:per_page) { 50 }
      let(:page) { 2 }
      it 'returns orders' do
        expect(json).to be_empty
      end
  
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'GET /orders/:id' do
    before { get "/orders/#{order_id}" }

    context 'when the record exists' do
      it 'returns the order' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(order_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:order_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Order/)
      end
    end
  end

  describe 'POST /orders' do
    # valid payload
    let(:valid_attributes) { { status: 'UNASSIGN', origin_lat: '101.01', origin_long: '101.01', destination_lat: '101.01', destination_long: '101.01' } }

    context 'when the request is valid' do
      before { post '/orders', params: valid_attributes }

      it 'creates a order' do
        expect(json['status']).to eq('UNASSIGN')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/orders', params: { origin_lat: '22' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed: Status can't be blank/)
      end
    end
  end

  describe 'PUT /orders/:id' do
    let(:valid_attributes) { { title: 'Shopping' } }

    context 'when the record exists' do
      before { put "/orders/#{order_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /orders/:id' do
    before { delete "/orders/#{order_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
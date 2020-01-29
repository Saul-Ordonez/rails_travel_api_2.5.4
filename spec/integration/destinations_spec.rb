# spec/integration/destinations_spec.rb
require 'swagger_helper'

describe 'Destinations API' do

  path '/destinations' do

    post 'Creates a destination' do
      tags 'Destinations'
      consumes 'application/json', 'application/xml'
      parameter city: :destination, in: :body, schema: {
        type: :object,
        properties: {
          city: { type: :string },
          country: { type: :string }
        },
        required: [ 'city', 'country' ]
      }

      response '201', 'destination created' do
        let(:destination) { { city: 'Dodo', country: 'supsup' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:destination) { { city: 'foo' } }
        run_test!
      end
    end
  end

  path '/destinations/{id}' do

    get 'Retrieves a destination' do
      tags 'Destinations'
      produces 'application/json', 'application/xml'
      parameter city: :id, :in => :path, :type => :string

      response '200', 'city found' do
        schema type: :object,
          properties: {
            id: { type: :integer, },
            city: { type: :string },
            country: { type: :string }
          },
          required: [ 'id', 'city', 'country' ]

        let(:id) { Destination.create(city: 'foo', country: 'bar') }
        run_test!
      end

      response '404', 'destination not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end

require 'rails_helper'

describe JSONAPI::RailsIntegration::Railtie do
  it 'registers the JSON API MIME type' do
    expect(Mime[:jsonapi]).to eq('application/vnd.api+json')
  end

  it 'registers the params parser for the JSON API MIME type' do
    expect(::ActionDispatch::Request.parameter_parsers[:jsonapi]).not_to be_nil
  end

  it 'registers the FilterMediaType middleware' do
    expect(
      Rails.application.middleware.include?(JSONAPI::RailsIntegration::FilterMediaType)
    ).to be true
  end

  it 'copies JSON API params into a _jsonapi hash' do
    data = { data: { type: 'users', id: '1' } }
    params = ActionController::Parameters.new(data)
    parsed = JSONAPI::RailsIntegration::Railtie::PARSER.call(params.to_json)

    expect(parsed).to eq({
      data: { type: 'users', id: '1' },
      _jsonapi: { data: { type: 'users', id: '1' } }
    }.with_indifferent_access)
  end
end

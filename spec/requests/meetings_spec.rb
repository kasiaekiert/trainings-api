require 'rails-helpers'

describe 'Meetings API', type: :request do
  it 'returns all meetings' do
    get '/api/v1/meetings'

    expect(response).to have_http_status(:success)
  
  end
end
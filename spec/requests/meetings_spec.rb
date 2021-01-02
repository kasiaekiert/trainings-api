require 'rails_helper'
require 'spec_helper'

describe 'Meetings API', type: :request do
    let(:first_author) { FactoryBot.create(:author, first_name: 'Adam', last_name: 'Kowalski', section: 'cardio') }
    let(:second_author) { FactoryBot.create(:author, first_name: 'Tomasz', last_name: 'Nowak', section: 'strength training') }
    
    describe 'GET /meetings' do
    before do
      FactoryBot.create(:meeting, title: '123', author: first_author)
      FactoryBot.create(:meeting, title: '12443', author: second_author)
    end

    it 'returns all meetings' do
      get '/api/v1/meetings'

      expect(response).to have_http_status(:success)
      expect(response_body.size).to eq(2)
    end
  end

  describe 'POST /meetings' do
    it 'create a new meeting' do
      expect { 
        post '/api/v1/meetings', params: { 
          author: {first_name: 'Adam', last_name: 'Kowalski', section: 'cardio'},
          meeting: {title: 'cardio'}
        }
        }.to change { Meeting.count }.from(0).to(1)

        expect(response).to have_http_status(:created)
        expect(Author.count).to eq(1)
        expect(response_body).to eq(
          {
            'id' => 1,
            'title' => 'cardio',
            'author_name' => 'AdamKowalski',
            'author_section' => 'cardio'
          }
        )
      end
    end

  describe 'DELETE .meetings/:id' do
    let!(:meeting) { FactoryBot.create(:meeting, title: 'streching', author: first_author) }

    it 'deletes a meeting' do
      expect {
        delete "/api/v1/meetings/#{meeting.id}"
      }.to change { Meeting.count }.from(1).to(0)

      expect(response).to have_http_status(:no_content)
    end
  end
end
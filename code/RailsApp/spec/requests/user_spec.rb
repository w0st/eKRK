require 'spec_helper'

describe 'Users' do
  describe 'GET /v1/users' do
    describe 'should return user list' do
      before do
        @user = create(:user)
        get '/v1/users'
      end

      it 'returns 200 success status' do
        expect(response.response_code).to eq 200
      end
    end
  end

  describe 'GET /v1/users/:id' do
    describe 'should return user details' do
      before do
        @user = create(:user)
        get "/v1/users/#{@user.id}"
      end

      it 'returns 200 success status' do
        expect(response.response_code).to eq 200
      end
    end
  end

  describe 'POST /v1/users' do
    describe 'should save parameters' do
      before do
        post '/v1/users'
      end

      it 'returns 201 success status' do
        expect(response.response_code).to eq 201
      end
    end
  end

  describe 'PUT /v1/users/:id' do
    describe 'should save parameters' do
      before do
        @user = create(:user)
        put "/v1/users/#{@user.id}"
      end

      it 'returns 200 success status' do
        expect(response.response_code).to eq 200
      end
    end
  end

  describe 'DELETE /v1/users/:id' do
    describe 'should delete user' do
      before(:each) do
        @user = create(:user)
        delete "/v1/users/#{@user.id}"
      end

      it 'returns 200 success status' do
        expect(response.response_code).to eq 200
      end
    end
  end
end

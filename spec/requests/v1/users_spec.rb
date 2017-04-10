# spec/requests/v1/users_spec.rb
describe "Users API" do
  context "/v1/users#index" do
    it 'returns 401 if not authorized' do
      # make sure it throws a 401 if unauthenticated
      get '/v1/users'
      expect(response.code.to_i).to eq 401
    end

    it 'sends a list of users' do
      FactoryGirl.create_list(:user, 3)

      sign_in do |headers|
        get '/v1/users', params: nil, headers: headers
        # test for the 200 status-code
        expect(response).to be_success

        # check to make sure the right amount of users are returned
        # We created 3 at the beginning of the test and another with the #sign_in method, so 4 total
        expect(json['data'].length).to eq(4)
      end
    end
  end

  context "/v1/users#show" do
    before do
      @user = FactoryGirl.create(:user)
    end

    it "returns 401 if not authorized" do
      get "/v1/users/#{@user.id}"
      expect(response.code.to_i).to eq 401
    end

    it 'retrieves a specific user' do
      sign_in do |headers|
        get "/v1/users/#{@user.id}", headers: headers

        # test for the 200 status-code
        expect(response).to be_success

        # check that the user attributes are the same.
        json_name_attr = json['data']['attributes']['name']
        expect(json_name_attr).to eq(@user.name)

        # ensure that private attributes aren't serialized
        expect(json['private_attr']).to eq(nil)
      end
    end
  end
end
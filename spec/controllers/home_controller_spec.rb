require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #index" do
    let(:name) { 'home controller' }
    context "with happy case" do
      it "returns http success" do
        get :index
        expect(response.status).to eq(200)
      end

      it "returns current time when added parameter time" do
        get :index, params: {time: 'now'}
        expect(response).to have_http_status(:success)
        expect(assigns(:time)).should_not be_nil
      end

      it "returns ip when added parameter whoami" do
        get :index, params: {whoami: '1'}
        expect(response).to have_http_status(:success)
        expect(assigns(:whoami)).should_not be_nil
      end

      it "returns ip and current time when added parameter time and whoami" do
        get :index, params: {whoami: '1', time: 'now'}
        expect(response).to have_http_status(:success)
        expect(assigns(:whoami)).should_not be_nil
        expect(assigns(:time)).should_not be_nil
      end
    end

    context "with unhappy case" do
      it "returns text warning when parameter time is not unmatch value" do
        get :index, params: {time: '1'}
        expect(assigns(:time)).to eq('use value 1 for see the current time')
      end

      it "returns text warning when parameter whoami is not unmatch value" do
        get :index, params: {whoami: 'now'}
        expect(assigns(:whoami)).to eq('use value 1 for see the current IP')
      end

      it "returns nil if parameter whoami and time empty " do
        get :index
        expect(assigns(:whoami)).to eq(nil)
        expect(assigns(:time)).to eq(nil)
      end
    end
  end

end

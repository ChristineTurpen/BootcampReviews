require 'rails_helper'

RSpec.describe BootcampsController, type: :controller do
  describe "bootcamps#create action" do

    it "should require a user to be logged in to post a bootcamp" do
      user = FactoryBot.create(:user)
      post :create, params: { name: 'UC Berkeley Bootcamp', description: 'lol', university: 'Berkeley, CA' }
      expect(response).to redirect_to new_user_session_path
    end

    it "shouldn't let unauthenticated users destroy a bootcamp" do
      bootcamp = FactoryBot.create(:bootcamp)
      delete :destroy, params: { id: bootcamp.id }
      expect(response).to redirect_to new_user_session_path
    end

    it "should allow a user to destroy bootcamp" do
      bootcamp = FactoryBot.create(:bootcamp)
      sign_in bootcamp.user
      delete :destroy, params: { id: bootcamp.id }
      expect(response).to redirect_to root_path
      bootcamp = Bootcamp.find_by_id(bootcamp.id)
      expect(bootcamp).to eq nil
    end
  end
end

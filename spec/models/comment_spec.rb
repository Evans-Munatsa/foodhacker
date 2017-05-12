require 'rails_helper'



RSpec.describe Comment, type: :model do
    let(:user) {FactoryGirl.create(:user)}

  describe "invalid content" do
    it "checks if the body content is valid" do
      expect(FactoryGirl.build(:comment, body: " ")).to be_invalid
    end
  end
end

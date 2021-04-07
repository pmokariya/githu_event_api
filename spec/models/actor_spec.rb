require 'rails_helper'

RSpec.describe Actor, type: :model do
  include Shoulda::Matchers::ActiveRecord
  context "valid Factory" do
    it "has a valid factory" do
      expect(build(:actor)).to be_valid
    end
  end
  it {should have_many(:events).dependent(:destroy)}
  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:email)}
end

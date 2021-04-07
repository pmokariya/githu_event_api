require 'rails_helper'

RSpec.describe Event, type: :model do
  include Shoulda::Matchers::ActiveRecord
  
  it { is_expected.to belong_to(:repo) }

  it { is_expected.to belong_to(:actor) }

  context "valid Factory" do
    it "has a valid factory" do
      expect(build(:event)).to be_valid
    end
  end
  it {should validate_presence_of(:event_type)}
  it {should validate_presence_of(:public)}
end

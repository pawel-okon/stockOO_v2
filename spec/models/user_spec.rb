require 'rails_helper'

describe User do
  it { is_expected.to have_many(:products) }

  describe "#skip_confirmation!" do
    subject { build(:user) }
    let(:confirmation_time) { Time.now }

    before { Timecop.freeze(confirmation_time) }

    it "sets the current date to confirmed_at" do
      subject.skip_confirmation!
      expect(subject.confirmed_at).to eq(confirmation_time)
    end

    after { Timecop.return }
  end
end

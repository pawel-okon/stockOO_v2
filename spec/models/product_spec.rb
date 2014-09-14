require 'rails_helper'

describe Product do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:category) }
  it { is_expected.to belong_to(:manufacturer) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:category) }
  it { is_expected.to validate_presence_of(:user) }
  it { is_expected.to validate_presence_of(:manufacturer) }

  it_behaves_like "time filterable"
end

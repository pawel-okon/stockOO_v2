require 'rails_helper'

describe Manufacturer do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }
  it { is_expected.to have_many(:products) }

  it_behaves_like "time filterable"
end


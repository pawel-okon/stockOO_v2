shared_examples_for "time filterable" do
  let(:time) { Time.now.midnight }
  let(:yesterday_entry) { create(model.to_s.underscore.to_sym, created_at: time - 1.day) }
  let(:model) { described_class }
  before { Timecop.freeze(time) }

  it "takes entries from midnight" do
    expect(model.from_current_day).to_not include(yesterday_entry)
  end

  after { Timecop.return }
end

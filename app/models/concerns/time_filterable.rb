module TimeFilterable
  extend ActiveSupport::Concern

  included do
    scope :from_current_day, -> { where("created_at >= ?", Time.now.midnight) }
  end
end

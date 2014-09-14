module Orderable
  extend ActiveSupport::Concern

  included do
    scope :ordered, -> { order(created_at: :desc) }
  end
end

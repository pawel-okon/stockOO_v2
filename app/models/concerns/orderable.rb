module Orderable
  extend ActiveSupport::Concern

  included do
    scope :ordered, -> { order(created_at: :desc) }

    def test
      puts "asdas"
    end
  end

  def test
    puts "asdas"
  end
end

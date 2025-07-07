module Searchable
  extend ActiveSupport::Concern

  included do
    scope :search_by_title, ->(term) { where("title ILIKE ?", "%#{term}%") }
  end
end
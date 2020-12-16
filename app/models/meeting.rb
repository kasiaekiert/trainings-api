class Meeting < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3 }
  validate :author, presence: true, length: { minimum: 3 }
end

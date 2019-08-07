class Division < ApplicationRecord
  has_many :employees, dependent: :nullify
end

class Official < ApplicationRecord
  validates :official_first_name, presence: true, format: { with: /\A[a-zA-Z ]+\z/,
    message: "only allows letters" }, length: {minimum: 4, maximum: 12}

  validates :official_middle_name, presence: true, format: { with: /\A[a-zA-Z. ]+\z/,
    message: "only allows letters" }, length: {minimum: 4, maximum: 12}

  validates :official_last_name, presence: true, format: { with: /\A[a-zA-Z ]+\z/,
    message: "only allows letters" }, length: {minimum: 4, maximum: 12}

  validates :official_position, presence: true, format: { with: /\A[a-zA-Z ]+\z/,
    message: "only allows letters" }, length: {minimum: 4, maximum: 12}
end

class Request < ApplicationRecord
  validates :request, presence: true

  validates :first_name, presence: true, format: { with: /\A[a-zA-Z ]+\z/,
    message: "only allows letters" }

  validates :middle_name, presence: true, format: { with: /\A[a-zA-Z\. ]+\z/ }

  validates :last_name, presence: true, format: { with: /\A[a-zA-Z ]+\z/,
    message: "only allows letters" }

  validates :nickname, presence: true, format: { with: /\A[a-zA-Z ]+\z/,
    message: "only allows letters" }

  validates :address, presence: true, format:{with:  /\A[a-zA-Z\-\#\.\, ]+\z/}

  validates :contact_no, presence: true
  validates :contact_no, length: {minimum: 4, maximum: 12, :message => "must be 4-12 characters"}
  validates :contact_no, format: {with: /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/}

  validates :gender, presence: true
  validates :gender, format: {with: /[(M|m|Fem|fem|FEM|FeM|feM|fEm)(ale|[a-zA-Z]{3})]/}

  validates :status, presence: true

  validates :birth_place, presence: true
  validates :birth_place,  format:{with: /[-#., a-zA-Z0-9]/}

  validates :occupation, presence: true
  validates :occupation, format: {with: /[a-zA-Z ]/}

  validates :monthly_income, presence: true
  validates :monthly_income, numericality: true

  validates :purpose, presence: true
  validates :purpose, format: {with: /[a-zA-Z ]/}

  validates :emergency_contact_person, presence: true
  validates :emergency_contact_person, format: {with: /[a-zA-Z. ]/}

  validates :relationship, presence: true
  validates :relationship, format: {with: /[a-zA-Z ]/}

  validates :contact_no_2, presence: true
  validates :contact_no_2, length: {minimum: 4, maximum: 12, :message => "must be 4-12 characters"}
  validates :contact_no_2, format: {with: /[(\+639|639|09)[0-9]{9}]|4[0-9]{2}-[0-9]{4}/}
end

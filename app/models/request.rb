class Request < ApplicationRecord
  validates :request, presence: true
  validates :request, format: {with: /[a-zA-Z]/}

  validates :first_name, presence: true
  validates :first_name, format: {with: /[a-zA-Z]/}

  validates :middle_name, presence: true
  validates :middle_name, format: {with: /[a-zA-Z.]/}

  validates :last_name, presence: true
  validates :last_name, format: {with: /[a-zA-Z]/}

  validates :nickname, presence: true
  validates :nickname, format: {with: /[a-zA-Z]/}

  validates :address, presence: true
  validates :address, format:{with: /[-#., a-zA-Z0-9]/}

  validates :contact_no, presence: true
  validates :contact_no, length: {minimum: 4, maximum: 12, :message => "must be 4-12 characters"}
  validates :contact_no, format: {with: /[(\+639|639|09)[0-9]{9}]|4[0-9]{2}-[0-9]{4}/}

  validates :gender, presence: true
  validates :gender, format: {with: /[(M|m|Fem|fem|FEM|FeM|feM|fEm)(ale|[a-zA-Z]{3})]/}

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

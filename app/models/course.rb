class Course < ApplicationRecord
    validates :number, presence: true, length: { minimum: 5 }
    validates :title, presence: true, length: { minimum: 5 }
    validates :semester, presence: true, length: { minimum: 5 }
    validates :category, presence: true, length: { minimum: 5 }
    validates :cataloglink, presence: true, length: { minimum: 5 }
    validates :evaluationlink, presence: true, length: { minimum: 5 }
end

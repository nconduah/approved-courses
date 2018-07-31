class Course < ApplicationRecord
    require 'csv'

    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            Course.create! row.to_hash
        end
    end

    validates :number, presence: true, length: { minimum: 4 }
    validates :title, presence: true, length: { minimum: 5 }
    validates :semester, presence: true, length: { minimum: 3 }
    validates :units, presence: true, length: { minimum: 1 }
    validates :category, presence: true, length: { minimum: 5 }
    validates :cataloglink, presence: true, length: { minimum: 5 }
    validates :evaluationlink, presence: true, length: { minimum: 5 }
end

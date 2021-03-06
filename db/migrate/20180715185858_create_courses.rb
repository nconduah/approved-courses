class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :number
      t.string :title
      t.decimal :units
      t.string :semester
      t.string :category
      t.string :cataloglink
      t.string :evaluationlink
      t.text :recenttakers
      t.text :notes
    end
  end
end

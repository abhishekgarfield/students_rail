class CreateStudentInformations < ActiveRecord::Migration[7.0]
  def change
    create_table :student_informations do |t|
      t.string :name
      t.string :email
      t.references :country, null: false, foreign_key: true
      t.integer :phone
      t.string :gender
      t.references :city, null: false, foreign_key: true
      t.string :extra_Activities

      t.timestamps
    end
  end
end

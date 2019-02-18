class CreateContributions < ActiveRecord::Migration[5.2]
  def change
    create_table :contributions do |t|
      t.belongs_to :project, foreign_key: true
      t.belongs_to :student, foreign_key: true
    end
  end
end

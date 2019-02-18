class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.string :img_url
      t.string :github_url
      t.string :slug
      t.boolean :graduated
    end
  end
end

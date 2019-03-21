class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :slug
      t.string :img_url
      t.string :github_username
      t.boolean :graduated
    end
  end
end

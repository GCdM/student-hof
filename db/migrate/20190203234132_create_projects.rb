class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :live_url
      t.string :repo_url
      t.string :slug
    end
  end
end

class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :slug
      t.string :img_url
      t.string :live_url
      t.string :frontend_repo
      t.string :backend_repo
    end
  end
end

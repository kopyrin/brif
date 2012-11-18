class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.boolean :grave
      t.string :autor
      t.timestamps
    end
  end
end

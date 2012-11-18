class CreateMatters < ActiveRecord::Migration
  def change
    create_table :matters do |t|
      t.text :demand
      t.text :answer
      t.string :category
      t.text :sybcategory
      t.integer :ordercategory
      t.integer :project_id

      t.timestamps
    end
  end
end

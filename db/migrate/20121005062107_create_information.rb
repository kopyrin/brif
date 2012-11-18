class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|
      t.text :demand
      t.text :answer

      t.timestamps
    end
  end
end

class AddCategoryToInformation < ActiveRecord::Migration
  def change
    add_column :information, :category, :string
  end
end

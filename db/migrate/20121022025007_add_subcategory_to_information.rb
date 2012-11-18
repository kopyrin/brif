class AddSubcategoryToInformation < ActiveRecord::Migration
  def change
    add_column :information, :subcategory, :text
  end
end

class AddOrderToInformation < ActiveRecord::Migration
  def change
    add_column :information, :OrderCategory, :integer
  end
end

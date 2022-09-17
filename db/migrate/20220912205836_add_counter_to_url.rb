class AddCounterToUrl < ActiveRecord::Migration[6.0]
  def change
    add_column :urls, :counter, :integer, default: 0
  end
end

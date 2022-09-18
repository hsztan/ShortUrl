# frozen_string_literal: true

class AddCounterToClick < ActiveRecord::Migration[6.0]
  def change
    add_column :clicks, :counter, :integer, default: 0
  end
end

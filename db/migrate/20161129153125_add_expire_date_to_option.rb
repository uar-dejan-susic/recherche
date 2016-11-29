class AddExpireDateToOption < ActiveRecord::Migration[5.0]
  def change
    add_column :options, :expire_date, :datetime
  end
end

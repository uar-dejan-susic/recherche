class CreateOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :options do |t|
      t.string :title
      t.string :template
      t.integer :available_slots

      t.timestamps
    end
  end
end

class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.first_name :string
      t.last_name :string
      t.email :string

      t.timestamps
    end
  end
end

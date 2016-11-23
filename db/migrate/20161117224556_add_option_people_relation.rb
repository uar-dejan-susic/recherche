class AddOptionPeopleRelation < ActiveRecord::Migration[5.0]
  def change
    create_table :prospects do |t|
      t.belongs_to :option, index: true
      t.belongs_to :person, index: true
      t.boolean :tried_to_opt_in, default: false
      t.boolean :checked_in, default: false
      t.datetime :checked_in_date
      t.boolean :opted_in, default: false
      t.datetime :opted_in_date
      t.string :access_token
      t.timestamps
    end
  end
end

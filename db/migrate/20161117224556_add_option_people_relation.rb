class AddOptionPeopleRelation < ActiveRecord::Migration[5.0]
  def change
    create_table :options_people, id: false do |t|
      t.belongs_to :options, index: true
      t.belongs_to :people, index: true
    end
  end
end

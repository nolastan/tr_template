class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :named_price
      t.integer :city_id
      t.text :description
      t.text :private_description
      t.integer :cost_in_cents
      t.boolean :virtual
      t.string :assignment_type
      t.integer :number_runners_to_fill
      t.datetime :complete_by_time
      t.datetime :assign_by_time

      t.timestamps
    end
  end
end

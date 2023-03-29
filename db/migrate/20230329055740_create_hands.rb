class CreateHands < ActiveRecord::Migration[7.0]
  def change
    create_table :hands do |t|
      t.integer :user_id
      t.integer :hand_id

      t.timestamps
    end
  end
end

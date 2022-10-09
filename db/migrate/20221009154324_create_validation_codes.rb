class CreateValidationCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :validation_codes do |t|
      t.string :email, null: false
      t.integer :kind, default: 0, null: false
      t.string :code, limit: 6
      t.datetime :used_at

      t.timestamps
    end
  end
end

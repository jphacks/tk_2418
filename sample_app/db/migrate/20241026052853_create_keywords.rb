class CreateKeywords < ActiveRecord::Migration[7.0]
  def change
    create_table :keywords do |t|
      t.string :word
      t.references :community, null: false, foreign_key: true

      t.timestamps
    end
  end
end

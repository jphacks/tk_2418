class CreateUserPapers < ActiveRecord::Migration[7.0]
  def change
    create_table :user_papers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :paper, null: false, foreign_key: true

      t.timestamps
    end
  end
end

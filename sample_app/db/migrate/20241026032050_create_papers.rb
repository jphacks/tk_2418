class CreatePapers < ActiveRecord::Migration[7.0]
  def change
    create_table :papers do |t|
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end

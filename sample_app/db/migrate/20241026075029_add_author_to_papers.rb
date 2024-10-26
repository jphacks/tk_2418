class AddAuthorToPapers < ActiveRecord::Migration[7.0]
  def change
    add_column :papers, :author, :string
  end
end

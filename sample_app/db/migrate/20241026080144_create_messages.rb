class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.text :content, null: false # メッセージの内容を追加
      t.references :community, null: false, foreign_key: true # community_idを追加
      t.references :user, null: false, foreign_key: true # user_idを追加

      t.timestamps
    end
  end
end
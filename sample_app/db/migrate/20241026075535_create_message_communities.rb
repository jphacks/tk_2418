class CreateMessageCommunities < ActiveRecord::Migration[7.0]
  def change
    create_table :message_communities do |t|

      t.timestamps
    end
  end
end

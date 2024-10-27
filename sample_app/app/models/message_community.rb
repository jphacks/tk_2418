class MessageCommunity < ApplicationRecord
    belongs_to :messages
    belongs_to :users
    belongs_to :community
end

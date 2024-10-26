class Community < ApplicationRecord
    has_many :user_communities
    has_many :users, through: :user_communities
    has_many :message_communities, dependent: :destroy
    
    has_many :keywords
end

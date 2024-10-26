class Community < ApplicationRecord
    has_many :user_communities
    has_many :users, through: :user_communities
    
    has_many :keywords
end

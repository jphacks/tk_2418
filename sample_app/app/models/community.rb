class Community < ApplicationRecord
    has_many :user_communities
    has_many :users, through: :user_communities
    has_many :message_communities, dependent: :destroy
    
    serialize :keywords,Array
    validates :keywords,presence: true
end

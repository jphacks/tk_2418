class Paper < ApplicationRecord
    has_many :authors
    
    has_many :user_papers
    has_many :users, through: :user_papers
end

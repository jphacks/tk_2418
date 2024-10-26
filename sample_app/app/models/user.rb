class User < ApplicationRecord
    has_many :user_communities
    has_many :communities, through: :user_communities

    has_many :user_papers
    has_many :arxiv_papers, through: :user_papers, source: :paper
end

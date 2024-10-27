class CommunityController < ApplicationController
    # ユーザ一覧を表示
    def index
      @community = Community.all
      render json: @community
    end
    def create
        community = Community.new(community_params)
        if community.save
          render json: community, status: :created
        else
          render json: community.errors, status: :unprocessable_entity
        end
      end
    
      def show
        community = Community.find(params[:id])
        render json: {
            id: community.id,
            keywords: community.keywords,
            users: community.users,
            messages: community.messages
        }
      end
    
      def join
        community = Community.find(params[:id])
        user = User.find(params[:user_id])
        community.users << user unless community.users.include?(user)
        render json: community
      end
    
      private
    
      def community_params
        params.require(:community).permit(:name, keywords: [])
      end
end

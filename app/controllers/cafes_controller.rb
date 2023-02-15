class CafesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @cafes = Cafe.all
end 
  def new
        @cafe = cafe.new
      end
    
      def create
       cafes = cafe.new(cafe_params)
        if cafe.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end
      def show
        @cafe = cafe.find(params[:id])
      end
    
      def edit
        @cafe = cafe.find(params[:id])
      end
    
      def update
        cafe = cafe.find(params[:id])
        if cafe.update(cafe_params)
          redirect_to :action => "show", :id => cafe.id
        else
          redirect_to :action => "new"
        end
      end
    
      # 追加ここから
      def destroy
        cafe = cafe.find(params[:id])
        cafe.destroy
        redirect_to action: :index
      end
      private
      def cafe_params
        params.require(:cafe).permit(:cafe_name, :address, :price, :recommend, :image)
      end
end

class DogsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    def index
        @dogs = Dog.all
        @tag_list = Tag.all  
    end

    def new
        @dog = Dog.new
        @dog = current_user.dogs.new
    end
    
    def create
      @dog = current_user.dogs.new(dog_params)           
      tag_list = params[:dog][:tag_name].split(nil)  
      if @dog.save
        @dog.save_tag(tag_list)                                                           
        redirect_to dogs_path      
      else
        redirect_to new_dog_path         
      end
   end

    def show
        @dog = Dog.find(params[:id])
        @comments = @dog.comments
        @comment = Comment.new
        @dog_tags = @dog.tags  
    end

    def edit
        @dog = Dog.find(params[:id])
        @tag_list=@dog.tags.pluck(:tag_name).join(nil)
      end

      def update
        dog = Dog.find(params[:id])
        tag_list = params[:dog][:tag_name].split(nil)
        if dog.update(dog_params)
          old_relations = TagAdd.where(dog_id: dog.id)
    
      old_relations.each do |relation|
        relation.delete
      end

       dog.save_tag(tag_list)
          redirect_to :action => "show", :id => dog.id
      else
        redirect_to :action => "new"
        end
      end

        def destroy
            dog = Dog.find(params[:id])
            dog.destroy
            redirect_to action: :index
        end
          def search
            @tag_list = Tag.all               # こっちの投稿一覧表示ページでも全てのタグを表示するために、タグを全取得
            @tag = Tag.find(params[:tag_id])  # クリックしたタグを取得
            @dogs = @tag.dogs.all      
          end
      private
    def dog_params
      
        params.require(:dog).permit(:cafe_name, :adress, :price, :ecommend, :image,:youtube_url, :tag_id)
    end
end

class AdsController < ApplicationController
    before_action :require_logged_user
    
    def new
        @ad = Ad.new
    end

    def edit
      @ad = current_user.ads.find(params[:id])
    end

    def update
      @ad = current_user.ads.find(params[:id])
      if @ad.update(ad_params)
        redirect_to root_path, notice: "Anúncio atualizado com sucesso!!!"
      else
        render :edit
      end
    end

    def create
        # binding.pry
        # @ad = Ad.new(ad_params.merge(user_id: current_user.id))
        @ad = current_user.ads.build(ad_params)
        
        if @ad.save          
          redirect_to root_path, notice: t(".add_ads_success")
        else
          render :new, alert: "Falha ao criar o anúncio!"
        end
    end

    def destroy
      @ad = current_user.ads.find(params[:id])
      if @ad.destroy          
        redirect_to root_path, notice: t(".delete_ads_success")
      else
        redirect_to root_path, alert: "Falha ao excluir o anúncio!"
      end
    end

    private 

    def ad_params
        params.require(:ad).permit(:title, :description, :price)
    end
end
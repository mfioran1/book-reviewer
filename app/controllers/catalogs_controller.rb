class CatalogsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_catalog, only: [:show, :edit, :update, :destroy]

    
    def index
        @catalogs = current_user.catalogs
    end

    def new
        @catalog = Catalog.new
    end

    def create
        @catalog = current_user.catalogs.new(catalog_params)
        if @catalog.save
            redirect_to @catalog
        else
            render :new
        end
    end

    def show

    end
    

    








    private

    def set_catalog
        @catalog = Catalog.find(params[:id])
    end

    def catalog_params
        params.require(:catalog).permit(:name, :description, :book_ids => [])
    end

end    

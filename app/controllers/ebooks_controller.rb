class EbooksController < ApplicationController
  before_action :set_ebook, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    if params[:category_id] or params[:ebook_name]
      @ebooks = Ebook.where('category_id LIKE ? AND ebook_name LIKE ?',"%#{params[:category_id]}%",
      "%#{params[:ebook_name]}%").paginate(:page => params[:page], :per_page => 5)
    else
      @ebooks = Ebook.all
    end
    respond_with(@ebooks)
  end

  def show
    respond_with(@ebook)
  end

  def new
    @categories = Category.all 
    @staffs = Staff.all 
    @ebook = Ebook.new
    respond_with(@ebook)
  end

  def edit
    @categories = Category.all 
    @staffs = Staff.all
  end

  def create
    @ebook = Ebook.new(ebook_params)
    @ebook.save
    respond_with(@ebook)
  end

  def update
    @ebook.update(ebook_params)
    respond_with(@ebook)
  end

  def destroy
    @ebook.destroy
    respond_with(@ebook)
  end

  def download_file
    send_file @ebook.attachment.url
  end

  private
    def set_ebook
      @ebook = Ebook.find(params[:id])
    end

    def ebook_params
      params.require(:ebook).permit(:ebook_name, :file, :about, :category_id, :uploader_id)
    end
end

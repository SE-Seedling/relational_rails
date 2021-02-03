class NovelsController < ApplicationController
  def index
    @novels = Novel.all
  end

  def new

  end

  def create
    novel = Novel.new({
      title: params[:novel][:title],
      author: params[:novel][:author],
      hard_cover: params[:novel][:hard_cover],
      number_of_chapters: params[:novel][:number_of_chapters],
      created_at: params[:novel][:created_at],
      updated_at: params[:novel][:updated_at]
      })

      novel.save

      redirect_to '/novels'
  end
end

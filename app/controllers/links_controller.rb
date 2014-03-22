require 'link_normalizer'

class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def show
    link = Link.find_by_token(params[:token])
    if link
      redirect_to "http://#{link.url}"
    else
      redirect_to links_path
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    params.permit!
    link = Link.new(params[:link])

    @link = ::LinkNormalizer.new(link).normalize!

    @link.save!

    flash[:success] = "Link saved successfully"

    redirect_to links_path
  end

  def new
    @link = Link.new
  end

  def create
    params.permit!
    link = Link.new(params[:link])

    @link = ::LinkNormalizer.new(link).normalize!

    @link.save!

    flash[:success] = "Link saved successfully"

    redirect_to links_path
  end
end

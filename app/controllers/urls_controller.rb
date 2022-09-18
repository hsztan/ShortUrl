# frozen_string_literal: true

class UrlsController < ApplicationController
  def index
    # recent 10 short urls
    respond_to do |f|
      f.html do
        @urls = Url.latest
        @url = Url.new
      end
      f.json { render json: Url.latest.to_json(include: :clicks) }
    end
    # @url = Url.new
    # @urls = Url.latest
  end

  def create
    @url = Url.new(url_params)
    @url.short_url = Url.create_short_url
    flash[:notice] = 'Short URL created!' if @url.save
    flash[:notice] = @url.errors.full_messages.join(', ') unless @url.errors.empty?
    redirect_to urls_path
  end

  def show # rubocop:disable Metrics/AbcSize
    if params[:url] == 'NOTFOUND'
      render_404
    else
      @url = Url.find(params[:url])
      @click = Click.new(url: @url, browser: browser.name, platform: browser.platform)
      render_404 unless @click.save
      @url.clicks_count += 1
      @url.update(clicks_count: @url.clicks_count)
      # implement queries
      @daily_clicks = @url.daily_clicks
      # create tuple of browser and clicks
      @browsers_clicks = @url.browsers_clicks
      # create tuple of platform and clicks
      @platform_clicks = @url.platforms_clicks
    end
  end

  def render_404 # rubocop:disable naming/VariableNumber
    respond_to do |format|
      format.html { render file: "#{Rails.root}/public/404", layout: false, status: :not_found }
      format.xml  { head :not_found }
      format.any  { head :not_found }
    end
  end

  def visit
    @url = Url.find_by(short_url: params[:short_url])
    if @url.present?
      redirect_to @url.original_url
    else
      redirect_to url_path('NOTFOUND')
    end
  end

  private

  def url_params
    params.require(:url).permit(:original_url)
  end
end

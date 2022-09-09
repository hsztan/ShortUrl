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

  def show
    @url = Url.find(params[:url])
    redirect_to urls_path unless @url.present?
    @click = Click.new(url: @url, browser: browser.name, platform: browser.platform)
    unless @click.save
      flash[:notice] = @click.errors.full_messages.join(', ')
      redirect_to urls_path
    end
    @url.clicks_count += 1
    @url.update(clicks_count: @url.clicks_count)
    # implement queries
    @daily_clicks = @url.daily_clicks
    # create tuple of browser and clicks
    @browsers_clicks = @url.browsers_clicks
    # create tuple of platform and clicks
    @platform_clicks = @url.platforms_clicks
  end

  def visit
    # params[:short_url]
    render plain: 'redirecting to url...'
  end

  private

  def url_params
    params.require(:url).permit(:original_url)
  end
end

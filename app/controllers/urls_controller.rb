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
    if @url.save
      @click = Click.new(url_id: @url.id, browser: browser.name, platform: browser.platform, created_at: Time.now)
      @click.save
      @url.clicks << @click
    end
    flash[:notice] = @url.errors.full_messages.join(', ') unless @url.errors.empty?
    redirect_to urls_path
  end

  def show
    @url = Url.find(params[:url])
    redirect_to urls_path unless @url.present?
    # implement queries
    @daily_clicks = [
      ['1', 13],
      ['2', 2],
      ['3', 1],
      ['4', 7],
      ['5', 20],
      ['6', 18],
      ['7', 10],
      ['8', 20],
      ['9', 15],
      ['10', 5]
    ]
    @browsers_clicks = [
      ['IE', 13],
      ['Firefox', 22],
      ['Chrome', 17],
      ['Safari', 7]
    ]
    @platform_clicks = [
      ['Windows', 13],
      ['macOS', 22],
      ['Ubuntu', 17],
      ['Other', 7]
    ]
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

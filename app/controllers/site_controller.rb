class SiteController < ApplicationController

  def index

  end

  def about

  end

  def contact

  end

  def contact_submit
    ContactMailer.delay.contact_request(params)
    redirect_to root_path, notice: 'Thanks for contacting us!'
  end
end

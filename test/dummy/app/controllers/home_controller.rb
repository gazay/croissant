class HomeController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.ascii { render ascii: 'contents' }
    end
  end
end

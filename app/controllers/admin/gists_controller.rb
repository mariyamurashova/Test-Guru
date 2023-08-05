class Admin::GistsController < Admin::BaseController

  def show
    @gists = Gist.all
  end

end

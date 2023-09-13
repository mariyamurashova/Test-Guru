class Admin:: BadgesController < Admin::BaseController
  before_action :authenticate_user! 
  before_action :set_badge, only: %i[ update destroy ]


  def index
    @badges = Badge.all
  end

  def show
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)
      if @badge.save
        redirect_to [:admin, @badge], notice: t('.success')
      else
        render :new
      end
  end

  def update
    @badge.rule_category = nil if params[:rule_category]==nil 
    @badge.rule_level = nil if params[:rule_level]==nil 
    if @badge.update(badge_params)
      redirect_to [:admin, @badge]
    else
      render :edit 
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

private

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    
     params.require(:badge).permit(:title, :image, :rule_category, :rule_level, :active)
  end

end

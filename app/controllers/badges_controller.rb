class BadgesController < ApplicationController
  
  before_action :authenticate_user!, only: %i[ index ]
  before_action :set_badge, only: %i[ show edit update destroy ]


  def index
    @badges = Badge.all
  end

end

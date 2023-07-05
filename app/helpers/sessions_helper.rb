module SessionsHelper

  def flash_message

   if flash[:alert] 
    flash.each do |key, msg|
      return content_tag :div, msg, :id => key, :class => 'flash alert'
    end
   end
  end

end

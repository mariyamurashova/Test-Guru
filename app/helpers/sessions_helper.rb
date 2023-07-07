module SessionsHelper

  def flash_message
 
    flash.map do |key, message| 
      content_tag :div, message, class: "flash #{key}"  
    end.join().html_safe
  end

end

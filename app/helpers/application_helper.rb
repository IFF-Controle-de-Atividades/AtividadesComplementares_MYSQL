module ApplicationHelper
	def error_tag(model, attribute)
  		if model.errors.has_key? attribute
  			content_tag :div, model.errors[attribute].first, :class => 'error_message'
  		end
  	end

  	def yes_or_no?(value)
		value ? I18n.t('labels._yes') : I18n.t('labels._no')
	end

	def status?(value)
		value ? I18n.t('labels._on') : I18n.t('labels._off')
	end
	
	def flash_message
        messages = ""
        [:warning, :error].each {|type|
          if flash[type]
            messages += "<p class=\"#{type}\">#{flash[type]}</p>"
          end
        }
        messages.html_safe
    end
end
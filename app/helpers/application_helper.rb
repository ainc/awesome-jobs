module ApplicationHelper
  def flash_errors(object)
    if resource and resource.errors and resource.errors.count > 0 or !flash[:alert].blank?
      output = ''
      output += '<div class="alert alert-danger">'
      output += '<button type="button" class="close" data-dismiss="alert" aria-hidden="true"> &times;</button>'
      output += "<h4 class='text-center'>#{I18n.t('error')}</h4>"
      object.errors.full_messages.each do |message|
        output += "<p class='text-center'>#{message}</p>"
      end
      if !flash[:alert].blank?
        output += "<p class='text-center'>#{flash[:alert]}</p>"
      end
      output += '</div>'
      output += "<script type='text/javascript'>$('.alert').alert();</script>"
      output.html_safe
    else
      ''
    end
  end


  def error_for_field(resource, symbols, &proc)
    error = false
    symbols.each do |s|
      error = resource.errors[s].first.nil? ? error : true
    end
    
    output = ''
    if error
      output += "<div class='form-group has-error has-feedback'>"
      output += "#{proc.yield}"
      output += "<span class='glyphicon glyphicon-remove form-control-feedback'></span>"
      output += "</div>"
    else
      output += "<div class='form-group'>"
      output += "#{proc.yield}"
      output += "</div>"
    end

    output.html_safe
  end

  def resource_errors!
    output = ""
    if resource and resource.errors and resource.errors.count > 0
      output += "<div class='alert alert-danger'>
        <script type='text/javascript'>
          $('.alert').alert();                
        </script>
        <button type='button' class='close' data-dismiss='alert' aria-hidden='true'> #{'&times;'.html_safe} </button>
        <h4 class='text-center'> #{I18n.t('error')}</h4>"
        resource.errors.full_messages.uniq.each do |message|
          output += "<p class='text-center'>#{message}</p>"
        end
        output += "</div>"
    end
    output.html_safe
  end
end

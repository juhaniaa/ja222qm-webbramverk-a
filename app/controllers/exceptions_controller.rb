class ExceptionsController < ApplicationController
  layout 'error'

  def show
    render "error_page"
    #custom_template = template_exists?(status_code, 'errors')
    #render action: custom_template ? status_code.to_s : 'show'
  end
  
  #def render_error
   # @exception = env["action_dispatch.exception"]
    #@status_code = ActionDispatch::ExceptionWrapper.new(env, @exception).status_code
    #render :error_page, status: @status_code, layout: true
  #end
  #protected

  #def status_code
    #(request.path.match(/\d{3}/) || ['500'])[0].to_i
  #end
end

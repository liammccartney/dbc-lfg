def display_error
  error = session[:errors]
  session[:errors] = nil

  if error
    return erb :'errors/_error_display', layout: false, locals: {errors: error}
  else
    return ""
  end
end

def set_error(msg)
  session[:error] = {"Error" => [msg]}
end
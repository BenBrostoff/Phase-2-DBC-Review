helpers do
  def show_errors_for(error_type)
    if @errors && @errors[error_type]
      @errors[error_type].join('; ')
    end
  end
end

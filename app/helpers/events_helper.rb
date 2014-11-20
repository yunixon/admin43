module EventsHelper

  def label_class_for(status)
    return if status.nil?
    {
      :new => 'label-default',
      :moderating => 'label-info',
      :accepted => 'label-success',
      :rejected => 'label-danger'
    }[status.to_sym] || status.to_s
  end

end

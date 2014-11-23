module ApplicationHelper

  def alert_class_for(flash_type)
    {
      :success => 'alert-success',
      :error => 'alert-danger',
      :alert => 'alert-warning',
      :notice => 'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def label_class_for(status)
    return if status.nil?
    {
      :new => 'label-default',
      :moderating => 'label-info',
      :accepted => 'label-success',
      :rejected => 'label-danger',
      :unpublished => 'label-default',
      :published => 'label-success',
      :completed => 'label-warning'
    }[status.to_sym] || status.to_s
  end

  def avatar_url(user)
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png"
  end

end

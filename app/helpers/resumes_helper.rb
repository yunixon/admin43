module ResumesHelper

  def label_class_for(status)
    return if status.nil?
    {
      :unpublished => 'label-default',
      :published => 'label-success',
    }[status.to_sym] || status.to_s
  end

end

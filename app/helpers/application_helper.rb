module ApplicationHelper
  
  def full_title(page_title = '', base_title = t('views.app.title'))
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  
  def has_ctas?
    content_for(:ctas_primary) || content_for(:ctas_secondary)
  end

  
  def is_link_active?(link)
    controller_name == link ? '-active' : ''
  end


end

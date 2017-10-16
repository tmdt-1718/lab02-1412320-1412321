module MessagesHelper
  def localtime(time)
    local = time.localtime();
    return "<span class='time'>#{local.day}/#{local.month} #{local.hour}:#{local.min}</span>".html_safe
  end
end

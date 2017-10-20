module MessagesHelper
  def localtime(time)
    local = time.localtime();
    return "#{local.day}/#{local.month} #{local.hour}:#{local.min}"
  end
end

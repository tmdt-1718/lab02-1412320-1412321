module MessagesHelper
  def localtime(time)
    local = time.in_time_zone('Bangkok')
    return "#{local.day}/#{local.month} #{local.hour > 9 ? local.hour : '0' + local.hour.to_s}:#{local.min > 9 ? local.min : '0' + local.min.to_s}"
  end
end

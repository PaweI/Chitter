def current_user
  @current_user ||= User.get(session[:user_id]) if session[:user_id]
end

def time_word(peep)
  return "#{(Time.now - peep.time).to_i} seconds ago" if (0..59).include?(Time.now - peep.time)
  return "#{(Time.now - peep.time).to_i / 60} minutes ago" if (60..3599).include?(Time.now - peep.time)
  return "#{(Time.now - peep.time).to_i / 3600} hours ago" if (3600..86400).include?(Time.now - peep.time)
  "#{(Time.now - peep.time).to_i / 86400} days ago"
end
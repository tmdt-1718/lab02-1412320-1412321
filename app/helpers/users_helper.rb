module UsersHelper
	def gravatar_for(user, size: 80)
    # if user.avatar
    #   image_tag(user.avatar, class:"gravatar img-fluid", style:"width: #{size}px")
    # else
      gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
      gravatar_link = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
      image_tag(gravatar_link, alt: user.name, class: "gravatar")
    # end
  end
end

module ApplicationHelper
  def user_avatar(user)
    user&.avatar&.url || asset_pack_path('media/images/user_avatar.jpg')
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end
end

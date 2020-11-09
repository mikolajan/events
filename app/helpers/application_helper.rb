module ApplicationHelper
  def user_avatar(user)
    user&.avatar&.url || asset_pack_path('media/images/user_avatar.jpg')
  end

# Аналогично user_avatar, только возвращает миниатюрную версию
  def user_avatar_thumb(user)
    user.avatar.file.present? ? user.avatar.thumb.url : asset_pack_path('media/images/user_avatar.jpg')
  end

  # Возвращает адрес рандомной фотки события, если есть хотя бы одна. Или ссылку
  # на дефолтную картинку.
  def event_photo(event)
    photos = event.photos.persisted

    photos.any? ? photos.sample.photo.url : asset_pack_path('media/images/event.jpg')
  end

  # Аналогично event_photo, только возвращает миниатюрную версию
  def event_thumb(event)
    photos = event.photos.persisted

    photos.any? ? photos.sample.photo.thumb.url : asset_pack_path('media/images/event_thumb.jpg')
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end
end

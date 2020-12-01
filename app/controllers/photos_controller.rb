class PhotosController < ApplicationController
  before_action :set_event, only: [:create, :destroy]
  before_action :set_photo, only: [:destroy]

  def create
    @new_photo = @event.photos.build(photo_params)
    @new_photo.user = current_user

    if @new_photo.save
      notify_subscribers(@event, @new_photo)

      redirect_to @event, notice: I18n.t('controllers.photos.created')
    else
      render 'events/show', alert: I18n.t('controllers.photos.error')
    end
  end

  def destroy
    message = {notice: I18n.t('controllers.photos.destroyed')}

    if current_user_can_edit?(@photo)
      @photo.destroy
    else
      message = {alert: I18n.t('controllers.photos.error')}
    end

    redirect_to @event, message
  end

  private
  # Так как фотография — вложенный ресурс, то в params[:event_id] рельсы
  # автоматически положает id события, которому принадлежит фотография
  # найденное событие будет лежать в переменной контроллера @event
  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_photo
    @photo = @event.photos.find(params[:id])
  end

  def photo_params
    params.fetch(:photo, {}).permit(:photo)
  end

  def notify_subscribers(event, photo)
    subscribers_list_for_mailing = event.subscribers.map(&:email) + [event.user.email] - [current_user.email]

    subscribers_list_for_mailing.each do |mail|
      EventMailer.photo(event, photo, mail).deliver_now
    end
  end
end

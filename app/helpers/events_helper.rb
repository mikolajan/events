module EventsHelper
  def user_is_author?
    @event.user == current_user
  end
end

module SubscriptionsHelper
  def user_is_subscribed?
    @event.subscriptions.map(&:user).include?(current_user)
  end
end

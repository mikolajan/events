module SubscriptionsHelper
  def user_is_subscribed?
    current_user ? @event.subscriptions.map(&:user).include?(current_user) : false
  end
end

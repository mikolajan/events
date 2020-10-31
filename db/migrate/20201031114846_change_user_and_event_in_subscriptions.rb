class ChangeUserAndEventInSubscriptions < ActiveRecord::Migration[6.0]
  def change
    remove_reference :subscriptions, :user, null: false
  end
end

class ChangeEventAndUserInSubscriptions < ActiveRecord::Migration[6.0]
  def change
      remove_reference :subscriptions, :event, null: false

      add_reference :subscriptions, :event, index: true, foreign_key: true
      add_reference :subscriptions, :user, index: true, foreign_key: true
  end
end

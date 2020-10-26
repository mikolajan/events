class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :event, presence: true

  validates :user_name, presence: true, unless: -> { user.present? }
  validates :user_email, presence: true, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/, unless: -> { user.present? }

  validates :user, uniqueness: {scope: :event_id}, if: -> { user.present? }
  validates :user_email, uniqueness: {scope: :event_id}, unless: -> { user.present? }

  validate :block_author_to_subscribe, on: :create

  def user_name
    user.present? ? user.name : super
  end

  def user_email
    user.present? ? user.email : super
  end

  def block_author_to_subscribe
    errors.add(:event, I18n.t('subscriptions.subscription.block_author_to_subscribe')) if user == event.user
  end
end

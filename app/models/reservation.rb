class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  
  validates :check_in, presence: true
  validates :check_out, presence: true
  validates :number_of_guests, presence: true
  
  validate :checkin_checkout_check
  validate :checkin_not_today

  def checkin_checkout_check
    if check_in.present? && check_out.present? && check_in >= check_out
      errors.add(:check_out, "はチェックイン日より後の日付を選択してください")
    end
  end

  def checkin_not_today
    if check_in.present? && check_in <= Date.today
      errors.add(:check_in, "は本日以降で選択してください")
    end
  end
end

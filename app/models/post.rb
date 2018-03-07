class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  include ActiveModel::Validations
  validates_with ClickbaitValidator
end

class ClickbaitValidator < ActiveModel::Validator
  CLICKBAIT_PATTERNS = [ /Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]
  def validate(record)
    unless CLICKBAIT_PATTERNS.include?(record.title)
      record.errors[:name] << "not a clickbait"
    end
  end
  
end

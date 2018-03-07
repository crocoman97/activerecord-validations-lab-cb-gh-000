# class ClickbaitValidator < ActiveModel::Validator
  
#   def validate(record)
#     clickbait_patterns = [ /Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]
#     unless CLICKBAIT_PATTERNS.include?(title)
#       record.errors[:name] << "not a clickbait"
#     end
#   end
  
# end

class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validates_with ClickbaitValidator
end

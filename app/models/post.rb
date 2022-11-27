class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ['Fiction', 'Non-Fiction']}
    validate :title_clickbait

    def title_clickbait
        if !(["Won't Believe","Secret","Top [number]","Guess"].any?{|phrase| "#{title}".include?(phrase)})
          errors.add(:title, "not clickbaity")
        end
      end
end

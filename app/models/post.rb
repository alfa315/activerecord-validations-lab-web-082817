class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content,length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
  validates :title, presence: true, if: :clickbait?

  def clickbait?

    array = ["Won't Believe", "Secret", "Top [Number]", "Guess"]

    if self.title
      array.each do |phrase|
        if self.title.include?(phrase)
          return
        end
        self.errors[:title] << "WRONG"
      end
    end
  end


  #   array.each do |phrase|
  #      self.title.exclude?(phrase)
  #       false
  #     end
  #   end
  # end

end

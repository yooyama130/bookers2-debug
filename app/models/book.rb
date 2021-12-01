class Book < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :book_comments, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}

	 # 先週比用
  def self.this_week_posts
      if Date.today.saturday?
          self.where(created_at: Date.today ... Date.today+7)
      elsif Date.today.sunday?
          self.where(created_at: Date.today-1 ... Date.today+6)
      elsif Date.today.monday?
          self.where(created_at: Date.today-2 ... Date.today+5)
      elsif Date.today.tuesday?
          self.where(created_at: Date.today-3 ... Date.today+4)
      elsif Date.today.wednesday?
          self.where(created_at: Date.today-4 ... Date.today+3)
      elsif Date.today.thursday?
          self.where(created_at: Date.today-5 ... Date.today+2)
      elsif Date.today.friday?
          self.where(created_at: Date.today-6 ... Date.today+1)
      end
  end

  def self.last_week_posts
      if Date.today.saturday?
          self.where(created_at: Date.today-7 ... Date.today)
      elsif Date.today.sunday?
          self.where(created_at: Date.today-8 ... Date.today-1)
      elsif Date.today.monday?
          self.where(created_at: Date.today-9 ... Date.today-2)
      elsif Date.today.tuesday?
          self.where(created_at: Date.today-10 ... Date.today-3)
      elsif Date.today.wednesday?
          self.where(created_at: Date.today-11 ... Date.today-4)
      elsif Date.today.thursday?
          self.where(created_at: Date.today-12 ... Date.today-5)
      elsif Date.today.friday?
          self.where(created_at: Date.today-13 ... Date.today-6)
      end
  end
end

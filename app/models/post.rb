class Post < ActiveRecord::Base
    belongs_to :user

    validates :title, presence: true
    validates :author, presence: true
    validates :copyright_date, presence: true
    validates :image_url, presence: true
    validates :description, presence: true


    def self.search(query)
        where("title LIKE ?", "%#{query}%")
    end

    def self.by_author(author)
        where(author: author)
    end
    
    def self.all_authors
        self.pluck(:author).uniq
    end
    
end

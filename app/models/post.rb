class Post < ActiveRecord::Base
    belongs_to :user

    # validates :title, presence: true
    # validates :author, presence: true
    # validates :copyright_date, presence: true
    # validates :image_url, presence: true
    # validates :description, presence: true
    
end

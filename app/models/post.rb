class Post < ApplicationRecord
    validates :title, presence: true 
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    validates :content, length: {minimum: 100}

    def self.fiction_posts 
        self.where("category = ?", "Fiction")
    end

    def self.non_fiction_posts 
        self.where("category = ?", "Non-Fiction")
    end
end

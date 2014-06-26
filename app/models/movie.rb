class Movie < ActiveRecord::Base
	validates :title, :description, presence: true
	validates :description, length: { minimum: 10 }
	validates :year_released, numericality: { greater_than: 0 }

	 def self.search_for(query)
	 	where('title LIKE :query OR description LIKE :query', query:"%#{query}%")
	 end
end

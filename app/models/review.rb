class Review < ActiveRecord::Base
    belongs_to :product
    belongs_to :user

    def print_review
        "Review for #{product.name} by #{user.name}: #{star_rating}. #{comment}"
    end

end

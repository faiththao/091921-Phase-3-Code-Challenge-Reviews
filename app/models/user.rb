class User < ActiveRecord::Base
    has_many :reviews
    has_many :products, through: :reviews

    def favorite_product
        self.products
        .filter {|product| product.star_rating}.last
    end

    def remove_reviews(product)
        review = self.reviews.find_by_product_id(product.id)
        if reviews != nil 
            review.destroy
        end
    end
end

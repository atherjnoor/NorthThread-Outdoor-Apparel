module ProductsHelper
  def product_image_url(product)
    if product.images.attached?
      url_for(product.images.first.variant(resize_to_limit: [350, 250]))
    else
      # Generate a fast CDN placeholder image URL based on product ID
      # Picsum.photos provides random images at URL: https://picsum.photos/WIDTH/HEIGHT?random=SEED
      "https://picsum.photos/350/250?random=#{product.id}"
    end
  end

  def product_detail_image_url(product)
    if product.images.attached?
      url_for(product.images.first.variant(resize_to_limit: [600, 450]))
    else
      "https://picsum.photos/600/450?random=#{product.id}"
    end
  end
end

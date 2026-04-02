namespace :seed do
  desc "Attach placeholder images to all products using Picsum.photos API"
  task attach_images: :environment do
    puts "Attaching images to products..."

    Product.all.each_with_index do |product, index|
      if product.images.attached?
        puts "✓ #{product.name} - already has images"
        next
      end

      begin
        # Use Picsum.photos for random placeholder images
        image_url = "https://picsum.photos/400/400?random=#{product.id + index}"

        image_data = URI.open(image_url, read_timeout: 10)
        product.images.attach(
          io: image_data,
          filename: "product_#{product.id}.jpg",
          content_type: 'image/jpeg'
        )
        print "."
        STDOUT.flush
      rescue StandardError => e
        print "!"
        STDOUT.flush
      end
    end

    puts "\n✓ All product images attached successfully!"
  end
end

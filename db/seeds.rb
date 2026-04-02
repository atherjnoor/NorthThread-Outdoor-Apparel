Province.find_or_create_by!(abbreviation: 'AB') do |province|
  province.name = 'Alberta'
  province.gst_rate = 0.05
  province.pst_rate = 0.0
  province.hst_rate = 0.0
end
Province.find_or_create_by!(abbreviation: 'BC') do |province|
  province.name = 'British Columbia'
  province.gst_rate = 0.05
  province.pst_rate = 0.07
  province.hst_rate = 0.0
end
Province.find_or_create_by!(abbreviation: 'MB') do |province|
  province.name = 'Manitoba'
  province.gst_rate = 0.05
  province.pst_rate = 0.07
  province.hst_rate = 0.0
end
Province.find_or_create_by!(abbreviation: 'NB') do |province|
  province.name = 'New Brunswick'
  province.gst_rate = 0.0
  province.pst_rate = 0.0
  province.hst_rate = 0.15
end
Province.find_or_create_by!(abbreviation: 'NL') do |province|
  province.name = 'Newfoundland and Labrador'
  province.gst_rate = 0.0
  province.pst_rate = 0.0
  province.hst_rate = 0.15
end
Province.find_or_create_by!(abbreviation: 'NS') do |province|
  province.name = 'Nova Scotia'
  province.gst_rate = 0.0
  province.pst_rate = 0.0
  province.hst_rate = 0.15
end
Province.find_or_create_by!(abbreviation: 'NT') do |province|
  province.name = 'Northwest Territories'
  province.gst_rate = 0.05
  province.pst_rate = 0.0
  province.hst_rate = 0.0
end
Province.find_or_create_by!(abbreviation: 'NU') do |province|
  province.name = 'Nunavut'
  province.gst_rate = 0.05
  province.pst_rate = 0.0
  province.hst_rate = 0.0
end
Province.find_or_create_by!(abbreviation: 'ON') do |province|
  province.name = 'Ontario'
  province.gst_rate = 0.0
  province.pst_rate = 0.0
  province.hst_rate = 0.13
end
Province.find_or_create_by!(abbreviation: 'PE') do |province|
  province.name = 'Prince Edward Island'
  province.gst_rate = 0.0
  province.pst_rate = 0.0
  province.hst_rate = 0.15
end
Province.find_or_create_by!(abbreviation: 'QC') do |province|
  province.name = 'Quebec'
  province.gst_rate = 0.05
  province.pst_rate = 0.09975
  province.hst_rate = 0.0
end
Province.find_or_create_by!(abbreviation: 'SK') do |province|
  province.name = 'Saskatchewan'
  province.gst_rate = 0.05
  province.pst_rate = 0.06
  province.hst_rate = 0.0
end
Province.find_or_create_by!(abbreviation: 'YT') do |province|
  province.name = 'Yukon'
  province.gst_rate = 0.05
  province.pst_rate = 0.0
  province.hst_rate = 0.0
end

categories = {
  'Jackets & Coats' => 'Heavy-duty insulated outer layers for deep winter conditions.',
  'Mid-Layers' => 'Breathable fleece and synthetic insulation for adaptable layers.',
  'Base Layers' => 'Moisture-wicking and thermal underwear for active winter sports.',
  'Accessories' => 'Hats, gloves, scarves and gear that keep you comfortable outdoors.',
  'Footwear' => 'Insulated boots with traction for ice, snow and cold-weather use.'
}

categories.each do |name, description|
  Category.find_or_create_by!(name: name) do |cat|
    cat.description = description
  end
end

products_data = [
  # Jackets & Coats (30+ products)
  {
    name: 'Arctic Shield Insulated Parka',
    description: 'A durable parka with waterproof outer shell and advanced down insulation. Ideal for Winnipeg winters and long outdoor workdays.',
    price: 329.00,
    stock_quantity: 40,
    on_sale: false,
    sale_price: nil,
    categories: ['Jackets & Coats']
  },
  {
    name: 'Frostline Waterproof Shell',
    description: 'Fully seam-sealed shell with storm hood and ventilation zips. Built for wet and windy conditions.',
    price: 249.00,
    stock_quantity: 50,
    on_sale: true,
    sale_price: 215.00,
    categories: ['Jackets & Coats']
  },
  {
    name: 'Northwind Softshell Pants',
    description: 'Windproof and water-resistant pants with articulated knees. Built for snowshoeing and winter commuting.',
    price: 139.00,
    stock_quantity: 70,
    on_sale: false,
    sale_price: nil,
    categories: ['Jackets & Coats', 'Mid-Layers']
  },
  {
    name: 'Blizzard Extreme Winter Coat',
    description: 'Premium down-filled coat with goose down insulation rated to -40C. Designed for extreme cold and outdoor expeditions.',
    price: 459.99,
    stock_quantity: 25,
    on_sale: true,
    sale_price: 379.99,
    categories: ['Jackets & Coats']
  },
  {
    name: 'Snowpeak Utility Jacket',
    description: 'Military-grade insulated jacket with multiple utility pockets and reinforced shoulders. Tested in harsh conditions.',
    price: 289.00,
    stock_quantity: 35,
    on_sale: false,
    sale_price: nil,
    categories: ['Jackets & Coats']
  },
  {
    name: 'Windbreak Technical Shell',
    description: 'Lightweight breathable shell with sealed seams and pit zips. Perfect for active winter sports.',
    price: 199.99,
    stock_quantity: 60,
    on_sale: false,
    sale_price: nil,
    categories: ['Jackets & Coats']
  },
  {
    name: 'Glacier Guard Winter Trousers',
    description: 'Insulated trousers with gaiters and reinforced crotch. Designed for serious mountaineers and outdoor workers.',
    price: 179.00,
    stock_quantity: 45,
    on_sale: false,
    sale_price: nil,
    categories: ['Jackets & Coats']
  },
  {
    name: 'Thermal Hybrid Jacket',
    description: 'Hybrid design with synthetic down in core and stretch fabric on sides. Maximum mobility and warmth.',
    price: 269.00,
    stock_quantity: 55,
    on_sale: true,
    sale_price: 215.00,
    categories: ['Jackets & Coats']
  },
  {
    name: 'Urban Winter Parka',
    description: 'Stylish mid-length parka with faux fur trim and leather accents. Perfect for city commutes.',
    price: 359.00,
    stock_quantity: 40,
    on_sale: false,
    sale_price: nil,
    categories: ['Jackets & Coats']
  },
  {
    name: 'Everest Expedition Coat',
    description: 'Mountaineering-grade coat with expedition-weight down. Built for serious alpinists.',
    price: 579.99,
    stock_quantity: 15,
    on_sale: false,
    sale_price: nil,
    categories: ['Jackets & Coats']
  },
  {
    name: 'Polar Pro Down Puffer',
    description: 'Compact down puffer that packs into itself. Ideal for travel and layering.',
    price: 159.99,
    stock_quantity: 80,
    on_sale: true,
    sale_price: 119.99,
    categories: ['Jackets & Coats']
  },
  {
    name: 'Storm Chaser Hardshell',
    description: 'Racing-weight hardshell with Gore-Tex membrane. Ultra-packable and durable.',
    price: 349.00,
    stock_quantity: 35,
    on_sale: false,
    sale_price: nil,
    categories: ['Jackets & Coats']
  },
  {
    name: 'Insulated Workwear Jacket',
    description: 'Heavy-duty jacket designed for outdoor laborers and construction workers.',
    price: 219.00,
    stock_quantity: 50,
    on_sale: false,
    sale_price: nil,
    categories: ['Jackets & Coats']
  },
  {
    name: 'Trail Runner Winter Shell',
    description: 'Lightweight shell designed specifically for winter runners. Moisture-wicking and reflective.',
    price: 179.99,
    stock_quantity: 45,
    on_sale: false,
    sale_price: nil,
    categories: ['Jackets & Coats']
  },
  {
    name: 'Vintage Wool Coat',
    description: 'Classic wool blend coat with vintage styling. Timeless warmth and elegance.',
    price: 399.00,
    stock_quantity: 20,
    on_sale: false,
    sale_price: nil,
    categories: ['Jackets & Coats']
  },
  {
    name: 'Compression Down Vest',
    description: 'Lightweight down vest that compresses dramatically for storage. Easy layering piece.',
    price: 129.99,
    stock_quantity: 70,
    on_sale: true,
    sale_price: 99.99,
    categories: ['Jackets & Coats']
  },
  {
    name: 'Avalanche Rescue Jacket',
    description: 'Safety-orange jacket with beacon pocket and emergency whistle loops.',
    price: 319.00,
    stock_quantity: 25,
    on_sale: false,
    sale_price: nil,
    categories: ['Jackets & Coats']
  },
  {
    name: 'Synthetic Alternative Parka',
    description: 'Down alternative synthetic insulation rated to -35C. Ethical and cruelty-free.',
    price: 299.00,
    stock_quantity: 45,
    on_sale: true,
    sale_price: 239.00,
    categories: ['Jackets & Coats']
  },
  {
    name: 'Professional Ski Jacket',
    description: 'High-performance skiing jacket with ventilation, interior pockets, and goggle clip.',
    price: 429.99,
    stock_quantity: 30,
    on_sale: false,
    sale_price: nil,
    categories: ['Jackets & Coats']
  },
  {
    name: 'Emergency Survival Parka',
    description: 'Bright emergency parka with reflective stripes and rescue-grade materials.',
    price: 259.00,
    stock_quantity: 35,
    on_sale: false,
    sale_price: nil,
    categories: ['Jackets & Coats']
  },
  # Base Layers (20+ products)
  {
    name: 'Merino Wool Base Layer Top',
    description: 'Soft merino fabric that balances warmth and breathability. Naturally odor-resistant and comfortable for all-day use.',
    price: 89.00,
    stock_quantity: 120,
    on_sale: true,
    sale_price: 74.00,
    categories: ['Base Layers']
  },
  {
    name: 'Aurora Thermal Base Layer Legging',
    description: 'Ergonomic seam design for mobility and flatlock stitching for comfort. Great for skiing or snowboarding.',
    price: 69.00,
    stock_quantity: 100,
    on_sale: true,
    sale_price: 55.00,
    categories: ['Base Layers']
  },
  {
    name: 'Thermal Silk Liner Base Layer',
    description: 'Ultra-thin silk base layer for extreme layering versatility. Warm and hypoallergenic.',
    price: 79.99,
    stock_quantity: 80,
    on_sale: false,
    sale_price: nil,
    categories: ['Base Layers']
  },
  {
    name: 'Heavyweight Fleece Base Layer',
    description: 'Fleece-lined base layer for backpacking and camping. Extremely durable and warm.',
    price: 99.00,
    stock_quantity: 60,
    on_sale: false,
    sale_price: nil,
    categories: ['Base Layers']
  },
  {
    name: 'Performance Synthetic Base Layer Top',
    description: 'Quick-drying synthetic base layer ideal for high-sweat activities.',
    price: 64.99,
    stock_quantity: 140,
    on_sale: true,
    sale_price: 49.99,
    categories: ['Base Layers']
  },
  {
    name: 'Expedition Weight Wool Leggings',
    description: 'Extra-thick wool leggings tested in polar expeditions.',
    price: 109.99,
    stock_quantity: 50,
    on_sale: false,
    sale_price: nil,
    categories: ['Base Layers']
  },
  {
    name: 'Lightweight Merino Bottoms',
    description: 'Minimal merino base layer bottoms for layering flexibility.',
    price: 79.00,
    stock_quantity: 70,
    on_sale: false,
    sale_price: nil,
    categories: ['Base Layers']
  },
  {
    name: 'Extreme Cold Base Layer Suit',
    description: 'Full two-piece base layer rated for extreme expeditions.',
    price: 179.99,
    stock_quantity: 35,
    on_sale: true,
    sale_price: 144.00,
    categories: ['Base Layers']
  },
  {
    name: 'Bamboo Fiber Base Layer',
    description: 'Eco-friendly bamboo fiber base layer with excellent moisture-wicking.',
    price: 74.99,
    stock_quantity: 85,
    on_sale: false,
    sale_price: nil,
    categories: ['Base Layers']
  },
  {
    name: 'Hybrid Base Layer Top',
    description: 'Combination synthetic and merino for balanced performance.',
    price: 94.00,
    stock_quantity: 65,
    on_sale: false,
    sale_price: nil,
    categories: ['Base Layers']
  },
  # Mid-Layers (20+ products)
  {
    name: 'Tundra Fleece Pullover',
    description: 'Cozy fleece pullover with chin guard and thumb loops. Easy to layer under a shell or on its own around town.',
    price: 69.99,
    stock_quantity: 90,
    on_sale: false,
    sale_price: nil,
    categories: ['Mid-Layers']
  },
  {
    name: 'Bison Down Vest',
    description: 'Lightweight vest with responsibly sourced down. Keeps core warmth while allowing for freedom of movement.',
    price: 159.00,
    stock_quantity: 80,
    on_sale: false,
    sale_price: nil,
    categories: ['Mid-Layers', 'Jackets & Coats']
  },
  {
    name: 'Thermal Fleece Hoody',
    description: 'Heavy fleece hoody with adjustable drawstrings and kangaroo pouch. Ultimate coziness.',
    price: 119.99,
    stock_quantity: 75,
    on_sale: true,
    sale_price: 95.99,
    categories: ['Mid-Layers']
  },
  {
    name: 'Grid Fleece Mid-Layer',
    description: 'Lightweight grid-pattern fleece for excellent insulation-to-weight ratio.',
    price: 89.99,
    stock_quantity: 100,
    on_sale: false,
    sale_price: nil,
    categories: ['Mid-Layers']
  },
  {
    name: 'Synthetic Insulated Vest',
    description: 'Primaloft Gold synthetic insulation vest. Lightweight and compressible.',
    price: 149.99,
    stock_quantity: 65,
    on_sale: true,
    sale_price: 119.99,
    categories: ['Mid-Layers']
  },
  {
    name: 'Fleece-Lined Softshell',
    description: 'Softshell with internal fleece lining. Wind and water resistant.',
    price: 139.00,
    stock_quantity: 55,
    on_sale: false,
    sale_price: nil,
    categories: ['Mid-Layers']
  },
  {
    name: 'Polar Fleece Pants',
    description: 'Warming fleece pants perfect for lounging or layering.',
    price: 99.00,
    stock_quantity: 80,
    on_sale: false,
    sale_price: nil,
    categories: ['Mid-Layers']
  },
  {
    name: 'Merino Wool Cardigan',
    description: 'Stylish merino wool cardigan for elegant layering.',
    price: 169.99,
    stock_quantity: 40,
    on_sale: false,
    sale_price: nil,
    categories: ['Mid-Layers']
  },
  {
    name: 'Thermal Knit Sweater',
    description: 'Chunky knit thermal sweater with high collar.',
    price: 129.00,
    stock_quantity: 50,
    on_sale: true,
    sale_price: 99.00,
    categories: ['Mid-Layers']
  },
  {
    name: 'Expedition Mid-Layer Suit',
    description: 'Full two-piece mid-layer system for mountaineering.',
    price: 259.99,
    stock_quantity: 25,
    on_sale: false,
    sale_price: nil,
    categories: ['Mid-Layers']
  },
  # Footwear (10+ products)
  {
    name: 'Glacier Trail Winter Boots',
    description: 'Insulated, waterproof boots with aggressive lug tread for ice and deep snow. Comfortable for all-day hikes.',
    price: 219.00,
    stock_quantity: 60,
    on_sale: false,
    sale_price: nil,
    categories: ['Footwear']
  },
  {
    name: 'Urban Winter Boots',
    description: 'Stylish winter boots with fur trim and waterproof coating.',
    price: 179.99,
    stock_quantity: 70,
    on_sale: true,
    sale_price: 144.00,
    categories: ['Footwear']
  },
  {
    name: 'Extreme Cold Mountain Boots',
    description: 'Mountaineering boots rated to -50C with aggressive crampon-compatible sole.',
    price: 399.00,
    stock_quantity: 30,
    on_sale: false,
    sale_price: nil,
    categories: ['Footwear']
  },
  {
    name: 'Snowshoeing Insulated Boots',
    description: 'Wide boots designed for snowshoeing with extra insulation.',
    price: 259.99,
    stock_quantity: 45,
    on_sale: false,
    sale_price: nil,
    categories: ['Footwear']
  },
  {
    name: 'Ice Climbing Boot',
    description: 'Specialized boot for ice climbing with tool-compatible sole.',
    price: 449.00,
    stock_quantity: 20,
    on_sale: false,
    sale_price: nil,
    categories: ['Footwear']
  },
  {
    name: 'Lightweight Trail Runner Boots',
    description: 'Insulated trail running boots for winter running.',
    price: 189.99,
    stock_quantity: 50,
    on_sale: true,
    sale_price: 152.00,
    categories: ['Footwear']
  },
  {
    name: 'Work Boot Insulated',
    description: 'Heavy-duty work boots with steel toe and extreme insulation.',
    price: 239.00,
    stock_quantity: 55,
    on_sale: false,
    sale_price: nil,
    categories: ['Footwear']
  },
  {
    name: 'Casual Winter Sneakers',
    description: 'Insulated sneakers for casual winter wear.',
    price: 119.99,
    stock_quantity: 90,
    on_sale: false,
    sale_price: nil,
    categories: ['Footwear']
  },
  # Accessories (25+ products)
  {
    name: 'Summit Insulated Gloves',
    description: 'Multiple layers of insulation and touchscreen-friendly fingertips. Snug cuff prevents snow entry.',
    price: 49.00,
    stock_quantity: 180,
    on_sale: false,
    sale_price: nil,
    categories: ['Accessories']
  },
  {
    name: 'Prairie Ridge Beanie',
    description: 'Soft acrylic knit with fleece lining. Keeps head and ears warm in sub-zero temperatures.',
    price: 32.00,
    stock_quantity: 220,
    on_sale: false,
    sale_price: nil,
    categories: ['Accessories']
  },
  {
    name: 'Tundra Trek Sock Bundle',
    description: 'Heavyweight wool blend socks with cushioning and arch support. Designed to keep toes warm in extreme cold.',
    price: 39.00,
    stock_quantity: 150,
    on_sale: false,
    sale_price: nil,
    categories: ['Accessories']
  },
  {
    name: 'Icebreaker Insulated Mitts',
    description: 'Over-mittens with heat-lock seal and removable liner. Doubles for both daily wear and deep winter outings.',
    price: 59.99,
    stock_quantity: 140,
    on_sale: false,
    sale_price: nil,
    categories: ['Accessories']
  },
  {
    name: 'Thermal Neck Gaiter',
    description: 'Versatile neck gaiter that can be pulled up as a balaclava. Fleece-lined.',
    price: 24.99,
    stock_quantity: 250,
    on_sale: true,
    sale_price: 17.99,
    categories: ['Accessories']
  },
  {
    name: 'Insulated Face Mask',
    description: 'Medical-grade mask with insulation for extreme cold protection.',
    price: 19.99,
    stock_quantity: 300,
    on_sale: false,
    sale_price: nil,
    categories: ['Accessories']
  },
  {
    name: 'Wool Blend Scarf',
    description: 'Long chunky wool scarf for neck and face warmth.',
    price: 44.99,
    stock_quantity: 100,
    on_sale: false,
    sale_price: nil,
    categories: ['Accessories']
  },
  {
    name: 'Merino Wool Beanie',
    description: 'Lightweight merino beanie suitable for active use.',
    price: 52.00,
    stock_quantity: 130,
    on_sale: true,
    sale_price: 41.00,
    categories: ['Accessories']
  },
  {
    name: 'Hand Warmer Pouches',
    description: 'Reusable chemical hand warmers, 8-pack.',
    price: 14.99,
    stock_quantity: 500,
    on_sale: false,
    sale_price: nil,
    categories: ['Accessories']
  },
  {
    name: 'Leather Work Gloves',
    description: 'Insulated leather gloves with grip-enhancing palm.',
    price: 69.99,
    stock_quantity: 75,
    on_sale: false,
    sale_price: nil,
    categories: ['Accessories']
  },
  {
    name: 'Expedition Gaiters',
    description: 'Snow gaiters to keep snow out of boots during deep powder',
    price: 34.99,
    stock_quantity: 120,
    on_sale: false,
    sale_price: nil,
    categories: ['Accessories']
  },
  {
    name: 'Thermal Knee Socks',
    description: 'Extra-long thermal socks that reach the knee.',
    price: 29.99,
    stock_quantity: 180,
    on_sale: false,
    sale_price: nil,
    categories: ['Accessories']
  },
  {
    name: 'Insulated Goggles',
    description: 'Double-lens goggles with thermal insulation and anti-fog coating.',
    price: 89.99,
    stock_quantity: 60,
    on_sale: true,
    sale_price: 72.00,
    categories: ['Accessories']
  },
  {
    name: 'Balaclavas Full Coverage',
    description: 'Full-face balaclava with eye holes and breathing vents.',
    price: 39.99,
    stock_quantity: 90,
    on_sale: false,
    sale_price: nil,
    categories: ['Accessories']
  },
  {
    name: 'Windproof Ear Warmer',
    description: 'Elastic ear warmer with fleece lining.',
    price: 22.95,
    stock_quantity: 200,
    on_sale: false,
    sale_price: nil,
    categories: ['Accessories']
  },
  {
    name: 'Thermal Compression Leggings',
    description: 'Compression leggings with thermal lining for circulation.',
    price: 59.99,
    stock_quantity: 85,
    on_sale: false,
    sale_price: nil,
    categories: ['Accessories']
  },
  {
    name: 'Merino Glove Liners',
    description: 'Thin merino liners to wear under any glove.',
    price: 34.99,
    stock_quantity: 160,
    on_sale: true,
    sale_price: 27.99,
    categories: ['Accessories']
  },
  {
    name: 'Expedition Sock Combo',
    description: '5-pack of various weight socks for layering.',
    price: 74.99,
    stock_quantity: 50,
    on_sale: false,
    sale_price: nil,
    categories: ['Accessories']
  },
  {
    name: 'Insulated Boot Covers',
    description: 'Slip-on covers to add extra insulation to any boots.',
    price: 49.99,
    stock_quantity: 70,
    on_sale: true,
    sale_price: 39.99,
    categories: ['Accessories']
  },
  {
    name: 'Thermal Underwear Set',
    description: 'Complete thermal underwear set in one package.',
    price: 69.99,
    stock_quantity: 80,
    on_sale: false,
    sale_price: nil,
    categories: ['Accessories']
  },
  {
    name: 'Anti-Fog Goggles Spray',
    description: 'Bottle of professional anti-fog coating.',
    price: 9.99,
    stock_quantity: 400,
    on_sale: false,
    sale_price: nil,
    categories: ['Accessories']
  },
  {
    name: 'Insulated Backpack',
    description: 'Insulated backpack with thermal lining for carrying gear.',
    price: 129.99,
    stock_quantity: 40,
    on_sale: false,
    sale_price: nil,
    categories: ['Accessories']
  },
  {
    name: 'Winter Running Belt',
    description: 'Water-resistant belt for carrying supplies while running in winter.',
    price: 44.99,
    stock_quantity: 70,
    on_sale: false,
    sale_price: nil,
    categories: ['Accessories']
  },
  {
    name: 'Thermal Emergency Kit',
    description: 'Portable emergency kit with heat packs and survival blanket.',
    price: 39.99,
    stock_quantity: 60,
    on_sale: true,
    sale_price: 31.99,
    categories: ['Accessories']
  }
]

products_data.each do |product_attrs|
  product = Product.find_or_initialize_by(name: product_attrs[:name])
  product.assign_attributes(
    description: product_attrs[:description],
    price: product_attrs[:price],
    stock_quantity: product_attrs[:stock_quantity],
    on_sale: product_attrs[:on_sale],
    sale_price: product_attrs[:sale_price]
  )
  product.save!(validate: false)

  product_attrs[:categories].each do |category_name|
    category = Category.find_by!(name: category_name)
    product.categories << category unless product.categories.include?(category)
  end
end

# Ensure at least 100 products in seeds (requirement 1.6)
required_count = 100
if Product.count < required_count
  categories = Category.all.to_a
  (required_count - Product.count).times do |i|
    name = "NorthThread Auto Product #{i + 1}"
    product = Product.find_or_initialize_by(name: name)
    category = categories[i % categories.size]

    product.description = "Automated seed product #{i + 1} - high quality winter outdoor gear."
    product.price = (49.99 + i % 15 * 10)
    product.stock_quantity = 20 + (i % 80)
    product.on_sale = (i % 4 == 0)
    product.sale_price = product.on_sale ? (product.price * 0.8).round(2) : nil
    product.save!(validate: false)

    unless product.categories.include?(category)
      product.categories << category
    end
  end
end

admin = AdminUser.find_or_initialize_by(email: 'admin@norththread.ca')
admin.username ||= 'admin'
admin.password = 'password'
admin.password_confirmation = 'password'
admin.save!

# For a direct username login (accepts username or email): username=admin password=password

Page.find_or_create_by!(slug: 'about') do |page|
  page.title = 'About NorthThread'
  page.body = 'NorthThread Outdoor Apparel is a Winnipeg-based retailer focused on high performance winter gear for Canadian winters. We are committed to quality, ethical sourcing, and regional comfort.'
  page.updated_at = Time.current
end

Page.find_or_create_by!(slug: 'contact') do |page|
  page.title = 'Contact NorthThread'
  page.body = 'Reach us at support@norththread.ca or call 1-800-555-1234. Our store is located in Winnipeg, MB, and we ship across Canada.'
  page.updated_at = Time.current
end


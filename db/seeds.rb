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
    name: 'Merino Wool Base Layer Top',
    description: 'Soft merino fabric that balances warmth and breathability. Naturally odor-resistant and comfortable for all-day use.',
    price: 89.00,
    stock_quantity: 120,
    on_sale: true,
    sale_price: 74.00,
    categories: ['Base Layers']
  },
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
    name: 'Frostline Waterproof Shell',
    description: 'Fully seam-sealed shell with storm hood and ventilation zips. Built for wet and windy conditions.',
    price: 249.00,
    stock_quantity: 50,
    on_sale: true,
    sale_price: 215.00,
    categories: ['Jackets & Coats']
  },
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
    name: 'Northwind Softshell Pants',
    description: 'Windproof and water-resistant pants with articulated knees. Built for snowshoeing and winter commuting.',
    price: 139.00,
    stock_quantity: 70,
    on_sale: false,
    sale_price: nil,
    categories: ['Jackets & Coats', 'Mid-Layers']
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

AdminUser.find_or_create_by!(email: 'admin@norththread.ca') do |admin|
  admin.password = 'password123'
  admin.password_confirmation = 'password123'
end

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


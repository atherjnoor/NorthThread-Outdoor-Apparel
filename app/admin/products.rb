ActiveAdmin.register Product do
  permit_params :name, :description, :price, :stock_quantity, :on_sale, :sale_price, category_ids: [], images: []

  form do |f|
    f.semantic_errors
    f.inputs "Product Details" do
      f.input :name
      f.input :description
      f.input :price
      f.input :stock_quantity
      f.input :on_sale
      f.input :sale_price
    end

    f.inputs "Categories" do
      f.input :categories, as: :check_boxes, collection: Category.all
    end

    f.inputs "Images" do
      f.input :images, as: :file, input_html: { multiple: true }
      if f.object.images.attached?
        ul do
          f.object.images.each do |img|
            li do
              image_tag url_for(img.variant(resize_to_limit: [ 100, 100 ])), alt: img.filename.to_s
            end
          end
        end
      end
    end

    f.actions
  end

  index do
    selectable_column
    id_column
    column :name
    column :price
    column :stock_quantity
    column :on_sale
    column :sale_price
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :price
      row :stock_quantity
      row :on_sale
      row :sale_price
      row :categories do |product|
        product.categories.map(&:name).join(", ")
      end
      row :images do |product|
        product.images.map { |img| image_tag url_for(img.variant(resize_to_limit: [ 200, 200 ])) }.join(" ").html_safe
      end
    end
  end
end

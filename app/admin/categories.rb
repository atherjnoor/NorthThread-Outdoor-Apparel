ActiveAdmin.register Category do
  permit_params :name, :description

  menu label: "Product Categories", priority: 3

  index do
    selectable_column
    id_column
    column :name do |category|
      link_to category.name, admin_category_path(category)
    end
    column :description do |category|
      truncate(category.description, length: 60) if category.description.present?
    end
    column :product_count do |category|
      badge(category.product_count)
    end
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :description
      row :product_count
      row :created_at
      row :updated_at
    end

    panel "Products in this Category" do
      table_for resource.products do
        column :name do |product|
          link_to product.name, admin_product_path(product)
        end
        column :price do |product|
          number_to_currency(product.price)
        end
        column :on_sale
      end
    end
  end

  form do |f|
    f.semantic_errors
    f.inputs "Category Details" do
      f.input :name, label: "Category Name", hint: "Must be unique and 2-100 characters"
      f.input :description, label: "Category Description", as: :text, input_html: { rows: 5 }, hint: "Optional. Up to 500 characters."
    end
    f.actions
  end
end

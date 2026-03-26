ActiveAdmin.register_page "Dashboard" do
  content do
    columns do
      column do
        panel "Recent Products" do
          ul do
            Product.order(created_at: :desc).limit(5).map do |product|
              li link_to(product.name, admin_product_path(product))
            end
          end
        end
      end

      column do
        panel "Recent Orders" do
          ul do
            Order.order(created_at: :desc).limit(5).map do |order|
              li "##{order.id} - #{order.status}"
            end
          end
        end
      end
    end
  end
end

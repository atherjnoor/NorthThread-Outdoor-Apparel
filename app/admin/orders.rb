ActiveAdmin.register Order do
  permit_params :status

  index do
    selectable_column
    id_column
    column :user
    column :created_at
    column :grand_total
    column :status do |order|
      case order.status
      when 'new'
        tag.span 'NEW', class: 'badge bg-warning'
      when 'paid'
        tag.span 'PAID', class: 'badge bg-success'
      when 'shipped'
        tag.span 'SHIPPED', class: 'badge bg-info'
      else
        tag.span order.status.upcase, class: 'badge bg-secondary'
      end
    end
    actions
  end

  show do
    attributes_table do
      row :id
      row :user
      row :created_at
      row :grand_total
      row :subtotal
      row :gst_amount
      row :pst_amount
      row :hst_amount
      row :status do |order|
        case order.status
        when 'new'
          tag.span 'NEW', class: 'badge bg-warning'
        when 'paid'
          tag.span 'PAID', class: 'badge bg-success'
        when 'shipped'
          tag.span 'SHIPPED', class: 'badge bg-info'
        else
          tag.span order.status.upcase, class: 'badge bg-secondary'
        end
      end
      row :address
    end

    panel 'Order Items' do
      table_for order.order_items do
        column :product_name_snapshot
        column :unit_price_snapshot
        column :quantity
        column :line_total
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :status, as: :select, collection: ['new', 'paid', 'shipped']
    end
    f.actions
  end
end

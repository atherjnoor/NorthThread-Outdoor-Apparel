ActiveAdmin.register Province do
  permit_params :name, :abbreviation, :gst_rate, :pst_rate, :hst_rate

  index do
    selectable_column
    id_column
    column :name
    column :abbreviation
    column :gst_rate
    column :pst_rate
    column :hst_rate
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :abbreviation
      f.input :gst_rate, hint: "Enter as decimal (e.g., 0.05 for 5%)"
      f.input :pst_rate, hint: "Enter as decimal (e.g., 0.07 for 7%)"
      f.input :hst_rate, hint: "Enter as decimal (e.g., 0.13 for 13%)"
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :abbreviation
      row :gst_rate
      row :pst_rate
      row :hst_rate
      row :created_at
      row :updated_at
    end
  end
end

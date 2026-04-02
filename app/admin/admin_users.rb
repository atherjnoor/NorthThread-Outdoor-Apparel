ActiveAdmin.register AdminUser do
  permit_params :username, :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :username
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :username, hint: "Use for username login (admin)"
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end

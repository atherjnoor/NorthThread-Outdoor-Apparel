ActiveAdmin.register Page do
  actions :all, except: [:new, :destroy]

  permit_params :title, :body

  menu label: "Website Pages", priority: 2

  controller do
    def scoped_collection
      super.where(slug: ["about", "contact"])
    end

    def update
      if permitted_params[:page][:slug].present?
        flash[:alert] = "Page slug is managed and cannot be changed"
        redirect_back(fallback_location: admin_pages_path)
      else
        super
      end
    end
  end

  index do
    selectable_column
    id_column
    column :slug
    column :title
    column :body do |page|
      truncate(page.body, length: 80)
    end
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :slug
      row :title
      row :body do |page|
        simple_format(page.body)
      end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  form do |f|
    f.inputs "Page Details" do
      f.input :slug, input_html: { disabled: true }, hint: "Page slug (fixed): #{f.object.slug}"
      f.input :title, label: "Page Title"
      f.input :body, as: :text, label: "Page Content", input_html: { rows: 20, class: "form-control" }, hint: "Plain text formatting. This content is displayed on the public website."
    end
    f.actions
  end
end

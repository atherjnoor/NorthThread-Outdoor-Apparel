ActiveAdmin.register Page do
  actions :all, except: [:new, :destroy]

  permit_params :title, :body

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
    id_column
    column :slug
    column :title
    actions
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :title
      f.input :body, as: :text
    end
    f.actions
  end
end

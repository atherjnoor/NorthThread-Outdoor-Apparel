module BreadcrumbsHelper
  def render_breadcrumbs(items = [])
    items = [ { label: "Home", path: root_path } ] + items

    render "shared/breadcrumbs", items: items
  end
end

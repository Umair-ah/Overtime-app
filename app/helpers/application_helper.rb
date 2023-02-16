module ApplicationHelper
    def active?(path)
        "nav-link active" if current_page?(path)
    end
end

module ApplicationHelper
    def admins_who_can_access
        ["AdminUser"]
    end



    def active?(path)
        "nav-link active" if current_page?(path)
    end

    def status_labels(status)
        status_span_generator(status)
    end


    private
        def status_span_generator(status)
            case status
            when "submitted"
                content_tag(:span, status.titleize, class:"badge bg-primary")
            
            when "approved"
                content_tag(:span, status.titleize, class:"badge bg-success")
    
            when "rejected"
                content_tag(:span, status.titleize, class:"badge bg-danger")

            when "pending"
                content_tag(:span, status.titleize, class:"badge bg-primary")

            when "confirmed"
                content_tag(:span, status.titleize, class:"badge bg-success")
            end
        end
end

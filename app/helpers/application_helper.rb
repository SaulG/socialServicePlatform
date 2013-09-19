module ApplicationHelper
    #Given a page title this method will return a complete title
    def full_title(page_title)
        base_title = "Social Service Platform" #Name of the platform
        if page_title.empty? #Verify if that's empty
            base_title #Give a title
        else
            "#{base_title} | #{page_title}" #Concatenate a base title and page title
        end
    end
end

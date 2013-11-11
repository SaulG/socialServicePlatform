module ProcessStudentsHelper
    SELECCION = 1
    ENTREVISTA = 2
    REPORTES = 3
    LIBERACION = 4
    FINALIZACION = 5

    def get_title_to_render(status_progress_id)
        html=''
        html << '<center>'
        html << '<div class="breadcrumb flat">'
        status_progress_all = StatusProgress.all_order_asc_by_id
        aux = ''
        status_progress_all.each do | status_progress |
            if status_progress_id >= status_progress.id
                aux = 'class="active"'
            end
            html << '<a href="#"'+aux+'>'
            html << status_progress.name.capitalize
            html << '</a>'
            aux=''
        end
        html << '</div>'
        html << '</center>'
        return html.html_safe
    end
    def get_message_to_render(status_progress_id)
        case status_progress_id
        when SELECCION
            render :partial => 'selection'
        when ENTREVISTA
            render :partial => 'interview'
        when REPORTES
            render :partial => 'reporting'
        when LIBERACION
            render :partial => 'release'
        when FINALIZACION
            render :partial => 'ending'
        else
            render :partial => 'help'
        end
    end
end

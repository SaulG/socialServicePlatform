module ProcessStudentsHelper
    SELECCION = 1
    ENTREVISTA = 2
    REPORTES = 3
    LIBERACION = 4
    FINALIZACION = 5

    def get_status_progress_to_render(status_progress_id)
        get_title_to_render(status_progress_id)
        get_message_to_render(status_progress_id)
    end
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
            html << '<a href=""'+aux+'>#{@status_progress.name.capitalize}</a>'
            aux=''
        end
        html << '</div>'
        html << '</center>'
        return html.html_safe
    end
    def get_message_to_render(status_progress_id)
        case status_progress_id
        when SELECCION
            render 'process_students_controller/selection'
        when ENTREVISTA
            render :template => 'process_students_controller/interview'
        when REPORTES
            render :template => 'process_students_controller/reporting'
        when LIBERACION
            render :template => 'process_students_controller/release'
        when FINALIZACION
            render :template => 'process_students_controller/ending'
        else
            render :template => 'process_students_controller/help'
        end
    end
end

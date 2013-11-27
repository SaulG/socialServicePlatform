module PruebaHelper
    def get_programs_available
        @programs = Program.all
    end
    def get_modal_window(program, turn)
        html = '<div id="modalProgram'+program.id.to_s+'" class="modal hide fade"  tabindex="-1" role="dialog" aria-labelledby="modalProgramLabel" aria-hidden="true">'
        html << '<div class="modal-header">'
        html << '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>'
        html << '<h3 id="modalProgramLabel">'+program.name+'</h3>'
        html << '</div>'
        html << '<div class="modal-body">'
        html << '<p><b>Fecha de creacion: </b>'+program.created_at.to_s+'</p>'
        html << '<p><b>Fecha de ultima actualizacion: </b>'+program.updated_at.to_s+'</p>'
        html << '<p><b>Cantidad de vacantes: </b>'+program.quantity_of_students.to_s+'</p>'
        html << '<p><b>Turno: </b>'+turn[program.turn_id]+'</p>'
        html << '<p>'+program.description+'</p>'
        html << '</div>'
        html << '<div class="modal-footer">'
        html << '</div>'
        html << '</div>'
        return html.html_safe
    end
end

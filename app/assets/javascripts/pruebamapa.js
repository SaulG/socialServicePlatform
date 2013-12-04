$.fn.seleccionDePlaza = function(plaza_id, a_dom){        
            if(!$.fn.isValueInList(plaza_id)){
                if ($(a_dom).text() == REMOVER_PLAZA){
                    $('li').remove('#'+plaza_id);
                    $(a_dom).text(AGREGAR_PLAZA);
                    CONTADOR--;
                    alert(CONTADOR);
                } else if(CONTADOR <= LIMITE){
                    var plaza_name = $('#'+plaza_id).attr('value');
                    var plaza = $('<li/>', {
                            class: 'plaza span4',
                            id:plaza_id
                        });
                    var contenedor = $('<div/>',{
                            style:'position: relative;height:80px;'
                        });
                    var informacionPlaza = $('<p/>',{
                            text:plaza_name,
                        });
                    var removerIcono = $('<i/>',{
                            class:'icon-remove-circle',
                            style:' position: absolute;right: 5px;top: 5px;cursor: pointer;'
                        });
                    contenedor.append(informacionPlaza);
                    contenedor.append(removerIcono);
                    plaza.append(contenedor);
                    
                    removerIcono.on('click', function(){
                        $(plaza).remove();
                        $(a_dom).text(AGREGAR_PLAZA);
                        CONTADOR--;
                        alert(CONTADOR);
                        });
                    $(plaza).appendTo('#plazas');
                    $(a_dom).text(REMOVER_PLAZA);
                    CONTADOR++;
                    alert(CONTADOR);
                }
            }
        };

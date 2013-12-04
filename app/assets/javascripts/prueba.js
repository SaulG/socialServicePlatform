//Configuracion de seleccion de plazas
var LIMITE = 5;

//Constantes de links
var REMOVER_PLAZA = "Remover plaza";
var AGREGAR_PLAZA = "Agregar plaza";

//CONTADOR de plazas
var CONTADOR = 0;

$(function(){
        $('#myTab a').click(function (e) {
                e.preventDefault();
                $(this).tab('show');
            });
        $('#plazas').sortable();
        $('#plazas').disableSelection();      
        $('#programs').dataTable({
                bJQueryUI: true,
                    sDom: "<'row'<'span6'l><'span6'f>r>t<'row'<'span6'i><'span6'p>>",
                    sPaginationType: "bootstrap",
                    bLengthChange: false,
                    bInfo: false,
                    oLanguage:{
                    "sProcessing":     "Procesando...",
                        "sLengthMenu":     "Mostrar _MENU_ registros",
                        "sZeroRecords":    "No se encontraron resultados",
                        "sEmptyTable":     "Ningún dato disponible en esta tabla",
                        "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                        "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
                        "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
                        "sInfoPostFix":    "",
                        "sSearch":         "Buscar:",
                        "sUrl":            "",
                        "sInfoThousands":  ",",
                        "sLoadingRecords": "Cargando...",
                        "oPaginate": {
                        "sFirst":    "Primero",
                            "sLast":     "Último",
                            "sNext":     "Siguiente",
                            "sPrevious": "Anterior"
                            },
                        "oAria": {
                            "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
                                "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                                }
                }                 
            });        
        
        $.fn.isValueInList = function(plaza_id){
            var array = [];
            var $li = $('ul.ui-sortable > li').attr('id', function(i){ 
                    if (plaza_id == i) return true;
                });
            return false
        };

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
        
        /*
          Solamente fue agregado para evitar que la pagina principal se scrolle hacia arriba
          al momento de ejecutar javascript.
        */
        event.preventDefault();
    });


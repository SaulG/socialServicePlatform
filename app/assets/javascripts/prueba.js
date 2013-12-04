$(function(){
        //Configuracion de seleccion de plazas
        var contador = 0;
        var LIMITE = 5;
        var plazas_array = [];
        $('#myTab a').click(function (e) {
                e.preventDefault();
                $(this).tab('show');
            });

        $('#agregarPlazas').click(function(){
                    if(contador <= LIMITE){
                        var plaza = $('<li/>', {
                                class: 'plaza span2',
                            });
                        var contenedor = $('<div/>',{
                                style:'position: relative;height:80px;'
                            });
                        var informacionPlaza = $('<p/>',{
                                text:'Prueba '+contador
                            });
                        var removerIcono = $('<i/>',{
                                class:'icon-remove-circle',
                                style:' position: absolute;right: 5px;top: 5px; '
                            });
                        contenedor.append(informacionPlaza);
                        contenedor.append(removerIcono);
                        plaza.append(contenedor);
                        removerIcono.on('click', function(){
                                $(plaza).remove();
                                contador--;
                            });
                        $(plaza).appendTo('#plazas');
                        contador++;
                    }
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
            var $li = $('ul.ui-sortable > li').attr('program_id', function(i){ 
                    if (value == i) return true;
                });
            return false
        };

        $.fn.seleccionDePlaza = function(plaza_id){
            if(contador <= LIMITE && !$.fn.isValueInList(plaza_id)){
                var plaza_name = $('#'+plaza_id).attr('value');
                var plaza = $('<li/>', {
                        class: 'plaza span4',
                        program_id:plaza_id
                    });
                var contenedor = $('<div/>',{
                        style:'position: relative;height:80px;'
                    });
                var informacionPlaza = $('<p/>',{
                        text:plaza_name,
                    });
                var removerIcono = $('<i/>',{
                        class:'icon-remove-circle',
                        style:' position: absolute;right: 5px;top: 5px; '
                    });
                contenedor.append(informacionPlaza);
                contenedor.append(removerIcono);
                plaza.append(contenedor);
                removerIcono.on('click', function(){
                        $(plaza).remove();
                        contador--;
                    });
                $(plaza).appendTo('#plazas');
                contador++;
            }
            
        };
    });


jQuery.fn.cambiarTipoDeBusqueda = function(){
    $(this).bind('change', function(){
            var tipoBusqueda = $(this).find('option:selected').val();
            if(tipoBusqueda == 'mapa' || tipoBusqueda == 'tabla'){
                $.ajax({
                        url:'/prueba/'+tipoBusqueda,
                            sucess: function(resultado){
                            jQuery('.busqueda').html(resultado);
                        },
                            error: function(){
                            alert('Vuelve a intentarlo es probable que tengas acceso a internet.');
                            $(this).val(tipoBusqueda == 'mapa'? 'tabla':'mapa');
                        }
                    });
            }
        });
}
$(function(){
        var contador = 0;
        var LIMITE = 5;
        $('#seleccionBusqueda').cambiarTipoDeBusqueda();
        $('#plazas').sortable();
        $('#plazas').disableSelection();      
                $('#programs').dataTable({
                bJQueryUI: true,
                    sDom: "<'row'<'span6'l><'span6'f>r>t<'row'<'span6'i><'span6'p>>",
                    sPaginationType: "bootstrap",
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

        $('#agregarPlazas').click(function(){
                agregarPlaza();
            });
        function agregarPlaza(){
            if(contador <= LIMITE){
                var plaza = $('<li/>', {
                        class: 'plaza',
                    });
                var contenedor = $('<div/>',{
                        class:'container',
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
            
        };
    });
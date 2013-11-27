class PruebaController < ApplicationController

  def muestra_plazas
      @programs = Program.all
      dependencies = Hash.new()
      Dependency.all.each do |dependency|
          dependencies[dependency.id] = [dependency.location.latitude, dependency.location.longitude]
      end
      @turns = Hash.new()
      Turn.all.each do |turn| @turns[turn.id] = turn.name end
      @hash = Gmaps4rails.build_markers(@programs) do |program, marker|
          if program.dependency_id
              marker.lat dependencies[program.dependency_id][0]
              marker.lng dependencies[program.dependency_id][1]
              marker.infowindow '<div id="content">'+
                  '<h5 id="firstHeading" class="firstHeading">'+program.name+'</h5>'+
                  '<div id="bodyContent"><p>"'+
                  program.description+
                  '"</p>'+
                  '<div class="horizontalLine">'+
                  '</div>'+
                  '<a class="text-left" href="#">Agregar a plaza</a>'+
                  '<a class="text-right" href="#">Como llego aqui?</a>'+
                  '</div>'+
                  '</div>'
              marker.title program.name
              marker.json({ :id => program.id })
          end
      end
      @hash.delete_if {|key, value| key.blank? }
  end
end

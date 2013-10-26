# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
type_of_numbers = TypeOfNumber.create([{type_of_number: 'Celular'},{type_of_number:'Casa'}])
institutions = Institution.create([{name:'Facultad de Ingenieria Mecanica y Electrica'},{name:'Facultad de Artes Visuales'},
                                      {name:'Facultad de Arquitectura'},{name:'Facultad de Ingenieria Civil'}])
frequencies = Frequency.create([{name:'Cada dia'},{name:'Cada semana'},{name:'Cada mes'}])
type_of_administration = TypeOfAdministration.create([{name:'Publica'},{name:'Privada'}])
turns = Turn.create([{name:'Matutino'},{name:'Vespertino'},{name:'Indefinido'},{name:'Nocturno'}])
skills = Skill.create([{name:'Programacion'},{name:'Trabajo en equipo'},{name:'Control del estres'},{name:'Iniciativa'},{name:'Innovacion y creatividad'},{name:'Argumentacion'}])
aptitudes = Aptitude.create([{name:'Respeto'},{name:'Sinceridad'},{name:'Calma'},{name:'Tolerancia'}])

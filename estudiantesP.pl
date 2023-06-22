% Hechos
%estudia(Nombre,carreras(carrera, nivel)notas([]))
estudia('Juan Lopez',carrera('ingenieria en tecnologias de la informacion',4),notas([8,7])).
estudia('Yandy Macias',carrera('ingenieria en tecnologias de la informacion',8),notas([5,8])).
estudia('Luis Navarrete',carrera('ingenieria en tecnologias de la informacion',8),notas([6,9])).
estudia('Peralta Perez',carrera('ingeniera de software',6),notas([10,7])).
estudia('Amy Mendoza',carrera('ingeniera de software',6),notas([8,8])).
estudia('Dayana Arcentales',carrera('ingenieria en tecnologias de la informacion',1),notas([6.5,7.5])).
estudia('Ana García',carrera('ingenieria en tecnologias de la informacion',4),notas([5,6])).
estudia('Arbar Lopez',carrera('ingenieria en tecnologias de la informacion',4),notas([10,7])).
estudia('Nayeli Loor',carrera('ingenieria de software',1),notas([8.5,6])).
estudia('Juan Zapato',carrera('ingenieria en sistemas',9),notas([8,9])).
estudia('Isabel Morales',carrera('ingenieria de software',5),notas([7,7.10])).
estudia('Francisco Silva',carrera('ingenieria de software',3),notas([8,8])).
estudia('Carolina Ortega',carrera('ingenieria de software',2),notas([8.4,6.5])).
estudia('Miguel Zamora',carrera('ingenieria de software',6),notas([8,7])).
estudia('Jesus Cedeño',carrera('ingenieria en sistemas',8),notas([9,9])).


%REGLAS
% Regla para obtener la lista de estudiantes de una determinada carrera
%EJEMPLO -> estudiantes_carrera('ingenieria en sistemas', Estudiantes).
estudiantes_carrera(Carrera, Estudiantes) :-
  findall(Nombre, estudia(Nombre, carrera(Carrera, _), _), Estudiantes).

% Regla para obtener la lista de estudiantes con un promedio superior a un valor dado
%EJEMPLO -> promedio_superior(8, Estudiantes)
promedio_superior(Promedio, Estudiantes) :-
  findall(Nombre-PromedioEstudiante, (estudia(Nombre, _, notas(Notas)), 
                                     promedio_r(Notas, PromedioEstudiante), 
                                     PromedioEstudiante > Promedio), Estudiantes).

% Regla para obtener la lista de estudiantes aprobados y no aprobados de una carrera específica
%EJEMPLO -> estudiantes_aprobados_no_aprobados('ingenieria en tecnologias de la informacion', Aprobados, NoAprobados).
estudiantes_aprobados_no_aprobados(Carrera, Aprobados, NoAprobados) :-
  findall(Nombre, (estudia(Nombre, carrera(Carrera, _), notas(Notas)), promedio_r(Notas, Promedio), 
                  Promedio >= 7), Aprobados),
  findall(Nombre, (estudia(Nombre, carrera(Carrera, _), notas(Notas)), promedio_r(Notas, Promedio), 
                  Promedio < 7), NoAprobados).

% Regla para generar el promedio de las notas de todos los estudiantes de una carrera
%EJEMPLO -> promedio_carrera('ingenieria en sistemas', Promedio).
promedio_carrera(Carrera, Promedio) :-
  findall(NotasEstudiante, (estudia(_, carrera(Carrera, _), notas(NotasEstudiante))), ListasNotas),
  flatten(ListasNotas, Notas),
  promedio_r(Notas, Promedio).

% Regla para calcular el promedio de una lista de notas
promedio_r([], 0).
promedio_r([Nota | Resto], Promedio) :-
  promedio_r(Resto, PromedioResto),
  length([Nota | Resto], Cantidad),
  Suma is PromedioResto * (Cantidad - 1),
  Promedio is (Suma + Nota) / Cantidad.


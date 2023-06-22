%Hechos
%estudiante(nombre,edad)
estudiantes('Juan Lopez',22).
estudiantes('Yandy Macias',21).
estudiantes('Luis Navarrete',22).
estudiantes('Peralta Perez',20).
estudiantes('Amy Mendoza',21).
estudiantes('Dayana Arcentales',17).
estudiantes('Ana García',20).
estudiantes('Arbar Lopez',22).
estudiantes('Nayeli Loor',17).
estudiantes('Juan Zapato',27).
estudiantes('Isabel Morales',23).
estudiantes('Francisco Silva',19).
estudiantes('Carolina Ortega',18).
estudiantes('Miguel Zamora',21).
estudiantes('Jesus Cedeño',24).
%carrera(nombre,carrera)
carrera('Juan Lopez','ingenieria en tecnologias de la informacion').
carrera('Yandy Macias','ingenieria en tecnologias de la informacion').
carrera('Luis Navarrete','ingenieria en tecnologias de la informacion').
carrera('Peralta Perez','ingeniera de software').
carrera('Amy Mendoza','ingeniera de software').
carrera('Dayana Arcentales','ingenieria en tecnologias de la informacion').
carrera('Ana García','ingenieria en tecnologias de la informacion').
carrera('Arbar Lopez','ingenieria en tecnologias de la informacion').
carrera('Nayeli Loor','ingeniera de software').
carrera('Juan Zapato', 'ingeniera en sistemas').
carrera('Isabel Morales','ingeniera de software').
carrera('Francisco Silva','ingeniera de software').
carrera('Carolina Ortega','ingeniera de software').
carrera('Miguel Zamora','ingeniera de software').
carrera('Jesus Cedeño','ingeniera en sistemas').
%hombre(nombre)
hombre('Juan Lopez').
hombre('Yandy Macias').
hombre('Luis Navarrete').
hombre('Juan Zapato').
hombre('Francisco Silva').
hombre('Miguel Zamora').
hombre('Jesus Cedeño').
%mujer(nombre)
mujeres('Peralta Perez').
mujeres('Amy Mendoza').
mujeres('Dayana Arcentales').
mujeres('Ana García').
mujeres('Arbar Lopez').
mujeres('Nayeli Loor').
mujeres('Isabel Morales').
mujeres('Carolina Ortega').
%promedio(nombre,nota)
promedio('Juan Lopez',16).
promedio('Yandy Macias',17.4).
promedio('Luis Navarrete',14.8).
promedio('Peralta Perez',14).
promedio('Amy Mendoza',17).
promedio('Dayana Arcentales',19).
promedio('Ana García',20).
promedio('Arbar Lopez',16).
promedio('Nayeli Loor',17.2).
promedio('Juan Zapato',17.5).
promedio('Isabel Morales',23).
promedio('Francisco Silva',19).
promedio('Carolina Ortega',18).
promedio('Miguel Zamora',19.8).
promedio('Jesus Cedeño',13.5).
%semestre(nombre, nivel)
semestre('Juan Lopez',4).
semestre('Yandy Macias',8).
semestre('Luis Navarrete',8).
semestre('Peralta Perez',6).
semestre('Amy Mendoza',6).
semestre('Dayana Arcentales',1).
semestre('Ana García',4).
semestre('Arbar Lopez',4).
semestre('Nayeli Loor',1).
semestre('Juan Zapato',9).
semestre('Isabel Morales',5).
semestre('Francisco Silva',3).
semestre('Carolina Ortega',2).
semestre('Miguel Zamora',6).
semestre('Jesus Cedeño',8).
%REGLAS
%estudiantes con un promedio superior a x (regla con operadores)
promedio_superior(X, Y) :-promedio(X, Z),Z > Y.
%en base al nombre saber a que semestre pertenece
semestre_estudiante(X, Y) :- semestre(X, Y).
%obtener el promedio de todos los estudiantes de una carrera en especifico
promedio_carrera(Carrera, Promedio) :-
  findall(Nota, (carrera(Estudiante, Carrera), promedio(Estudiante, Nota)), Notas),
  length(Notas, Cantidad),
  sum_list(Notas, Suma),
  Promedio is Suma / Cantidad.
%idea para regla (listar todos los estudiantes menores/mayores de edad)
%(ver que carrera tiene el promedio mas bajo/alto)
%(ver la cantidad de estudiantes de cada carrera)

#!/bin/bash
# Script to insert data from courses.csv and students.csv into students database

PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"

# Ler o arquivo courses.csv linha por linha
cat courses.csv | while IFS="," read MAJOR COURSE; do
  # Obter o major_id correspondente ao MAJOR atual
  MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")

  # Se MAJOR_ID estiver vazio, isso significa que o major não foi encontrado
  if [ -z "$MAJOR_ID" ]; then
    # Inserir novo major
    $($PSQL "INSERT INTO majors(major) VALUES ('$MAJOR')")

    # Obter o novo major_id
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
  fi

  # Obter o course_id correspondente ao COURSE atual
  COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")

  # Se COURSE_ID estiver vazio, isso significa que o curso não foi encontrado
  if [ -z "$COURSE_ID" ]; then
    # Inserir novo curso
    $($PSQL "INSERT INTO courses(course) VALUES ('$COURSE')")

    # Obter o novo course_id
    COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")
  fi

  # Inserir na tabela de relação entre majors e courses
  $($PSQL "INSERT INTO majors_courses(major_id, course_id) VALUES ($MAJOR_ID, $COURSE_ID)")
done

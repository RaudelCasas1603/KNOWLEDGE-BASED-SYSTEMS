         CLIPS (6.4.1 4/8/23)
CLIPS> ;; Definición de la plantilla de enfermedad
(deftemplate enfermedad
   (slot nombre)
   (slot tipo)
   (multislot sintomas)
)

;; Base de hechos inicial de enfermedades
(deffacts base-enfermedades
   (enfermedad (nombre "Influenza") (tipo "Viral") (sintomas "Fiebre" "Escalofríos" "Dolor de cabeza" "Dolor muscular" "Tos" "Fatiga"))
   (enfermedad (nombre "Tuberculosis") (tipo "Bacteriana") (sintomas "Tos persistente" "Fiebre" "Sudores nocturnos" "Pérdida de peso"))
   (enfermedad (nombre "COVID-19") (tipo "Viral") (sintomas "Fiebre" "Tos seca" "Dificultad para respirar" "Pérdida del olfato" "Pérdida del gusto"))
   (enfermedad (nombre "Neumonía bacteriana") (tipo "Bacteriana") (sintomas "Dolor en el pecho" "Fiebre" "Escalofríos" "Tos con flema"))
   (enfermedad (nombre "Varicela") (tipo "Viral") (sintomas "Erupción cutánea" "Picazón" "Fiebre" "Cansancio"))
   (enfermedad (nombre "Salmonelosis") (tipo "Bacteriana") (sintomas "Fiebre" "Diarrea" "Calambres abdominales"))
   (enfermedad (nombre "Hepatitis B") (tipo "Viral") (sintomas "Ictericia" "Fatiga" "Dolor abdominal" "Náuseas"))
   (enfermedad (nombre "Difteria") (tipo "Bacteriana") (sintomas "Dolor de garganta" "Fiebre" "Dificultad para respirar" "Inflamación de ganglios"))
   (enfermedad (nombre "Tétanos") (tipo "Bacteriana") (sintomas "Rigidez muscular" "Dificultad para tragar" "Espasmos" "Fiebre"))
   (enfermedad (nombre "Ébola") (tipo "Viral") (sintomas "Fiebre alta" "Sangrado" "Dolor muscular" "Vómitos" "Diarrea"))
)

;; Reglas de diagnóstico basadas en síntomas
(defrule diagnostico-fiebre
   ?sintoma <- (sintoma "Fiebre")
   ?enfermedad <- (enfermedad (sintomas $? "Fiebre" $?))
   =>
   (printout t "Posible enfermedad: " (fact-slot-value ?enfermedad nombre) crlf)
)

(defrule diagnostico-tos-seca
   ?sintoma <- (sintoma "Tos seca")
   ?enfermedad <- (enfermedad (sintomas $? "Tos seca" $?))
   =>
   (printout t "Posible enfermedad: " (fact-slot-value ?enfermedad nombre) crlf)
)

;; Ejecutar el sistema
(reset)
(run)

CLIPS> (reset)
(assert (sintoma "Fiebre"))
(assert (sintoma "Tos seca"))
(run)

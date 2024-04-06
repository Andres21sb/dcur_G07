
# Read CSV file
data <- read.csv("Dataset.csv")

plot(data$Age.at.enrollment, data$Admission.grade, 
     xlab = "Edad de matrícula", ylab = "Grado de admisión",
     main = "Gráfico de dispersión de la edad de matrícula frente al grado de admisión")

# Crea un vector con los nombres de las categorías del eje x
nombres_x <- c("Soltero", "Casado", "Viudo", "Divorciado", "Unión de hecho", "Legalmente separados")

# Crea el gráfico de barras y especifica los nombres de las categorías en el eje x
barplot(table(data$Marital.status), 
        cex.main = 1, 
        col = "chocolate", 
        main = "Distribución de estudiantes según estado civil", 
        xlab = "Estado civil", 
        ylab = "Cantidad de estudiantes", 
        xlim = c(0, 7), 
        ylim = c(0, 4000), 
        sub = "Fuente: Elaboración propia",
        names.arg = nombres_x)

# Agrega una línea base
abline(h = 0)

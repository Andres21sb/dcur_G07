#1 Conocer el % de variancia explicada para determinar cuántos componentes utilizar 
#para calcular los puntajes Leverage

var_exp


var_exp(Dataset, standardize = TRUE, Marital.status:Course)
# Se escogió como rango la autoeficacia hasta la nota de bachillerato para un 
#total de 182 variables.


#2 #Classic CUR with top scores selection criteria.
result <- CUR(data=Dataset, variables=Marital.status:Course,
              k=20, rows = 1, columns = .2, standardize = TRUE,
              cur_method = "sample_cur")
result

#Como resultado de este leverage_columns
#1         11.777423   SalGasColCabDep->
#2         11.302768    npadecimientos-> numero de padecimientos
#3         11.072102           RecUned->Responsabilidad Seguridad en si mismo
#4         10.457292        EscolMadre->Escolaridad de la madre
#5         10.370812           AserCog->Cogniciones acerca de la autoeficacia en interacciones sociales
#6         10.368642        EscolPadre->Escolaridad del padre
#7         10.107032        RecCarrECA->Recomendación Alguna carrera de la ECA
#8          9.538026        Climaclima->Clima Primer orden
#9          8.824725    CreativExpCorp->Empresión Corporal
#10         8.779562           TecOral-Tecnicas Orales

#3 #Extension of classic CUR: Recalibrating leverages scores
#and adjusting a mixtures Gaussian models to leverages.
result <- CUR(data=BaseDatos, variables=AutEficComF1:notabachillerato,
              k=20, rows = 1, columns = .2, standardize = TRUE,
              cur_method = "mixture",
              correlation = R1, correlation_type = "partial")

result$leverage_columns_sorted
#Se puede observar que se mejoró los resultados y quedó en quinto lugar
#la escolaridad del padre. Y se mantienen las 10 variables.
#1         11.812500   SalGasColCabDep
#2         11.355266    npadecimientos
#3         11.106225           RecUned
#4         10.700022        EscolMadre
#5         10.404541        EscolPadre
#6         10.372252           AserCog
#7         10.116369        RecCarrECA
#8          9.538030        Climaclima
#9          8.844297    CreativExpCorp
#10         8.793471           TecOral


#7 Relevant variables Plot

result <- CUR(data=BaseDatos, variables=AutEficComF1:notabachillerato,
              k=20, rows = 1, columns = .2, standardize = TRUE,
              cur_method = "sample_cur")
relevant_variables_plot(result)
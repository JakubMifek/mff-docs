# Klasifikační úloha

<p align="center">
  <img src="https://github.com/JakubMifek/mff-docs/blob/master/Introduction%20to%20Machine%20Learning/images/klasifikacni_uloha.png">
</p>

Zobrazení objektu klasifikace na cílovou množinu diskrétních hodnot
Objekt klasifikace je reprezentován pomocí vektoru příznaků `<A_1, A_2, ... A_n>`
Učíme se pomocí:
 - trénovacích dat
 - testovacích dat
 
Data jsou množiny příkladů `<x_i, y_i>, i=1..n`, kde `x_i` je vektor příznaků a `y_i` je jednou z cílových množin diskrétních hodnot.

# Entropy
See [slides](https://ufal.mff.cuni.cz/~holub/2018/docs/lec.Entropy.2018-10-17.pdf).
Entropie (`H`) je definovaná jako střední hodnota množství informace které se dozvídám v závislosti na pravděpodobnosti jevu.
`sum(Pr(value) . log_2 1/Pr(value)) = - sum(Pr(value) . log_2 Pr(value))`

<p align="center">
  <img src="https://github.com/JakubMifek/mff-docs/blob/master/Introduction%20to%20Machine%20Learning/images/rozdeleni.png
</p> 

<p align="center">
  <img src="https://github.com/JakubMifek/mff-docs/blob/master/Introduction%20to%20Machine%20Learning/images/slozena_entropie.png">
</p>

# Rozhodovací stromy
Rozhodovací strom `T=(V,E)` je zakořeněný strom, kde V je složeno z vnitřních rozhodovacích uzlů a konečných listových uzlů.
Typicky se jedná o binární stromy s rozhodovací funkcí v každém uzlu.
V listech se nachází cílové hodnoty.

<p align="center">
  <img src="https://github.com/JakubMifek/mff-docs/blob/master/Introduction%20to%20Machine%20Learning/images/rozhodovaci_stromy.png">
</p>

| Klasifikační stromy | Regresní stromy |
| :---: | :---: |
| Y je kategorický výstup | Y je numerický výstup |

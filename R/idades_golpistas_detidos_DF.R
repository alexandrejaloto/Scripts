library(ggplot2)
library(clock)
library(stringr)
library(pdftools)

file <- 'https://download.uol.com.br/files/2023/01/3966616256_presos1001-2.pdf'

lista <- pdf_text(file)


# homens ----

a <- str_split(lista[1], '\n\n')
a <- a[[1]][4]

# primeira substituição do espaço
i <- 1
while (substr(a, i, i) == ' ') {
  str_sub(a, i, i) <- ''
}
a
# substituições seguintes
while(i < str_length(a))
{
  if (substr(a, i, i+1) == '  ')
  {
    str_sub(a, i, i) <- ';'
    i <- i + 1
    while (substr(a, i, i) == ' ') {
      str_sub(a, i, i) <- ''
    }
    i <- i + 1
  } else {
    i <- i + 1
  }
}
a
txtPath <- tempfile(fileext = ".txt")
writeLines(text = a,
           con = txtPath)
h1 <- read.table(txtPath, sep = ';')
unlink(txtPath)

# página 2

a <- str_split(lista[2], '\n\n')
a <- a[[1]][1]

i <- 1
# substituições
while(i < str_length(a))
{
  if (substr(a, i, i+1) == '  ')
  {
    str_sub(a, i, i) <- ';'
    i <- i + 1
    while (substr(a, i, i) == ' ') {
      str_sub(a, i, i) <- ''
    }
    i <- i + 1
  } else {
    i <- i + 1
  }
}
a
txtPath <- tempfile(fileext = ".txt")
writeLines(text = a,
           con = txtPath)
h2 <- read.table(txtPath, sep = ';')
unlink(txtPath)

h2 <- h2[,-1]

# página 3

a <- str_split(lista[3], '\n\n')
a <- a[[1]][1]

i <- 1
# substituições
while(i < str_length(a))
{
  if (substr(a, i, i+1) == '  ')
  {
    str_sub(a, i, i) <- ';'
    i <- i + 1
    while (substr(a, i, i) == ' ') {
      str_sub(a, i, i) <- ''
    }
    i <- i + 1
  } else {
    i <- i + 1
  }
}
a
txtPath <- tempfile(fileext = ".txt")
writeLines(text = a,
           con = txtPath)
h3 <- read.table(txtPath, sep = ';')
unlink(txtPath)

h3 <- h3[,-1]

# página 4

a <- str_split(lista[4], '\n\n')
a <- a[[1]][1]

i <- 1
# substituições
while(i < str_length(a))
{
  if (substr(a, i, i+1) == '  ')
  {
    str_sub(a, i, i) <- ';'
    i <- i + 1
    while (substr(a, i, i) == ' ') {
      str_sub(a, i, i) <- ''
    }
    i <- i + 1
  } else {
    i <- i + 1
  }
}
a
txtPath <- tempfile(fileext = ".txt")
writeLines(text = a,
           con = txtPath)
h4 <- read.table(txtPath, sep = ';')
unlink(txtPath)

h4 <- h4[,-1]


# mulheres ----

# página 4

a <- str_split(lista[4], '\n\n')
a <- a[[1]][3]

# primeira substituição do espaço
i <- 1
while (substr(a, i, i) == ' ') {
  str_sub(a, i, i) <- ''
}
a

# substituições seguintes
while(i < str_length(a))
{
  if (substr(a, i, i+1) == '  ')
  {
    str_sub(a, i, i) <- ';'
    i <- i + 1
    while (substr(a, i, i) == ' ') {
      str_sub(a, i, i) <- ''
    }
    i <- i + 1
  } else {
    i <- i + 1
  }
}
a
txtPath <- tempfile(fileext = ".txt")
writeLines(text = a,
           con = txtPath)
m4 <- read.table(txtPath, sep = ';')
unlink(txtPath)

# página 5

a <- str_split(lista[5], '\n\n')
a <- a[[1]][1]

i <- 1
# substituições
while(i < str_length(a))
{
  if (substr(a, i, i+1) == '  ')
  {
    str_sub(a, i, i) <- ';'
    i <- i + 1
    while (substr(a, i, i) == ' ') {
      str_sub(a, i, i) <- ''
    }
    i <- i + 1
  } else {
    i <- i + 1
  }
}
a
txtPath <- tempfile(fileext = ".txt")
writeLines(text = a,
           con = txtPath)
m5 <- read.table(txtPath, sep = ';')
unlink(txtPath)

m5 <- m5[,-1]


# página 6

a <- str_split(lista[6], '\n\n')
a <- a[[1]][1]

i <- 1
# substituições
while(i < str_length(a))
{
  if (substr(a, i, i+1) == '  ')
  {
    str_sub(a, i, i) <- ';'
    i <- i + 1
    while (substr(a, i, i) == ' ') {
      str_sub(a, i, i) <- ''
    }
    i <- i + 1
  } else {
    i <- i + 1
  }
}
a
txtPath <- tempfile(fileext = ".txt")
writeLines(text = a,
           con = txtPath)
m6 <- read.table(txtPath, sep = ';')
unlink(txtPath)

m6 <- m6[,-1]


# página 7

a <- str_split(lista[7], '\n\n')
a <- a[[1]][1]

i <- 1
# substituições
while(i < str_length(a))
{
  if (substr(a, i, i+1) == '  ')
  {
    str_sub(a, i, i) <- ';'
    i <- i + 1
    while (substr(a, i, i) == ' ') {
      str_sub(a, i, i) <- ''
    }
    i <- i + 1
  } else {
    i <- i + 1
  }
}
a
txtPath <- tempfile(fileext = ".txt")
writeLines(text = a,
           con = txtPath)
m7 <- read.table(txtPath, sep = ';')
unlink(txtPath)

m7 <- m7[,-1]

# juntar tudo ----

names(m4) <- c('V2', 'V3')
m <- rbind(m4, m5, m6, m7)
m$sexo <- 'feminino'

names(h1) <- c('V2', 'V3')
h <- rbind(h1, h2, h3, h4)
h$sexo <- 'masculino'

lista <- rbind(h, m)
names(lista) <- c('nome', 'data', 'sexo')

lista$data <- as.Date(lista$data, "%d.%m.%Y")

lista$idade <- date_count_between(lista$data, Sys.Date(), 'year')

lista <- subset(lista, idade <= 100)

# gráfico ----
ggplot(lista, aes(x = sexo, y = idade, color = sexo)) +
  geom_violin() +
  theme_bw() +
  theme(
    legend.position = "none"
  )

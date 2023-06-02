# Rano noumi sulistyo, 5025211185
# no 1

# terdapat tabel berisi 2 kolom, x dan y. berisi data dari responden

kx <- c(78, 75, 67, 77, 70, 72, 78, 70, 77)
ky <- c(100, 95, 70, 90, 90, 90, 89, 100, 100)
# 1a mencari selisih dan 
cat(ky-kx, "\n")
cat(sd(ky-kx), "\n")
# selisih = 22 20 3 13 20 18 11 30 23
# standar deviasi = 7.838651 

# 1 b
# cari t(pvalue) ini bisa dilakukan dengan mencari t test dan ambil p valuenya
testox <- t.test(kx, ky, paired = TRUE)
cat("t_value= ", testox$statistic, "\n")
cat("p_value= ", testox$p.value, "\n")
# statistic/t_value = -6.803892 
# p_value = 0.0001372773 

# 1 c

# pengaruh jiksa signifikan levelnya 5%, berarti lakukan t.test dengan confident level 95%
t.test(kx, ky, paired = TRUE, conf.level = 0.95)
# berdasarkan hasil, ditemukan fakta bahwa H0 ditolak karena p sangat kecil, oleh karena itu
# H1(terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen sebelum dan sesudah melakukan aktifitas A)
# H1 diterima

# No 2
# nilai2 yang diketahui
install.packages("BSDA")
library(BSDA)
meanH0 <- 25000
Nm <- 100
meanH1 <- 23500
sds <- 3000
# normal menggunakan 5% signifikan 
zsum.test(mean.x=meanH1, sigma.x = sds, n.x = Nm, alternative = "greater", mu = meanH0, conf.level = 0.95)
# 2a = menurut saya dikaenkan perdedaan 25000 dan 23500 masuk dalam standar deviasi 3000 klaim tersebut masuk akal dan bisa diterima
# 2b = berdasarkan p-value yang berupa 1. ini berarti klaim H0 tersebut adalah benar

# no 3.
# terdapat 2 data kota bandung dan bali
bnsh <- 20
bnm <- 3.64
bnsd <- 1.67
blsh <- 27
blm <- 2.79
blsd <- 1.5
# 3a = H0(mean1 <= mean2) dan H1(mean1 > mean2) di hipotesa rata rata lebih besar dari H0
tsum.test(mean.x= bnm, s.x = bnsd, n.x = bnsh, mean.y =blm , s.y =blsd, n.y = blsh,
          alternative = "greater", var.equal = TRUE, conf.level = 0.95)
# 3b = t = 1.8304, df = 45, p-value = 0.03691
install.packages("mosaic")
library(mosaic)
# 3c
plotDist(dist = 't', df = 2, col = "blue")
# 3d nilai kritikal
cat("Nilai kritkal=", qt(p = 0.05/2, 2, lower.tail = FALSE), "\n")
# nilai kritikal adalah 4.302653
# 3e = H0 ditolak dan H1 diterima
# 3f = karena nilai p lebih kecil dari 5% sehingga mean asli lebih besar dari h0

# no 4 
# terdapat data csv yang akan dilakukan uji ANOVA

GTL <- read.csv("GTL.csv")
print(GTL)
library(ggpubr)
#buat plot simple untuk anova
ggplot(GTL, aes(x = Glass, y = Temp, color = Light)) + geom_point(width = .02) +
  theme_minimal()
# lakukan uji anova
anovaGTL <- aov(Light ~ Glass * Temp, data = GTL)
summary(anovaGTL)
# tampilkan g
hasilanova <- aggregate(Light ~ Glass + Temp, GTL, function(x) c(mean = mean(x), sd = sd(x)))
print(hasilanova)
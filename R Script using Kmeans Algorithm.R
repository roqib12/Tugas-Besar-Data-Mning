# Melihat working direktori kerja saat ini
getwd()

# Mensertakan library yang akan digunakan
library(cluster)
library(factoextra)
library(magrittr)

# Mengimport dataset yang akan digunakan dan melihat struktur data pada dataset
dataset <- read.csv("cervical_cancer.csv", sep = ",")
str(dataset)

# Melihat sebagian data yang ada pada dataset
head(dataset)

# Menghapus nilai yang hilang yang mungkin ada dalam data
data <- na.omit(dataset)
summary(data)

# Standarisasi data
datafix <-scale(data)

# Menentukan K optimal dari metode elbow, silhoutte, dan gap static
fviz_nbclust(datafix, kmeans, method ="wss")

fviz_nbclust(datafix, kmeans, method ="silhouette")

set.seed(123)
gap_stat <- clusGap(datafix, FUN = kmeans, nstart = 25,
                    K.max = 10, B = 50)
fviz_gap_stat(gap_stat)

# Menghitung pengelompokan k-means
final <- kmeans(datafix, 7, nstart = 25)
print(final)

# Memvisualisasikan data menggunakan fviz_cluster
fviz_cluster(final, data = datafix)
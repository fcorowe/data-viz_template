# HOW TO CHECK EACH COLOR FROM VIRIDIS PALETTE
library(viridis)
library(colorspace)
library(scales)


df <- data.frame(
  x = runif(100),
  y = runif(100),
  z1 = rnorm(100),
  z2 = abs(rnorm(100))
)

df_na <- data.frame(
  value = seq(1, 20),
  x = runif(20),
  y = runif(20),
  z1 = c(rep(NA, 10), rnorm(10))
)

ggplot(df, aes(x, y)) + 
  geom_point(color = z2) +
  scale_color_gradient2(midpoint = mid,
                        low = "blue", mid = "white", high = "red" )

ggplot(df, aes(x, y)) +
  geom_point(aes(colour = x)) +
  scale_colour_gradient2(low = "blue", mid = "white", high = "red", midpoint = 0.5)


# viridis
show_col(viridis_pal()(20))
viridis_pal()(20)

show_col(viridis_pal( option = "plasma")(20))
viridis_pal(option = "plasma")(20)

show_col(viridis_pal( option = "magma")(20))
viridis_pal(option = "magma")(20)

show_col(viridis_pal( option = "inferno")(25))
viridis_pal(option = "inferno")(25)
#
show_col("black")

## diverging red-blue colors
hcl_palettes("diverging", n = 7, plot = TRUE)
diverging_hcl(7, "Blue-Red")

dsamp <- diamonds[1 + 1:1000 * 50, ]
ggplot(dsamp, aes(carat, price, color = cut)) + geom_point() +
  scale_color_discrete_sequential(palette = "Purples 3", nmax = 6, order = 2:6)

dsamp <- diamonds[1 + 1:1000 * 50, ]
ggplot(dsamp, aes(carat, price, color = cut)) + geom_point() +
  scale_color_discrete_diverging(palette = "Blue-Red", nmax = 6, order = 2:6)

dsamp <- diamonds[1 + 1:1000 * 50, ]
ggplot(dsamp, aes(carat, price, color = cut)) + geom_point() +
  scale_color_discrete_diverging(palette = "Blue-Red 2", nmax = 6, order = 2:6)

dsamp <- diamonds[1 + 1:1000 * 50, ]
ggplot(dsamp, aes(carat, price, color = cut)) + geom_point() +
  scale_color_discrete_diverging(palette = "Blue-Red 3", nmax = 6, order = 2:6)







library(ggplot2)
#library(cumplyr)
library(scales)
library(RColorBrewer)


myPalette <- colorRampPalette(plasma(10))

x   = 1:5
y   = 1:5
pts = expand.grid(x=x, y=y)
d1 = cbind(pts, runif(nrow(pts),min=0,max=1), 1)
d2 = cbind(pts, runif(nrow(pts),min=0,max=4), 2)
colnames(d1) = colnames(d2) = c("x","y","val","k")
d  = rbind(d1,d2)

p1 <- ggplot(d1)
p1 <- p1 + geom_tile(aes(x = x, y = y, fill = val))
p1 <- p1 + scale_fill_gradientn(colours = myPalette(4))
p1

p2 <- ggplot(d2, aes(x = x, y = y, fill = val))
p2 <- p2 + geom_tile(aes(x = x, y = y, fill = val)) 
p2 <- p2 + scale_fill_gradientn(colours = myPalette(4))
p2

gd <- as.data.frame(VADeaths)
view(gd)


barplot(gd$`Rural Male`)
barplot(gd$`Rural Male`, names.arg = c("50-54", "55-59", "60-64", "65-69", "70-74"))
#OR
barplot(gd$`Rural Male`, names.arg = rownames(VADeaths))

barplot(gd$`Rural Male`, names.arg = rownames(VADeaths),
        main="Death Rate in Virginia USA", xlab="Age group", ylab="Rate")

barplot(gd$`Rural Male`, names.arg = rownames(VADeaths),
        main="Death Rate in Virginia USA", xlab="Age group", ylab="Rate",
        horiz = T, col = "blue", border = "red",
        xlim = c(0,70), cex.axis = 0.80)    #cex.axis for font size

barplot(gd, col = c("lightblue", "mistyrose", "lightcyan", "lavender", "cornsilk"), legend = rownames(VADeaths) )

gdm <- as.matrix(gd)

barplot(gdm, col = c("lightblue", "mistyrose", "lightcyan", "lavender", "cornsilk"), legend = rownames(gd))


my_colors <- c("lightblue", "mistyrose", "lightcyan", "lavender", "cornsilk")

legend("topleft", legend =rownames(gdm), fill = my_colors, box.lty = 0, cex = 0.8)

barplot(gdm, col = my_colors, legend = rownames(gd),
        beside = T)

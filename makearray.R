# This is a simple R script. The hash indicates that a line should be ignored
# by the R interpreter.


# Let's start by defining a function:
rescale <- function(vec){
    floor = min(vec)
    extent = max(vec) - floor
    return( as.vector( scale(vec, center=floor, scale=extent) ) )
}

# note this is built using the scale() base function - take a look (using ?scale)

# Fetching the data:
array <- read.csv('heatmaps_in_r.csv', header = TRUE, comment.char="#", row.names = 1) 

# Let's make our new array:
array_norm_byprobe <- apply(array, 2, rescale)

# And then we can make our image:
pdf("nanoarray_byprobe.pdf", 12, 6)
par(cex.axis=0.6, las=2)
image(x=1:10, y=1:4, z=data.matrix(array_norm_byprobe), col=rev(heat.colors(10)), xlab='', ylab='', axes=F)
axis(1, at=1:10, labels=rownames(array_norm_byprobe))
axis(2, at=1:4, labels=colnames(array_norm_byprobe))
title(xlab="sample", ylab="probe", cex.main=2)
dev.off()

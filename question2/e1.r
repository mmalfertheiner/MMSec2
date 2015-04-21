require("MMSec")
setwd("/home/martin/Projects/MMSec2/question2")

img1 <- load.png("Img8.png")
m = 255 * as.matrix.greymap(img1)
hist <- matrix(0,256,1)

# Histogram
png(filename="Hist8.png")
h = hist(m, breaks=256)
dev.off()

# Count occurences of each color
for (i in 1:ncol(m)) {
	for (j in 1:nrow(m)) {
		#Colors from 1 to 256, to make it simpler for indexing
		color = m[i,j] + 1
		hist[color] <- hist[color] + 1
	}
}

# Chi-Square
x = 0

for (i in 0:127) {
	# Calculate Chi-Square
	y1 = hist[2*i+1]
	y2 = hist[2*i+2]

	e = (y1 + y2)/2

	if (e == 0) {
		next
	}

	x = x + ((y2 - e)^2 / e)
}

print(x)

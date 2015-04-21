require("MMSec")
require("MASS")

setwd("/home/martin/Projects/MMSec2/question2")

img1 <- load.png("Img7.png")
#m1 <- img1$grey

m = 256 * as.matrix.greymap(img1)
h = truehist(m, breaks=256)

x = 0

print(h)

for (i in 0:127) {
	value1 = 0
	value2 = 0

	print(dim(h$breaks))
	for (j in 1:dim(h$breaks)) {
		if (h$breaks[j] == (2*i)) {
			value1 = h$counts[j]
		}

		if (h$breaks[j] == (2*i+1)) {
			value2 = h$counts[j]
		}
		
	}

	e = (value1 + value2)/2
	x = x + ((value2 - e)^2 / e)
}

print(x)


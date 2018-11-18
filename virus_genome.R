# Plotting a genome figure

# Plotting the arcs (in 3 ring sets)
par.to.keep <- par()
par(cex=0.7, pty = "s", mar = c(0, 0, 0, 0), mgp = c(0, 0, 0), new = F)
plot(0, 0, axes = F, xlim = c(-8, 8), ylim = c(-8, 8), xlab = "", ylab = "", type = "n")
for (i in 1:7)
{
	if (i==1) {radius = 7.5 ; angle1 <- pi/2 - (2*pi*964/5386) ; angle2 <- pi/2 + (2*pi*(5386-3981)/5386)}
	if (i==2) {radius = 7.5 ; angle1 <- pi/2 - (2*pi*2284/5386) ; angle2 <- pi/2 - (2*pi*1001/5386)}
	if (i==3) {radius = 7.5 ; angle1 <- pi/2 - (2*pi*2922/5386) ; angle2 <- pi/2 - (2*pi*2395/5386)}
	if (i==4) {radius = 7.5 ; angle1 <- pi/2 - (2*pi*3917/5386) ; angle2 <- pi/2 - (2*pi*2931/5386)}
	if (i==5) {radius = 6 ; angle1 <- pi/2 - (2*pi*136/5386) ; angle2 <- pi/2 + (2*pi*(5386-4497)/5386)}
	if (i==6) {radius = 4.5 ; angle1 <- pi/2 - (2*pi*221/5386) ; angle2 <- pi/2 + (2*pi*(5386-5075)/5386)}
	if (i==7) {radius = 6 ; angle1 <- pi/2 - (2*pi*843/5386) ; angle2 <- pi/2 - (2*pi*568/5386)}

	t <- seq(angle1,angle2,0.01)
	lines(radius*cos(t),radius*sin(t))
	lines((radius-0.75)*cos(t),(radius-0.75)*sin(t))
}

# Plotting outer ring's segments
for (i in c(133,136,390,393,848,964,1001,2284,2395,2922,2931,3917,3981))
{
	x1 <- 6.75*cos(pi/2 - 2*pi*i/5386)
	y1 <- 6.75*sin(pi/2 - 2*pi*i/5386)
	x2 <- 7.5*cos(pi/2 - 2*pi*i/5386)
	y2 <- 7.5*sin(pi/2 - 2*pi*i/5386)

	segments(x1,y1,x2,y2)
}

# Plotting middle ring's segments
for (i in c(136,568,843,4497))
{
	x1 <- 5.25*cos(pi/2 - 2*pi*i/5386)
	y1 <- 5.25*sin(pi/2 - 2*pi*i/5386)
	x2 <- 6*cos(pi/2 - 2*pi*i/5386)
	y2 <- 6*sin(pi/2 - 2*pi*i/5386)

	segments(x1,y1,x2,y2)
}

# Plotting inner ring's segments
for (i in c(51,221,5075))
{
	x1 <- 3.75*cos(pi/2 - 2*pi*i/5386)
	y1 <- 3.75*sin(pi/2 - 2*pi*i/5386)
	x2 <- 4.5*cos(pi/2 - 2*pi*i/5386)
	y2 <- 4.5*sin(pi/2 - 2*pi*i/5386)

	segments(x1,y1,x2,y2)
}

# Plotting positional coordinates
for (i in 0:5)
{
	text.angle = pi/2 - (i * 2000*pi/5386)
	text(8*cos(text.angle), 8*sin(text.angle), labels = as.character(i*1000), cex=0.8)
}

# Plotting positional names
genes <- c("A","C","D","J","F","G","H","A*","E","B","K")
midcoord <- c(4751.5,263,619,906,1642.5,2658.5,3424,5009.5,705.5,5256,136)

for (i in 1:7)
{
	text.angle = pi/2 - (midcoord[i]*2*pi/5386)
	text(7.125*cos(text.angle), 7.125*sin(text.angle), labels = genes[i], cex=1.3)
}

for (i in 8:9)
{
	text.angle = pi/2 - (midcoord[i]*2*pi/5386)
	text(5.625*cos(text.angle), 5.625*sin(text.angle), labels = genes[i], cex=1.3)
}

for (i in 10:11)
{
	text.angle = pi/2 - (midcoord[i]*2*pi/5386)
	text(4.125*cos(text.angle), 4.125*sin(text.angle), labels = genes[i], cex=1.3)
}

# Central text
text(0, 0.3, labels = "\u03C6X174 Genome Map", cex=1.3)
text(0, -0.3, labels = "5386 bases", cex=1.3)

# Label text
text(-7.5, 7.5, "A", cex=2)

# Restoring graphical settings
par(par.to.keep)
library(igraph);
library(xtable);
fileToRead <- NULL;
csvFrame <- NULL;
csv <- NULL;
yesno <- c("yes", "no");
message(getwd());
filesinDir <- dir();
while (TRUE) {
  fileToRead <- choose.files(default = "", caption =  "select data file",  multi = FALSE);
  if (length(fileToRead) != 0)  {
    break;
  }
}
csvFrame <- read.csv(file = fileToRead, header = TRUE, sep = ",", quote = "\"", dec = ".",  fill = TRUE, comment.char = "");

View(csvFrame);

message("Writing stuff to files! Check in the Out folder in the current working directory.");
file.create("TableView.html");
file.create("PlotView.svg");
file.create("PlotViewOPT.png");
file.create("PlotViewDAVE.png");
file.create("PlotViewDRL.png");
file.create("PlotViewBIPARTITE.png");
file.create("PlotViewSTAR.png");
file.create("BoxPlot.png");
file.create("BarPlot.png");
file.create("AssocPlot.png");
file.create("SunflowerPlot.png");
file.create("ScatterPlot.png");
file.create("MosiacPlot.png");


sink("TableView.html");
print(xtable(csvFrame), type = 'html');
sink();
dev.off();

csvFrame.directed <- graph.data.frame(csvFrame, directed = TRUE, vertices = );
V(csvFrame.directed);
E(csvFrame.directed);

sink("PlotView.svg");
layout.graphopt(csvFrame.directed, mass = 10, spring.length = 4, spring.constant = 8);
png(filename = "PlotView.svg", width = 1080, height = 1040, units = "px", pointsize = 12, bg = "white");
plot(csvFrame.directed);
sink();
dev.off();

sink("PlotViewOPT.png");
layout.graphopt(csvFrame.directed, mass = 10, spring.length = 4, spring.constant = 8);
png(filename = "PlotViewOPT.png", width = 1080, height = 1040, units = "px", pointsize = 12, bg = "white");
plot(csvFrame.directed);
sink();
dev.off();

sink("PlotViewDAVE.png");
layout.davidson.harel(csvFrame.directed, maxiter = 1);
png(filename = "PlotViewDAVE.png", width = 1080, height = 1040, units = "px", pointsize = 12, bg = "white");
plot(csvFrame.directed);
sink();
dev.off();

sink("plotViewDRL.png");
layout.drl(csvFrame.directed, dim = 3);
png(filename = "PlotViewDRL.png", width = 1080, height = 1040, units = "px", pointsize = 12, bg = "white");
plot(csvFrame.directed);
sink();
dev.off();

sink("PlotViewBIPARTITE.png");
layout.bipartite(csvFrame.directed);
png(filename = "PlotViewBIPARTITE.png", width = 1080, height = 1040, units = "px", pointsize = 12, bg = "white");
plot(csvFrame.directed);
sink();
dev.off();

sink("PlotViewSTAR.png");
layout.star(csvFrame.directed);
png(filename = "PlotViewSTAR.png", width = 1080, height = 1040, units = "px", pointsize = 12, bg = "white");
plot(csvFrame.directed);
sink();
dev.off();

# I couldn't get these to work
# 
# sink("BoxPlot.png");
# png(filename = "BoxPlot.png", width = 1080, height = 1040, units = "px", pointsize = 12, bg = "white");
# boxplot(csvFrame.directed);
# sink();
# dev.off();

# sink("BarPlot.png");
# png(filename = "BarPlot.png", width = 1080, height = 1040, units = "px", pointsize = 12, bg = "white");
# barplot(csvFrame.directed);
# sink();
# dev.off();
# 
# sink("AssocPlot.png");
# png(filename = "AssocPlot.png", width = 1080, height = 1040, units = "px", pointsize = 12, bg = "white");
# assocplot(csvFrame.directed);
# sink();
# dev.off();
# 
# sink("SunflowerPlot.png");
# png(filename = "SunflowerPlot.png", width = 1080, height = 1040, units = "px", pointsize = 12, bg = "white");
# sunflowerplot(csvFrame.directed, size = 1/2, x = csvFrame.directed[1], y = csvFrame.directed[2]);
# sink();
# dev.off();
# 
# sink("ScatterPlot.png");
# png(filename = "ScatterPlot.png", width = 1080, height = 1040, units = "px", pointsize = 12, bg = "white");
# smoothScatter(csvFrame.directed, nbin = 256, x = csvFrame.directed[1], y = csvFrame.directed[2]);
# sink();
# dev.off();
# 
# sink("MosiacPlot.png");
# png(filename = "MosiacPlot.png", width = 1080, height = 1040, units = "px", pointsize = 12, bg = "white");
# mosaicplot(csvFrame.directed, bin = 1);
# sink();
# dev.off();


graphics.off();
message("bye.");


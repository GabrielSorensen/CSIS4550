library(igraph);
library(xtable);
fileToRead <- NULL;
csvFrame <- NULL;
csv <- NULL;
message(getwd());
filesinDir <- dir();
# change this data set to see things
csvFrame <- beaver1;
# -----------------------------------------
View(csvFrame);

message("Writing stuff to files! Check in the Out folder in the current working directory.");
file.create("TableViewF.html");
file.create("PlotViewF.svg");
file.create("PlotViewOPTF.png");
file.create("PlotViewDAVEF.png");
file.create("PlotViewDRLF.png");
file.create("PlotViewBIPARTITEF.png");
file.create("PlotViewSTARF.png");
file.create("BoxPlotF.png");
file.create("BarPlotF.png");
file.create("AssocPlotF.png");
file.create("SunflowerPlotF.png");
file.create("ScatterPlotF.png");
file.create("MosiacPlotF.png");


sink("TableViewF.html");
print(xtable(csvFrame), type = 'html');
sink();
dev.off();

csvFrame.directed <- graph.data.frame(csvFrame, directed = TRUE);
V(csvFrame.directed);
E(csvFrame.directed);

sink("PlotViewF.svg");
layout.graphopt(csvFrame.directed, mass = 10, spring.length = 4, spring.constant = 8);
png(filename = "PlotViewF.svg", width = 1080, height = 1040, units = "px", pointsize = 12, bg = "white");
plot(csvFrame.directed);
sink();
dev.off();

sink("PlotViewOPTF.png");
layout.graphopt(csvFrame.directed, mass = 10, spring.length = 4, spring.constant = 8);
png(filename = "PlotViewOPTF.png", width = 1080, height = 1040, units = "px", pointsize = 12, bg = "white");
plot(csvFrame.directed);
sink();
dev.off();

sink("PlotViewDAVEF.png");
layout.davidson.harel(csvFrame.directed, maxiter = 1);
png(filename = "PlotViewDAVEF.png", width = 1080, height = 1040, units = "px", pointsize = 12, bg = "white");
plot(csvFrame.directed);
sink();
dev.off();

sink("plotViewDRLF.png");
layout.drl(csvFrame.directed, dim = 3);
png(filename = "PlotViewDRLF.png", width = 1080, height = 1040, units = "px", pointsize = 12, bg = "white");
plot(csvFrame.directed);
sink();
dev.off();

sink("PlotViewBIPARTITEF.png");
layout.bipartite(csvFrame.directed);
png(filename = "PlotViewBIPARTITEF.png", width = 1080, height = 1040, units = "px", pointsize = 12, bg = "white");
plot(csvFrame.directed);
sink();
dev.off();

sink("PlotViewSTARF.png");
layout.star(csvFrame.directed);
png(filename = "PlotViewSTARF.png", width = 1080, height = 1040, units = "px", pointsize = 12, bg = "white");
plot(csvFrame.directed);
sink();
dev.off();


sink("BoxPlotF.png");
png(filename = "BoxPlotF.png", width = 1080, height = 1040, units = "px", pointsize = 12, bg = "white");
boxplot(csvFrame.directed);
sink();
dev.off();

sink("BarPlotF.png");
png(filename = "BarPlotF.png", width = 1080, height = 1040, units = "px", pointsize = 12, bg = "white");
barplot(csvFrame.directed);
sink();
dev.off();

sink("AssocPlotF.png");
png(filename = "AssocPlotF.png", width = 1080, height = 1040, units = "px", pointsize = 12, bg = "white");
assocplot(csvFrame.directed);
sink();
dev.off();

sink("SunflowerPlotF.png");
png(filename = "SunflowerPlotF.png", width = 1080, height = 1040, units = "px", pointsize = 12, bg = "white");
sunflowerplot(csvFrame.directed, size = 1/2, x = csvFrame.directed[1], y = csvFrame.directed[2]);
sink();
dev.off();

sink("ScatterPlotF.png");
png(filename = "ScatterPlotF.png", width = 1080, height = 1040, units = "px", pointsize = 12, bg = "white");
smoothScatter(csvFrame.directed, nbin = 256, x = csvFrame.directed[1], y = csvFrame.directed[2]);
sink();
dev.off();

sink("MosiacPlotF.png");
png(filename = "MosiacPlotF.png", width = 1080, height = 1040, units = "px", pointsize = 12, bg = "white");
mosaicplot(csvFrame.directed, bin = 1);
sink();
dev.off();


graphics.off();
message("bye.");


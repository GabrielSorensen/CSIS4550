#Gabe Sorensen 
#data parsing and visualizations using R
#include 
library(igraph);
library(xtable);
#var   set to null to avoid issues
fileToRead <- NULL;
csvFrame <- NULL;
csv <- NULL;
yesno <- c("yes", "no");
#get the present working directory
message(getwd());
filesinDir <- dir();
#lets pull in whatever file we want
while (TRUE) {
  fileToRead <- choose.files(default = "", caption =  "select data file",  multi = FALSE);
  #message("file is: "); 
  #message(fileToRead);
  if (length(fileToRead) != 0)  {
    break;
  }
  
#   cho <-  select.list(choices = yesno, preselect = NULL, multiple = FALSE, 
#               title = "Are you sure you want to quit?", graphics = getOption("menu.graphics"));
#   if (cho == 1) {
#    break;
#   } else {
#    fileToRead <= NULL;
  
}
#message(fileToRead); note this is a bad idea, bc data can be huge
csvFrame <- read.csv(file = fileToRead, header = TRUE,
                sep = ",", quote = "\"", dec = ".", 
                fill = TRUE, comment.char = "");
#message(csvFrame);

message("Writing stuff to files! Check in the Out folder in the current working directory.");
View(csvFrame);
file.create("TableView.html");
file.create("PlotView.svg");
file.create("PlotViewOPT.png");
file.create("PlotViewDAVE.png");
# create the files we will be using.

sink("TableView.html");
print(xtable(csvFrame), type = 'html');
#create an html version of the dataframe

# sink("PlotView.svg");
# csvFrame.directed <- graph.data.frame(csvFrame, directed = TRUE);
# V(csvFrame.directed);
# E(csvFrame.directed);
# plot(csvFrame.directed);
# svg(filename = "PlotView.svg");
# #dev.off();
# # create vector graphic of plotview
# 
# sink("PlotView.png");
# csvFrame.directed <- graph.data.frame(csvFrame, directed = TRUE);
# V(csvFrame.directed);
# E(csvFrame.directed);
# plot(csvFrame.directed);
# png(filename = "PlotView.png", width = 1080, height = 1040, units = "px", pointsize = 12, bg = "white");
# #dev.off();
# create png of plotview

csvFrame.directed <- graph.data.frame(csvFrame, directed = TRUE, vertices = );
#message(V(csvFrame.directed)); #sometimes The edges and Verticies is
#message(E(csvFrame.directed)); #a crazy long list.
V(csvFrame.directed);
E(csvFrame.directed);

layout.graphopt(csvFrame.directed, mass = 10, spring.length = 1, spring.constant = 2);
plot(csvFrame.directed);
png(filename = "PlotViewOPT.png", width = 1080, height = 1040, units = "px", pointsize = 12, bg = "white");



# layout.davidson.harel(csvFrame.directed, maxiter = 20);
# plot(csvFrame.directed);
# sink(file = "plotviewDAVE.png");
# png(filename = "PlotViewDAVE.png", width = 1080, height = 1040, units = "px", pointsize = 12, bg = "white");
# 
# sink();
#dev.off();

#now lets take our data frame and pick the verticies for a new graph view
choicesForVerticies <- colnames(csvFrame, prefix = "Collumn: ", do.NULL = TRUE);
message(choicesForVerticies);

message("bye.");

#Gabe Sorensen
#

list1 <- c(1, 5, 7);
list2 <- c(2, 7, 8);
articles <- c("a", "an", "the");
colors <- c("black", "brown", "blue", "red", "yellow", "orange", "purple", "green", "gray", "pink");
EngNums <- c("zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten");
FrenchNums <- c("zero", "un", "deux", "trois", "quatre", "cinq", "six", "sept", "huit", "neuf", "dix");
FrenchEngDic <- FrenchNums;
names(FrenchEngDic) <- EngNums;



hypot <- function(base, height){
  sqrt((base * base) + (height * height));
}

ans <- hypot(3, 4); 
#ans;

sphereVol <- function(radius) {
  ((4/3)*(pi))*(radius * radius * radius);
}

ans <- sphereVol(3);
#ans;

stateOfWater <- function(temp) {
  if (temp < 32) {
    print("water is frozen.");
  } else if (temp >= 32 && temp < 113) {
    print("water is a liquid.");
  } else {
    print("water is a gas.");
  }
}

#stateOfWater(10);
#stateOfWater(50);
#stateOfWater(500);

dotProduct <- function(seq1, seq2) {
  sum(seq1 * seq2);
}

ans <- dotProduct(list1, list2);
#ans;

doubleSeq <- function(seq1) {
  (seq1 * 2);
}

ans <- doubleSeq(list1);
#ans;

duplicateSeq <- function(seq1) {
  rep(seq1, 2);
}

ans <- duplicateSeq(list1);
#ans;

removeDups <- function(seq1){
  s <- unique(seq1);
}

ans <- removeDups(strsplit("the quick brown fox jumped over the lazy dog.", " +")[[1]]);
#ans;

translate <- function(sentence) {
  words <- strsplit(sentence, " +")[[1]];
  words <- tolower(words);
  translatedSentence <- FrenchEngDic[words];
}
 
freelo <- translate("one three six nine four");
#freelo;

sumProduct <- function(seq1, fun) {
  Reduce(fun, seq1);
}

ans <- sumProduct(list1, sum);
#ans;
ans <- sumProduct(list1, prod);
#ans;

countAtricles <- function(sentence) {
  listWords <- strsplit(sentence, " +")[[1]];
  listWords <- tolower(listWords);
  list <- which(listWords %in% articles);
  length(listWords[list]);
}

numArticles <- countAtricles("the quick brown fox jumped over a lazy dog.");
#numArticles;

listColors <- function(sentence) {
  listWords <- strsplit(sentence, " +")[[1]];
  listWords <- tolower(listWords);
  list <- which(listWords %in% colors);
  listWords <- listWords[list];
}

listOfColors <- listColors("the quick brown fox jumped over a lazy dog.");
#listOfColors;

positives <- function(list1) {
  p <- list1[list1 >= 0];
}

ans <- positives(c(-1, 0, 1, -9, 5, -6, -7));
#ans;

findMax <- function(list1) {
  max <- max(list1);
}

ans <- findMax(c(-1, 0, 1, -9, 5, -6, -7));
#ans;

nestLevel <- function(item, list) {
  if (item %in% list) {
    return(0);
  } else {
    
  }
 #do stuff
}

#ans <- nestLevel(5);
#ans;

firstN <- function(n) {
  nums <- seq(0, n, 1);
  nums <- (nums * nums);
}

numbers <- firstN(10);
#numbers;

youngestPerson <- function(people) {
 #do things
}
#
#youngest <- youngestPerson(c(#people#));
#youngest;
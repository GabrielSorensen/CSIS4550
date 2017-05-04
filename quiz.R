#Gabe Sorensen
nums1 <- c(-1, 0, 1, -4, 4);

#duplicate seq
duplicateseq <- function(seq){
  seq <- rep(seq, 2);
}
ans <- duplicateseq(nums1);
ans;

#count negatives
negs <- function(nums){
  ret <- nums[nums<0];
  ret <- length(ret);
}
ans <- negs(nums1);
ans;

R6 <- c(-.75, -.25, .25, .75, 1.25, 1.75);

p5 <- function(x){
  ret <- (1 + x*x)*(.75);
}

ans <- sum(p5(R6));
ans;
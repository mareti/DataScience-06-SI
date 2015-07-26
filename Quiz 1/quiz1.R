q1 <- function() {
    p_aub = 0.17
    p_a = 0.12
    p_anb = 0.06
    
    p_b = p_aub + p_anb - p_a
    p_b
}

q2 <- function() {
    #pbeta(0.75,1,1)
    
    p_75 = 0.75 * 1 * 1
    p_75
}

q3 <- function() {
    # p(-X) + (1-p)(Y) = 0
    # pX = (1-p)Y
    # p/(1-p) = Y/X
}
q4 <- function() {
    # ans = 0?
    # x axis gives the position of the median, here it is 0
}

q5 <- function() {
    x = 1:4
    p = x/sum(x)
    temp = rbind(x, p)
    rownames(temp) = c("X", "Prob")
    
    e = sum(x*p)
    e
}

q6 <- function() {
    sensitivity = 0.75
    specificity = 0.52
    p_d = 0.30
    
    (sensitivity*p_d)/(sensitivity*p_d + (1-specificity)*(1-p_d))
    
    
}


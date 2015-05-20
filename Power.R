library(manipulate)
library(ggplot2)

# Demonstrating T conf limits ---------------------------------------------


k <- 1000
xvals <- seq(-5, 5, length = k)
myplot <- function(df){
    d <- data.frame(y = c(dnorm(xvals), dt(xvals, df)),
                    x = xvals,
                    dist = factor(rep(c("Normal", "T"), c(k,k))))
    g <- ggplot(d, aes(x = x, y = y))
    g <- g + geom_line(size = 2, aes(colour = dist))
    g
}

manipulate(myplot(mu), mu = slider(1, 20, step = 1))


# Demonstrating power -----------------------------------------------------

mu0=30
myplot <- function(sigma, mua, n, alpha) {
    g = ggplot(data.frame(mu = c(27, 36)), aes(x = mu))
    g = g + stat_function(fun = dnorm, geom = "line", args = list(mean = mu0,
        sd = sigma/sqrt(n)), size = 2, col = "red")
    g = g + stat_function(fun = dnorm, geom = "line", args = list(mean = mua,
        sd = sigma/sqrt(n)), size = 2, col = "blue")
    xitc = mu0 + qnorm(1 - alpha) * sigma/sqrt(n)
    g = g + geom_vline(xintercept = xitc, size = 3)
    g
}

manipulate(myplot(sigma, mua, n, alpha), 
           sigma = slider(1, 10, step = 1, initial = 4),
           mua = slider(30, 35, step = 1, initial = 32),
           n = slider(1, 50, step = 1, initial = 16),
           alpha = slider(0.01, 0.1, step = 0.01, initial = 0.05))

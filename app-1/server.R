mean <- 30


shinyServer(
    function(input, output) {
        
        output$powerValue <- renderPrint({input$power})
        output$xbarValue <- renderPrint({input$xbar})
        output$sdValue <- renderPrint({input$sigma})
        
        output$sample <- renderPrint({power.t.test(power = input$power,
                        delta = input$xbar - mean,
                        sd = as.numeric(input$sigma),
                        type = "one.sample",
                        alt = "one.sided")$n})
    }
)
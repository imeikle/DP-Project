shinyUI(fluidPage(
        titlePanel("Statistical Power"),
        
        sidebarLayout(
                sidebarPanel(
                        helpText("Population Mean is set at 30. Please set values 
                                 for Power, Sample Mean and Standard Deviation"),
                        
                        sliderInput("power",
                                    label= "Power:",
                                    min = 0.2, max = 1.0, value = 0.4, step = 0.1),
                        
                        numericInput("xbar",
                                     label = "Sample mean:",
                                     value = 32, min = 31, max = 40, step = 1),
                        
                        radioButtons("sigma",
                                     label = "Standard deviation:",
                                     choices = c(1,2,4,10),
                                     selected = 2)
                ),
                
                
                mainPanel(
                        h3("Sample size"),
                        p("The number of observations must be higher than:"),
                        
                        verbatimTextOutput("sample"),
                        
                        p("for the parameters specified.")
                        
                        #         textOutput("text1"),
                        #         textOutput("text2"),
                        #         textOutput("text3")
                )
        )
))
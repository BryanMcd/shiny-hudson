ui <- fluidPage(
  titlePanel("Hudson 2019 DE"),
  
  sidebarLayout(
    sidebarPanel(
      h4("DE"),
      br(),
      
      passwordInput("password", "Enter Password:", value = ""),
      actionButton("go", "Submit"),
      verbatimTextOutput("value"),
      
      br(),
      selectInput(inputId = "Gene", label = "Enter genes", 
                  choices = unique(df$gene), 
                  selected = "Anxa1", 
                  multiple = TRUE,
                  selectize = TRUE, 
                  width = NULL, 
                  size = NULL),

      
      submitButton("Update Plot")
    ),
    
    mainPanel(
      plotOutput("lfc")
    )
  )
)

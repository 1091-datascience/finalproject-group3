library(shiny)
d <- read.csv( "rawdata.csv",header=T)
variable <- read.csv( "variable.csv", header=T )
d_after  <- read.csv( "hotpotsteak.csv",header=T)
ui <- fluidPage(
  
  # app title
  titlePanel("Group 3 Data Science Final Project"),
  
  # Sidebar layout(佈局) with input and output definitions ----
  sidebarLayout(
    
    sidebarPanel(
      
      checkboxGroupInput("show_vars", "Columns in Telco Customer Churn to show:",
                         names(d), selected = names(d) ),
     
      
      
      sliderInput(inputId = "obs", label="Number of observations:", 
                  min=1, max=nrow(d), value=100)
    ),
  
  mainPanel(
    
    tabsetPanel(type="tabs",
                tabPanel( "Data",h1("Telco Customer Churn"),br(),
                                         tableOutput("Data") ),
                
                tabPanel( "Variables",h1("Variables"),br(),
                          tableOutput("Variables") ),
                
                tabPanel( "Data After Pre-Processing",h1("Data After Pre-processing"),
                          tableOutput("Data_After_PreProcessing") ),
                
                tabPanel( "EDA",h1("Exploring Data Analysis"),br(),
                          
                          h2("Churn"),
                          img(src="churn.png",height="30%",width="30%"),
                          
                          h2("Gender"),
                          img(src="gender.png",height="30%",width="30%"),
                          img(src="gender_churn.png",height="30%",width="30%"),
                          img(src="gender_nonchurn.png",height="30%",width="30%"),
                          img(src="gender_hist.png",height="35%",width="35%"),
                          
                          h2("Senior Citizen"),
                          img(src="SeniorCitizen.png",height="30%",width="30%"),
                          img(src="seniorCitizen_churn.png",height="30%",width="30%"),
                          img(src="seniorCitizen_nonchurn.png",height="30%",width="30%"),
                          img(src="seniorCitizen_hist.png",height="35%",width="35%"),
                          
                          h2("Partner"),
                          img(src="partner.png",height="30%",width="30%"),
                          img(src="partner_churn.png",height="30%",width="30%"),
                          img(src="partner_nonchurn.png",height="30%",width="30%"),
                          img(src="Partner_hist.png",height="35%",width="35%"),
                          
                          h2("Dependent"),
                          img(src="dependent.png",height="30%",width="30%"),
                          img(src="dependent.png",height="30%",width="30%"),
                          img(src="dependent.png",height="30%",width="30%"),
                          img(src="Dependents_hist.png",height="35%",width="35%"),
                          
                          h2("Tenure"),
                          img(src="tenure_1.png",height="40%",width="40%"),
                          img(src="tenure.png",height="40%",width="40%"),
                          
                          h2("PhoneService"),
                          img(src="phoneService.png",height="40%",width="40%"),
                          img(src="phoneservice_hist.png",height="40%",width="40%"),
                          
                          h2("MultipleLines"),
                          img(src="multipleLines.png",height="40%",width="40%"),
                          img(src="multiplelines_hist.png",height="40%",width="40%"),
                          
                          h2("InternetService"),
                          img(src="internetService.png",height="40%",width="40%"),
                          img(src="internetservice_hist.png",height="40%",width="40%"),
                          
                          h2("OnlineSecurity"),
                          img(src="onlineSecurity.png",height="40%",width="40%"),
                          img(src="OnlineSecurity_hist.png",height="40%",width="40%") ),
                          
                          
                tabPanel( "EDA2",h1("Exploring Data Analysis"),br(),            
                          
                          h2("OnlineBackup"),
                          img(src="onlineBackup.png",height="40%",width="40%"),
                          img(src="OnlineBackup_hist.png",height="40%",width="40%"),
                          
                          h2("DeviceProtection"),
                          img(src="deviceProtection.png",height="40%",width="40%"),
                          img(src="DeviceProtection_hist.png",height="40%",width="40%"),
                          
                          h2("techSupport"),
                          img(src="techSupport.png",height="40%",width="40%"),
                          img(src="TechSupport_hist.png",height="40%",width="40%"),
                          
                          h2("StreamingTV"),
                          img(src="streamingTV.png",height="40%",width="40%"),
                          img(src="StreamTV_hist.png",height="40%",width="40%"),
                          
                          h2("StreamingMovies"),
                          img(src="streamingMovies.png",height="40%",width="40%"),
                          img(src="StreamingMovies_hist.png",height="40%",width="40%"),
                          
                          h2("Contract"),
                          img(src="contract.png",height="40%",width="40%"),
                          img(src="Contract_hist.png",height="40%",width="40%"),
                          
                          h2("PaperlessBilling"),
                          img(src="paperlessBilling.png",height="40%",width="40%"),
                          img(src="PaperlessBilling_hist.png",height="40%",width="40%"),
                          
                          h2("PaymentMethod"),
                          img(src="paymentMethod.png",height="40%",width="40%"),
                          img(src="PaymentMethod_hist1.png",height="40%",width="40%"),
                          img(src="paymentMethod_hist2.png",height="40%",width="40%"),
                          
                          h2("Monthly Charges"),
                          img(src="monthlyCharges0.png",height="40%",width="40%"),
                          img(src="MonthlyCharges.png",height="40%",width="40%"),
                          
                          h2("TotalCharges"),
                          img(src="totalCharges.png",height="40%",width="40%"),
                          img(src="totalCharges0.png",height="40%",width="40%") ),
                          
                
                tabPanel( "Summary" ),
                
                tabPanel( "Challenges" ),
                
                tabPanel( "Reference",h1("Reference"),br(),
                          h2("Data Source"),br(),
                          
                          h2("Telco Customer Churn"),a("https://www.kaggle.com/blastchar/telco-customer-churn",
                          href="https://www.kaggle.com/blastchar/telco-customer-churn",style="font-size:20px;"),
                          
                          h2("我如何分析客戶流失預測？Kaggle比賽思路分享",br(),a("https://reurl.cc/3N1MgM",
                          href="https://reurl.cc/3N1MgM",style="font-size:20px;") ),
                          
                          h2("Shiny Data-Tables Demo",br(),a("https://shiny.rstudio.com/gallery/datatables-demo.html",
                          href="https://shiny.rstudio.com/gallery/datatables-demo.html",style="font-size:20px;") )
                          ) 
    )
  )
)
)


server <- function(input, output) {
  
  output$Data <- renderTable({
    head(d[,input$show_vars], n = input$obs)  
  })
  output$Variables <- renderTable({
    print(variable)  
  })
  output$Data_After_PreProcessing <- renderTable({
    head(d_after[,c(input$show_vars,"NumOfInternetService")], n = input$obs)
  })
  
  
}

shinyApp(ui = ui, server = server)

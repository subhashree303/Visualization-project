#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
data=read.csv("Life Expectancy Data.csv")
l2<-unique(data$Country)


ui <- dashboardPage(
  dashboardHeader(title = "Life Expectancy"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("About", tabName = "About"),
      menuItem("Distribution", tabName = "Distribution"),
      menuItem("Parameters", tabName = "Parameters"),
      menuItem("Country", tabName = "Country"),
      menuItem("Comparison", tabName="Comparison"),
      menuItem("Conclusion", tabName = "Conclusion")
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "About",
              h2("Life Expectancy"),
              br(),
              h3("Introduction"),
              br(),
              h4(
              p("The term life expectancy refers to the number of years a person can expect to live. By definition, life expectancy is based on an estimate of the average age that members of a particular population group will be when they die."),
              p("Everyone has their expiration date on this planet. After this day, they are buried six feet deep under the earth to decay. Humans die as a result of multiple causes such as accidents, diseases, war and other forms of death.
              
              
              One interesting trend is how people’s dying age varies across different countries. In some countries the average dying age is about 50 years while in some others it is as high as 85.

The reason behind this massive difference stems from the fact that some countries have built a system that is designed to prevent any case of death apart from natural/unexpected death. They go the extra mile to construct bridges and roads to prevent accidents and they use some of the most advanced medicinal tools available to mankind.

While these countries are putting massive efforts into prolonging its citizens’ life expectancy, countries with lower life expectancy do not have enough resources to keep its people alive in the long-term.

So, in this project we shall find out what factors heavily define life expectancy."),
              br(),
              
              tags$img(src='lifeimage1.png',width="1000px", align = "centre"),
              br(),
              br(),
              strong(h3("Data Description")),
              br(),
              p("The data-set related to life expectancy, health factors for 193 countries has been collected from the  WHO data repository website and its corresponding economic data was collected from United Nation website. Among all categories of health-related factors only those critical factors were chosen which are more representative. It has been observed that in the past 15 years , there has been a huge development in health sector resulting in improvement of human mortality rates especially in the developing nations in comparison to the past 30 years. Therefore, in this project we have considered data from year 2000-2015 for 193 countries for further analysis.
The final dataset consists of 22 Columns and 2938 rows which meant 20 predicting variables. All predicting variables was then divided into several broad categories:Immunization related factors, Mortality factors, Economical factors and Social factors."),
              br(),
              br(),
              p("Some predicting variables are:"),
              br(),br(),
              strong("Mortality factors:"),
              br(),
              br(),
              p("Adult Mortality Rates of both sexes -probability of dying between 15 and 60 years per 1000 population"),
              p("Infant deaths-Number of Infant Deaths per 1000 population"),
p("Measles - number of reported cases per 1000 population"),
p("under-five deaths- Number of under-five deaths per 1000 population"),

              br(),
              strong("Social factors-"),
              br(),
              br(),
                
              p("Alcohol-Alcohol consumption recorded per capita (15+) (in litres of pure alcohol)"),
             p("Schooling-Number of years of Schooling(years)"),
             br(),
              strong("Economical factors-"),
              br(),
              br(),
              p("Percentage expenditure-Expenditure on health as a percentage of Gross Domestic Product per capita(%)"),
              p("Total expenditure-General government expenditure on health as a percentage of total government expenditure (%)"),
              p("GDP- Gross Domestic Product per capita (in USD)"),
              p("Income composition of resources- Human Development Index in terms of income composition of resources (index ranging from 0 to 1)"),
              br(),
              strong("Immunization related factors-"),
              br(),
              br(),
              p("Hepatitis B -Hepatitis B (HepB) immunization coverage among 1-year-olds (%)"),
              p("Polio- Polio (Pol3) immunization coverage among 1-year-olds (%)"),
              p("Diphtheria -Diphtheria tetanus toxoid and pertussis (DTP3) immunization coverage among 1-year-olds (%)"),
              br(),
              br(),
              p("The data used in this study is taken from kaggle.The link to the original data is:"),
              tags$a(href="https://www.kaggle.com/datasets/kumarajarshi/life-expectancy-who","https://www.kaggle.com/datasets/kumarajarshi/life-expectancy-who"),
              br(),
              br(),
              strong(h3("Objective")),
              br(),
              p("
                The data-set aims to answer the following key questions:"),
                br(),
               p(" 1.How does Infant and Adult mortality rates affect life expectancy?"),

p("2.What is the impact of schooling on the lifespan of humans?"),

               p(" 3.Does Life Expectancy have positive or negative relationship with drinking alcohol?"),

    p(" 4.What is the impact of Immunization coverage on life Expectancy?"),

               p(" 5.Should a country having a lower life expectancy value(<65) increase its healthcare expenditure in order to improve its average lifespan?"),

        p("   The dataset also aims to make an attempt to observe the life expectancy among various countries over the years 2000-2015 and to study its relationship with social,economical and health related factors."),
              )
              
              
      ),
tabItem(tabName = "Distribution",
        h3("Distribution of life expectancy according to age"),
        br(),
        br(),
        plotOutput("plot100")
        ),
      tabItem(tabName = "Country",
              h3("Time series plot of the life expectancies of the country"),
              sidebarLayout(
                sidebarPanel(
                  selectInput("country", "Choose a country:",
                              choices =l2),
                  actionButton("update", "Update View")
                  
              ),
              mainPanel(plotOutput("plot1")))),
      
      
      tabItem(tabName = "Parameters",
              tabsetPanel(type = "tabs",
                          tabPanel("Mortality factors", 
                                   fluidPage( fluidRow(
                                     
                                     column(6,selectInput("choice20", "Choose an mortality related factor:",
                                                          choices = c("Adult.Mortality", "infant.deaths", "Measles","under.five.deaths"))
                                            #actionButton("update2", "Update View")
                                     )),fluidRow(
                                       column(12,plotOutput("plot30"))),fluidRow(
                                         column(6,plotOutput("plot16")),column(6,plotOutput("plot17")))  )),
                          tabPanel("Social factors", 
                                   fluidPage( fluidRow(
                                     
                                     column(6,selectInput("choice2", "Choose a social factor:",
                                                          choices = c("Alcohol","Schooling"))
                                            #actionButton("update3", "Update View")
                                     )),fluidRow(
                                       column(12,plotOutput("plot4"))),fluidRow(
                                       column(6,plotOutput("plot14")),column(6,plotOutput("plot15")))) ),
                          tabPanel("Economical factors",
                                   fluidPage( fluidRow(
                                     
                                     column(6,selectInput("choice11", "Choose an economical factor:",
                                                          choices =c("percentage.expenditure","Total.expenditure","GDP","Income.composition.of.resources" ))))
                                            #actionButton("update4", "Update View"))
                                     ,fluidRow(
                                              column(12,plotOutput("plot6"))),fluidRow(
                                                column(6,plotOutput("plot12")),column(6,plotOutput("plot13")))
                                     )),
                          tabPanel("Immunization related factors",
                                    fluidPage( fluidRow(
               
                                       column(6,selectInput("choice10", "Choose an immunization related factor:",
                                                            choices = c("Hepatitis.B","Polio","Diphtheria" ))
                                              #actionButton("update5", "Update View")
                                              )),fluidRow(
                                       column(12,plotOutput("plot5"),fluidRow(
                                         column(6,plotOutput("plot10")),column(6,plotOutput("plot11")))
                                   ))
              
      )
      
  ),
  

  tabPanel("Status of the country",
           fluidPage( fluidRow(
             br(),
             br(),
             
             h3(column(7,plotOutput("box")  )))
           )),
 
    
                         
  
  

          
  
  
      )
  ),
tabItem(tabName = "Comparison",
        h3("Comparison of the life expectancies of the countries in the chosen year"),
        
        fluidPage( fluidRow(
          
          column(6,selectInput("country1", "Choose country 1:",
                               choices =l2))),
          fluidRow(
            
            column(6,selectInput("country2", "Choose country 2:",
                                 choices =l2))),
          fluidRow(
            
            column(6,selectInput("country3", "Choose country 3:",
                                 choices =l2))),
          fluidRow(
            
            column(6,selectInput("country4", "Choose country 4:",
                                 choices =l2))),
          fluidRow(
            
            column(6,selectInput("country5", "Choose country 5:",
                                 choices =l2))),
          fluidRow(
            
            column(6,selectInput("year", "Choose Year:",
                                 choices =seq(2000,2015,length=16)))),
          actionButton("update10", "Update View"))
        ,
          fluidRow(column(10,plotOutput("histo2")))
          ),
tabItem(tabName = "Conclusion",
        h2("Conclusion"),
        br(),
        br(),
        
        h4(p("1.  The life expectancy is high between the age of 70 to 75 all over the world."),
           br(),
           
        p("2.  Developing countries have low life expectancy and the developed countries have high life expectancy all over the world.We can observe that the median life expectancy for the developing coutries is near 70 and in the developed countries the median life expectancy is near 80."),
        br(),
        
        p("3.   Recent years have a higher life expectancy among all the countries in the world.The relationship can be explained by the evolution of technlolgy, healthcare and medicine."),
        br(),
        
p("4.  The more educated or schooled the country , the higher the life expectancy.It is observed that the life expectancy has a strong positive relationship with the number of years of schooling in both developed and developing countries."),
        br(),
        p("5.  The more the infant deaths,the lower the  life expectancy. e.g India had 1800 infant death in year 2000 and the life expectancy rate in year 2000 was 62.5 on other hand in 2015 infant death decreases to 910 and life expectancy increases to 68.3. So life expectancy is directly propotional to the death of the infant per year.Same is the relation in case of adult mortality as well."),
        br(),
        p("6.  We observe an interesting situation with respect to expenditure on health. We see that if the average life of a country is less that 65, then the effect of increasing the expenditure on health shows no relation, however, if the average age is between 65 to 85, then the avergae spending plays a tremendous part .
So, countries with average life expectance above 65 should spend more in order to improve the average lifespan."),
br(),
p("7.  We also obsserve that there is a positive relation between Immunization coverage against Polio and Diptheria and life Expectancy."),
br(),
p("8.  Alcohol has an ambiguous relationship with life expectancy in developed and developing countries, but this relationship is weak.We can observe that the relationship is positive in developing and negative in developed countries. This shows a weak relationship. So it's difficult to assume that this variable affects life expectancy."),
br(),
p("9.  The higher the income composition of resources the higher the life expectancy which means that if a country utilizes its resources productively,it is more likely to see
  its citizens live longer than expected."))
        
  
        
))))

  
  
      
    
  


server <- function(input, output){
  library(ggplot2)
  library(gridExtra)
  library(dplyr)

  observeEvent(input$update,
  output$plot1<-renderPlot({
    o<-isolate(subset(data, !is.na(Life.expectancy)&Country==input$country))
    ggplot(o,aes(Year,Life.expectancy),na.rm=TRUE)+geom_line(color='blue')+ggtitle("Time series plot of life expectancy (2000-2015)")
  }))
  
    output$plot5<-renderPlot({
     
      y<-data[[input$choice10]]
      
      x<-data$Life.expectancy
      status<-data$Status
      
     df<-data.frame(y,x,status)
     
    t<-subset(df,!is.na(y)&!is.na(x)&!is.na(status))
     
     ggplot(t,aes(y,x))+geom_point(aes(color=status))+ggtitle(paste("life expectancy vs ",input$choice10))+labs(y="Life expectancy in years ",x=paste(input$choice10))
     
     })
    
    output$plot10<-renderPlot({
      
      y1<-data[[input$choice10]]
      x1<-data$Life.expectancy
      z1<-data$Status
      df1<-data.frame(y1,x1,z1)
      
      t1<-subset(df1,!is.na(y1)&!is.na(x1)&z1=="Developed")
     
      ggplot(t1,aes(y1,x1))+geom_point(color='coral 2')+ggtitle("In developed countries")+labs(y="Life expectancy in years ",x=paste(input$choice10))
      
    })
    
    output$plot11<-renderPlot({
      
      y2<-data[[input$choice10]]
      x2<-data$Life.expectancy
      z2<-data$Status
      df2<-data.frame(y2,x2,z2)
      
      t2<-subset(df2,!is.na(y2)&!is.na(x2)&z2=="Developing")
      
      ggplot(t2,aes(y2,x2))+geom_point(color='darkturquoise')+ggtitle("In developing countries")+labs(y="Life expectancy in years ",x=paste(input$choice10))
      
    })
  
    output$plot6<-renderPlot({
      
      y3<-data[[input$choice11]]
      
      x3<-data$Life.expectancy
      status<-data$Status
      df3<-data.frame(y3,x3,status)
      
      t3<-subset(df3,!is.na(y3)&!is.na(x3)&!is.na(status))
      
      ggplot(t3,aes(x3,y3))+geom_point(aes(color=status))+ggtitle(paste("life expectancy vs ",input$choice11))+labs(x="Life expectancy in years ",y=paste(input$choice11))
      
    })
    
    output$plot12<-renderPlot({
      
      y1<-data[[input$choice11]]
      x1<-data$Life.expectancy
      z1<-data$Status
      df1<-data.frame(y1,x1,z1)
      
      t1<-subset(df1,!is.na(y1)&!is.na(x1)&z1=="Developed")
      
      ggplot(t1,aes(x1,y1))+geom_point(color='coral 2')+ggtitle("In developed countries")+labs(x="Life expectancy in years ",y=paste(input$choice11))
      
    })
    
    output$plot13<-renderPlot({
      
      y2<-data[[input$choice11]]
      x2<-data$Life.expectancy
      z2<-data$Status
      df2<-data.frame(y2,x2,z2)
      
      t2<-subset(df2,!is.na(y2)&!is.na(x2)&z2=="Developing")
      
      ggplot(t2,aes(x2,y2))+geom_point(color='darkturquoise')+ggtitle("In developing countries")+labs(x="Life expectancy in years ",y=paste(input$choice11))
      
    })
    
    output$plot4<-renderPlot({
      
      y3<-data[[input$choice2]]
      
      x3<-data$Life.expectancy
      status<-data$Status
      df3<-data.frame(y3,x3,status)
      
      t3<-subset(df3,!is.na(y3)&!is.na(x3)&!is.na(status))
      
      ggplot(t3,aes(y3,x3))+geom_point(aes(color=status))+ggtitle(paste("life expectancy vs ",input$choice2))+labs(y="Life expectancy in years ",x=paste(input$choice2))
      
    })
    
    output$plot14<-renderPlot({
      
      y1<-data[[input$choice2]]
      x1<-data$Life.expectancy
      z1<-data$Status
      df1<-data.frame(y1,x1,z1)
      
      t1<-subset(df1,!is.na(y1)&!is.na(x1)&z1=="Developed")
      
      ggplot(t1,aes(y1,x1))+geom_point(color='coral 2')+ggtitle("In developed countries")+labs(y="Life expectancy in years ",x=paste(input$choice2))
      
    })
    
    output$plot15<-renderPlot({
      
      y2<-data[[input$choice2]]
      x2<-data$Life.expectancy
      z2<-data$Status
      df2<-data.frame(y2,x2,z2)
      
      t2<-subset(df2,!is.na(y2)&!is.na(x2)&z2=="Developing")
      
      ggplot(t2,aes(y2,x2))+geom_point(color='darkturquoise')+ggtitle("In developing countries")+labs(y="Life expectancy in years ",x=paste(input$choice2))
      
    })
    
    output$plot30<-renderPlot({
      
      y4<-data[[input$choice20]]
      
      x4<-data$Life.expectancy
      status<-data$Status
      df4<-data.frame(y4,x4,status)
      
      t4<-subset(df4,!is.na(y4)&!is.na(x4)&!is.na(status))
      
      ggplot(t4,aes(y4,x4))+geom_point(aes(color=status))+ggtitle(paste("life expectancy vs ",input$choice20))+labs(y="Life expectancy in years ",x=paste(input$choice20))
      
    })
    
    output$plot16<-renderPlot({
      
      y1<-data[[input$choice20]]
      x1<-data$Life.expectancy
      z1<-data$Status
      df1<-data.frame(y1,x1,z1)
      
      t1<-subset(df1,!is.na(y1)&!is.na(x1)&z1=="Developed")
      
      ggplot(t1,aes(y1,x1))+geom_point(color='coral 2')+ggtitle("In developed countries")+labs(y="Life expectancy in years ",x=paste(input$choice20))
      
    })
    
    output$plot17<-renderPlot({
      
      y2<-data[[input$choice20]]
      x2<-data$Life.expectancy
      z2<-data$Status
      df2<-data.frame(y2,x2,z2)
      
      t2<-subset(df2,!is.na(y2)&!is.na(x2)&z2=="Developing")
      
      ggplot(t2,aes(y2,x2))+geom_point(color='darkturquoise')+ggtitle("In developing countries")+labs(y="Life expectancy in years ",x=paste(input$choice20))
      
    })
    
    output$plot100<-renderPlot({
      
      ggplot(subset(data, !is.na(Life.expectancy)),aes(x=Life.expectancy))+geom_histogram(color="black",fill="light green",binwidth=2)
    })
    
    output$box<-renderPlot({
      ggplot(subset(data, !is.na(Life.expectancy)) ,aes(x= Status,y=Life.expectancy, fill= Status)) + 
        geom_boxplot() +
        ggtitle("Life expectancy per country Status")+
        theme(text = element_text(size = 11))+
        scale_fill_brewer(palette="Set1")
       })
    observeEvent(input$update10,
   output$histo2<-renderPlot({
  h<-isolate(c(input$country1,input$country2,input$country3,input$country4,input$country5)  )
  o1<-isolate(subset(data, !is.na(Life.expectancy)&(Year==input$year)&(Country%in% h)))
isolate(o1%>%ggplot(aes(Country, Life.expectancy,fill=Status))+ geom_bar(stat="identity",color="black")+ggtitle(paste("Bar graph of life expectancies of the countries in the year ",input$year))+scale_fill_manual("Status", values = c("Developing" = "orange", "Developed" = "light green")))
        }))
      
  }
  
  


shinyApp(ui, server)


library(shiny)
library(plotly)
data(gapminder, package = 'gapminder')
shinyApp(
    
    ui = fluidPage(
        selectInput(
            "country", "Country:", 
            choices = filter(gapminder, continent == 'Europe')$country,
            multiple = TRUE
        ),
        plotlyOutput("gdp_plot")
    ),
    
    server = function(input, output) {
        european_countries <- filter(gapminder, continent == 'Europe') %>%
            group_by(country) %>%
            plot_ly(x = ~year, y = ~gdpPercap) %>% 
            add_lines(alpha = 0.2, name = "European Countries", hoverinfo = "none")
        
        layer_country <- function(plot, name) {
            plot %>% filter(country == name) %>% add_lines(name = name)
        }
        
        output$gdp_plot <- renderPlotly({
            for (c in input$country) {
                european_countries <- european_countries %>% add_fun(layer_country, c)
            }
            layout(european_countries, hovermode = 'x')
        })
    }
)

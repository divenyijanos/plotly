Plotly
========================================================
author: Divényi János
date: 2017-10-04
autosize: true




ggplot
======


```r
gapminder %>% filter(country == 'Hungary') %>%
    ggplot(aes(x = year, y = gdpPercap)) + geom_line()
```

![plot of chunk unnamed-chunk-1](plotly-figure/unnamed-chunk-1-1.png)

ggplotly
========















```
Error in file(con, "rb") : cannot open the connection
```

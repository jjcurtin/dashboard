# plotting_functions.R
library(ggplot2)
library(scales)
library(stringr)
library(plotly)

create_ts_plot <- function(data, var, var_label, units = "") {
  # Create base ggplot
  p <- ggplot(data, aes(x = date, y = .data[[var]])) +
    geom_line(color = "steelblue", size = 1) +
    labs(
      title = str_glue("Time Series of {var_label}"),
      x = "Year",
      y = str_glue("{var_label} ({units})")
    ) +
    scale_y_continuous(labels = comma) +
    theme_bw() +
    theme(plot.title = element_text(hjust = 0.5))
  
  # Convert to plotly and add hover template
  fig <- ggplotly(p)
  
  # Update layout to format hover date
  fig %>% 
    layout(
      hoverlabel = list(bgcolor = "white"),
      xaxis = list(hoverformat = "%b %Y")
    )
}
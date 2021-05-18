data <- read.csv("data/polarization.csv")

library(tidyverse)

house_data <- data[which(data$chamber == "House"), ]

house_data %>% 
  plot(
    ((rep.mean.d1+dem.mean.d1)/2) ~ year,
    data = . ,
    main = "Polarization in the house of representatives ",
    sub  = "(Source: datasets::voteview_polarization_data)",
    ylab = "Ideological Spectrum (+ indicates conservative, - indicates liberal)",
    type = "l",
    col = rgb(0.5, 0.2, 0.5),
    ylim=range(c(-0.6, 0.6))
  )

par(new = TRUE)

house_data %>% 
  plot(
    rep.mean.d1 ~ year,
    data = . ,
    axes = F,
    ylab = "",
    xlab = "",
    type = "l",
    col = rgb(0.85, 0.25, 0.15),
    ylim=range(c(-0.6, 0.6))
  )

par(new = TRUE)

house_data %>% 
  plot(
    dem.mean.d1 ~ year,
    data = . ,
    axes = F,
    ylab = "",
    xlab = "",
    type = "l",
    col = rgb(0.15, 0.25, 0.85),
    ylim=range(c(-0.6, 0.6))
  )


legend(
    "topleft", 
    title="Party",
    c("Net Polarization","Republican","Democrat"), 
    fill=c(rgb(0.5, 0.2, 0.5), rgb(0.85, 0.25, 0.15), rgb(0.15, 0.25, 0.85)), 
    horiz=TRUE,
    x.intersp = 0.4
)

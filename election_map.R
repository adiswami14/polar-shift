library(tidyverse)
library(plotly)

voting_data <- read.csv("data/voting.csv")

simplified_data <- voting_data[which(voting_data$party_simplified == "DEMOCRAT" | voting_data$party_simplified == "REPUBLICAN"), ]

simplified_data <- simplified_data[order(-simplified_data$candidatevotes), ]

simplified_data <- simplified_data %>% mutate(winner = if_else(party_simplified == "DEMOCRAT", (candidatevotes/totalvotes), -1*candidatevotes/totalvotes))

simplified_data$hover <- simplified_data %>% with(
  paste(
    "Winner:", 
    candidate, 
    "<br>",
    "Party: ",
    party_detailed, 
    "<br>", 
    "Percentage Won: ",
    abs(winner)*100,
    "%"
  )
)

l <- list(color = toRGB("black"), width = 2)

g <- list(
  scope = 'usa',
  projection = list(type = 'albers usa'),
  showlakes = F
)

fig <- simplified_data %>% 
  plot_geo(
    locationmode = "USA-states",
    showscale = F
  )

fig <- fig %>% add_trace(
  z = ~ if_else(winner < 0, -(1+winner), (1-winner)),
  text = ~ hover,
  hoverinfo = "text",
  locations =  ~ state_po,
  frame = ~ year,
  color = "Red"
  )

fig <- fig %>% hide_colorbar()

fig <- fig %>% layout(
    title = "Presidential Election Results by State Over Time<br>(Hover for breakdown)",
    geo = g,
    xaxis = list(
      type = "log"
    )
  )

fig
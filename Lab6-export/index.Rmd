---
title: "Christine A Doyle, MD, CHCI, FASA"
output: html_document
date: "2025-05-07"
---

I'm an anesthesiologist and critical care specialist. This means that I can put you to sleep and wake you up, and keep you alive in between. I am also an informaticist, and spend a lot of time working on hospital computers. Like many of us, I have a rather eclectic group of interests, some of which are indicated on the other pages.


Here is a graph that I did for Data Visualization class, showing the number of paintings that are portrait vs square vs landscape at MOMA.

```{r,echo=FALSE,message=FALSE,warning=FALSE}
install.packages("blogdown")
library(tidyverse)
library(ggthemes)

```

```{r MOMA data, echo=FALSE, message=FALSE, warning=FALSE}
moma.data <- read.csv("data/artworks-cleaned.csv")

moma_size <- moma.data %>%  filter(height_cm < 600, width_cm < 760)
moma_size <- moma_size %>% mutate(size_ratio = width_cm / height_cm, 
                                  color_cat = case_when(
                                    size_ratio > 1 ~ "landscape",
                                    size_ratio < 1 ~ "portrait",
                                    size_ratio == 1 ~ "square"
                                  ))
ggplot(moma_size, aes(x=width_cm, y=height_cm, colour = color_cat)) +
  geom_point(alpha=0.5) +
  ggtitle("MoMA Paintings, Tall and Wide") +
  scale_colour_manual(name = "",
                      values = c("#5d98ca", "#55b244", "#ffca35")) +   #note that the colors are used in the order that matches the case order
  theme_fivethirtyeight() +
  theme(axis.title = element_text()) +
  labs(x= "Width (in cm)", y="Height (in cm)") +
  annotate(x=100, y=400, geom = "text",
                label = "Portrait", color = "#55b244",
                size = 5, family = "Lato", hjust=1, fontface =2) +  #note that you have to sort of guess where you want the text to fall
  annotate(x=600, y=100, geom="text",
                label = "Landscape", color = "#5d98ca",
                size = 5, family = "Lato", hjust=1, fontface=2)

```



Other pages on this site:

- [More About Me](./a_second_page.html)
- [References](./third_page.html)

```{r Install a Theme}


```
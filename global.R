library(shiny)
library(readr)
library(tidyverse)
library(DT)
library(rsconnect)
library(renv)

set.seed(1)
  calculate_sex <- function() {
    calculate <- runif(1)
    if (calculate < 0.1) {
      return("LGBTQ")
    } else {
      return("HETERO")
    }
  }

  calculate_lgbtq <- function(){
    calculate <- runif(1)
    if (calculate <= 0.5) {
      return("BI OR ANY")
    } else {
      return("HOMOSEX")
    }
  }
  

  calculate_relationships <- function() {
    calculate <- runif(1)
    if ((calculate >= 0) & (calculate <= 0.25)) {
      return("ONE PARTNERS")
    } else if ((calculate > 0.25) & (calculate <= 0.5)) {
      return("TWO PARTNERS")
    } else {
      return("NO PARTNERS")
    }
  }
  

calculate_kids_norel <- function() {
  calculate <- runif(1)
  if ((calculate >= 0) & (calculate <= 0.2)) {
    return("ONE KID")
  } else if ((calculate > 0.2) & (calculate < 0.4)) {
    return("TWO KIDS")
  } else {
    return("NO KIDS")
  }
}

calculate_rel_gender <- function(){
  calculate <- runif(1)
  if (calculate <= 0.5) {
    return("M")
  } else {
    return("F")
  }
}

calculate_rel_marry <- function(){
  calculate <- runif(1)
  if (calculate <= 0.5) {
    return("MARRY")
  } else {
    return("NO MARRY")
  }
}

death_or_divorce <- function(){
  calculate <- runif(1)
  if (calculate < 0.1) {
    return("DEATH")
  } else {
    return("DIVORCE")
  }
}
  
calculate_kids_rel <- function() {
  calculate <- runif(1)
  if ((calculate >= 0) & (calculate <= (1/3))) {
    return("NO KIDS")
  } else if ((calculate > (1/3)) & (calculate <= (2/3))) {
    return("ONE KID")
  } else {
    return("TWO KIDS")
  }
}

calculate_adoption <- function() {
  calculate <- runif(1)
  if (calculate <= 0.02) {
    return("ADOPT")
  } else {
    return("BIRTH")
  }
}

# hacky solution to put sidebar panel text outside of the form, thanks stackoverflow

sidebarPanel2 <- function (..., out = NULL, width = 4) 
{
  div(class = paste0("col-sm-", width), 
      tags$form(class = "well", ...),
      out
  )
}

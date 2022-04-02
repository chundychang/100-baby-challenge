library(shiny)
library(readr)
library(tidyverse)
library(DT)
library(rsconnect)
library(renv)
library(writexl)

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

child_asp <- c("Rambunctious Scamp", "Whiz Kid", "Artistic Prodigy", "Social Butterfly")
result_1 <- sample(child_asp, 95, replace = T)
result_1 <- as.data.frame(result_1)


adult_asp <- adult_asp <- c("Friend of the Animals", "Extreme Sports Enthusiast", "Body Builder", "Painter Extraordinaire", "Lord/Lady of the Knits", "Master Maker", "Musical Genius", "Bestselling Author", "Master Actor", "Public Enemy", "Chief of Mischief", "Villainous Valentine", "Vampire Family", "Successful Lineage", "Big Happy Family", "Super Parent", "Master Chef", "Master Mixologist", "Fabulously Wealthy", "Mansion Baron", "Academic", "Spellcraft & Sorcery", "Archaeology Scholar", "Renaissance Sim", "Nerd Brain", "Computer Whiz", "Master Vampire", "Perfectly Pristine", "Beach Life", "StrangerVille Mystery", "Mt Komorebi Sightseer", "Fabulously Filthy", "Soulmate", "Serial Romantic", "Eco Innovator", "Jungle Explorer", "Country Caretaker", "Outdoor Enthusiast", "Purveyor of Potions", "Freelance Botanist", "The Curator", "The Angling Ace", "Joke Star", "Party Animal", "Friend to the World", "City Native", "Good Vampire", "Neighborhood Confidante", "World-Famous Celebrity", "Leader of the Pack", "Hope VS Order", "Galactic Privateer", "Self Care Specialist", "Inner Peace", "Zen Guru")
result_2 <- sample(adult_asp, 96, replace = T)
result_2 <- as.data.frame(result_2)

career <- career <- c("Unemployed", "Actor/Actress", "Detective", "Doctor", "Interior Decorator", "Scientist", "Astronaut", "Athlete", "Business", "Civil Designer", "Conservationist", "Criminal", "Critic", "Culinary", "Entertainer", "Education", "Engineer", "Freelancer", "Gardener", "Law", "Military", "Painter", "Politician", "Salaryperson", "Secret Agent", "Social Media", "Style Influencer", "Tech Guru", "Writer", "Babysitter", "Barista", "Diver", "Fast Food Employee", "Fisherman", "Lifeguard", "Manual Laborer", "Retail Employee")
result_3 <- sample(career, 98, replace=T)
result_3 <- as.data.frame(result_3)

sex <- c("LGBTQ", "HETERO")
sexuality <- sample(sex, size = 98, prob=c(0.1, 0.9), replace=TRUE)
result_4 <- as.data.frame(sexuality)

lgbtq <- c("Bi/Pansexual", "Same Sex")
result_5 <- sample(lgbtq, size=13, prob=c(0.5, 0.5), replace=TRUE)
result_5 <- as.data.frame(result_5)

partner <- c("One Partner", "Two Partners", "No Partners")
result_6 <- sample(partner, size=98, prob=c(0.25, 0.25, 0.5), replace=TRUE)
result_6 <- as.data.frame(result_6)

kids_no_rel <- c("One Kids", "Two Kids", "No Kids")
result_7 <- sample(kids_no_rel, size=46, prob=c(0.2, 0.2, 0.6), replace=TRUE)
result_7 <- as.data.frame(result_7)

kids_no_rel_how <- c("Wedlock", "Adoption")
result_8 <- sample(kids_no_rel_how, size=20, prob=c(0.98, 0.02), replace=TRUE)
result_8 <- as.data.frame(result_8)

lgbtq_partner_1 <- c("M", "F")
result_9 <- sample(lgbtq_partner_1, size=5, prob=c(0.5, 0.5), replace=TRUE)
result_9 <- as.data.frame(result_9)

result_10 <- sample(lgbtq_partner_1, size=2, prob=c(0.5, 0.5), replace=TRUE)
result_10 <- as.data.frame(result_10)

partner_marry <- c("Married", "Not Married")
partner_1_marry <- sample(partner_marry, size=53, prob=c(0.5, 0.5), replace=TRUE)
partner_1_marry <- as.data.frame(partner_1_marry)
partner_2_marry <- sample(partner_marry, size=27, prob=c(0.5, 0.5), replace=TRUE)
partner_2_marry <- as.data.frame(partner_2_marry)

death_divorce <- c("Separation", "Death")
result_11 <- sample(death_divorce, size=26, prob=c(0.9, 0.1), replace=TRUE)
result_11 <- as.data.frame(result_11)

partner_kids <- c("No Kids", "One Kid", "Two Kids")
partner_1_kids <- sample(partner_kids, size=53, prob=c((1/3), (1/3), (1/3)), replace=TRUE)
partner_1_kids <- as.data.frame(partner_1_kids)
partner_2_kids <- sample(partner_kids, size=26, prob=c((1/3), (1/3), (1/3)), replace=TRUE)
partner_2_kids <- as.data.frame(partner_2_kids)

kid_origin <- c("Birth", "Adoption")
kid_1_origin <- sample(kid_origin, size=37, prob=c(0.98, 0.02), replace=TRUE)
kid_1_origin <- as.data.frame(kid_1_origin)
kid_2_origin <- sample(kid_origin, size=17, prob=c(0.98, 0.02), replace=TRUE)
kid_2_origin <- as.data.frame(kid_2_origin)
kid_3_origin <- sample(kid_origin, size=20, prob=c(0.98, 0.02), replace=TRUE)
kid_3_origin <- as.data.frame(kid_3_origin)
kid_4_origin <- sample(kid_origin, size=11, prob=c(0.98, 0.02), replace=TRUE)
kid_4_origin <- as.data.frame(kid_4_origin)

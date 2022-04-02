server <- function(input, output) {
  
# Child Aspiration
    random_child_asp <- eventReactive(input$do, {  
        child_asp <- c("Rambunctious Scamp", "Whiz Kid", "Artistic Prodigy", "Social Butterfly")
        sample(child_asp, 1, replace = T)
        
    })
    output$child_aspiration <- renderTable({
        name <- input$text
        aspiration_child <- random_child_asp()
        df <- data.frame(name, aspiration_child)
    }, rownames = FALSE, colnames = TRUE)

# Adult Aspiration
    random_adult_asp <- eventReactive(input$do1, {  
                adult_asp <- c("Friend of the Animals", "Extreme Sports Enthusiast", "Body Builder", "Painter Extraordinaire", "Lord/Lady of the Knits", "Master Maker", "Musical Genius", "Bestselling Author", "Master Actor", "Public Enemy", "Chief of Mischief", "Villainous Valentine", "Vampire Family", "Successful Lineage", "Big Happy Family", "Super Parent", "Master Chef", "Master Mixologist", "Fabulously Wealthy", "Mansion Baron", "Academic", "Spellcraft & Sorcery", "Archaeology Scholar", "Renaissance Sim", "Nerd Brain", "Computer Whiz", "Master Vampire", "Perfectly Pristine", "Beach Life", "StrangerVille Mystery", "Mt Komorebi Sightseer", "Fabulously Filthy", "Soulmate", "Serial Romantic", "Eco Innovator", "Jungle Explorer", "Country Caretaker", "Outdoor Enthusiast", "Purveyor of Potions", "Freelance Botanist", "The Curator", "The Angling Ace", "Joke Star", "Party Animal", "Friend to the World", "City Native", "Good Vampire", "Neighborhood Confidante", "World-Famous Celebrity", "Leader of the Pack", "Hope VS Order", "Galactic Privateer", "Self Care Specialist", "Inner Peace", "Zen Guru")
        sample(adult_asp, 1, replace = T)
    })
    output$adult_aspiration <- renderTable({
        name <- input$text1
        aspiration_adult <- random_adult_asp()
        df <- data.frame(name, aspiration_adult)
    }, rownames = FALSE, colnames = TRUE)

# Relationships and Children
    # Sexuality
    random_sexuality <- eventReactive(input$do2, {
        result <- calculate_sex()
    })
    output$sexuality <- renderTable({
        name <- input$text2
        assigned_sexuality <- random_sexuality()
        df <- data.frame(name, assigned_sexuality)
    }, rownames = FALSE, colnames = TRUE)
    
    # LGBTQ
    random_lgbtq <- eventReactive(input$do3, {
      result <- calculate_lgbtq()  
    })
    output$lgbtq <- renderTable({
        name <- input$text2
        assigned_lgbtq <- random_lgbtq()
        df <- data.frame(name, assigned_lgbtq)
    }, rownames = FALSE, colnames = TRUE)
    
    # Relationships
    random_relationships <- eventReactive(input$do4, {
        result <- calculate_relationships()  
    })
    output$relationships <- renderTable({
        name <- input$text2
        relationship_status <- random_relationships()
        df <- data.frame(name, relationship_status)
    }, rownames = FALSE, colnames = TRUE)
    
    # Kids if no relationships
    random_kids_norel <- eventReactive(input$do5, {
        result <- calculate_kids_norel()
    })
    output$kids_if_no_rel <- renderTable({
        name <- input$text2
        kids <- random_kids_norel()
        df <- data.frame(name, kids)
    }, rownames = FALSE,colnames = TRUE)
    
    # Partner Genders
    random_partner_1_gender <- eventReactive(input$do6, {
      result <- calculate_rel_gender()  
    })
    random_partner_2_gender <- eventReactive(input$do6, {
        result <- calculate_rel_gender()
    })
    output$partner_gender <- renderTable({
        name <- input$text2
        partners <- c("Partner 1", "Partner 2")
        genders <- c(random_partner_1_gender(), random_partner_2_gender())
        df <- data.frame(name, partners, genders)
    }, rownames = FALSE, colnames = TRUE)
    
    # Marriage
    partner_1_marriage <- eventReactive(input$do7, {
        result <- calculate_rel_marry()
    })
    partner_2_marriage <- eventReactive(input$do7, {
        result <- calculate_rel_marry()
    })
    output$marriage <- renderTable({
      name <- input$text2  
      partners <- c("Partner 1", "Partner 2")
        genders <- c(partner_1_marriage(), partner_2_marriage())
        df <- data.frame(name, partners, genders)
    }, rownames = FALSE, colnames = TRUE)
    
    # Death or Divorce
    partner_1_outcome <- eventReactive(input$do8, {
        result <- death_or_divorce()
    })
    output$leaving_partner_1 <- renderPrint({
     print(partner_1_outcome())   
    })
    
    # Kids if relationship
    partner_1_kids <- eventReactive(input$do9, {
        result <- calculate_kids_rel()
    })
    partner_2_kids <- eventReactive(input$do9, {
        result <- calculate_kids_rel()
    })
    output$kids_per_partner <- renderTable({
        name <- input$text2
        partners <- c("Partner 1", "Partner 2")
        kids <- c(partner_1_kids(), partner_2_kids())
        df <- data.frame(name, partners, kids)
    })
    
    # Career
    random_career <- eventReactive(input$do10, {
        career <- c("Unemployed", "Actor/Actress", "Detective", "Doctor", "Interior Decorator", "Scientist", "Astronaut", "Athlete", "Business", "Civil Designer", "Conservationist", "Criminal", "Critic", "Culinary", "Entertainer", "Education", "Engineer", "Freelancer", "Gardener", "Law", "Military", "Painter", "Politician", "Salaryperson", "Secret Agent", "Social Media", "Style Influencer", "Tech Guru", "Writer", "Babysitter", "Barista", "Diver", "Fast Food Employee", "Fisherman", "Lifeguard", "Manual Laborer", "Retail Employee")
        sample(career, 1, replace=T)
    })
    output$career <- renderTable({
        name <- input$text3
        career_select <- random_career()
        df <- data.frame(name, career_select)
    }, rownames = FALSE, colnames = TRUE)
    
    # Birth or Adopt
    kid1_birthadopt <- eventReactive(input$do11,{
      result <- calculate_adoption()
    })
    kid2_birthadopt <- eventReactive(input$do12, {
      result <- calculate_adoption()
    })
    kid3_birthadopt <- eventReactive(input$do13, {
      result <- calculate_adoption()
    })
    kid4_birthadopt <- eventReactive(input$do14, {
      result <- calculate_adoption()
    })
    output$kid1 <- renderTable({
      name <- input$text4
      Kid_1 <- kid1_birthadopt()
      df <- data.frame(name, Kid_1)
    }, rownames = FALSE, colnames = TRUE)
    output$kid2 <- renderTable({
      name <- input$text4
      Kid_2 <- kid2_birthadopt()
      df <- data.frame(name, Kid_2)
    }, rownames = FALSE, colnames = TRUE)
    output$kid3 <- renderTable({
      name <- input$text4
      Kid_3 <- kid3_birthadopt()
      df <- data.frame(name, Kid_3)
    }, rownames = FALSE, colnames = TRUE)
    output$kid4 <- renderTable({
      name <- input$text4
      Kid_4 <- kid4_birthadopt()
      df <- data.frame(name, Kid_4)
    }, rownames = FALSE, colnames = TRUE)
}

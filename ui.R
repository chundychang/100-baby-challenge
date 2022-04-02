shinyUI(navbarPage(
    title = "Sims Life Randomizer",
    theme = "styles.css",
    tabPanel(title = "About Page",
             img(
                 src="sims_header.png",
                 width="100%"
             ),
             h1("Sims 100 Babby Challenge Randomizer App"),
             p("This is my  Shiny app that randomly generates certain Sims traits based on certain probabilities written into the code. See the tabs for more info. The code is available on GitHub for review/feedback. Thanks and happy using if you'd like to test it out.
               ")),
    tabPanel(title = "Child Aspiration", sidebarLayout(
        sidebarPanel2(
            textInput("text", label=NULL, placeholder="Name"),
            actionButton("do", "Generate (press twice!!)"),
            out = h5("Type the name of the offspring and then press the button to randomly generate their child aspiration. There is an equal chance to generate any of the following four child aspirations:", tags$ul(tags$li("Rambunctious Scamp"), tags$li("Whiz Kid"), tags$li("Artistic Prodigy"), tags$li("Social Butterfly"))),
        ),
        mainPanel(
        tableOutput("child_aspiration")
    ))),
    tabPanel(title = "Adult Aspiration", sidebarLayout(
        sidebarPanel2(
            textInput("text1", label=NULL, placeholder="Name"),
            actionButton("do1", "Generate (press twice!!)"),
            out = h5("Type the name of the offspring and then press the button to randomly generate their adult aspiration. There is an equal chance to generate any of the following 55 adult aspirations:", tags$ul(tags$li("Friend of the Animals"), tags$li("Extreme Sports Enthusiast"), tags$li("Body Builder"), tags$li("Painter Extraordinaire"), tags$li("Lady of the Knits"), tags$li("Master Maker"), tags$li("Musical Genius"), tags$li("Bestselling Author"), tags$li("Master Actor"), tags$li("Public Enemy"), tags$li("Chief of Mischief"), tags$li("Villainous Valentine"), tags$li("Vampire Family"), tags$li("Successful Lineage"), tags$li("Super Parent"), tags$li("Big Happy Family"), tags$li("Master Chef"), tags$li("Master Mixologist"), tags$li("Fabulously Wealthy"), tags$li("Mansion Baron"), tags$li("Academic"), tags$li("Spellcraft & Sorcery"), tags$li("Archaeology Scholar"), tags$li("Renaissance Sim"), tags$li("Nerd Brain"), tags$li("Computer Whiz"), tags$li("Master Vampire"), tags$li("Perfectly Pristine"), tags$li("Beach Life"), tags$li("StrangerVille Mystery"), tags$li("Mt Komorebi Sightseer"), tags$li("Fabulously Filthy"), tags$li("Soulmate"), tags$li("Serial Romantic"), tags$li("Eco Innovator"), tags$li("Jungle Explorer"), tags$li("Outdoor Enthusiast"), tags$li("Purveyor of Potions"), tags$li("Freelance Botanist"), tags$li("The Curator"), tags$li("The Angling Ace"), tags$li("Country Caretaker"), tags$li("Joke Star"), tags$li("Party Animal"), tags$li("Neighborhood Confidante"), tags$li("Friend to the World"), tags$li("City Native"), tags$li("Good Vampire"), tags$li("World-Famous Celebrity"), tags$li("Leader of the Pack"), tags$li("Hope VS Order"), tags$li("Galactic Privateer"), tags$li("Self-Care Specialist"), tags$li("Inner Peace"), tags$li("Zen Guru"))),
        ),
        mainPanel(
            tableOutput("adult_aspiration")
        ))),
    tabPanel(title="Relationships and Children", sidebarLayout(
        sidebarPanel2(
            textInput("text2", label=NULL, placeholder="Name"),
            actionButton("do2", "Sexuality (press twice!!)"),
            actionButton("do3", "Press if LGBTQ (press twice!!)"),
            actionButton("do4", "Relationships? (press twice!!)"),
            actionButton("do5", "Press for Kids if No Relationships (press twice!!)"),
            actionButton("do6", "Press if Bi or Any Gender (press twice!!)"),
            actionButton("do7", "Marry Partner(s)? (press twice!!)"),
            actionButton("do8", "Press if 2 Partners (press twice!!)"),
            actionButton("do9", "Kids per Partner if Relationships (press twice!!)"),
            out = h5(tags$ol(tags$li("Type the name of the offspring and first start with the sexuality button. There is a 90% chance for 'Heterosexual' and 10% chance for 'LGBTQ-' this is roughly based on real life data stating that the global LGBTQ population is about 10%. See bottom of this page for link to source."), tags$li("If the result from the Sexuality button is 'LGBTQ,' proceed to the second button and press. There is a 50% chance for 'Bi or Any' and 'Homosex.' This is again roughly based on real world data; 'Bi or Any' includes trans/non-binary/other queer identifications."), tags$li("Press the 'Relationships' button to determine if the offspring will have any significant relationships. Because the priority is for the matriarch(s) to raise all 100 offspring, offspring are limited to 2 significant relationships maximum and there is a 50% chance for no kids, 25% chance for one kid, and 25% chance for two kids."), tags$li("If the 'Relationships' Button results in 'No relationships', proceed to the 'Kids if Relationships' button and press to determine if the offspring will have kids despite not having any significant relationships. Offspring can either conceive children through one-night stands or adopt. There is a 40% chance for offspring to have kids without significant relationships. This is roughly based on real world data stating that 40% of American families have children; source is linked below"), tags$li("If the offspring is determined to be 'Bi or Any Gender' sexuality, press the 'Press if Bi or Any Gender' button to determine the genders of the offspring's partners. If the offspring gets the 'No relationships' result, you can use the results from the partner gender button to determine gender of partner for one-night stand (may only apply for heterosexual matchings). There is a 50/50 chance for either M or F, for simplicity. If the offspring is only supposed to have one significant relationship, you can ignore the Partner 2 result."), tags$li("Press the 'Marry Partner(s)?' button to determine offspring's marriage status with partners. There is a 50/50 chance for marriage or no marriage, for simplicity. If the offspring is only supposed to have one significant relationship, you can ignore the partner 2 result."), tags$li("Press the 'Press if 2 Partners' Button to determine how the offspring will leave the first partner. There is a 90% chance for divorce and 10% chance for death. This is done because killing a sim without mods is cumbersome and divorce is generally more likely than death."), tags$li("Finally, press 'Kids with Relationship' to determine how many kids offspring will have with each partner. If the offspring is only supposed to have one significant relationship, you can ignore the Partner 2 result.")), tags$ul(tags$li(tags$a(href="https://www.ipsos.com/sites/default/files/ct/news/documents/2021-06/LGBT%20Pride%202021%20Global%20Survey%20Report_3.pdf", "IPSOS Global LGBTQ Population Report")), tags$li(tags$a(href="https://www.census.gov/newsroom/press-releases/2021/families-and-living-arrangements.html", "US Census Data on Families 2021")))),
        ),
        mainPanel(
            tableOutput("sexuality"),
            tableOutput("lgbtq"),
            tableOutput("relationships"),
            tableOutput("kids_if_no_rel"),
            tableOutput("partner_gender"),
            tableOutput("marriage"),
            tableOutput("leaving_partner_1"),
            tableOutput("kids_per_partner")
        )
    )),
    tabPanel(title = "Career", sidebarLayout(
        sidebarPanel2(
            textInput("text3", label=NULL, placeholder="Name"),
            actionButton("do10", "Generate (press twice!!)"),
            out = h5("Type the name of the offspring and then press the button to randomly generate their career. There is an equal chance to generate any of the following 37 careers:", tags$ul(tags$li("Unemployed"), tags$li("Actor"), tags$li("Detective"), tags$li("Doctor"), tags$li("Interior Decorator"), tags$li("Scientist"), tags$li("Astronaut"), tags$li("Athlete"), tags$li("Business"), tags$li("Civil Designer"), tags$li("Conservationist"), tags$li("Criminal"), tags$li("Critic"), tags$li("Culinary"), tags$li("Entertainer"), tags$li("Education"), tags$li("Engineer"), tags$li("Freelancer"), tags$li("Gardener"), tags$li("Law"), tags$li("Military"), tags$li("Painter"), tags$li("Politician"), tags$li("Salaryperson"), tags$li("Secret Agent"), tags$li("Social Media"), tags$li("Style Influencer"), tags$li("Tech Guru"), tags$li("Writer"), tags$li("Babysitter"), tags$li("Barista"), tags$li("Diver"), tags$li("Fast Food Employee"), tags$li("Fisherman"), tags$li("Lifeguard"), tags$li("Manual Laborer"), tags$li("Retail Employee"))),
        ),
        mainPanel(
            tableOutput("career")
        )
    )),
    tabPanel(title="Birth/Adoption", sidebarLayout(
        sidebarPanel2(
            textInput("text4", label=NULL, placeholder="Name"),
            actionButton("do11", "Kid 1 (press twice!!)"),
            actionButton("do12", "Kid 2 (press twice!!"),
            actionButton("do13", "Kid 3 (press twice!!)"),
            actionButton("do14", "Kid 4 (press twice!!)"),
            out = h5("Type the name of the offpsring and then press the button for each number kid that they are assigned to have to determine how they will be having each kid. There is a 98% chance they will conceive the child by birth and a 2% chance they will adopt the child. This is based on real world data stating that 2% of children in the US are adopted. Source is linked below. If an offspring is having trouble conceiving, they may choose to adopt as well.", tags$ul(tags$li(tags$a(href="https://adoptionnetwork.com/adoption-myths-facts/domestic-us-statistics/", "Domestic US Adoption Statistics")))),
        ),
        mainPanel(
            tableOutput("kid1"),
            tableOutput("kid2"),
            tableOutput("kid3"),
            tableOutput("kid4")
        )
    ))
    ))

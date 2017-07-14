library(shiny)
library(leaflet)

# Choices for drop-downs
vars <- c(
  "Centro Educativo" = "superzip",
  "Colegios Privados Concertados" = "ColegiosPrivadosConcertados",
  "Centros FP Privados/Concertados" = "CentrosFormacionProfesionalPrivadosConcertados",
  "Centros Educacion Adultos" = "CentrosEducacionAdultos",
  "Escuelas Infantiles Publicas" = "EscuelasInfantilesPublicas", 
  "Centros Educacion Especial Privados/Concertados " = "CentrosPrivadosConcertadosEducacionEspecial",
  "Centros FP Publicos" = "CentrosFormacionProfesionalPublicos",
  "Centros Educacion Adultos" = "CentrosEducacionAdultos",
  "Centros Ensenanza Especializada" = "CentrosEnsenanzaEspecializada",
  "Institutos Ensenanza Secundaria" = "InstitutosEnsenanzaSecundaria",
  "Escuelas Infantiles Privadas" = "EscuelasInfantilesPrivadasGuarderias",
  "Colegios Publicos" = "ColegiosPublicos",
  "Centros Publicos Educacion Especial" = "CentrosPublicosEducacionEspecial",
  "Monumentos-Edificios Artisticos" = "MonumentosEdificiosArtisticos"
)

varsx <- c(
  "Distrito" = "superzip",
  "Centro" = "CENTRO",
  "CIUDAD_LINEAL" = "CIUDAD_LINEAL",
  "SAN_BLAS_CANILLEJAS" = "SAN_BLAS_CANILLEJAS",
  "VILLAVERDE" = "VILLAVERDE", 
  "CHAMBERI" = "CHAMBERI",
  "FUENCARRAL_EL_PARDO" = "FUENCARRAL_EL_PARDO",
  "MONCLOA_ARAVACA" = "MONCLOA_ARAVACA",
  "PUENTE_DE_VALLECAS" = "PUENTE_DE_VALLECAS",
  "CARABANCHEL" = "CARABANCHEL",
  "USERA" = "USERA",
  "Colegios Publicos" = "HORTALEZA",
  "Centros Publicos Educacion Especial" = "BARAJAS",
  "Centros Publicos Educacion Especial" = "VILLA_DE_VALLECAS",
  "Centros Publicos Educacion Especial" = "LATINA",
  "Centros Publicos Educacion Especial" = "MORATALAZ",
  "Centros Publicos Educacion Especial" = "ARGANZUELA",
  "Centros Publicos Educacion Especial" = "SALAMANCA",
  "Centros Publicos Educacion Especial" = "CHAMARTIN",
  "Centros Publicos Educacion Especial" = "TETUAN",
  "Centros Publicos Educacion Especial" = "VICALVARO",
  "Centros Publicos Educacion Especial" = "RETIRO"
)
 




shinyUI(navbarPage("CENTROS EDUCATIVOS MADRID", id="nav", 

  tabPanel("Interactive map",
    div(class="outer",
      
      tags$head(
        # Include our custom CSS
        includeCSS("styles.css"),
        includeScript("gomap.js")
      ),
      
      #leafletOutput('map'),
      leafletOutput("map", width = "100%", height = "100%"),
      absolutePanel(
       id = "controls", 
       #class = "modal-body", 
        fixed = TRUE, draggable = TRUE,
        top = 60, left = "auto", right = 20, bottom = "auto",
        width = 330, height = "auto",
        
        h2("BUSCADOR"),
        
        selectInput("tipo", "Tipo", vars),
        selectInput("distrito", "Distrito", varsx),
        conditionalPanel("input.color == 'superzip' || input.size == 'superzip'",
          # Only prompt for threshold when coloring or sizing by superzip
          numericInput("threshold", "Selectivity threshold (admit rate less than)", 10)
        ),
       downloadButton('x3', 'Download')
       #downloadButton('x3', 'Download Filtered Data')
      
      #tags$div(id="cite",
      #  HTML('Contact <a href="http://www.richmajerus.com/" target="_blank" >Rich Majerus </a> (rich.majerus@gmail.com) with questions, comments or concerns.  This application was built from code developed by the <a href="https://github.com/rstudio/shiny-examples/tree/master/063-superzip-example" target="_blank" >RStudio Team</a>. Data Source: National Center for Education Statistics, Integrated Postsecondary Education Data System (IPEDS) 2012-2013.  Due to these data being self-reported by each institution, the quality of the data in this visualization is only as high as the quality of institutional reporting. This visualization presents IPEDS data “as is." '
      #))
    )
  ),
  

 
#  tabPanel("Data explorer",
#    fluidRow(
#      column(3,
#        selectInput("states", "States", c("All states"="", structure(state.abb, names=state.name), "Washington, DC"="DC"), multiple=TRUE)
#      ),
#      column(3,
#        conditionalPanel("input.states",
#          selectInput("cities", "Cities", c("All cities"=""), multiple=TRUE)
#        )
#      ),
#      column(3,
#        conditionalPanel("input.states",
#          selectInput("zipcodes", "Zipcodes", c("All zipcodes"=""), multiple=TRUE)
#        )
#      )
#    ),
#    #fluidRow(
#    #  column(5,
#    #    numericInput("minScore", "Min Tuition", min=0, max=50000, value=0)
#    #  ),
#    #  column(5,
#    #    numericInput("maxScore", "Max Tuition", min=0, max=50000, value=50000)
#    #  )
#    #),
#    hr(),
#    dataTableOutput("ziptable")
#  ),
  
  conditionalPanel("false", icon("crosshair"))

 # HTML("<i class=fa fa-crosshairs></i>")

)))

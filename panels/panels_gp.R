
# panels containing model features for northeast and southeast regions

gp_panel <- function(){
  fluidRow(
    column(1),
    column(
      10,
      HTML(
        '<h3 style="margin-top:5px; margin-bottom:-5px">
          <span class="badge badge-primary" 
            style="font-size:1.3rem;
                    background-color:#1a4480;
                    margin-right:8px;">Step 2
          </span>
          Enter field measurements for all indicators
        </h3>'
      ),

      div(
        style = 'background-color: white;
                width: 100%;
                border: 1px solid black;
                padding: 10px;
                margin: 0px;',
        h2(
          style = 'text-align:center;',
          HTML('<b><u>Great Plains SDAM</u></b>',
            )),
        h3(HTML('<b><u>Indicators</u></b>')),
        div(
          fluidRow(
            column(
              12,
              radioButtons(
                "user_total_abundance", 
                HTML("<b><i>Total abundance of aquatic macroinvertebrates</b></i>"),
                c(
                                "0" = 0,
                                "1 to 9" = 1,
                                "10 or greater" = 2
                            ),
                width = '100%',
                inline = F,
                selected = character(0)
              )

            )
          ),
        ) %>% tagAppendAttributes(class = 'question_box'),
        br(),
              
        div(
          fluidRow(
            column(
              12,
              radioButtons(
                "user_hydrophyte", 
                HTML("<b><i>Number of hydrophytic plant species</b></i>"),
                c(
                                "Less than 2" = 0,
                                "Greater than or equal to 2" = 1
                            ),
                width = '100%',
                inline = F,
                selected = character(0)
              )
            )

          ),
        ) %>% tagAppendAttributes(class = 'question_box'),
        br(),

        div(
          fluidRow(
            # HTML('<hr style="color: black; height: 1px; background-color: black;">'),
            column(
              12,
              radioButtons(
                "user_upland_rooted", 
                HTML("<b><i>Presence/absence of rooted upland plants in streambed</b></i><br>"),
                c(
                                "Absent" = 1,
                                "Present" = 0
                            ),
                width = '100%',
                inline = F,
                selected = character(0)
              )
            )
          ),
        ) %>% tagAppendAttributes(class = 'question_box'),
        br(),
        
        div(
          fluidRow(
            column(
              12,
              radioButtons(
                "user_diff_veg", 
                HTML("<b><i>Differences in vegetation</b></i>"),
                c(
                                "0 (Poor)" = 0,
                                "0.5" = 0.5,
                                "1 (Weak)" = 1,
                                "1.5" = 1.5,
                                "2 (Moderate)" = 2,
                                "2.5" = 2.5,
                                "3 (Strong)" = 3
                            ),
                inline = F,
                width = '100%',
                selected = character(0)
              )
            )
          ),
        ) %>% tagAppendAttributes(class = 'question_box'),
        br(),

        div( 
          fluidRow(
            column(
              12,
              radioButtons(
                "user_riff_pool", 
                HTML("<b><i>Riffle-pool sequence</b></i>"),
                c(
                  "0 (Poor)" = 0,
                  "0.5" = 0.5,
                  "1 (Weak)" = 1,
                  "1.5" = 1.5,
                  "2 (Moderate)" = 2,
                  "2.5" = 2.5,
                  "3 (Strong)" = 3
                ),
                inline = F,
                width = '100%',
                selected = character(0)
              )
            )
          ),
        ) %>% tagAppendAttributes(class = 'question_box'),
        br(),

        div(
          fluidRow(
            column(
              12,
              radioButtons(
                "user_substrate", 
                HTML("<b><i>Particle size or stream substrate sorting</b></i>"),
                c(
                  "0 (Weak)" = 0,
                  "0.75" = 0.75,
                  "1.5 (Moderate)" = 1.5,
                  "2.25" = 2.25,
                  "3 (Strong)" = 3
                ),
                inline = F,
                width = '100%',
                selected = character(0)
              )
            )
          ),
        ) %>% tagAppendAttributes(class = 'question_box'),
        br(),
        
        div(
          fluidRow(
            column(
              12,
              radioButtons(
                "user_sediment_plants", 
                HTML("<b><i>Sediment on plants or debris</b></i>"),
                c(
                  "0 (Poor)" = 0,
                  "0.25" = 0.25,
                  "0.5 (Weak)" = 0.5,
                  "0.75" = 0.75,
                  "1 (Moderate)" = 1,
                  "1.25" = 1.25,
                  "1.5 (Strong)" = 1.5
                ),
                inline = F,
                width = '100%',
                selected = character(0)
              )
            )
          ),
        ) %>% tagAppendAttributes(class = 'question_box'),
        br(),
      
        div(
          fluidRow(
            column(width = 12,
              HTML("<b><i>Enter the number of bankfull measurements (m) (min. 1, max. 3) and associated measurement values to the nearest 0.1 m</b></i>"),
              numericInputIcon("select_bank",
                label = NULL,
                min = 1,
                max = 3,
                value = 3,
                step = 1,
                width = '300px',
                icon = icon("hashtag")
              )
            )
          ),
          fluidRow(
            column(
              width = 6,
              uiOutput("bankUI")
            ),
            column(
              width = 6,
              uiOutput(outputId = "bank_text") %>%
                tagAppendAttributes(class = 'border-my-text')
            )
          ),
        ) %>% tagAppendAttributes(class = 'question_box'),
        br(),
        div(
          fluidRow(
            
            # HTML('<hr style="color: black; width: 100%; height: 3px; background-color: black;">'),
            tags$head(
              tags$style(HTML('#runmodel {background-color:#94d9f2;
                                          display: flex;
                                          justify-content: center;
                                          align-items: center;
                                          padding: 8px;
                                          font-size: 110%;
                                          font-weight: bold;
                                          border-style: outset;
                                          
                                          box-shadow: 0 8px 12px 0 rgba(0,0,0,0.24), 0 1px 1px 0 rgba(0,0,0,0.19);
                                          transition-duration: 0.1s;
                                          }',
                              '#runmodel:hover {
                                                background-color:#5d8b9c;
                                                color: black;
                                                border-style: solid;
                                                border-color: black;
                                                border-width: px;
                                                
                                                }'
                              )
                          )
            ),
            column(
              12,
              actionButton("runmodel", div("Run model")),
              align = 'center',
            ),
          ),
        ) %>% tagAppendAttributes(class = 'question_box'),
        div(
          fluidRow(

            column(
              12,
              conditionalPanel(
                condition = "input.runmodel != 0",
                uiOutput("class_out") %>%
                  tagAppendAttributes(class = 'border-my-class')
              )
            ),
          ),
        ) %>% tagAppendAttributes(class = 'question_box'),

        fluidRow(
          column(
            12,
            br(), br()
            
          )
        )
      )
    )
  )
}


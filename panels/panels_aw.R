
# panels containing model features for northeast and southeast regions

aw_panel <- function(){
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
                    HTML('<b><u>Arid West SDAM</u></b>')
                    ),

                h3(HTML('<b><u>Indicators</u></b>')),
                
                    
                div(
                    fluidRow(
                        column(
                            12,
                            radioButtons(
                                "user_eph_isa", 
                                HTML("<b><i>Perennial indicator taxa</b></i><br>"),
                                c(
                                    "No perennial indicator taxa detected" = 0,
                                    "1 to 4 perennial indicator individuals" = 1,
                                    "5 to 9 perennial indicator individuals" = 2,
                                    "10 to 19 perennial indicator individuals" = 3,
                                    "20 or more perennial indicator individuals" = 4
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
                            HTML("<b><i>Slope (to the nearest half-percent)</b></i>"),
                            numericInputIcon("user_slope",
                                label = NULL,
                                min = -500,
                                max = 500,
                                value = NULL,
                                step = 0.01,
                                icon = icon("percent")
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
                                HTML("<b><i>Number of hydrophytic plant species</b></i><br>"),
                                c(
                                    "0" = 0,
                                    "1" = 1,
                                    "2" = 2,
                                    "3" = 3,
                                    "4" = 4,
                                    "Greater than or equal to 5" = 5
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
                                "user_upland_rooted", 
                                HTML("<b><i>Prevalence of upland rooted plants in streambed</i></b><br>
                                      Upland rooted plants include FAC, FACU, UPL, NI, or not listed in the regionally appropriate National Wetland Plant List."),
                                c(
                                    "0 (Poor) Rooted upland plants are prevalent within the streambed/thalweg." = 0,
                                    "0.5" = 0.5,
                                    "1 (Weak) Rooted upland plants are consistently dispersed throughout the streambed/thalweg." = 1,
                                    "1.5" = 1.5,
                                    "2 (Moderate) There are a few rooted upland plants present within the streambed/thalweg." = 2,
                                    "2.5" = 2.5,
                                    "3 (Strong) Rooted upland plants are absent from the streambed/thalweg." = 3
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
                                "user_algal_cover", 
                                HTML("<b><i>Algal cover</b></i>"),
                                c(
                                    "Not detected" = 0,
                                    "<2%" = 1,
                                    "2-10%" = 2,
                                    "10-40%" = 3,
                                    ">40%" = 4
                                ),
                                inline = F,
                                width = '100%',
                                selected = character(0)
                            ),
                            checkboxInput(
                                "user_algal_cb",
                                HTML("<b><i>Check here if algae exclusively appears to have been deposited from an upstream source, and no local growth is evident.</b></i>"),
                                value = NULL,
                                width = '100%'
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
                                    "0 (Poor) No compositional or density differences in vegetation are present between the banks and the adjacent uplands." = 0,
                                    "0.5" = 0.5,
                                    "1 (Weak) Vegetation growing along the reach may occur in greater densities or grow more vigorously than vegetation in the adjacent uplands, but there are no dramatic compositional differences between the two." = 1,
                                    "1.5" = 1.5,
                                    "2 (Moderate) A distinct riparian corridor exists along part of the reach. Riparian vegetation is interspersed with upland vegetation along the length of the reach." = 2,
                                    "2.5" = 2.5,
                                    "3 (Strong) Dramatic compositional differences in vegetation are present between the banks and the adjacent uplands. A distinct riparian vegetation corridor exists along the entire reach. Riparian, aquatic, or wetland species dominate the length of the reach." = 3
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
                                HTML("<b><i>Riffle-pool sequence score</b></i>"),
                                c(
                                    "0 (Poor) No riffle-pool sequences observed." = 0,
                                    "0.5" = 0.5,
                                    "1 (Weak) Mostly has areas of pools or riffles." = 1,
                                    "1.5" = 1.5,
                                    "2 (Moderate) Represented by a less frequent number of riffles and pools. Distinguishing the transition between riffles and pools is difficult to observe." = 2,
                                    "2.5" = 2.5,
                                    "3 (Strong) Demonstrated by a frequent number of structural transitions (e.g., riffles followed by pools) along the entire reach. There is an obvious transition between riffles and pools." = 3
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
                            HTML("<b><i>Enter the number of bankfull width measurements (m) (min. 1, max. 3) and associated measurement values to the nearest 0.1 m</b></i>"),
                            numericInputIcon("select_bank",
                                width = "300px",
                                label = NULL,
                                min = 1,
                                max = 3,
                                value = 3,
                                step = 1,
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


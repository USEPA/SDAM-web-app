# ui panel for northeast model


# panels containing model features for northeast and southeast regions

ne_panel <- function(){
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
                    HTML('<b><u>Northeast SDAM</u></b>')
                    ),
                h3(HTML('<b><u>Indicators</u></b>')),

                div(
                    fluidRow(
                        column(width = 12,
                            HTML("<b><i>Enter the number of bankfull width measurements (m) (min. 1, max. 3) and associated measurement values to the nearest 0.1 m</b></i>"),
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
                        column(
                            6,
                            numericInputIcon(
                                "user_er", 
                                HTML("<b><i>Average Entrenchment Ratio</b></i>"),
                                min = 0,
                                max = Inf,
                                value = NA,
                                step = 0.01,
                                width = '300px',
                                icon = icon("hashtag")
                            )
                        ),
                        column(
                            6,
                            img(src='er.jpg', alt = 'Entrenchment Ratio diagram')
                        )
                    ),
                ) %>% tagAppendAttributes(class = 'question_box'),
                br(),

                div(
                    fluidRow(
                        column(
                            12,
                            radioButtons(
                                "user_bmi", 
                                HTML("<b><i>Aquatic macroinvertebrates: BMI Score</b></i><br>Richness is based on family-level identification for aquatic insects and mollusks, order-level for crustaceans and mites, and class or phylum for all other aquatic macroinvertebrates."),
                                c(
                                    "0 (Absent) No aquatic macroinvertebrates observed." = 0,
                                    "1 (Weak) Total abundance is 1 to 3." = 1,
                                    "2 (Moderate) Total abundance ≥4" = 2,
                                    "3 (Strong) Total abundance ≥10 and richness ≥3 OR Total abundance < 10 and richness ≥5" = 3
                                ),
                                inline = F,
                                width = '80%',
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
                                min = 0,
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
                            HTML("<b><i>Percent shading</b></i>"),
                            numericInputIcon("user_shade",
                                label = NULL,
                                min = 0,
                                max = 100,
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
                            HTML("<b><i>Drainage area (in square miles, if < 1 round to the nearest 0.001)</b></i>"),
                            numericInputIcon("user_drainage",
                                label = NULL,
                                min = 0.0000000000001,
                                max = Inf,
                                value = NA,
                                step = 0.1,
                                width = '300px',
                                icon = icon("hashtag")
                            )
                        )
                    ),
                ) %>% tagAppendAttributes(class = 'question_box'),
                br(),

                # div(
                #     fluidRow(
                #         column(
                #             12,
                #             uiOutput(outputId = "region_choice")
                #         )
                #     ),
                # ) %>% tagAppendAttributes(class = 'question_box'),
                # br(),

                conditionalPanel(
                    condition = "output.region_choice == 'manual'",
                    div(
                        div(
                            id = "coords",
                            HTML("<b><i>Enter coordinates in decimal degrees to retrieve the Elevation and Average Monthly Precipitation for May, June and July.</i></b>"),
                            fluidRow(
                                column(
                                    4,
                                    numericInput("lat",
                                        label = NULL,
                                        value = 40
                                    )
                                ),
                                column(12, h5("Latitude"))
                            ),
                            fluidRow(
                                column(4, numericInput("lon",
                                    label = NULL,
                                    value = -98
                                )),
                                column(12, h5("Longitude"))
                            )
                        )
                    ) %>% tagAppendAttributes(class = 'question_box'),
                    br()
                ),

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
                            condition = "output.region_str == 'Northeast'",
                            # condition = "input.runmodel != 0'",
                            # Only show this if the region is Northeast or Southeast and coordinates provided
                            uiOutput("nese") 
                        ),
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


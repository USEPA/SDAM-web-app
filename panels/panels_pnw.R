
# panels containing model features for Pacific Northwest

pnw_panel <- function(){
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
                    HTML('<b><u>Pacific Northwest SDAM</u></b>')
                ),
                
                ##  indicators----
                h3(HTML('<b><u>Indicators</u></b>')),
                div(
                    fluidRow(
                        column(
                            12,
                            radioButtons(
                                "user_aquatic_presence", 
                                HTML("<b><i>Are aquatic macroinvertebrates present?</b></i>"),
                                c(
                                    "Yes" = "Yes",
                                    "No" = "No"
                                ),
                                inline = T,
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
                                "user_ephemeroptera", 
                                HTML("<b><i>Are 6 or more individuals of the Order Ephemeroptera present?</b></i>"),
                                c(
                                    "Yes" = "Yes",
                                    "No" = "No"
                                ),
                                inline = T,
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
                                "user_per_taxa", 
                                HTML("<b><i>Are perennial indicator taxa present?</b></i>"),
                                c(
                                    "Yes" = "Yes",
                                    "No" = "No"
                                ),
                                inline = T,
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
                                "user_plants", 
                                HTML("<b><i>Are FACW, OBL, or SAV plants present? (Within ½ channel width)</b></i>"),
                                c(
                                    "Yes" = "Yes",
                                    "No" = "No"
                                ),
                                inline = T,
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
                            numericInputIcon("user_slope",
                                            HTML("<b><i>What is the slope? (In percent, measured for the valley, not the stream)</b></i>"),
                                            min = 0,
                                            max = 500,
                                            value = NULL,
                                            step = 0.01,
                                            width = '100%',
                                            icon = icon("percent"))
                        )
                    ),
                ) %>% tagAppendAttributes(class = 'question_box'),
                br(),

                div(
                    fluidRow(
                        column(
                            12,
                            radioButtons(
                                "user_fish", 
                                HTML("<b><i>Are fish present?</b></i>"),
                                c(
                                    "Yes" = "Yes",
                                    "No" = "No"
                                ),
                                inline = T,
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
                                "user_amphibians", 
                                HTML("<b><i>Are amphibians present?</b></i>"),
                                c(
                                    "Yes" = "Yes",
                                    "No" = "No"
                                ),
                                inline = T,
                                selected = character(0)
                            )
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
                br(),

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


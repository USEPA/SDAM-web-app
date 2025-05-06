# ui panel for mountain west model


# panels containing model features for northeast and southeast regions

se_panel <- function(){
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
                    HTML('<b><u>Southeast SDAM</u></b>')
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
                            radioButtons(
                                "user_total_abundance", 
                                HTML("<b><i>Total aquatic macroinvertebrate abundance </b></i><br>"),
                                c(
                                    "No aquatic macroinvertebrates observed." = 0,
                                    "Total abundance is 1 or 2" = 1,
                                    "Total abundance is 3 to 40" = 2,
                                    "Total abundance is 41 or more" = 3
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
                            radioButtons(
                                "user_upland_rooted", 
                                HTML("<b><i>Prevalence of upland rooted plants in streambed</b></i><br>Upland rooted plants include FAC, FACU, UPL, NI, or not listed in the regionally appropriate National Wetland Plant List."),
                                c(
                                    "0 (Poor) Rooted upland plants are prevalent within the streambed/thalweg (>75%)." = 0,
                                    # "0.5" = 0.5,
                                    "1 (Weak) Rooted upland plants are consistently dispersed throughout the streambed/thalweg (20-75%)." = 1,
                                    # "1.5" = 1.5,
                                    "2 (Moderate) There are a few rooted upland plants present within the streambed/thalweg (<20%)." = 2,
                                    # "2.5" = 2.5,
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
                                "user_substrate", 
                                HTML("<b><i>Particle size of stream substrate </b></i>"),
                                c(
                                    "0 (Absent) The channel is poorly developed, very little to no coarse sediment is present. There is no difference between particle size in the stream substrate and adjacent land." = 0,
                                    "0.5" = 0.5,
                                    "1 (Weak) The channel is poorly developed through the soil profile. Some coarse sediment is present in the streambed but is discontinuous. Particle size differs little between the stream substrate and adjacent land." = 1,
                                    "1.5" = 1.5,
                                    "2 (Moderate) There is a well-developed channel, but it is not deeply incised through the soil profile. Some coarse sediment is present in the streambed in a continuous layer. Particle size differs somewhat between the stream substrate and adjacent land." = 2,
                                    "2.5" = 2.5,
                                    "3 (Strong) The channel is well-developed through the soil profile with relatively coarse streambed sediments compared to the riparian zone soils: coarse sand, gravel, or cobbles in the piedmont; cobbles or boulders in the mountains, and medium or coarse sand in the coastal plain. Particle size differs greatly between the stream substrate and adjacent land." = 3
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
                                "user_roots", 
                                HTML("<b><i>Prevalence of fibrous roots in the streambed </b></i>"),
                               c(
                                    "0 (Absent) A strong network of fibrous roots is persistent in the stream thalweg and surrounding area." = 0,
                                    "0.5" = 0.5,
                                    "1 (Weak) A discontinuous network of fibrous roots is present in the stream thalweg and surrounding area." = 1,
                                    "1.5" = 1.5,
                                    "2 (Moderate) Very few fibrous roots are present anywhere in the streambed." = 2,
                                    "2.5" = 2.5,
                                    "3 (Strong) No fibrous roots are present." = 3
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
                            HTML("<b><i>Drainage area (in square miles, to nearest tenth)</b></i>"),
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

                conditionalPanel(
                    condition = "output.region_choice == 'manual'",
                    div(
                        fluidRow(
                            column(
                                12,
                                HTML("<b><i>Mean watershed elevation from <a href='https://www.epa.gov/national-aquatic-resource-surveys/streamcat-web-tool-map-view/'>StreamCat</a> (in feet)</b></i>"),
                                numericInputIcon("user_manual_elevation",
                                    label = NULL,
                                    min = 0.0000000000001,
                                    max = Inf,
                                    value = NA,
                                    step = 0.1,
                                    width = '300px',
                                    icon = icon("hashtag")
                                ),
                                HTML("<b><i>Average monthly precipitation for May, June, and July (mm) from <a href='https://prism.oregonstate.edu/explorer/'>PRISM</a></b></i>"),
                                numericInputIcon("user_manual_precip",
                                    label = NULL,
                                    min = 0.0000000000001,
                                    max = Inf,
                                    value = NA,
                                    step = 0.01,
                                    width = '300px',
                                    icon = icon("hashtag")
                                )   
                            )
                        ),
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
                                condition = "output.region_str == 'Southeast'",
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


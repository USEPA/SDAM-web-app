# PNW report panel

pnw_report <- function(){
    fluidRow(
        column(1),
        column(10,

            br(), br(),
             HTML(
                '<h3 style="margin-top:5px; margin-bottom:-5px">
                    <span class="badge badge-primary" 
                        style="font-size:1.3rem;
                                background-color:#1a4480;
                                margin-right:8px;">Step 3
                    </span>
                    (optional) Enter additional information and generate a report (no information saved or stored)
                </h3>'
            ),
            div(
                style = 'background-color: white;
                        width: 100%;
                        border: 1px solid black;
                        padding: 10px;
                        margin: 0px;',

                ## General Information----
                h2(
                    style = 'text-align:center;',
                    HTML('<b><u>Pacific Northwest SDAM Report</u></b>')
                ),
                h4(HTML("* Maximum file upload size is 30MB.")),
                
                h5('Enter information about the assessment. Indicators required for classification are filled in from entries above'),
                HTML('<hr style="color: black; height: 5px; background-color: black;">'),

                h2(
                    HTML("<b><u>General information</u></b>")
                ) %>% tagAppendAttributes(class = 'center-div-text'),
                
                div(
                    textInput(
                        "project",
                        label = "Project Name or Number:" ,
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    textInput(
                        "code",
                        label = "Address:",
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    textInput(
                        "assessor",
                        label = "Assessor(s):",
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    textInput(
                        "waterway",
                        label = "Waterway Name:",
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    dateInput(
                        "date",
                        label = "Visit Date:",
                        value = "",
                        format = "yyyy-mm-dd"
                    ),

                    numericInput(
                        inputId = "actreach",
                        label = "Precipitation w/in 48 hours (cm):",
                        value = "",
                        min = 0,
                    ),

                    numericInput(
                        inputId = "cwidth",
                        label = "Channel width (m):",
                        value = "",
                        min = 0,
                    ),

                    # radioButtons(
                    #     inputId = "radio_weather",
                    #     label = "Current Weather Conditions (check one):",
                    #     choices = c(
                    #         "Storm/Heavy Rain" = 'heavyrain',
                    #         "Steady Rain" = 'steadyrain',
                    #         "Intermittent Rain" = 'intermittentrain',
                    #         "Snowing" = 'snowing',
                    #         "Cloudy" = 'cloudy',
                    #         "Clear/Sunny" = 'clearsunny'
                    #     ),
                    #     selected = NULL
                    # ),

                    # textAreaInput(
                    #     "weather",
                    #     label = "Notes on current or recent weather conditions:" ,
                    #     value = "",
                    #     width = '100%',
                    #     height = '75px',
                    #     placeholder = NULL
                    # ),

                    # checkboxGroupInput(
                    #     inputId = "check_use",
                    #     label = "Surrounding land-use within 100 m (check one or two):",
                    #     choices = c(
                    #         "Urban, industrial, or residential" = 'urban',
                    #         "Agricultural" = 'agricultural',
                    #         "Developed open-space (e.g., golf course, parks, lawn grasses)" = 'openspace',
                    #         "Forested" = 'forested',
                    #         "Other Natural" = 'othernatural',
                    #         "Other" = 'other'
                    #     ),
                    #     selected = NULL
                    # ),

                    # textAreaInput(
                    #     inputId = "notes_landuse",
                    #     label = "Comments on observed land-use:",
                    #     value = "",
                    #     width = '100%',
                    #     height = '75px',
                    #     placeholder = NULL
                    # ),

                    

                    textAreaInput(
                        inputId = "boundary",
                        label = "Describe reach boundaries:" ,
                        value = "",
                        width = '100%',
                        height = '75px',
                        placeholder = NULL
                    ),

                    checkboxInput(
                                "diff_site",
                                HTML("<b>Disturbed site / difficult situation</b>"),
                                value = NULL,
                                width = '100%'
                    ),

                    HTML("<b>Difficult situation (check all that apply):</b><br>"),
                    div(
                        style='padding-left:30px',
                        HTML("Prolonged abnormal rainfall / snowpack:"),
                        div(
                            style='padding-left:30px; margin-top:-18px; margin-bottom:-10px',
                            checkboxGroupInput(
                                inputId = "precip_avg",
                                label = "",
                                choices = c(
                                    "Below average" = 'Below average',
                                    "Above average" = 'Above average'
                                ),
                                selected = NULL
                            ) 
                        ),
                        div(
                            style='margin-bottom:-10px;',
                            checkboxInput(
                                    "disturbance",
                                    HTML("Natural or anthropogenic disturbance"),
                                    value = NULL,
                                    width = '100%'
                            )
                        ),
                        
                        checkboxInput(
                                    "diff_other",
                                    HTML("Other (explain in notes)"),
                                    value = NULL,
                                    width = '100%'
                        )
                    ),

                    textAreaInput(
                        inputId = "situation",
                        label = "Notes for difficult situations (For disturbed streams, note extent, type, and history of disturbance):" ,
                        value = "",
                        width = '100%',
                        height = '75px',
                        placeholder = NULL
                    ),
                ) %>% tagAppendAttributes(class = 'question_box'),
                br(),
                
                ## Observed Hydrology----
                HTML('<hr style="color: black; height: 5px; background-color: black;">'),

                h2(
                    HTML("<b><u>Observed hydrology</u></b>")
                ) %>% tagAppendAttributes(class = 'center-div-text'),
                div(
                    numericInput(
                        inputId = "surfflow",
                        label = "Percent of reach with surface flows:",
                        value = NULL,
                        min = 0,
                    ),
                    numericInput(
                        inputId = "subflow",
                        label = "Percent of reach with any flow (surface or hyporheic):",
                        value = NULL,
                        min = 0,
                    ),

                    numericInput(
                        inputId = "pool",
                        label = "Number of pools observed:",
                        value = NULL,
                        min = 0,
                    ),

                    textAreaInput(
                        inputId = "notes_observed_hydrology",
                        label = "Comments on observed hydrology:",
                        value = "",
                        width = '100%',
                        height = '75px',
                        placeholder = NULL
                    ),
                ) %>% tagAppendAttributes(class = 'question_box'),
                br(),
                
                ## Site photos----
                HTML('<hr style="color: black; height: 5px; background-color: black;">'),

                h2(
                    HTML("<b><u>Site photos</u></b>")
                ) %>% tagAppendAttributes(class = 'center-div-text'),
                div(
                    ### General photos----
                    slatesFileInput(
                        "tld",
                        "Top of reach looking downstream:",
                        accept = c('image/png', 'image/jpeg')
                    ),
                    
                    slatesFileInput(
                        "mlu",
                        "Middle of reach looking upstream:",
                        accept = c('image/png', 'image/jpeg')
                    ),
                    
                    slatesFileInput(
                        "mld",
                        "Middle of reach looking downstream:",
                        accept = c('image/png', 'image/jpeg')
                    ),
                    
                    slatesFileInput(
                        "blu",
                        "Bottom of reach looking upstream:",
                        accept = c('image/png', 'image/jpeg')
                    ),

                ) %>% tagAppendAttributes(class = 'question_box'),
                br(),

                # Site Sketch----
                HTML('<hr style="color: black; height: 5px; background-color: black;">'),

                h2(
                    HTML("<b><u>Site sketch</u></b>")
                ) %>% tagAppendAttributes(class = 'center-div-text'),
                div(                
                    slatesFileInput(
                        "sketch",
                        "Site Sketch:",
                        accept = c('image/png', 'image/jpeg')
                    ),
                ) %>% tagAppendAttributes(class = 'question_box'),
                br(),

                # Indicators----
                HTML('<hr style="color: black; height: 5px; background-color: black;">'),
                h2(
                    HTML("<b><u>Indicators</u></b>")
                ) %>% tagAppendAttributes(class = 'center-div-text'),

                # Macroinvertebrates----
                div(
                    h4(HTML("<b><u>Macroinvertebrates</u></b>")
                    ) %>% tagAppendAttributes(class = 'center-div-text'),

                    textAreaInput(
                        inputId = "notes_totalAbundance",
                        label = "Notes about observed macroinvertebrates (including taxa names, indicator status, Order, and number of individuals observed):",
                        value = "",
                        width = '100%',
                        height = '75px',
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "inv1",
                        HTML("Macroinvertebrate photo #1<br /> <span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "inv1_cap",
                        label = HTML("<span style='font-weight:normal'> Macroinvertebrate photo #1 caption: </span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "inv2",
                        HTML("Macroinvertebrate photo #2<br /> <span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),   
                    textInput(
                        inputId = "inv2_cap",
                        label = HTML("<span style='font-weight:normal'>Macroinvertebrate photo #2 caption:</span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "inv3",
                        HTML("Macroinvertebrate photo #3<br /><span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "inv3_cap",
                        label = HTML("<span style='font-weight:normal'>Macroinvertebrate photo #3 caption:</span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "inv4",
                        HTML("Macroinvertebrate photo #4<br /> <span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "inv4_cap",
                        label = HTML("<span style='font-weight:normal'> Macroinvertebrate photo #4 caption: </span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "inv5",
                        HTML("Macroinvertebrate photo #5<br /> <span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "inv5_cap",
                        label = HTML("<span style='font-weight:normal'>Macroinvertebrate photo #5 caption:</span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "inv6",
                        HTML("Macroinvertebrate photo #6<br /><span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "inv6_cap",
                        label = HTML("<span style='font-weight:normal'>Macroinvertebrate photo #6 caption:</span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),
                ) %>% tagAppendAttributes(class = 'question_box'),
                br(),

                # Hydrophytes ----
                div(
                    h4(HTML("<b><u>Wetland plants</u></b>")
                    ) %>% tagAppendAttributes(class = 'center-div-text'),

                    textAreaInput(
                        inputId = "notes_hydro",
                        label = "Notes about observed wetland plants (including taxa names and indicator status):",
                        value = "",
                        width = '100%',
                        height = '75px',
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "hydro1",
                        HTML("Wetland plant photo #1<br /> <span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "hydro1_cap",
                        label = HTML("<span style='font-weight:normal'> Wetland plant photo #1 caption: </span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "hydro2",
                        HTML("Wetland plant photo #2<br /> <span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),   
                    textInput(
                        inputId = "hydro2_cap",
                        label = HTML("<span style='font-weight:normal'>Wetland plant photo #2 caption:</span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "hydro3",
                        HTML("Wetland plant photo #3<br /><span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "hydro3_cap",
                        label = HTML("<span style='font-weight:normal'>Wetland plant photo #3 caption:</span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "hydro4",
                        HTML("Wetland plant photo #4<br /> <span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "hydro4_cap",
                        label = HTML("<span style='font-weight:normal'> Wetland plant photo #4 caption: </span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "hydro5",
                        HTML("Wetland plant photo #5<br /> <span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "hydro5_cap",
                        label = HTML("<span style='font-weight:normal'>Wetland plant photo #5 caption:</span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "hydro6",
                        HTML("Wetland plant photo #6<br /><span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "hydro6_cap",
                        label = HTML("<span style='font-weight:normal'>Wetland plant photo #6 caption:</span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),
                ) %>% tagAppendAttributes(class = 'question_box'),
                br(),

                ### Slope----
                div(
                    h4(HTML("<b><u>Slope</u></b>")
                    ) %>% tagAppendAttributes(class = 'center-div-text'),
                    
                    textAreaInput(
                        inputId = "notes_slope",
                        label = "Notes about slope:",
                        value = "",
                        width = '100%',
                        height = '75px',
                        placeholder = NULL
                    ),
                    # numericInput(
                    #   inputId = "valley_length",
                    #   label = "Valley length (m):",
                    #   value = 0,
                    #   min = 0,
                    # ),
                    slatesFileInput(
                        "slope1",
                        HTML("Slope photo #1<br /> <span style='font-weight:normal'>Upload photo file here: </span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "slope1_cap",
                        label = HTML("<span style='font-weight:normal'>Slope photo #1 caption: </span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "slope2",
                        HTML("Slope photo #2<br/> <span style='font-weight:normal'> Upload photo file here: </span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "slope2_cap",
                        label = HTML("<span style='font-weight:normal'>Slope photo #2 caption: </span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "slope3",
                        HTML("Slope photo #3<br /> <span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "slope3_cap",
                        label = HTML("<span style='font-weight:normal'>Slope photo #3 caption:</span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),
                ) %>% tagAppendAttributes(class = 'question_box'),
                br(),


                ### Perennial Taxa-----
                # div(
                #     h4(HTML("<b><u>Perennial Taxa</b>")
                #     ) %>% tagAppendAttributes(class = 'center-div-text'),

                #     textAreaInput(
                #         inputId = "notes_per", 
                #         label = "Notes about perennial taxa:", 
                #         value = "", 
                #         width = '100%',
                #         height = '75px',
                #         placeholder = NULL
                #     ),

                #     slatesFileInput(
                #         "per1", 
                #         HTML("Perennial Taxa photo #1<br/><span style='font-weight:normal'>Upload photo file here:</span>"), 
                #         accept = c('image/png', 'image/jpeg')
                #     ),
                #     textInput(
                #         inputId = "per1_cap", 
                #         label = HTML("<span style='font-weight:normal'>Perennial Taxa photo #1 caption:</span>"), 
                #         value = "", 
                #         width = NULL, 
                #         placeholder = NULL
                #     ),
                    
                #     slatesFileInput(
                #         "per2", 
                #         HTML("Perennial Taxa photo #2<br /><span style='font-weight:normal'>Upload photo file here:</span>"), 
                #         accept = c('image/png', 'image/jpeg')
                #     ),
                #     textInput(
                #         inputId = "per2_cap", 
                #         label = HTML("<span style='font-weight:normal'>Perennial Taxa photo #2 caption:</span>"), 
                #         value = "", 
                #         width = NULL, 
                #         placeholder = NULL
                #     ),

                #     slatesFileInput(
                #         "per3", 
                #         HTML("Perennial Taxa photo #3<br /><span style='font-weight:normal'>Upload photo file here:</span>"), 
                #         accept = c('image/png', 'image/jpeg')
                #     ),
                #     textInput(
                #         inputId = "per3_cap", 
                #         label = HTML("<span style='font-weight:normal'>Perennial Taxa photo #3 caption: </span>"), 
                #         value = "", 
                #         width = NULL, 
                #         placeholder = NULL
                #     ),
                # ) %>% tagAppendAttributes(class = 'question_box'),
                # br(),
                
                ### Fish----
                div(
                    h4(HTML("<b><u>Amphibians, snake, and fish</u></b>")
                    ) %>% tagAppendAttributes(class = 'center-div-text'),
                    
                    textAreaInput(
                        inputId = "notes_fish",
                        label = "Notes about observed amphibians, snakes, and fish (including taxa names, life history stage, location observed, and number of individuals observed):",
                        value = "",
                        width = '100%',
                        height = '75px',
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "fish1",
                        HTML("Amphibian, snake, or fish photo #1<br/><span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "fish1_cap",
                        label = HTML("<span style='font-weight:normal'>Amphibian, snake, or fish photo #1 caption:</span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "fish2",
                        HTML("Amphibian, snake, or fish photo #2<br /><span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "fish2_cap",
                        label = HTML("<span style='font-weight:normal'>Amphibian, snake, or fish photo #2 caption:</span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "fish3",
                        HTML("Amphibian, snake, or fish photo #3<br /><span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "fish3_cap",
                        label = HTML("<span style='font-weight:normal'>Amphibian, snake, or fish photo #3 caption: </span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "amph1", 
                        HTML("Amphibian, snake, or fish photo #4<br/><span style='font-weight:normal'>Upload photo file here:</span>"), 
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "amph1_cap", 
                        label = HTML("<span style='font-weight:normal'>Amphibian, snake, or fish photo #4 caption:</span>"), 
                        value = "", 
                        width = NULL, 
                        placeholder = NULL
                    ),
                    
                    slatesFileInput(
                        "amph2", 
                        HTML("Amphibian, snake, or fish photo #5<br /><span style='font-weight:normal'>Upload photo file here:</span>"), 
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "amph2_cap", 
                        label = HTML("<span style='font-weight:normal'>Amphibian, snake, or fish photo #5 caption:</span>"), 
                        value = "", 
                        width = NULL, 
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "amph3", 
                        HTML("Amphibian, snake, or fish photo #6<br /><span style='font-weight:normal'>Upload photo file here:</span>"), 
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "amph3_cap", 
                        label = HTML("<span style='font-weight:normal'>Amphibian, snake, or fish photo #6 caption: </span>"), 
                        value = "", 
                        width = NULL, 
                        placeholder = NULL
                    ),
                ) %>% tagAppendAttributes(class = 'question_box'),
                br(),

                div(
                    h4(HTML("<b><u>Ancillary Information</u></b>")
                    ) %>% tagAppendAttributes(class = 'center-div-text'),
                    checkboxInput(
                                "anc_rip",
                                HTML("Riparian corridor"),
                                value = NULL,
                                width = '100%'
                    ),

                    checkboxInput(
                                "anc_erosion",
                                HTML("Erosion and deposition"),
                                value = NULL,
                                width = '100%'
                    ),

                    checkboxInput(
                                "anc_fp",
                                HTML("Floodplain connectivity"),
                                value = NULL,
                                width = '100%'
                    ),
                    
                    textAreaInput(
                        inputId = "notes_anc",
                        label = "Notes about observed ancillary information:",
                        value = "",
                        width = '100%',
                        height = '75px',
                        placeholder = NULL
                    ),

                ) %>% tagAppendAttributes(class = 'question_box'),
                br(),


                
                ## Notes and photos----
                HTML('<hr style="color: black; height: 5px; background-color: black;">'),
                h2(
                    HTML("<b><u>Supplemental information</u></b>")
                ) %>% tagAppendAttributes(class = 'center-div-text'),
                div(
                    HTML(
                    "Note if assessment was also conducted on different dates, historical photo interpretation, etc "
                    ),
                    
                    textAreaInput(
                        inputId = "notes_supplemental_information",
                        label = "Additional notes about the assessment:",
                        value = "",
                        width = '100%',
                        height = '75px',
                        placeholder = NULL
                    ),
                    
                    HTML('<hr style="color: black; height: 3px; background-color: black;">'),    
                    h4(HTML("<b>Additional photos</b>")
                    ) %>% tagAppendAttributes(class = 'center-div-text'),

                    slatesFileInput(
                        "add1",
                        HTML("Additional photo #1<br/> <span style='font-weight:normal'>Upload photo file here: </span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "add1_cap",
                        label = HTML("<span style='font-weight:normal'>Additional photo #1 caption: </span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "add2",
                        HTML("Additional photo #2<br/> <span style='font-weight:normal'>Upload photo file here: </span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "add2_cap",
                        label = HTML("<span style='font-weight:normal'>Additional photo #2 caption: </span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),
                    
                    slatesFileInput(
                        "add3",
                        HTML("Additional photo #3<br /> <span style='font-weight:normal'>Upload photo file here: </span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "add3_cap",
                        label = HTML("<span style='font-weight:normal'>Additional photo #3 caption: </span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "add4",
                        HTML("Additional photo #4<br /> <span style='font-weight:normal'>Upload photo file here: </span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "add4_cap",
                        label = HTML("<span style='font-weight:normal'>Additional photo #4 caption: </span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),
                ) %>% tagAppendAttributes(class = 'question_box'),
                br(),
                
                div(
                    downloadButton("report", "Generate report"),
                ) %>% tagAppendAttributes(class = 'question_box'),
                br(),
                br(),
                br(),
                br()
            )
        )
    )
}
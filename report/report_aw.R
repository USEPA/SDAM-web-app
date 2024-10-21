# arid west report panel

aw_report <- function(){
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
                    HTML('<b><u>Arid West SDAM Report</u></b>')
                ),
                h4(HTML("* Maximum file upload size is 30MB")),
                
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
                        label = "Site Code or Identifier:",
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

                    radioButtons(
                        inputId = "radio_weather",
                        label = "Current Weather Conditions (check one):",
                        choices = c(
                            "Storm/Heavy Rain" = 'heavyrain',
                            "Steady Rain" = 'steadyrain',
                            "Intermittent Rain" = 'intermittentrain',
                            "Snowing" = 'snowing',
                            "Cloudy" = 'cloudy',
                            "Clear/Sunny" = 'clearsunny'
                        ),
                        selected = character(0)
                    ),

                    textAreaInput(
                        "weather",
                        label = "Notes on current or recent weather conditions:" ,
                        value = "",
                        width = '100%',
                        height = '75px',
                        placeholder = NULL
                    ),

                    checkboxGroupInput(
                        inputId = "check_use",
                        label = "Surrounding land-use within 100 m (check one or two):",
                        choices = c(
                            "Urban, industrial, or residential" = 'urban',
                            "Agricultural" = 'agricultural',
                            "Developed open-space (e.g., golf course, parks, lawn grasses)" = 'openspace',
                            "Forested" = 'forested',
                            "Other Natural" = 'othernatural',
                            "Other" = 'other'
                        ),
                        selected = NULL
                    ),

                    textAreaInput(
                        inputId = "notes_landuse",
                        label = "Comments on observed land-use:",
                        value = "",
                        width = '100%',
                        height = '75px',
                        placeholder = NULL
                    ),

                    numericInput(
                        inputId = "actreach",
                        label = "Assessment reach length (m):",
                        value = "",
                        min = 0,
                    ),

                    textAreaInput(
                        inputId = "boundary",
                        label = "Describe reach boundaries:" ,
                        value = "",
                        width = '100%',
                        height = '75px',
                        placeholder = NULL
                    ),

                    checkboxGroupInput(
                        inputId = "radio_situation",
                        label = "Disturbed or difficult conditions (check all that apply):",
                        choices = c(
                            "Recent flood or debris flow" = 'flood',
                            "Stream modifications (e.g., channelization)" = 'stream_modifications',
                            "Diversions" = 'diversions',
                            "Water discharges" = 'discharges',
                            "Drought" = 'drought',
                            "Vegetation removal/limitations" = 'vegetation',
                            "Other (explain in notes)" = 'other',
                            "None" = 'none'
                        ),
                        selected = NULL
                    ),

                    textAreaInput(
                        inputId = "situation",
                        label = "Site disturbances/difficulties:" ,
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
                        inputId = "subflow",
                        label = "Percent of reach with surface and sub-surface flows:",
                        value = NULL,
                        min = 0,
                    ),
                    numericInput(
                        inputId = "surfflow",
                        label = "Percent of reach with surface flows:",
                        value = NULL,
                        min = 0,
                    ),

                    

                    numericInput(
                        inputId = "pool",
                        label = "Number of isolated pools:",
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

                ### Mean bankfull width-----
                div(
                    h4(
                        HTML("<b><u>Mean bankfull channel width </u></b>")
                    ) %>% tagAppendAttributes(class = 'center-div-text'),

                    textAreaInput(
                        inputId = "notes_mb", 
                        label = "Notes on mean bankfull channel width:", 
                        value = "", 
                        width = '100%',
                        height = '75px',
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "mb1", 
                        HTML("Mean bankfull width photo #1<br/><span style='font-weight:normal'>Upload photo file here:</span>"), 
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "mb1_cap", 
                        label = HTML("<span style='font-weight:normal'>Mean bankfull width photo #1 caption:</span>"), 
                        value = "", 
                        width = NULL, 
                        placeholder = NULL
                    ),
                    
                    slatesFileInput(
                        "mb2", 
                        HTML("Mean bankfull width photo #2<br /><span style='font-weight:normal'>Upload photo file here:</span>"), 
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "mb2_cap", 
                        label = HTML("<span style='font-weight:normal'>Mean bankfull width photo #2 caption:</span>"), 
                        value = "", 
                        width = NULL, 
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "mb3", 
                        HTML("Mean bankfull width photo #3<br /><span style='font-weight:normal'>Upload photo file here:</span>"), 
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "mb3_cap", 
                        label = HTML("<span style='font-weight:normal'>Mean bankfull width photo #3 caption: </span>"), 
                        value = "", 
                        width = NULL, 
                        placeholder = NULL
                    ),
                ) %>% tagAppendAttributes(class = 'question_box'),
                br(),

                # Biological----
                div(
                    h4(HTML("<b><u>Aquatic macroinvertebrates</u></b>")
                    ) %>% tagAppendAttributes(class = 'center-div-text'),

                    HTML('Check if applicable:'),
                    checkboxInput(
                                    "macro_check",
                                    HTML("No aquatic macroinvertebrates in assessment area"),
                                    value = NULL,
                                    width = '100%'
                    ),

                    textAreaInput(
                        inputId = "notes_totalAbundance",
                        label = "Notes about aquatic macroinvertebrates:",
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
                        HTML("Slope photo #2<br /> <span style='font-weight:normal'> Upload photo file here: </span>"),
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

                # Hydrophytes ----
                div(
                    h4(HTML("<b><u>Hydrophytic plants</u></b>")
                    ) %>% tagAppendAttributes(class = 'center-div-text'),

                    HTML('Check if applicable:'),
                    checkboxInput(
                                    "hydro_check",
                                    HTML("No vegetation in assessment area"),
                                    value = NULL,
                                    width = '100%'
                    ),
                    
                    textAreaInput(
                        inputId = "notes_hydro",
                        label = "Notes about hydrophytic vegetation (e.g., list species here or in photo captions and note odd distributions):",
                        value = "",
                        width = '100%',
                        height = '75px',
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "hydro1",
                        HTML("Hydrophyte photo #1<br /> <span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "hydro1_cap",
                        label = HTML("<span style='font-weight:normal'> Hydrophyte photo #1 caption: </span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "hydro2",
                        HTML("Hydrophyte photo #2<br /> <span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),   
                    textInput(
                        inputId = "hydro2_cap",
                        label = HTML("<span style='font-weight:normal'>Hydrophyte photo #2 caption:</span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "hydro3",
                        HTML("Hydrophyte photo #3<br /><span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "hydro3_cap",
                        label = HTML("<span style='font-weight:normal'>Hydrophyte photo #3 caption:</span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "hydro4",
                        HTML("Hydrophyte photo #4<br /> <span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "hydro4_cap",
                        label = HTML("<span style='font-weight:normal'> Hydrophyte photo #4 caption: </span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "hydro5",
                        HTML("Hydrophyte photo #5<br /> <span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "hydro5_cap",
                        label = HTML("<span style='font-weight:normal'>Hydrophyte photo #5 caption:</span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "hydro6",
                        HTML("Hydrophyte photo #6<br /><span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "hydro6_cap",
                        label = HTML("<span style='font-weight:normal'>Hydrophyte photo #6 caption:</span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),
                ) %>% tagAppendAttributes(class = 'question_box'),
                br(),

                ### Upland Rooted-----
                div(
                    h4(HTML("<b><u>Prevalence of upland rooted plants in streambed</u></b>")
                    ) %>% tagAppendAttributes(class = 'center-div-text'),

                    textAreaInput(
                        inputId = "notes_rooted", 
                        label = "Notes about upland rooted plants:", 
                        value = "", 
                        width = '100%',
                        height = '75px',
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "ur1", 
                        HTML("Upland rooted plant photo #1<br/><span style='font-weight:normal'>Upload photo file here:</span>"), 
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "ur1_cap", 
                        label = HTML("<span style='font-weight:normal'>Upland rooted plant photo #1 caption:</span>"), 
                        value = "", 
                        width = NULL, 
                        placeholder = NULL
                    ),
                    
                    slatesFileInput(
                        "ur2", 
                        HTML("Upland rooted plant photo #2<br /><span style='font-weight:normal'>Upload photo file here:</span>"), 
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "ur2_cap", 
                        label = HTML("<span style='font-weight:normal'>Upland rooted plant photo #2 caption:</span>"), 
                        value = "", 
                        width = NULL, 
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "ur3", 
                        HTML("Upland rooted plant photo #3<br /><span style='font-weight:normal'>Upload photo file here:</span>"), 
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "ur3_cap", 
                        label = HTML("<span style='font-weight:normal'>Upland rooted plant photo #3 caption: </span>"), 
                        value = "", 
                        width = NULL, 
                        placeholder = NULL
                    ),
                ) %>% tagAppendAttributes(class = 'question_box'),
                br(),
                
                ### Algal Cover----
                div(
                    h4(HTML("<b><u>Algal cover</u></b>")
                    ) %>% tagAppendAttributes(class = 'center-div-text'),
                    
                    textAreaInput(
                        inputId = "notes_algal",
                        label = "Notes about algal cover:",
                        value = "",
                        width = '100%',
                        height = '75px',
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "algal1",
                        HTML("Algae photo #1<br/><span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "algal1_cap",
                        label = HTML("<span style='font-weight:normal'>Algae photo #1 caption:</span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "algal2",
                        HTML("Algae photo #2<br /><span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "algal2_cap",
                        label = HTML("<span style='font-weight:normal'>Algae photo #2 caption:</span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "algal3",
                        HTML("Algae photo #3<br /><span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "algal3_cap",
                        label = HTML("<span style='font-weight:normal'>Algae photo #3 caption: </span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),
                ) %>% tagAppendAttributes(class = 'question_box'),
                br(),

                ### Difference in Vegetation----
                div(
                    h4(HTML("<b><u>Differences in vegetation</u></b>")
                    ) %>% tagAppendAttributes(class = 'center-div-text'),

                    textAreaInput(
                        inputId = "notes_veg", 
                        label = "Notes about differences in vegetation:", 
                        value = "", 
                        width = '100%',
                        height = '75px',
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "veg1", 
                        HTML("Vegetation difference photo #1<br/><span style='font-weight:normal'>Upload photo file here:</span>"), 
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "veg1_cap", 
                        label = HTML("<span style='font-weight:normal'>Vegetation difference photo #1 caption:</span>"), 
                        value = "", 
                        width = NULL, 
                        placeholder = NULL
                    ),
                    
                    slatesFileInput(
                        "veg2", 
                        HTML("Vegetation difference photo #2<br /><span style='font-weight:normal'>Upload photo file here:</span>"), 
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "veg2_cap", 
                        label = HTML("<span style='font-weight:normal'>Vegetation difference photo #2 caption:</span>"), 
                        value = "", 
                        width = NULL, 
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "veg3", 
                        HTML("Vegetation difference photo #3<br /><span style='font-weight:normal'>Upload photo file here:</span>"), 
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "veg3_cap", 
                        label = HTML("<span style='font-weight:normal'>Vegetation difference photo #3 caption: </span>"), 
                        value = "", 
                        width = NULL, 
                        placeholder = NULL
                    ),
                ) %>% tagAppendAttributes(class = 'question_box'),
                br(),

                ### Riffle----
                div(
                    h4(HTML("<b><u>Riffle-pool sequence</u></b>")
                    ) %>% tagAppendAttributes(class = 'center-div-text'),

                    textAreaInput(
                        inputId = "notes_riff", 
                        label = "Notes about the riffle-pool sequence:", 
                        value = "", 
                        width = '100%',
                        height = '75px',
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "riff1", 
                        HTML("Riffle-pool photo #1<br/><span style='font-weight:normal'>Upload photo file here:</span>"), 
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "riff1_cap", 
                        label = HTML("<span style='font-weight:normal'>Riffle-pool photo #1 caption:</span>"), 
                        value = "", 
                        width = NULL, 
                        placeholder = NULL
                    ),
                    
                    slatesFileInput(
                        "riff2", 
                        HTML("Riffle-pool photo #2<br /><span style='font-weight:normal'>Upload photo file here:</span>"), 
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "riff2_cap", 
                        label = HTML("<span style='font-weight:normal'>Riffle-pool photo #2 caption:</span>"), 
                        value = "", 
                        width = NULL, 
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "riff3", 
                        HTML("Riffle-pool photo #3<br /><span style='font-weight:normal'>Upload photo file here:</span>"), 
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "riff3_cap", 
                        label = HTML("<span style='font-weight:normal'>Riffle-pool photo #3 caption: </span>"), 
                        value = "", 
                        width = NULL, 
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
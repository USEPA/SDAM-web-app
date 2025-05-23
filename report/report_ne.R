# northeast report panel

ne_report <- function() {
    fluidRow(
        column(1),
        column(
            10,
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
                style = "background-color: white;
                        width: 100%;
                        border: 1px solid black;
                        padding: 10px;
                        margin: 0px;",
                ## General Information----
                h2(
                    style = "text-align:center;",
                    HTML("<b><u>Northeast SDAM Report</u></b>")
                ),
                h4(HTML("* Maximum file upload size is 30MB.")),
                h5("Enter information about the assessment. Indicators required for classification are filled in from entries above"),
                HTML('<hr style="color: black; height: 5px; background-color: black;">'),
                h2(
                    HTML("<b><u>General information</u></b>")
                ) %>% tagAppendAttributes(class = "center-div-text"),
                div(
                    textInput(
                        "project",
                        label = "Project Name or Number:",
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
                    checkboxGroupInput(
                        inputId = "current_precip",
                        label = "Current precipitation:",
                        choices = c(
                            "None",
                            "Rain",
                            "Snow/Ice",
                            "Light",
                            "Moderate",
                            "Heavy"
                        ),
                        selected = NULL
                    ),
                    # radioButtons(
                    #     inputId = "radio_weather",
                    #     label = "Current precipitation:",
                    #     choices = c(
                    #         "Storm/Heavy Rain" = "heavyrain",
                    #         "Steady Rain" = "steadyrain",
                    #         "Intermittent Rain" = "intermittentrain",
                    #         "Snowing" = "snowing",
                    #         "Cloudy" = "cloudy",
                    #         "Clear/Sunny" = "clearsunny"
                    #     ),
                    #     selected = character(0)
                    # ),
                    textAreaInput(
                        "notes_precip",
                        label = "Notes on current precipitation or recent weather:",
                        value = "",
                        width = "100%",
                        height = "75px",
                        placeholder = NULL
                    ),
                    checkboxGroupInput(
                        inputId = "check_use",
                        label = "Surrounding land-use within 100 m (check one or two):",
                        choices = c(
                            "Urban, industrial, or residential" = "urban",
                            "Agricultural" = "agricultural",
                            "Developed open-space (e.g., golf course, parks, lawn grasses)" = "openspace",
                            "Forested" = "forested",
                            "Other Natural" = "othernatural",
                            "Other" = "other"
                        ),
                        selected = NULL
                    ),
                    textAreaInput(
                        inputId = "notes_landuse",
                        label = "Comments on observed land-use:",
                        value = "",
                        width = "100%",
                        height = "75px",
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
                        label = "Describe reach boundaries:",
                        value = "",
                        width = "100%",
                        height = "75px",
                        placeholder = NULL
                    ),
                    checkboxGroupInput(
                        inputId = "radio_situation",
                        label = "Disturbed or difficult conditions (check all that apply):",
                        choices = c(
                            "None" = "none",
                            "Recent flood or debris flow" = "flood",
                            "Stream modifications (e.g., channelization)" = "stream_modifications",
                            "Diversions" = "diversions",
                            "Water discharges" = "discharges",
                            "Drought" = "drought",
                            "Vegetation removal/limitations" = "vegetation",
                            "Other (explain in notes)" = "other"
                            
                        ),
                        selected = NULL
                    ),
                    textAreaInput(
                        inputId = "situation",
                        label = "Site disturbances/difficulties:",
                        value = "",
                        width = "100%",
                        height = "75px",
                        placeholder = NULL
                    ),
                ) %>% tagAppendAttributes(class = "question_box"),
                br(),

                ## Observed Hydrology----
                HTML('<hr style="color: black; height: 5px; background-color: black;">'),
                h2(
                    HTML("<b><u>Observed hydrology</u></b>")
                ) %>% tagAppendAttributes(class = "center-div-text"),
                div(
                    numericInput(
                        inputId = "surfflow",
                        label = "Percent of reach with surface flows:",
                        value = NULL,
                        min = 0,
                    ),
                    numericInput(
                        inputId = "subflow",
                        label = "Percent of reach with surface and sub-surface flows:",
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
                ) %>% tagAppendAttributes(class = "center-div-text"),
                div(
                    ### General photos----
                    slatesFileInput(
                        "tld",
                        "Top of reach looking downstream:",
                        accept = c("image/png", "image/jpeg")
                    ),
                    slatesFileInput(
                        "mlu",
                        "Middle of reach looking upstream:",
                        accept = c("image/png", "image/jpeg")
                    ),
                    slatesFileInput(
                        "mld",
                        "Middle of reach looking downstream:",
                        accept = c("image/png", "image/jpeg")
                    ),
                    slatesFileInput(
                        "blu",
                        "Bottom of reach looking upstream:",
                        accept = c("image/png", "image/jpeg")
                    ),
                ) %>% tagAppendAttributes(class = "question_box"),
                br(),

                # Site Sketch----
                HTML('<hr style="color: black; height: 5px; background-color: black;">'),
                h2(
                    HTML("<b><u>Site sketch</u></b>")
                ) %>% tagAppendAttributes(class = "center-div-text"),
                div(
                    slatesFileInput(
                        "sketch",
                        "Site Sketch:",
                        accept = c("image/png", "image/jpeg")
                    ),
                ) %>% tagAppendAttributes(class = "question_box"),
                br(),

                # Indicators----
                HTML('<hr style="color: black; height: 5px; background-color: black;">'),
                h2(
                    HTML("<b><u>Indicators</u></b>")
                ) %>% tagAppendAttributes(class = "center-div-text"),
                div(
                    h4(
                        HTML("<b><u>Mean bankfull channel width </u></b>")
                    ) %>% tagAppendAttributes(class = "center-div-text"),
                    textAreaInput(
                        inputId = "notes_mb",
                        label = "Notes on mean bankfull channel width:",
                        value = "",
                        width = "100%",
                        height = "75px",
                        placeholder = NULL
                    ),
                    slatesFileInput(
                        "mb1",
                        HTML("Mean bankfull width photo #1<br/><span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c("image/png", "image/jpeg")
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
                        accept = c("image/png", "image/jpeg")
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
                        accept = c("image/png", "image/jpeg")
                    ),
                    textInput(
                        inputId = "mb3_cap",
                        label = HTML("<span style='font-weight:normal'>Mean bankfull width photo #3 caption: </span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),
                ) %>% tagAppendAttributes(class = "question_box"),
                br(),

                ## Entrenchment----
                div(
                    h4(HTML("<b><u>Average Entrenchment Ratio</u></b>")) %>% tagAppendAttributes(class = "center-div-text"),
                    textAreaInput(
                        inputId = "notes_er",
                        label = "Notes about average Entrenchment Ratio:",
                        value = "",
                        width = "100%",
                        height = "75px",
                        placeholder = NULL
                    ),
                    slatesFileInput(
                        "er1",
                        HTML("Entrenchment Ratio photo #1<br /> <span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c("image/png", "image/jpeg")
                    ),
                    textInput(
                        inputId = "er1_cap",
                        label = HTML("<span style='font-weight:normal'> Entrenchment Ratio photo #1 caption: </span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),
                    slatesFileInput(
                        "er2",
                        HTML("Entrenchment Ratio photo #2<br /> <span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c("image/png", "image/jpeg")
                    ),
                    textInput(
                        inputId = "er2_cap",
                        label = HTML("<span style='font-weight:normal'>Entrenchment Ratio photo #2 caption:</span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),
                    slatesFileInput(
                        "er3",
                        HTML("Entrenchment Ratio photo #3<br /><span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c("image/png", "image/jpeg")
                    ),
                    textInput(
                        inputId = "er_cap",
                        label = HTML("<span style='font-weight:normal'>Entrenchment Ratio photo #3 caption:</span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),
                ) %>% tagAppendAttributes(class = "question_box"),
                br(),

                ## BMI----
                div(
                    h4(HTML("<b><u>Aquatic macroinvertebrates: BMI Score</u></b>")) %>% tagAppendAttributes(class = "center-div-text"),
                    textAreaInput(
                        inputId = "notes_totalAbundance",
                        label = "Notes about aquatic macroinvertebrates:",
                        value = "",
                        width = "100%",
                        height = "75px",
                        placeholder = NULL
                    ),
                    slatesFileInput(
                        "inv1",
                        HTML("Macroinvertebrate photo #1<br /> <span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c("image/png", "image/jpeg")
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
                        accept = c("image/png", "image/jpeg")
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
                        accept = c("image/png", "image/jpeg")
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
                        accept = c("image/png", "image/jpeg")
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
                        accept = c("image/png", "image/jpeg")
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
                        accept = c("image/png", "image/jpeg")
                    ),
                    textInput(
                        inputId = "inv6_cap",
                        label = HTML("<span style='font-weight:normal'>Macroinvertebrate photo #6 caption:</span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),
                ) %>% tagAppendAttributes(class = "question_box"),
                br(),

                ## Slope----
                div(
                    h4(HTML("<b><u>Slope (to the nearest half-percent)</u></b>")) %>% tagAppendAttributes(class = "center-div-text"),
                    textAreaInput(
                        inputId = "notes_slope",
                        label = "Notes about slope:",
                        value = "",
                        width = "100%",
                        height = "75px",
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
                        accept = c("image/png", "image/jpeg")
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
                        accept = c("image/png", "image/jpeg")
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
                        accept = c("image/png", "image/jpeg")
                    ),
                    textInput(
                        inputId = "slope3_cap",
                        label = HTML("<span style='font-weight:normal'>Slope photo #3 caption:</span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),
                ) %>% tagAppendAttributes(class = "question_box"),
                br(),

                ## Shading----
                div(
                    h4(HTML("<b><u>Percent shading</u></b>")) %>% tagAppendAttributes(class = "center-div-text"),
                    textAreaInput(
                        inputId = "notes_shade",
                        label = "Notes about shading:",
                        value = "",
                        width = "100%",
                        height = "75px",
                        placeholder = NULL
                    ),
                    slatesFileInput(
                        "shade1",
                        HTML("Shading photo #1<br/><span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c("image/png", "image/jpeg")
                    ),
                    textInput(
                        inputId = "shade1_cap",
                        label = HTML("<span style='font-weight:normal'>Shading photo #1 caption:</span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),
                    slatesFileInput(
                        "shade2",
                        HTML("Shading photo #2<br /><span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c("image/png", "image/jpeg")
                    ),
                    textInput(
                        inputId = "shade2_cap",
                        label = HTML("<span style='font-weight:normal'>Shading photo #2 caption:</span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),
                    slatesFileInput(
                        "shade3",
                        HTML("Shading photo #3<br /><span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c("image/png", "image/jpeg")
                    ),
                    textInput(
                        inputId = "shade3_cap",
                        label = HTML("<span style='font-weight:normal'>Shading photo #3 caption: </span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),
                    slatesFileInput(
                        "shade4",
                        HTML("Shading photo #4<br /><span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c("image/png", "image/jpeg")
                    ),
                    textInput(
                        inputId = "shade4_cap",
                        label = HTML("<span style='font-weight:normal'>Shading photo #4 caption: </span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),
                ) %>% tagAppendAttributes(class = "question_box"),
                br(),

                ## Drainage ----
                div(
                    h4(HTML("<b><u>Drainage area</u></b>")) %>% tagAppendAttributes(class = "center-div-text"),
                    textAreaInput(
                        inputId = "notes_drainage",
                        label = "Notes about drainage area, including method/tool(s) used to calculate it:",
                        value = "",
                        width = "100%",
                        height = "75px",
                        placeholder = NULL
                    ),
                    slatesFileInput(
                        "drainage1",
                        HTML("Drainage area photo #1<br /> <span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c("image/png", "image/jpeg")
                    ),
                    textInput(
                        inputId = "drainage1_cap",
                        label = HTML("<span style='font-weight:normal'> Drainage area photo #1 caption: </span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),
                    slatesFileInput(
                        "drainage2",
                        HTML("Drainage area photo #2<br /> <span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c("image/png", "image/jpeg")
                    ),
                    textInput(
                        inputId = "drainage2_cap",
                        label = HTML("<span style='font-weight:normal'>Drainage area photo #2 caption:</span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),
                    slatesFileInput(
                        "drainage3",
                        HTML("Drainage area photo #3<br /><span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c("image/png", "image/jpeg")
                    ),
                    textInput(
                        inputId = "drainage3_cap",
                        label = HTML("<span style='font-weight:normal'>Drainage area photo #3 caption:</span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    )
                ) %>% tagAppendAttributes(class = "question_box"),
                br(),

                ## mean elevation----
                div(
                    h4(HTML("<b><u>Mean Watershed Elevation (m)</u></b>")) %>% tagAppendAttributes(class = "center-div-text"),
                    textAreaInput(
                        inputId = "notes_elevation",
                        label = "Notes about mean watershed elevation from StreamCat:",
                        value = "",
                        width = "100%",
                        height = "75px",
                        placeholder = NULL
                    ),
                ) %>% tagAppendAttributes(class = "question_box"),
                br(),

                ## Notes and photos----
                HTML('<hr style="color: black; height: 5px; background-color: black;">'),
                h2(
                    HTML("<b><u>Supplemental information</u></b>")
                ) %>% tagAppendAttributes(class = "center-div-text"),
                div(
                    HTML(
                        "Note if assessment was also conducted on different dates, historical photo interpretation, etc "
                    ),
                    textAreaInput(
                        inputId = "notes_supplemental_information",
                        label = "Additional notes about the assessment:",
                        value = "",
                        width = "100%",
                        height = "75px",
                        placeholder = NULL
                    ),
                    HTML('<hr style="color: black; height: 3px; background-color: black;">'),
                    h4(HTML("<b>Additional photos</b>")) %>% tagAppendAttributes(class = "center-div-text"),
                    slatesFileInput(
                        "add1",
                        HTML("Additional photo #1<br/> <span style='font-weight:normal'>Upload photo file here: </span>"),
                        accept = c("image/png", "image/jpeg")
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
                        accept = c("image/png", "image/jpeg")
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
                        accept = c("image/png", "image/jpeg")
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
                        accept = c("image/png", "image/jpeg")
                    ),
                    textInput(
                        inputId = "add4_cap",
                        label = HTML("<span style='font-weight:normal'>Additional photo #4 caption: </span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),
                ) %>% tagAppendAttributes(class = "question_box"),
                br(),
                div(
                    downloadButton("report", "Generate report"),
                ) %>% tagAppendAttributes(class = "question_box"),
                br(),
                br(),
                br(),
                br()
            )
        )
    )
}

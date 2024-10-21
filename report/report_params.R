# report parameters by region



# combine the general parameters and region specific parameters for markdown; knits the report document for download
generate_params <- function(region){

    general_params <- list(
    # -------------------Classification
    stream_class = classification(),
    region = region_class()$region,
    # precip = precip(),
    drain_area = input$user_DRNAREA,

    # -------------------General Site Information
    a = input$project,
    b = input$assessor,
    c = input$code,
    d = input$waterway,
    e = input$date,
    bm = case_when(input$radio_weather == 'heavyrain' ~ "Storm/heavy rain",
                    input$radio_weather == 'steadyrain' ~ "Steady rain",
                    input$radio_weather == 'intermittentrain' ~ "Intermittent rain",
                    input$radio_weather == 'snowing' ~ "Snowing",
                    input$radio_weather == 'cloudy' ~ "Cloudy",
                    input$radio_weather == 'clearsunny' ~ "Clear/Sunny"),

    j = input$weather,
    g = as.numeric(input$lat),
    h = as.numeric(input$lon),
    l = plyr::mapvalues(
        input$check_use,
        from = c(
        "urban","agricultural", "Developed open-space (e.g., golf course, parks, lawn grasses)",
        "forested","othernatural","other"),
        to = c(
        "Urban, industrial, or residential", "Agricultural","Developed open-space",
        "Forested","Other Natural","Other")
    ) %>% as.character() %>% paste0(collapse = ", "),

    f = input$boundary,
    fff = input$actreach,
    bn = plyr::mapvalues(
        input$radio_situation,
        from = c(
        "flood","stream_modifications", "diversions",
        "Water discharges","drought","vegetation",
        "other","none"),
        to = c(
        "Recent flood or debris flow","Stream modifications (e.g., channelization)","Diversions",
        "Water discharges","Drought","Vegetation removal/limitations",
        "Other (explain in notes)","None")
    ) %>% as.character() %>% paste0(collapse = ", "),

    k = input$situation,

    # ------------------- Site Photos
    v = fig4(),
    u = fig3(),
    t = fig2(),
    s = fig1(),

    # ------------------- Observed Hydrology
    m = input$surfflow,
    n = input$subflow,
    o = input$pool,
    r = input$notes_observed_hydrology,

    # ------------------- Site Sketch
    w = fig5(),

    # ------------------- Supplemental Information
    notes_supplemental_information = input$notes_supplemental_information,
    f48 = fig48(),
    f48_cap = input$add1_cap,
    f49 = fig49(),
    f49_cap = input$add2_cap,
    f50 = fig50(),
    f50_cap = input$add3_cap,
    f51 = fig51(),
    f51_cap = input$add4_cap
    )  

   
    if (region == 'Arid West'){
        ## Arid West----
        
        # Set up parameters to pass to Rmd document
        region_params <- list(
            
            ### ------------------- Biological indicators
            # EPT Taxa
            aqua_inv = input$user_total_abundance,
            f6 = fig6(),
            f6_cap = input$inv1_cap,
            f7 = fig7(),
            f7_cap = input$inv2_cap,
            f8 = fig8(),
            f8_cap = input$inv3_cap,
            f6_1 = fig6_1(),
            f6_1cap = input$inv4_cap,
            f7_1 = fig7_1(),
            f7_1cap = input$inv5_cap,
            f8_1 = fig8_1(),
            f8_cap = input$inv6_cap,
            notes_aquainv = input$notes_totalAbundance,

            # Hydrophytes
            hydro = input$user_hydrophyte,
            f24 = fig24(),
            f24_cap = input$hydro1_cap,
            f25 = fig25(),
            f25_cap = input$hydro2_cap,
            f26 = fig26(),
            f26_cap = input$hydro3_cap,
            f27 = fig27(),
            f27_cap = input$hydro4_cap,
            f28 = fig28(),
            f28_cap = input$hydro5_cap,
            f29 = fig29(),
            f29_cap = input$hydro6_cap,
            notes_hydro = input$notes_hydro,                       

            # Upland Rooted
            upland_rooted = input$user_upland_rooted,
            f45 = fig45(),
            f45_cap = input$ur1_cap,
            f46 = fig46(),
            f46_cap = input$ur2_cap,
            f47 = fig47(),
            f47_cap = input$ur3_cap,
            notes_rooted = input$notes_rooted,
            
            # Agal Cover
            algal = input$user_algal_cover,
            f36 = fig36(),
            f36_cap = input$algal1_cap,
            f37 = fig37(),
            f37_cap = input$algal2_cap,
            f38 = fig38(),
            f38_cap = input$algal3_cap,
            notes_algal = input$notes_algal,

            # Difference in Veg
            vegetation = input$user_diff_veg,
            f15 = fig15(),
            f15_cap = input$veg1_cap,
            f16 = fig16(),
            f16_cap = input$veg2_cap,
            f17 = fig17(),
            f17_cap = input$veg3_cap,
            notes_vegetation = input$notes_veg,

            # Slope
            slope = input$user_slope,
            f21 = fig21(),
            f21_cap = input$slope1_cap,
            f22 = fig22(),
            f22_cap = input$slope2_cap,
            f23 = fig23(),
            f23_cap = input$slope3_cap,
            notes_slope = input$notes_slope,

            # Riffle Pool Sequence
            riff = input$user_riff_pool,
            f42 = fig42(),
            f42_cap = input$riff1_cap,
            f43 = fig43(),
            f43_cap = input$riff2_cap,
            f44 = fig44(),
            f44_cap = input$riff3_cap,
            notes_riff = input$notes_riff,

            # Bank Width
            bankwidth = bank_mean()
        )

    } else if (region == 'East'){
        # reserved for future final East SDAM

    } else if (region == 'Great Plains'){
        ## Great Plains ----

        # Set up parameters to pass to Rmd document
        region_params <- list(
            
            # ------------------- Biological indicators
            # EPT Taxa
            aqua_inv = input$user_total_abundance,
            f6 = fig6(),
            f6_cap = input$inv1_cap,
            f7 = fig7(),
            f7_cap = input$inv2_cap,
            f8 = fig8(),
            f8_cap = input$inv3_cap,
            f6_1 = fig6_1(),
            f6_1cap = input$inv4_cap,
            f7_1 = fig7_1(),
            f7_1cap = input$inv5_cap,
            f8_1 = fig8_1(),
            f8_cap = input$inv6_cap,
            notes_aquainv = input$notes_totalAbundance,

            # Hydrophytes
            hydro = input$user_hydrophyte,
            f24 = fig24(),
            f24_cap = input$hydro1_cap,
            f25 = fig25(),
            f25_cap = input$hydro2_cap,
            f26 = fig26(),
            f26_cap = input$hydro3_cap,
            f27 = fig27(),
            f27_cap = input$hydro4_cap,
            f28 = fig28(),
            f28_cap = input$hydro5_cap,
            f29 = fig29(),
            f29_cap = input$hydro6_cap,
            notes_hydro = input$notes_hydro,                       

            # Upland Rooted
            upland_rooted = input$user_upland_rooted,
            f45 = fig45(),
            f45_cap = input$ur1_cap,
            f46 = fig46(),
            f46_cap = input$ur2_cap,
            f47 = fig47(),
            f47_cap = input$ur3_cap,
            notes_rooted = input$notes_rooted,

            # Substrate
            substrate = input$user_substrate,
            f12 = fig12(),
            f12_cap = input$sub1_cap,
            f13 = fig13(),
            f13_cap = input$sub2_cap,
            f14 = fig14(),
            f14_cap = input$sub3_cap,
            notes_sub = input$notes_sub,

            # Difference in Veg
            vegetation = input$user_diff_veg,
            f15 = fig15(),
            f15_cap = input$veg1_cap,
            f16 = fig16(),
            f16_cap = input$veg2_cap,
            f17 = fig17(),
            f17_cap = input$veg3_cap,
            notes_vegetation = input$notes_veg,

            # Sediment on plants
            sediment = input$user_sediment_plants,
            f18 = fig18(),
            f18_cap = input$sed1_cap,
            f19 = fig19(),
            f19_cap = input$sed2_cap,
            f20 = fig20(),
            f20_cap = input$sed3_cap,
            notes_sed = input$notes_sed,

            # Riffle Pool Sequence
            riff = input$user_riff_pool,
            f42 = fig42(),
            f42_cap = input$riff1_cap,
            f43 = fig43(),
            f43_cap = input$riff2_cap,
            f44 = fig44(),
            f44_cap = input$riff3_cap,
            notes_riff = input$notes_riff,

            # Bank Width
            bankwidth = bank_mean()
        )

    } else if (region == 'Pacific Northwest'){
        ## Pacific Northwest----

        # Set up parameters to pass to Rmd document
        region_params <- list(
            
            # ------------------- Biological indicators
            # EPT Taxa
            aqua_inv = input$user_total_abundance,
            ephem = input$user_ephemeroptera,
            f6 = fig6(),
            f6_cap = input$inv1_cap,
            f7 = fig7(),
            f7_cap = input$inv2_cap,
            f8 = fig8(),
            f8_cap = input$inv3_cap,
            f6_1 = fig6_1(),
            f6_1cap = input$inv4_cap,
            f7_1 = fig7_1(),
            f7_1cap = input$inv5_cap,
            f8_1 = fig8_1(),
            f8_cap = input$inv6_cap,
            notes_aquainv = input$notes_totalAbundance,

            # Hydrophytes
            hydro = input$user_plants,
            f24 = fig24(),
            f24_cap = input$hydro1_cap,
            f25 = fig25(),
            f25_cap = input$hydro2_cap,
            f26 = fig26(),
            f26_cap = input$hydro3_cap,
            f27 = fig27(),
            f27_cap = input$hydro4_cap,
            f28 = fig28(),
            f28_cap = input$hydro5_cap,
            f29 = fig29(),
            f29_cap = input$hydro6_cap,
            notes_hydro = input$notes_hydro,                       

            # Perennial Taxa
            per_taxa = input$user_per_taxa,
            f33 = fig33(),
            f33_cap = input$per1_cap,
            f34 = fig34(),
            f34_cap = input$per2_cap,
            f35 = fig35(),
            f35_cap = input$per3_cap,
            notes_per = input$notes_per,

            # Fish
            fish = input$user_fish,
            f30 = fig30(),
            f30_cap = input$fish1_cap,
            f31 = fig31(),
            f31_cap = input$fish2_cap,
            f32 = fig32(),
            f32_cap = input$fish3_cap,
            notes_fish = input$notes_fish,

            # Amphibians
            amphibians = input$user_amphibians,
            f39 = fig39(),
            f39_cap = input$amph1_cap,
            f40 = fig40(),
            f40_cap = input$amph2_cap,
            f41 = fig41(),
            f41_cap = input$amph3_cap,
            notes_amph = input$notes_amph,

            # Slope
            slope = input$user_slope,
            f21 = fig21(),
            f21_cap = input$slope1_cap,
            f22 = fig22(),
            f22_cap = input$slope2_cap,
            f23 = fig23(),
            f23_cap = input$slope3_cap,
            notes_slope = input$notes_slope
        )

    } else if (region == 'Western Mountains'){
        ## Western Mountains----

        # Set up parameters to pass to Rmd document
        region_params <- list(
            
            # ------------------- Biological indicators
            # EPT Taxa
            aqua_inv = input$user_total_abundance,
            f6 = fig6(),
            f6_cap = input$inv1_cap,
            f7 = fig7(),
            f7_cap = input$inv2_cap,
            f8 = fig8(),
            f8_cap = input$inv3_cap,
            f6_1 = fig6_1(),
            f6_1cap = input$inv4_cap,
            f7_1 = fig7_1(),
            f7_1cap = input$inv5_cap,
            f8_1 = fig8_1(),
            f8_cap = input$inv6_cap,
            notes_aquainv = input$notes_totalAbundance,

            # Hydrophytes
            hydro = input$user_hydrophyte,
            f24 = fig24(),
            f24_cap = input$hydro1_cap,
            f25 = fig25(),
            f25_cap = input$hydro2_cap,
            f26 = fig26(),
            f26_cap = input$hydro3_cap,
            f27 = fig27(),
            f27_cap = input$hydro4_cap,
            f28 = fig28(),
            f28_cap = input$hydro5_cap,
            f29 = fig29(),
            f29_cap = input$hydro6_cap,
            notes_hydro = input$notes_hydro,                       

            # Upland Rooted
            upland_rooted = input$user_upland_rooted,
            f45 = fig45(),
            f45_cap = input$ur1_cap,
            f46 = fig46(),
            f46_cap = input$ur2_cap,
            f47 = fig47(),
            f47_cap = input$ur3_cap,
            notes_rooted = input$notes_rooted,

            # Substrate
            substrate = input$user_substrate,
            f12 = fig12(),
            f12_cap = input$sub1_cap,
            f13 = fig13(),
            f13_cap = input$sub2_cap,
            f14 = fig14(),
            f14_cap = input$sub3_cap,
            notes_sub = input$notes_sub,

            # Difference in Veg
            vegetation = input$user_diff_veg,
            f15 = fig15(),
            f15_cap = input$veg1_cap,
            f16 = fig16(),
            f16_cap = input$veg2_cap,
            f17 = fig17(),
            f17_cap = input$veg3_cap,
            notes_vegetation = input$notes_veg,

            # Slope
            slope = input$user_slope,
            f21 = fig21(),
            f21_cap = input$slope1_cap,
            f22 = fig22(),
            f22_cap = input$slope2_cap,
            f23 = fig23(),
            f23_cap = input$slope3_cap,
            notes_slope = input$notes_slope,

            # Riffle Pool Sequence
            riff = input$user_riff_pool,
            f42 = fig42(),
            f42_cap = input$riff1_cap,
            f43 = fig43(),
            f43_cap = input$riff2_cap,
            f44 = fig44(),
            f44_cap = input$riff3_cap,
            notes_riff = input$notes_riff,

            # Bank Width
            bankwidth = bank_mean(),

            # Percent Shade
            shade = densi_shade_perc()


        )

    }

    combined_params <- c(general_params, region_params)

}
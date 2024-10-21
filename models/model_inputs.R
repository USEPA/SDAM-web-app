# model input data processing

pnw_df <- function(
    user_lat = 0,
    user_lon = 0,
    user_aquatic_presence = NA,
    user_ephemeroptera = NA,
    user_per_taxa = NA,
    user_plants = NA,
    user_slope = NA,
    user_fish = NA,
    user_amphibians = NA
){
    df_input <- tibble(
                        lat = user_lat, 
                        lon = user_lon,
                        aqua_presence = user_aquatic_presence,
                        ephemeroptera = user_ephemeroptera,
                        peren_taxa = user_per_taxa,
                        plants = user_plants,
                        slope = user_slope,
                        fish = user_fish,
                        amphibians = user_amphibians,
                )
    df_input
}

gp_df <- function(
  user_lat = 0,
  user_lon = 0,
  user_total_abundance = NA,
  user_hydrophyte = NA,
  user_upland_rooted = NA,
  user_diff_veg = NA,
  user_sediment_plants = NA,
  user_substrate = NA,
  user_riff_pool = NA,
  user_bank_mean = NA
){

        df_input <- tibble(
                        lat = as.numeric(user_lat), 
                        lon = as.numeric(user_lon),
                        BankWidthMean = as.numeric(user_bank_mean),
                        SubstrateSorting_score = as.numeric(user_substrate),
                        DifferencesInVegetation_score = as.numeric(user_diff_veg),
                        RifflePoolSeq_score = as.numeric(user_riff_pool),
                        SedimentOnPlantsDebris_score = as.numeric(user_sediment_plants),
                        TotalAbundance = as.numeric(user_total_abundance),
                        UplandRootedPlants_score = as.numeric(user_upland_rooted),
                        hydrophytes_present = as.numeric(user_hydrophyte),
                )

        df_input <- df_input %>% mutate(
                TotalAbund_0_10 = as.numeric(user_total_abundance),
                UplandRooted_PA = as.numeric(UplandRootedPlants_score),
                hydrophytes_2 = as.numeric(user_hydrophyte)
                ) 
        df_input
}       

aw_df <- function(
  user_lat = 0,
  user_lon = 0,
  user_hydrophyte = NA,
  user_eph_isa = NA,
  user_upland_rooted = NA,
  user_diff_veg = NA,
  user_algal_cover = NA,
  user_slope = NA,
  user_riff_pool = NA,
  user_bank_mean = NA
){

        df_input <- tibble(
                        lat = as.numeric(user_lat), 
                        lon = as.numeric(user_lon),
                        BankWidthMean = as.numeric(user_bank_mean),
                        AlgalCover_LiveOrDead_NoUpstream = as.numeric(user_algal_cover),
                        DifferencesInVegetation_score = as.numeric(user_diff_veg),
                        RifflePoolSeq_score = as.numeric(user_riff_pool),
                        UplandRootedPlants_score = as.numeric(user_upland_rooted),
                        perennial_West_abundance_simplified2 = as.numeric(user_eph_isa),
                        hydrophytes_present = as.numeric(user_hydrophyte),
                        Slope = as.numeric(user_slope)
                )
        
        df_input <- df_input %>% 
                        mutate(
                                hydrophytes_present_0_1_2_3_4_5 = as.numeric(user_hydrophyte),
                                perennial_ISAsubregion_abundance_simp2_0_5_10_20 = as.numeric(user_eph_isa)
                        )                      
   

        df_input
}  


wm_df <- function(
  user_lat = 0,
  user_lon = 0,
  user_total_abundance = NA,
  user_hydrophyte = NA,
  user_substrate = NA,
  user_eph_isa = NA,
  user_PctShade = NA,
  user_upland_rooted = NA,
  user_diff_veg = NA,
  user_slope = NA,
  user_riff_pool = NA,
  user_bank_mean = NA
){

        df_input <- tibble(
                        lat = as.numeric(user_lat), 
                        lon = as.numeric(user_lon),
                        BankWidthMean = as.numeric(user_bank_mean),
                        TotalAbundance = as.numeric(user_total_abundance),
                        DifferencesInVegetation_score = as.numeric(user_diff_veg),
                        UplandRootedPlants_score = as.numeric(user_upland_rooted),
                        RifflePoolSeq_score = as.numeric(user_riff_pool),
                        PctShading = as.numeric(user_PctShade),
                        Slope = as.numeric(user_slope),
                        SubstrateSorting_score = as.numeric(user_substrate),
                        perennial_West_abundance_simplified2 = as.numeric(user_eph_isa),
                        hydrophytes_present = as.numeric(user_hydrophyte),
                )

        df_input <- df_input %>% 
                        mutate(
                                hydrophytes_present_0_1_2_3_4_5 = as.numeric(user_hydrophyte),
                                perennial_ISAsubregion_abundance_simp2_0_5_10_20 = as.numeric(user_eph_isa),
                                EPT_abundance_0_5_10_20 = as.numeric(user_total_abundance)
                        )

        df_input
}  
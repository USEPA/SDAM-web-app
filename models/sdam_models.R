
# Load shapefile with regions
regions_shp <- read_sf("./spatial/simplified_regions.shp")

# Run the pretrained random forest model based on region; returns the stream classification
run_sdam <- function(
        df = NA,
        var_input_reg = NA
        ){
                if (var_input_reg == 'No Region'){
                        pnts_df <- sf::st_as_sf(df, 
                                coords = c("lon", "lat"), 
                                crs = 4326, 
                                remove = FALSE)
                        pnts_join_df <- sf::st_join(pnts_df, regions_shp) %>%
                                rename(Strata_UNC = region)

                        if (is.na(pnts_join_df$Strata_UNC)){
                                spatial_msg <- paste0(
                                "<h5>",
                                "<p>The location of your site is outside of the SDAM Study areas.<p><br>",
                                "<p>Please check your latitude and longitude coordinates to ensure they are entered correctly.<p><br>"
                                )
                                print(spatial_msg)

                        } else if (pnts_join_df$Strata_UNC == 'East'){
                                show_alert(
                                        title = "Location Error!",
                                        text = tagList(
                                        tags$p(HTML(paste0("This site is located in the East Beta SDAM study area.",
                                                                "Please visit the <a href=\"https://ecosystemplanningrestoration.shinyapps.io/beta_sdam_nese\">East Beta SDAM application</a>  for the Northeast and Southeast."
                                                        ))
                                        )
                                        ),
                                        type = "error"
                                )

                        } else if (pnts_join_df$Strata_UNC == 'Great Plains'){
                                set.seed(1111)
                                ClassProbs <- predict(gp_rf, newdata = df, type="prob") %>% as.data.frame()
                                
                                output_df <- bind_cols(pnts_join_df, ClassProbs) %>%
                                        mutate(ALI = I + P,
                                                Class = case_when(P>=.5~"perennial",
                                                                I>=.5~"intermittent",
                                                                E>=0.5~"ephemeral",
                                                                P>E ~ "at least intermittent",
                                                                E>P ~ "less than perennial",
                                                                P==E & I>P ~ "Need more information",
                                                                P==E & I<=P ~ "Need more information",
                                                                T~"Other")
                                        )

                                output_df$Class

                        } else if (pnts_join_df$Strata_UNC == 'Western Mountains'){
                                load("NotForGit/Step5/all_refined_rf_mods.Rdata")

                                ClassProbs <- predict(wm_rf, newdata = pnts_join_df, type="prob") %>% as.data.frame()
                                # assign appropriate class based on probabilities
                                output_df <- bind_cols(df, ClassProbs) %>%
                                        mutate(ALI = I + P,
                                                Class = case_when(P>=.5~"perennial",
                                                                I>=.5~"intermittent",
                                                                E>=0.5~"ephemeral",
                                                                P>E ~ "at least intermittent",
                                                                E>P ~ "less than perennial",
                                                                P==E & I>P ~ "Need more information",
                                                                P==E & I<=P ~ "Need more information",
                                                                T~"Other")
                                        )
                                output_df$Class

                        } else if (pnts_join_df$Strata_UNC == 'Arid West'){

                                ClassProbs <- predict(aw_rf, newdata = df, type="prob") %>% as.data.frame()
                                # assign appropriate class based on probabilities
                                output_df <- bind_cols(pnts_join_df, ClassProbs) %>%
                                        mutate(ALI = I + P,
                                                Class = case_when(P>=.5~"perennial",
                                                                I>=.5~"intermittent",
                                                                E>=0.5~"ephemeral",
                                                                P>E ~ "at least intermittent",
                                                                E>P ~ "less than perennial",
                                                                P==E & I>P ~ "Need more information",
                                                                P==E & I<=P ~ "Need more information",
                                                                T~"Other")
                                        )
                                output_df$Class

                        } else if (pnts_join_df$Strata_UNC == 'Pacific Northwest'){
                                check_list <- list()
                                for (t in names(df)){
                                        if((length(df[[t]]) == 0) | (is.na(df[[t]]))){
                                                cv <- 'NULL'
                                                print(df[[t]])
                                                check_list <- append(check_list, cv)
                                        }
                                }
                                if ('NULL' %in% check_list) {
                                        print('Null found in check list')
                                        show_alert(
                                                title = "",
                                                text = tagList(
                                                        tags$p(HTML(paste0("Indicator data missing!  Please fill in all indicators before running the model prediction.")
                                                                )
                                                                )
                                                        ),
                                                        type = "default"
                                                        )
                                } else {
                                        if (df$aqua_presence == 'Yes'){
                                                if (df$ephemeroptera == 'Yes'){
                                                        if (df$peren_taxa == 'Yes'){
                                                                        df$Class = 'perennial'
                                                        } else if (df$peren_taxa == 'No'){
                                                                        if (df$slope < 16){
                                                                                df$Class = 'intermittent'
                                                                        } else if (df$slope >= 16){
                                                                                df$Class = 'perennial'
                                                                        }
                                                        } 

                                                } else if (df$ephemeroptera == 'No'){
                                                        df$Class = 'intermittent'
                                                }
                                        } else if (df$aqua_presence == 'No'){
                                                if (df$plants == 'Yes'){
                                                        if (df$slope < 10.5){
                                                                df$Class = 'intermittent'
                                                        } else if (df$slope >= 10.5){
                                                                df$Class = 'ephemeral'
                                                        }
                                                } else if (df$plants == 'No'){
                                                        df$Class = 'ephemeral'
                                                }
                                        }

                                        if (df$Class == 'ephemeral'){
                                                if (df$fish == 'Yes'){
                                                        df$Class == 'at least intermittent'
                                                } else if (df$amphibians == 'Yes'){
                                                        df$Class == 'at least intermittent'
                                                }
                                        }

                                        output_df$Class
                                }
                        }

                } else if (var_input_reg == 'East'){
                        show_alert(
                                title = "Location Error!",
                                text = tagList(
                                        tags$p(HTML(paste0("This site is located in the East Beta SDAM study area.",
                                                        "Please visit the <a href=\"https://github.com/WSaulnier/beta_sdam_nese\">East Beta SDAM application</a>  for the Northeast and Southeast."
                                                        ))
                                        )
                                ),
                                type = "error"
                                )

                } else if (var_input_reg == 'Great Plains'){
                        set.seed(1111)

                        ClassProbs <- predict(gp_rf, newdata = df, type="prob") 
                                # assign appropriate class based on probabilities
                        output_df <- bind_cols(df, ClassProbs) %>%
                                mutate(ALI = I + P,
                                        Class = case_when(P>=.5~"perennial",
                                                        I>=.5~"intermittent",
                                                        E>=0.5~"ephemeral",
                                                        P>E ~ "at least intermittent",
                                                        E>P ~ "less than perennial",
                                                        P==E & I>P ~ "Need more information",
                                                        P==E & I<=P ~ "Need more information",
                                                        T~"Other")
                                )

                        output_df$Class

                } else if (var_input_reg == 'Western Mountains'){
                        
                        ClassProbs <- predict(wm_rf, newdata = df, type="prob") %>% as.data.frame()
                                # assign appropriate class based on probabilities
                        output_df <- bind_cols(df, ClassProbs) %>%
                                mutate(ALI = I + P,
                                        Class = case_when(P>=.5~"perennial",
                                                        I>=.5~"intermittent",
                                                        E>=0.5~"ephemeral",
                                                        P>E ~ "at least intermittent",
                                                        E>P ~ "less than perennial",
                                                        P==E & I>P ~ "Need more information",
                                                        P==E & I<=P ~ "Need more information",
                                                        T~"Other")
                                )
                        output_df$Class

                } else if (var_input_reg == 'Arid West'){
 
                        ClassProbs <- predict(aw_rf, newdata = df, type="prob") %>% as.data.frame()
                                # assign appropriate class based on probabilities
                        output_df <- bind_cols(df, ClassProbs) %>%
                                mutate(ALI = I + P,
                                        Class = case_when(P>=.5~"perennial",
                                                        I>=.5~"intermittent",
                                                        E>=0.5~"ephemeral",
                                                        P>E ~ "at least intermittent",
                                                        E>P ~ "less than perennial",
                                                        P==E & I>P ~ "Need more information",
                                                        P==E & I<=P ~ "Need more information",
                                                        T~"Other")
                                )


                        output_df$Class

                } else if (var_input_reg == 'Pacific Northwest'){
                        check_list <- list()
                        for (t in names(df)){
                                if((length(df[[t]]) == 0) | (is.na(df[[t]]))){
                                        cv <- 'NULL'
                                        print(df[[t]])
                                        check_list <- append(check_list, cv)
                                }
                        }
                        if ('NULL' %in% check_list) {
                                print('Null found in check list')
                                show_alert(
                                        title = "",
                                        text = tagList(
                                                tags$p(HTML(paste0("Indicator data missing!  Please fill in all indicators before running the model prediction.")
                                                        )
                                                        )
                                                ),
                                                type = "default"
                                                )
                        } else {
                        
                                if (df$aqua_presence == 'Yes'){
                                        if (df$ephemeroptera == 'Yes'){
                                                if (df$peren_taxa == 'Yes'){
                                                        df$Class = 'perennial'
                                                } else if (df$peren_taxa == 'No'){
                                                        if (df$slope < 16){
                                                                df$Class = 'intermittent'
                                                        } else if (df$slope >= 16){
                                                                df$Class = 'perennial'
                                                        }
                                                } 

                                        } else if (df$ephemeroptera == 'No'){
                                                df$Class = 'intermittent'
                                        }

                                } else if (df$aqua_presence == 'No'){
                                        if (df$plants == 'Yes'){
                                                if (df$slope < 10.5){
                                                        df$Class = 'intermittent'
                                                } else if (df$slope >= 10.5){
                                                        df$Class = 'ephemeral'
                                                }
                                        } else if (df$plants == 'No'){
                                                df$Class = 'ephemeral'
                                        }
                                }

                                if (df$Class == 'ephemeral'){
                                        if (df$fish == 'Yes'){
                                                df$Class = 'at least intermittent'
                                        } else if (df$amphibians == 'Yes'){
                                                df$Class = 'at least intermittent'
                                        }
                                }


                                df$Class
                        }
                        
        }
}







        
        
# Create a data frame with two variables: 
# - The final abuse determination made by the LEAD panel and;
# - The abuse determination made using the DETECT tool at the initial visit

# This data frame will be used to create a confusion matrix for the LEAD panel assessment master table site.



compare_det <- function(lead_final_det, detect_tool){
  
  # Select the any_abuse column from the final determination dataframe
  abuse_any_final_det <- lead_final_det %>% select(medstar_id, abuse_any) %>%
    
    # convert factor variables to binary factor variable
    mutate(
      abuse_any =  case_when(
        abuse_any == "Yes" ~ "positive",
        abuse_any == "No"  ~ "negative"
      ),
      abuse_any = factor(abuse_any)
    )
  
  # Determine the initial MedStar Medic DETECT tool abuse determination (counts as positive if at least one of the items in the DETECT tool was positive)
  detect_tool <- detect_tool %>% 
    mutate(
      # Create a column that has a value of 1 if at least one of the items in the DETECT tool variables are positive
      detect_tool_det = case_when(
        if_any(ends_with("_5cat_f"), ~. == "Yes")  ~ "positive",
        if_all(ends_with("_5cat_f"), ~. == "No")   ~ "negative",
        TRUE                                       ~ NA
      ),
      # Convert variable type to factor
      detect_tool_det = factor(detect_tool_det)
    )
  
  # Combine the two variables into one df
  tool_vs_lead <- abuse_any_final_det %>% left_join(detect_tool, by = "medstar_id") %>% select(medstar_id, abuse_any, detect_tool_det)
  
  # Create contingency table and convert it to data frame
  cm_values <- table(tool_vs_lead$abuse_any, tool_vs_lead$detect_tool_det) %>% as.data.frame() %>% rename(
    abuse_any = "Var1",
    detect_tool_det = "Var2",
    labels = "Freq"
  )
  
  cm_values
}
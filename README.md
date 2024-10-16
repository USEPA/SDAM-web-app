# Streamflow Duration Assessment Methods (SDAMs) Web App

## Project Description
The SDAMs web app is used to provide a predicted streamflow duration classification based on entered field-collected data. This web app is used for the Great Plains, Arid West, Western Mountains, and Pacific Northwest SDAMs, and will also be used for the Northeast and Southeast SDAMs when those methods are finalized. Using random forest models, this web app generates a classification prediction from a select set of field indicators specific to the regional method. The classification outcomes are perennial, intermittent, or ephemeral; in rarer cases, additional outcomes are at least intermittent, less than perennial, or needs more information. In addition, users can generate an optional PDF report with the indicator data, information about the site, and photos if desired. We provide the R code used to create the Shiny app.
## Usage
### Code
Code in this repository can be used to generate the Shiny web app. 
* app.R
  * Contains the UI, server, and ShinyApp call that create the app
* model_inputs.R
  * Contains the inputs for each regional model, which include the geographic coordinates from the assessment and the indicators 
* sdam_models.R
  * Contains the code to run the pretrained random forest model based on region
* report folder
  * Contains the .R report template files by region used by the app to generate a PDF 
  
### Getting Started
The steps below outline the process of setting up the web app on a Windows computer. 
* Background Steps: If R and RStudio are not installed on the computer, please follow these steps:
	* [Download R](https://www.r-project.org/) and install.
	* [Download RStudio](https://posit.co/) and install. R should be installed before RStudio.
* Step 1: [Click here](FUTURE GITHUB LINK WITH ZIP FILE) to download the code files and the data files listed in the Code section.
* Step 2: Extract the downloaded file into a new project folder on your local machine.
* Step 3: Open RStudio -> File -> New Project... -> Existing Directory -> Navigate to your project folder from Step 2 and select the actual folder as your directory.
* Step 4: File -> Open File... -> app.R
* Step 5: Click the "Run App" button at top, right-hand side of the code window to run the Shiny app.  A new window will open up with the app hosted locally.  If this is the first time running the app, you may be prompted to install the libraries utilized by the app.  This could take several minutes to complete.

### App Description
The SDAMs web app involves two to three main steps. First, users input their location by manually entering coordinates, selecting by region, or clicking a location on a map. The next step is to enter the indicator data, which is done by filling in a bubble and/or typing in values. The final, optional step is to generate a PDF report. 


## Software
The dashboard was developed with R software, version 4.4.1, on a Windows computer.  The code may need to be adapted to run on other operating systems.

## References
* [Shiny from RStudio](https://shiny.rstudio.com/)


# Disclaimer 
The United States Environmental Protection Agency (EPA) GitHub project code is provided on an “as is” basis and the user assumes responsibility for its use. EPA has relinquished control of the information and no longer has responsibility to protect the integrity, confidentiality, or availability of the information. Any reference to specific commercial products, processes, or services by service mark, trademark, manufacturer, or otherwise, does not constitute or imply their endorsement, recommendation or favoring by EPA. The EPA seal and logo shall not be used in any manner to imply endorsement of any commercial product or activity by EPA or the United States Government.
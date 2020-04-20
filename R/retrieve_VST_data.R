#' retrieve vegetation structure data from NEON
#'
#'
#' @param site (character) "all" for all sites (see neonUtilities::loadByProduct), else a NEON site ID
#' @param start (character) "Either NA, meaning all available dates, or a character vector in the form YYYY-MM, e.g. 2017-01. Defaults to NA"
#' @param enddate Either NA, meaning all available dates, or a character vector in the form YYYY-MM, e.g. 2017-01. Defaults to NA.
#' @return A list of dataframe
#' @seealso [neonUtilities::loadByProduct()] which this function wraps.
#' @export
#' @examples
#' @importFrom magrittr "%>%"
#'
retrieve_VST_data <- function(site = "all", start = NA, enddate = NA){
  
  # load NEON woody vegetation structure data product into R
  vst <- neonUtilities::loadByProduct("DP1.10098.001", check.size=F,
                                      site=site, start, enddate)
  
  # calculate UTM coordinates of vst entries based on azimuth and distance
  # measurements from plot reference points
  vst_locations <- calc_tree_geolocations(vst, dataProd = "vst_mappingandtagging")

  return(vst_locations)
}



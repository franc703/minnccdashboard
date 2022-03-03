get_provider_counts <- function(){

	df <- minnccaccess::read_licensing(version = '2021-10', filled = TRUE)

	a <- df %>%
		dplyr::count(date, provider_type)

	a

}

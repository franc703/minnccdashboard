plot_provider_counts <- function(scaled = FALSE){

	df <- get_provider_counts()
	if (!scaled) {
		p <- df %>%
			ggplot2::ggplot() +
			ggplot2::geom_line(ggplot2::aes(date, n, color = provider_type))
	}

	if (scaled) {
		a <- df %>%
			dplyr::group_by(provider_type) %>%
			dplyr::mutate(scaled_n = n / n[1]) %>%
			dplyr::ungroup()

		p <- a %>%
			ggplot2::ggplot() +
			ggplot2::geom_line(ggplot2::aes(date, scaled_n, color = provider_type))

	}

	p


}

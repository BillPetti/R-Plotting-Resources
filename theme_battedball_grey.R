theme_battedball_grey <- function(base_size = 12, base_family = "Helvetica") {
  theme_minimal(base_size = base_size, base_family = base_family) %+replace%
    theme(
      axis.text = element_blank(),
      axis.title = element_blank(),
      legend.title = element_text(face = "bold", size = 14),
      legend.text = element_text(face = "bold", size = 14),
      plot.title = element_text(face = "bold", size = 28, hjust=-.08,vjust=2),
      plot.background = element_rect(fill="#F0F0F0"),
      panel.grid = element_blank()
    )
}

# install.packages('ggplot2')

library(ggplot2)

# creates sample data
df <- data.frame(HR=c(19,20,25,5,2,50,72,20,18,19),Settled=c(10^6, 2*10^6, 4*10^6, 2.4*10^6, 5*10^6, 7*10^6, 15*10^6, 5.6*10^6, 10*10^6, 8.9*10^6), Group = sample(c("1","2","3","4","5","6"), 10, replace = TRUE))

# Graph Parameters
fg_palette = c('#20520E', '#50ae26', '#95E476', '#969696', '#636363', '#252525')
dot_size = 5
dot_transparency = .7
y_major_tick_marks = seq(from=0, to=10^8, by=10^6)
y_axis_limits = c(0,15*10^6)

# FanGraphs Theme
fg_theme <- function(base_size = 12, base_family = "Arial") {
  theme_minimal(base_size = base_size, base_family = base_family) %+replace%
    theme(
      panel.background = element_rect(fill = "white", color='#BFBFBF'),
      axis.line = element_line(color='#BFBFBF', size=.5),
      panel.grid.major = element_line(color='#BFBFBF', size=.25),
      axis.title = element_text(face='bold', hjust=.5, vjust=0),
      axis.text = element_text(color='black'),
      title = element_text(face='bold', size = 18, hjust=0, vjust=1.5))
}

# Scatter Plot with r-square annotation and lm fit line
ggplot(data=df, aes(y=Settled, x=HR)) + 
  geom_point(fill = '#50ae26', shape=21, size=dot_size, alpha=dot_transparency) + 
  geom_smooth(method=lm, se=F, color='black') + 
  scale_y_continuous(breaks=(y_major_tick_marks), limits=y_axis_limits) +
  ggtitle("HR vs Arbitration Settlement_g") +
  annotate(geom="text", y=1.2*10^7, x=58, label='r-square = .20', size = 5, fontface = "bold") +
  fg_theme()

# Scatter Plot with r-square annotation and lm fit line, colored by Group
ggplot(data=df, aes(y=Settled, x=HR)) + 
  geom_point(aes(fill = Group), shape=21, size=dot_size, alpha=dot_transparency) + 
  geom_smooth(method=lm, se=F, color='black') + 
  scale_y_continuous(breaks=(y_major_tick_marks), limits=y_axis_limits) +
  scale_fill_manual(values = fg_palette) + 
  ggtitle('HR vs Arbitration Settlement_g') +
  annotate(geom="text", y=1.2*10^7, x=58, label='r-square = .20', size = 5, fontface = "bold") +
  fg_theme()

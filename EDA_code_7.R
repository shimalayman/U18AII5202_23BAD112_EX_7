library(ggplot2)
library(dplyr)

# Check columns
colnames(social_data)

# Overplotting
ggplot(social_data, aes(x = Likes, y = Comments)) +
  geom_point(color = "blue") +
  labs(title = "Overplotting Problem")

# Alpha Blending
ggplot(social_data, aes(x = Likes, y = Comments)) +
  geom_point(alpha = 0.05, color = "blue") +
  labs(title = "Alpha Blending Applied")

# Jittering
ggplot(social_data, aes(x = Likes, y = Comments)) +
  geom_jitter(alpha = 0.05, width = 2, height = 2, color = "darkgreen") +
  labs(title = "Jittering Applied")

# Aggregation
aggregated_data <- social_data %>%
  group_by(Likes) %>%
  summarise(avg_comments = mean(Comments, na.rm = TRUE))

ggplot(aggregated_data, aes(x = Likes, y = avg_comments)) +
  geom_line(color = "red") +
  labs(title = "Aggregation: Avg Comments per Likes")

# 2D Binning
ggplot(social_data, aes(x = Likes, y = Comments)) +
  geom_bin2d(bins = 40) +
  theme_minimal() +
  labs(title = "2D Binning")

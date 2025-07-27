# LLM testing

library(quanteda)
library(caret)
library(here)
library(mall)
library(ollamar)
library(ellmer)

source(here("preprocessing_master.R"))

# test connection to Ollama server
test_connection() 

# see available models 
list_models()

llm_use(
  backend = "ollama", 
  model = "gemma3:4b", 
  seed = 1337, 
  temperature = 0, 
  .cache = "_my_cache"
)

feedback_sentiment <- korean_reviews %>%
  llm_sentiment(comment)


korean_reviews <- korean_reviews %>%
  mutate(sentiment = feedback_sentiment$.sentiment)


sentiment_summary <- korean_reviews %>%
  filter(!is.na(sentiment)) %>% 
  count(restaurant_name, sentiment) %>%
  pivot_wider(
    names_from = sentiment,
    values_from = n,
    values_fill = 0  # Use 0 to avoid NA issues
  ) %>%
  mutate(
    total_reviews = positive + neutral + negative,
    percent_positive = round(positive / total_reviews, 2)
  ) %>%
  left_join(
    korean_reviews %>%
      select(rank, restaurant_name) %>% 
      distinct(),
    by = "restaurant_name"
  ) %>%
  arrange(rank)


# Get Averages 

average_sentiments <- sentiment_summary %>%
  summarise(
    avg_positive = mean(positive, na.rm = TRUE),
    avg_neutral = mean(neutral, na.rm = TRUE),
    avg_negative = mean(negative, na.rm = TRUE),
    avg_total_reviews = mean(total_reviews, na.rm = TRUE),
    avg_percent_positive = mean(percent_positive, na.rm = TRUE)
  )

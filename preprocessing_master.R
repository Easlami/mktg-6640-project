# Load Data and Complete Text preprocessing 

# Libraries ----------------------------------

library(tidyverse)
library(janitor)
library(quanteda)
library(here)



# load data ----------------------------------
raw_reviews <- suppressMessages(read_csv(here("data/top 240 restaurants recommanded in los angeles 2.csv"))) %>% 
  clean_names()

# Create factor vars 
raw_reviews <- raw_reviews %>% 
  mutate(across(c(style, price), factor))

# Split into the 2 korean restaurant groups 

# Filter and label Korean restaurants based on rank
korean_reviews <- raw_reviews %>%
  filter(str_detect(style, "Korean"),
         restaurant_name != "The Barn Cafe & Restaurant") %>%
  mutate(rank_group = case_when(
    rank < 26 ~ "High",
    rank > 150 ~ "Low",
    TRUE ~ NA_character_
  )) %>%
  filter(!is.na(rank_group)) %>%
  mutate(rank_group = factor(rank_group))


# Text preprocessing --------------------------

# Create corpus from full dataframe, specifying comment column as text
corpus_base <- corpus(korean_reviews, text_field = "comment")

# Define custom stopwords
custom_stopwords <- c(stopwords("english"), "restaurant", "food", "great", "good", "place")

# Tokenize
reviews_tokens <- tokens(corpus_base,
                                   remove_punct = TRUE,
                                   remove_numbers = TRUE,
                                   remove_symbols = TRUE,
                                   ) %>%
  tokens_tolower() %>% # set all to lowercase
  tokens_keep(min_nchar = 3) %>% # at least 3 characters
  tokens_remove(custom_stopwords)  # remove stopwords using english group and our custom words

# Create DFM 

dfm_reviews <- dfm(reviews_tokens) %>% 
  dfm_trim(min_termfreq = 3) # Remove Rare Terms that appear less than 3 times

# TFIDF
dfm_tfidf_reviews <- dfm_tfidf(dfm_reviews)


cat("🟢 Data and text preprocessing complete — DFM ready.\n\n")

cat("📦 Available objects and descriptions:\n")
cat("  - raw_reviews       : Original dataset with top 240 LA restaurants (cleaned)\n")
cat("  - korean_reviews    : Filtered Korean restaurants with High/Low rank groups\n")
cat("  - corpus_base       : Quanteda corpus built from review comments\n")
cat("  - custom_stopwords  : Custom stopword list (standard + domain-specific terms)\n")
cat("  - reviews_tokens    : Tokenized and cleaned review text (lowercase, no stopwords)\n")
cat("  - dfm_reviews       : Document-feature/term matrix (DFM) for modeling or analysis\n")
cat("  - dfm_tfidf_reviews : Document-feature/term matrix (DFM) with tfidf\n")


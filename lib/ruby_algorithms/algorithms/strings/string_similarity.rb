require 'set'
# string similarity
module StringSimilarityMeasures
  def self.set_overlap(tokens1,tokens2)
    tokens1_set,tokens2_set = [tokens1,tokens2].map { |tokens| tokens.to_set }
    tokens1_or_2_set = tokens1_set | tokens2_set
    tokens1_and_2_set = tokens1_set & tokens2_set
    return tokens1_and_2_set.length.to_f / tokens1_or_2_set.length
  end
end

# fuzzy search
class Dictionary
  def initialize(strings,tokenizer) # Does not make a copy of the strings
    @tokenizer = tokenizer # tokenizer is also expected to normalize, e.g. downcase
    @token_to_string = Hash.new { |h,k| h[k] = [] }
    strings.each do |string|
      token_string = @tokenizer.call(string)
      @token_to_string[token_string] << string
    end
    # Below will be used in find_most_similar and is here for performance reasons
    @tokenized_strings = @token_to_string.keys
  end

  def find_most_similar(search_string)
    tokenized_search_string = @tokenizer.call(search_string)
    scores = @tokenized_strings.map do |tokenized_string|
      StringSimilarityMeasures.set_overlap(tokenized_string,tokenized_search_string)
    end
    max_score = scores.max
    # select is used below because max_score may not occur uniquely in scores
    idxs_of_max_score = (0...scores.length).select { |i| scores[i] >= max_score }
    # Below is optimized for the common case that max_score does occur uniquely in scores
    result = []
    (0...idxs_of_max_score.length).each do |i|
      result += @token_to_string[@tokenized_strings[idxs_of_max_score[i]]]
    end
    return result
  end
end

white_space_tokenizer = Proc.new { |s| s.downcase.split }
dictionary = Dictionary.new(['Art of War', 'War of Art', 'War and Peace'], white_space_tokenizer)
puts dictionary.find_most_similar('art war')

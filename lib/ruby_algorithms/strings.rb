module StringSimilarityMeasures
  def self.set_overlap(tokens1,tokens2)
    tokens1_as_set,tokens2_as_set = [tokens1,tokens2].map { |tokens| tokens.to_set }
    tokens1_or_2_as_set = tokens1_as_set | tokens2_as_set
    tokens1_and_2_as_set = tokens1_as_set & tokens2_as_set
    return tokens1_and_2_as_set.length.to_f / tokens1_or_2_as_set.length
  end
end

class Dictionary
  def initialize(strings,tokenizer) # Does not make a copy of the strings
    @tokenizer = tokenizer # tokenizer is also expected to normalize, e.g. downcase
    @token_string_to_strings = Hash.new { |h,k| h[k] = [] }
    strings.each do |string|
      token_string = @tokenizer.call(string)
      @token_string_to_strings[token_string] << string
    end
    # Below will be used in find_most_similar and is here for performance reasons
    @tokenized_strings_in_dictionary = @token_string_to_strings.keys
  end

  def find_most_similar(search_string)
    tokenized_search_string = @tokenizer.call(search_string)
    scores = @tokenized_strings_in_dictionary.map do |tokenized_string|
      StringSimilarityMeasures.set_overlap(tokenized_string,tokenized_search_string)
    end
    max_score = scores.max # select is used below because max_score may not occur uniquely in scores
    idxs_of_max_score = (0..scores.length).select { |i| scores[i] >= max_score }
    # Below is optimized for the common case that max_score does occur uniquely in scores
    result_array = @token_string_to_strings[@tokenized_strings_in_dictionary[idxs_of_max_score[0]]]
    (1..idxs_of_max_score.length).each do |i|
      result_array += @token_string_to_strings[@tokenized_strings_in_dictionary[idxs_of_max_score[i]]]
    end
    return result_array
  end
end

white_space_tokenizer = Proc.new { |s| s.downcase.split }
dictionary = Dictionary.new(['The Art of War', 'War and Peace'], white_space_tokenizer)
puts dictionalry.find_most_similar('art war')

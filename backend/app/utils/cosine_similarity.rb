require 'matrix'

# Uses the cosine of the angle between two vectors to measure how close they are
def cosine_similarity(vector1, vector2)
  dot_product = 0
  magnitude1 = 0
  magnitude2 = 0

  vector1.each_with_index do |value, index|
    dot_product += value * vector2[index]
    magnitude1 += value**2
    magnitude2 += vector2[index]**2
  end

  magnitude_product = Math.sqrt(magnitude1) * Math.sqrt(magnitude2)

  dot_product / magnitude_product
end

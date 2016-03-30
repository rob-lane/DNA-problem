require 'yaml'
# DNA
# Create an object using bases which can output
# amino acids.
class DNA

  class << self
    def codon_to_aa 
      @codon_to_aa ||= YAML.load(File.read(File.expand_path('../../config/codon_to_aa.yml', __FILE__)))
    end

    def common_sequence(*sequences)
      base_string = sequences.min_by(&:length)
      max_length = base_string.length
      max_length.downto(0) do |length|
        0.upto(max_length - length) do |pos|
          substring = base_string[pos, length]
          return substring if sequences.all? { |seq| seq.include? substring }
        end 
      end
    end
  end

  def initialize(base_string)
    @base_string = base_string
  end

  def amino_acids
    current_acid, amino_string = '', ''
    @base_string.each_char do |base_char|
      # Replace 'u' with 't' for RNA sequences
      base_char = 't' if base_char == 'u' 
      current_acid << base_char
      next unless current_acid.length >= 3
      amino_string << DNA.codon_to_aa[current_acid]
      current_acid = ''
    end
    amino_string
  end

end

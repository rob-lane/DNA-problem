require 'spec_helper'
require 'dna'

RSpec.describe DNA do 
  
  subject { DNA.new(base_string) }
  let(:base_string) { '' }

  context 'given a valid base string' do 

    let(:base_string) { 'atgcattga' }

    it 'can produce an amino acids string' do 
      expect(subject.amino_acids).to eq('MH*')
    end

  end

  context 'given a RNA sequence' do 

    let (:base_string) { 'augcauuga' }

    it 'can produce an amino acids string' do 
      expect(subject.amino_acids).to eq('MH*')
    end

  end

  context 'given two sequences' do 

    let(:seq_a) { 'abcdefghijklmnopqrstuvwxyz' }
    let(:seq_b) { 'zyxuabctsrqdefghijktuv' }

    it 'finds the longest shared sequence' do 
      expect(DNA.common_sequence(seq_a, seq_b)).to eq('defghijk')
    end

  end

end

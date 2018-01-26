# frozen_string_literal: true

require_relative 'scoring'

RSpec.describe Scoring do
  describe '#score_letter' do
    context 'invalid language' do
      it "raises an exception for no language" do
        expect { described_class.new }.to raise_error ArgumentError
      end
      it "raises an exception for an invalid language" do
        expect { described_class.new(:esperanto) }.to raise_error ArgumentError
      end

    end

    context 'in English' do
      subject { described_class.new(:english) }
      %w[A E I O U L N R S T].each do |letter|
        it "scores a #{letter} as 1 point" do
          expect(subject.score_letter(letter))
            .to eq 1
        end
      end

      %w[D G].each do |letter|
        it "scores a #{letter} as 2 point" do
          expect(subject.score_letter(letter))
            .to eq 2
        end
      end

      %w[B C M P].each do |letter|
        it "scores a #{letter} as 3 point" do
          expect(subject.score_letter(letter))
            .to eq 3
        end
      end

      %w[F H V W Y].each do |letter|
        it "scores a #{letter} as 4 point" do
          expect(subject.score_letter(letter))
            .to eq 4
        end
      end

      %w[K].each do |letter|
        it "scores a #{letter} as 5 point" do
          expect(subject.score_letter(letter))
            .to eq 5
        end
      end

      %w[J X].each do |letter|
        it "scores a #{letter} as 8 point" do
          expect(subject.score_letter(letter))
            .to eq 8
        end
      end

      %w[Q Z].each do |letter|
        it "scores a #{letter} as 10 point" do
          expect(subject.score_letter(letter))
            .to eq 10
        end
      end
      %w[Ñ].each do |letter|
        it "raises an exception for an invalid letter (#{letter})" do
          expect {subject.score_letter(letter)}.to raise_error ArgumentError
        end
      end
    end

    context 'in Spanish' do
      subject { described_class.new(:spanish) }
      %w[A E O S I U N L R T].each do |letter|
        it "scores a #{letter} as 1 point" do
          expect(subject.score_letter(letter))
            .to eq 1
        end
      end

      %w[C D G].each do |letter|
        it "scores a #{letter} as 2 point" do
          expect(subject.score_letter(letter))
            .to eq 2
        end
      end

      %w[B M P].each do |letter|
        it "scores a #{letter} as 3 point" do
          expect(subject.score_letter(letter))
            .to eq 3
        end
      end

      %w[F H V Y].each do |letter|
        it "scores a #{letter} as 4 point" do
          expect(subject.score_letter(letter))
            .to eq 4
        end
      end

      %w[J].each do |letter|
        it "scores a #{letter} as 5 point" do
          expect(subject.score_letter(letter))
            .to eq 6
        end
      end

      %w[K LL Ñ Q RR W X].each do |letter|
        it "scores a #{letter} as 8 point" do
          expect(subject.score_letter(letter))
            .to eq 8
        end
      end

      %w[Z].each do |letter|
        it "scores a #{letter} as 10 point" do
          expect(subject.score_letter(letter))
            .to eq 10
        end
      end

      %w[0].each do |letter|
        it "raises an exception for an invalid letter (#{letter})" do
          expect {subject.score_letter(letter)}.to raise_error ArgumentError
        end
      end

    end
  end
end

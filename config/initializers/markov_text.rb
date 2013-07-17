require 'markov_class' # Connects to TwitterMarkov class in lib

# Generates sample text from Monty Python & Star Trek raw text file
sample_text = open(Rails.root+"lib/markov_class/python_trek.txt").read()

# Creates an instance of hashes with python and trek words
MARKOV_TEXT = TwitterMarkov.new sample_text
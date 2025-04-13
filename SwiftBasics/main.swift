import Foundation

print("Initialized Command Project.")

let paragraph =
"""
This is amazing. I am creating this paragraph example. And i am also learning other stuff too.

I would like to know much about how Swift will evolve in Ml in future. Yes, for now we can focus on this basuc stuffs.

Hell yahh! We are success.
"""

let nlpBasics = NLPBasics()

nlpBasics.languageIdentifier(string: "How are you?")
nlpBasics.languageIdentifier(string: "Cómo estás hoy?")
nlpBasics.languageIdentifier(string: "Wie geht es dir?")

nlpBasics.languageHypothisis(string: "How are you?")
nlpBasics.languageHypothisis(string: "Cómo estás hoy?")
nlpBasics.languageHypothisis(string: "Wie geht es dir?")

nlpBasics.tokeniseWords(string: "How are you doing today?")
nlpBasics.tokeniseSentence(string: "How are you doing today? This is so cool! And also, I love Swift. I am learning NLP.")
nlpBasics.tokeniseParagraph(string: paragraph)
nlpBasics.tokeniseDocument(string: paragraph)

nlpBasics.lemmatizationWord(string: "How are you doing today? This is so cool! And also, I love Swift. I am learning Natural Language Processing.")
nlpBasics.lemmatizationSentence(string: "How are you doing today? This is so cool! And also, I love Swift. I am learning Natural Language Processing.")
nlpBasics.lemmatizationParagraph(string: paragraph)
nlpBasics.lemmatizationDocument(string: paragraph)

nlpBasics.sentimentWord(string: "Wow")
nlpBasics.sentimentSentence(string: "I love this product!")
nlpBasics.sentimentParagraph(string: "I absolutely love this product! It’s amazing and works perfectly.")
nlpBasics.sentimentDocument(string: "I absolutely love this product! It’s amazing and works perfectly.")

nlpBasics.partsOfSpeechWord(string: "I absolutely love this product! It’s amazing and works perfectly.")
nlpBasics.partsOfSpeechSentence(string: "I absolutely love this product! It’s amazing and works perfectly.")
nlpBasics.partsOfSpeechParagraph(string: "I absolutely love this product! It’s amazing and works perfectly.")
nlpBasics.partsOfSpeechDocumnet(string: "I absolutely love this product! It’s amazing and works perfectly.")

//nlpBasics.identifyPersonNames(string: "Hi, My name is Harish. I am a not working in Google and i am from India.") // Didn't work for person name
nlpBasics.identifyPersonNames(string: "Hi, My name is Harish Kumar. I am a not working in Google and i am from India.")
nlpBasics.identifyPlaceNames(string: "Hi, My name is Harish Kumar. I am a not working in Google and i am from India.")
nlpBasics.identifyOrganizationNames(string: "Hi, My name is Harish Kumar. I am a not working in Google and i am from India.")

nlpBasics.extractWordVector(string: "Car")
nlpBasics.distanceBetweenTwoWords(string1: "Car", string2: "Bike")
nlpBasics.neighbourOfWord(string: "Pen")
nlpBasics.neighbourWordsBetweenTwoWords(string1: "Car", string2: "Bike")

nlpBasics.sentenceEmbedding(string: "I absolutely love this product! It’s amazing and works perfectly.")
nlpBasics.embeddingBetweenTwoSentences(string1: "This is good.", string2: "This is best.")

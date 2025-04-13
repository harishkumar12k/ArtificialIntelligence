// https://www.youtube.com/watch?v=iAyj_yin1cc

import NaturalLanguage

class NLPBasics {
    
    init() {
        print("NLPBasics init")
    }
    
    func languageIdentifier(string: String) {
        let identifier = NLLanguageRecognizer()
        identifier.processString(string)
        if let languageCode = identifier.dominantLanguage?.rawValue {
            print("\(#function) :: \(string) :: Language Identified as: \(languageCode) :: \(languageCode.languageNameFromCode() ?? "Unknown Format of Code")")
        } else {
            print("\(#function) :: \(string) :: Language Identified as: Unknown")
        }
    }
    
    func languageHypothisis(string: String) {
        let identifier = NLLanguageRecognizer()
        identifier.processString(string)
        let languageCodes = identifier.languageHypotheses(withMaximum: 5)
        for (language, confidence) in languageCodes {
            let languageCode = language.rawValue
            print("\(#function) :: \(string) :: Language Identified as: \(languageCode) :: \(languageCode.languageNameFromCode() ?? "Unknown Format of Code") :: Confidence: \(confidence.convertNotaionToNormal())")
        }
    }
    
    func tokeniseWords(string: String) {
        let tokenizer = NLTokenizer(unit: .word)
        tokenizer.string = string
        tokenizer.enumerateTokens(in: string.startIndex..<string.endIndex) { index, attribute in
            print(string[index])
            return true
        }
    }
    
    func tokeniseSentence(string: String) {
        let tokenizer = NLTokenizer(unit: .sentence)
        tokenizer.string = string
        tokenizer.enumerateTokens(in: string.startIndex..<string.endIndex) { index, attribute in
            print(string[index])
            return true
        }
    }
    
    func tokeniseParagraph(string: String) {
        let tokenizer = NLTokenizer(unit: .paragraph)
        tokenizer.string = string
        tokenizer.enumerateTokens(in: string.startIndex..<string.endIndex) { index, attribute in
            print(string[index])
            return true
        }
    }
    
    /**
     .document isn’t for splitting — it just treats the whole string as one token.
     It's useful for uniformity when switching between .word, .sentence, .paragraph, and .document, so your code can be generalized.
     */
    func tokeniseDocument(string: String) {
        let tokenizer = NLTokenizer(unit: .document)
        tokenizer.string = string
        tokenizer.enumerateTokens(in: string.startIndex..<string.endIndex) { index, attribute in
            print(string[index])
            return true
        }
    }
    
    func lemmatizationWord(string: String) {
        let tagger = NLTagger(tagSchemes: [.lemma])
        tagger.string = string
        tagger.enumerateTags(in: string.startIndex..<string.endIndex, unit: .word, scheme: .lemma) { tag, tokenRange in
            if let tag = tag {
                print("\(string[tokenRange]): \(tag.rawValue)")
            }
            return true
        }
    }
    
    func lemmatizationSentence(string: String) {
        let tagger = NLTagger(tagSchemes: [.lemma])
        tagger.string = string
        tagger.enumerateTags(in: string.startIndex..<string.endIndex, unit: .sentence, scheme: .lemma) { tag, tokenRange in
            if let tag = tag {
                print("\(string[tokenRange]): \(tag.rawValue)")
            }
            return true
        }
    }
    
    func lemmatizationParagraph(string: String) {
        let tagger = NLTagger(tagSchemes: [.lemma])
        tagger.string = string
        tagger.enumerateTags(in: string.startIndex..<string.endIndex, unit: .paragraph, scheme: .lemma) { tag, tokenRange in
            if let tag = tag {
                print("\(string[tokenRange]): \(tag.rawValue)")
            }
            return true
        }
    }
    
    // TODO: Check why received Nil for `tag`
    func lemmatizationDocument(string: String) {
        let tagger = NLTagger(tagSchemes: [.lemma])
        tagger.string = string
        tagger.enumerateTags(in: string.startIndex..<string.endIndex, unit: .document, scheme: .lemma) { tag, tokenRange in
            if let tag = tag {
                print("\(string[tokenRange]): \(tag.rawValue)")
            }
            return true
        }
    }
    
    /// This is not possible
    func sentimentWord(string: String) {
        let tagger = NLTagger(tagSchemes: [.sentimentScore])
        tagger.string = string
        let (sentiment, range) = tagger.tag(at: string.startIndex, unit: .word, scheme: .sentimentScore)
        print("Sentiment: \(sentiment?.rawValue ?? "Unknown"), Range: \(range)")
    }
    
    func sentimentSentence(string: String) {
        let tagger = NLTagger(tagSchemes: [.sentimentScore])
        tagger.string = string
        tagger.setLanguage(.english, range: string.startIndex..<string.endIndex)
        tagger.enumerateTags(in: string.startIndex..<string.endIndex, unit: .sentence,  scheme: .sentimentScore, options: [.omitWhitespace, .omitPunctuation]) { tag, range in
            if let tag = tag {
                let sentence = String(string[range])
                print("\"\(sentence)\" -> Sentiment score: \(tag.rawValue)")
            } else {
                print("\"\(string[range])\" -> No sentiment score")
            }
            return true
        }
    }
    
    func sentimentParagraph(string: String) {
        let tagger = NLTagger(tagSchemes: [.sentimentScore])
        tagger.string = string
        tagger.setLanguage(.english, range: string.startIndex..<string.endIndex)
        tagger.enumerateTags(in: string.startIndex..<string.endIndex, unit: .paragraph,  scheme: .sentimentScore, options: [.omitWhitespace, .omitPunctuation]) { tag, range in
            if let tag = tag {
                let sentence = String(string[range])
                print("\"\(sentence)\" -> Sentiment score: \(tag.rawValue)")
            } else {
                print("\"\(string[range])\" -> No sentiment score")
            }
            return true
        }
    }
    
    /// This is not possible
    func sentimentDocument(string: String) {
        let tagger = NLTagger(tagSchemes: [.sentimentScore])
        tagger.string = string
        tagger.setLanguage(.english, range: string.startIndex..<string.endIndex)
        tagger.enumerateTags(in: string.startIndex..<string.endIndex, unit: .document,  scheme: .sentimentScore, options: [.omitWhitespace, .omitPunctuation]) { tag, range in
            if let tag = tag {
                let sentence = String(string[range])
                print("\"\(sentence)\" -> Sentiment score: \(tag.rawValue)")
            } else {
                print("\"\(string[range])\" -> No sentiment score")
            }
            return true
        }
    }
    
    func partsOfSpeechWord(string: String) {
        let tagger = NLTagger(tagSchemes: [.lexicalClass])
        tagger.string = string
        tagger.setLanguage(.english, range: string.startIndex..<string.endIndex)
        tagger.enumerateTags(in: string.startIndex..<string.endIndex, unit: .word,  scheme: .lexicalClass, options: [.omitWhitespace, .omitPunctuation]) { tag, range in
            if let tag = tag {
                let sentence = String(string[range])
                print("\"\(sentence)\" -> lexical class: \(tag.rawValue)")
            } else {
                print("\"\(string[range])\" -> No lexical class")
            }
            return true
        }
    }
    
    /// Should not used
    func partsOfSpeechSentence(string: String) {
        let tagger = NLTagger(tagSchemes: [.lexicalClass])
        tagger.string = string
        tagger.setLanguage(.english, range: string.startIndex..<string.endIndex)
        tagger.enumerateTags(in: string.startIndex..<string.endIndex, unit: .sentence,  scheme: .lexicalClass, options: [.omitWhitespace, .omitPunctuation]) { tag, range in
            if let tag = tag {
                let sentence = String(string[range])
                print("\"\(sentence)\" -> lexical class: \(tag.rawValue)")
            } else {
                print("\"\(string[range])\" -> No lexical class")
            }
            return true
        }
    }
    
    /// Should not used
    func partsOfSpeechParagraph(string: String) {
        let tagger = NLTagger(tagSchemes: [.lexicalClass])
        tagger.string = string
        tagger.setLanguage(.english, range: string.startIndex..<string.endIndex)
        tagger.enumerateTags(in: string.startIndex..<string.endIndex, unit: .paragraph,  scheme: .lexicalClass, options: [.omitWhitespace, .omitPunctuation]) { tag, range in
            if let tag = tag {
                let sentence = String(string[range])
                print("\"\(sentence)\" -> lexical class: \(tag.rawValue)")
            } else {
                print("\"\(string[range])\" -> No lexical class")
            }
            return true
        }
    }
    
    /// Should not used
    func partsOfSpeechDocumnet(string: String) {
        let tagger = NLTagger(tagSchemes: [.lexicalClass])
        tagger.string = string
        tagger.setLanguage(.english, range: string.startIndex..<string.endIndex)
        tagger.enumerateTags(in: string.startIndex..<string.endIndex, unit: .document,  scheme: .lexicalClass, options: [.omitWhitespace, .omitPunctuation]) { tag, range in
            if let tag = tag {
                let sentence = String(string[range])
                print("\"\(sentence)\" -> lexical class: \(tag.rawValue)")
            } else {
                print("\"\(string[range])\" -> No lexical class")
            }
            return true
        }
    }
    
    func identifyPersonNames(string: String) {
        let options: NLTagger.Options = [.omitWhitespace, .omitPunctuation, .joinNames]
        let tags: [NLTag] = [.personalName]
        
        let tagger = NLTagger(tagSchemes: [.nameType])
        tagger.string = string
        
        tagger.enumerateTags(in: string.startIndex..<string.endIndex, unit: .word, scheme: .nameType, options: options) { tag, range in
            if let tag = tag, tags.contains(tag) {
                let (hypotheses, _) = tagger.tagHypotheses(at: range.lowerBound, unit: .word, scheme: .nameType, maximumCount: 1)
                let name = String(string[range])
                print("\"\(name)\" -> \(tag.rawValue) :: Hypotheses: \(hypotheses)")
            }
            return true
        }
    }
    
    func identifyPlaceNames(string: String) {
        let options: NLTagger.Options = [.omitWhitespace, .omitPunctuation, .joinNames]
        let tags: [NLTag] = [.placeName]
        
        let tagger = NLTagger(tagSchemes: [.nameType])
        tagger.string = string
        
        tagger.enumerateTags(in: string.startIndex..<string.endIndex, unit: .word, scheme: .nameType, options: options) { tag, range in
            if let tag = tag, tags.contains(tag) {
                let (hypotheses, _) = tagger.tagHypotheses(at: range.lowerBound, unit: .word, scheme: .nameType, maximumCount: 1)
                let name = String(string[range])
                print("\"\(name)\" -> \(tag.rawValue) :: Hypotheses: \(hypotheses)")
            }
            return true
        }
    }
    
    func identifyOrganizationNames(string: String) {
        let options: NLTagger.Options = [.omitWhitespace, .omitPunctuation, .joinNames]
        let tags: [NLTag] = [.organizationName]
        
        let tagger = NLTagger(tagSchemes: [.nameType])
        tagger.string = string
        
        tagger.enumerateTags(in: string.startIndex..<string.endIndex, unit: .word, scheme: .nameType, options: options) { tag, range in
            if let tag = tag, tags.contains(tag) {
                let (hypotheses, _) = tagger.tagHypotheses(at: range.lowerBound, unit: .word, scheme: .nameType, maximumCount: 1)
                let name = String(string[range])
                print("\"\(name)\" -> \(tag.rawValue) :: Hypotheses: \(hypotheses)")
            }
            return true
        }
    }
    
    func extractWordVector(string: String) {
        let embedding = NLEmbedding.wordEmbedding(for: .english)
        let vector = embedding?.vector(for: string.lowercased())
        print("All Vetors for \(string):\n \(vector ?? [])\n")
    }
    
    func distanceBetweenTwoWords(string1: String, string2: String) {
        let embedding = NLEmbedding.wordEmbedding(for: .english)
        let distance = embedding?.distance(between: string1.lowercased(), and: string2.lowercased())
        print("Distance between \(string1) and \(string2): \(distance ?? 0.0)\n")
    }
    
    func neighbourOfWord(string: String) {
        let embedding = NLEmbedding.wordEmbedding(for: .english)
        let _ = embedding?.enumerateNeighbors(for: string.lowercased(), maximumCount: 5) { neighbourString, distance in
            print("Neighbour for \(string) :: \(neighbourString) :: Distance :: \(distance)")
            return true
        }
    }
    
    func neighbourWordsBetweenTwoWords(string1: String, string2: String) {
        let embedding = NLEmbedding.wordEmbedding(for: .english)
        let vector1 = embedding?.vector(for: string1.lowercased())
        let vector2 = embedding?.vector(for: string2.lowercased())
        let vector = zip(vector1 ?? [], vector2 ?? []).map({ $0 + $1 })
        embedding?.enumerateNeighbors(for: vector, maximumCount: 5) { neighbourString, distance in
            print("Neighbour for \(string1) and \(string2) :: \(neighbourString) :: Distance :: \(distance)")
            return true
        }
    }
    
    func sentenceEmbedding(string: String) {
        let embedding = NLEmbedding.sentenceEmbedding(for: .english)
        if let vector = embedding?.vector(for: string) {
            print("Vector for \(string): \(vector)")
        }
    }
    
    func embeddingBetweenTwoSentences(string1: String, string2: String) {
        let embedding = NLEmbedding.sentenceEmbedding(for: .english)
        let distance = embedding?.distance(between: string1, and: string2)
        print("Distance for \(string1) and \(string2): \(distance ?? 0)")
    }
    
}

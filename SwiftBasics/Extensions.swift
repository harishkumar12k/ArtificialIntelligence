import Foundation

extension String {

    func languageNameFromCode(in locale: Locale = Locale.current) -> String? {
        return locale.localizedString(forLanguageCode: self)
    }
    
}

extension Double {
    
    func convertNotaionToNormal() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 20
        formatter.minimumFractionDigits = 0
        formatter.usesGroupingSeparator = false

        if let formatted = formatter.string(from: NSNumber(value: self)) {
            return formatted
        }
        return ""
    }
}

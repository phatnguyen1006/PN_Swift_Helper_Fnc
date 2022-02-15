import UIKit

final class dateFormatterConfig {
    public static var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .long
        //Fix this so real device can run without error
        formatter.locale = Locale(identifier: "en_US")
        return formatter
    }()   
}

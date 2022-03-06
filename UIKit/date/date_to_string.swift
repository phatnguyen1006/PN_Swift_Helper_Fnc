import Foundation


func convertToString(_ date: Date) -> String {

  // Create Date Formatter
  let dateFormatter = DateFormatter()

  // Set Date Format
  dateFormatter.dateFormat = "YY/MM/dd"
  /*
    "y, M d"                // 2020, 10 29
    "YY, MMM d"             // 20, Oct 29
    "YY, MMM d, hh:mm"      // 20, Oct 29, 02:18
    "YY, MMM d, HH:mm:ss"   // 20, Oct 29, 14:18:31
  */

  // Convert Date to String
  return dateFormatter.string(from: date)
}

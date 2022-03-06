func convertSpecifiedDateToISODate(_ date: String) -> Date {
  /// date: 2022-02-08T03:45:51Z ->
  let formatter = ISO8601DateFormatter()
  return formatter.date(from: date ?? Date()
}
  
func convertISODateToSpecifiedDate(_ date: Date) -> String {
  /// date: -> 2022-02-08T03:45:51Z
  let formatter = ISO8601DateFormatter()
  return formatter.string(from: date) ?? formatter.string(from: Date(timeIntervalSince1970: 0))
}

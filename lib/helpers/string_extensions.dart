extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String cleanString() {
    final cleaned = replaceAll(RegExp(r'\s+'), ' ') // replaces \n, \t, multiple spaces
        .trim(); // remove leading/trailing whitespace

    if (cleaned.isEmpty) return cleaned;

    return cleaned[0].toUpperCase() + cleaned.substring(1).toLowerCase();
  }
}

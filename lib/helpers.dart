extension MyInt on int {
  String toDateFormat() {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(this);
    return "${dateTime.day}-${dateTime.month}-${dateTime.year}";
  }
}

double myCardCorner = 4.0;

String cutString(String s) {
  if (s.length > 20) {
    return s.replaceRange(20, s.length, '...');
  } else {
    return s;
  }
}

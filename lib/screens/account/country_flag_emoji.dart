String countryToEmoji(String? countryCode) {
  if (countryCode == null) return 'πΊπΈ';
  final cn = countryCode.toLowerCase().trim();
  switch (cn) {
    case 'usa':
      return 'πΊπΈ';
    case 'us':
      return 'πΊπΈ';
    case 'united states':
      return 'πΊπΈ';
    case 'united states of america':
      return 'πΊπΈ';
    case 'united states america':
      return 'πΊπΈ';
    case 'america':
      return 'πΊπΈ';
    case 'cad':
      return 'π¨π¦';
    case 'canada':
      return 'π¨π¦';
    case 'haiti':
      return 'π­πΉ';
    case 'mx':
      return 'π²π½';
    case 'mex':
      return 'π²π½';
    case 'mexico':
      return 'π²π½';
    default:
      return 'πΊπΈ';
  }
}

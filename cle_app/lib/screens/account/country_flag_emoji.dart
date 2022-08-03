String countryToEmoji(String? countryCode) {
  if (countryCode == null) return '🇺🇸';
  final cn = countryCode.toLowerCase().trim();
  switch (cn) {
    case 'usa':
      return '🇺🇸';
    case 'us':
      return '🇺🇸';
    case 'united states':
      return '🇺🇸';
    case 'united states of america':
      return '🇺🇸';
    case 'united states america':
      return '🇺🇸';
    case 'america':
      return '🇺🇸';
    case 'cad':
      return '🇨🇦';
    case 'canada':
      return '🇨🇦';
    case 'haiti':
      return '🇭🇹';
    case 'mx':
      return '🇲🇽';
    case 'mex':
      return '🇲🇽';
    case 'mexico':
      return '🇲🇽';
    default:
      return '🇺🇸';
  }
}

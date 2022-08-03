String shipmentStatusCode(String code) {
  switch (code) {
    case 'AC':
      return 'Accepted';
    case 'IT':
      return 'In Transit';
    case 'DE':
      return 'Delivered';
    case 'UN':
      return 'Unknown';
    case 'AT':
      return 'Delivery Attempt';
    case 'NY':
      return 'Not Yet In System';
    case 'EX':
      return 'Exception';
    case 'AP':
      return 'pending acceptance';
    case 'PD':
      return 'Pending';
    default:
      return 'Unknown';
  }
}

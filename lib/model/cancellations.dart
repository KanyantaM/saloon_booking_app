class Cancellation {
  final String cancellationReason;
  final DateTime cancellationTime;
  final String userName;

  Cancellation({
    required this.userName,
    required this.cancellationTime,
    this.cancellationReason = '',
  });
}

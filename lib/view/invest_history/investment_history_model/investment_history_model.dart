class Investment {
  final int id;
  final double amount;
  final double beforeBalance;
  final double afterBalance;
  final double profit;
  final int maxProfitGenerateDays;
  final int earnDay;
  final int status;
  final DateTime investmentStartDate;
  final DateTime investmentEndDate;
  final DateTime createdAt;
  final int userId;
  final int walletId;
  final int packageId;
  final Package package;

  Investment({
    required this.id,
    required this.amount,
    required this.beforeBalance,
    required this.afterBalance,
    required this.profit,
    required this.maxProfitGenerateDays,
    required this.earnDay,
    required this.status,
    required this.investmentStartDate,
    required this.investmentEndDate,
    required this.createdAt,
    required this.userId,
    required this.walletId,
    required this.packageId,
    required this.package,
  });

  factory Investment.fromJson(Map<String, dynamic> json) {
    return Investment(
      id: json['id'],
      amount: json['amount'].toDouble(),
      beforeBalance: json['before_balance'].toDouble(),
      afterBalance: json['after_balance'].toDouble(),
      profit: json['profit'].toDouble(),
      maxProfitGenerateDays: json['max_profit_generate_days'],
      earnDay: json['earn_day'],
      status: json['status'],
      investmentStartDate: DateTime.parse(json['investment_start_date']),
      investmentEndDate: DateTime.parse(json['investment_end_date']),
      createdAt: DateTime.parse(json['created_at']),
      userId: json['user_id'],
      walletId: json['wallet_id'],
      packageId: json['package_id'],
      package: Package.fromJson(json['package']),
    );
  }
}

class Package {
  final int id;
  final String packageName;
  final double amount;
  final double dailyReturnOfInvest;
  final int maxReturnOfInvestDays;

  Package({
    required this.id,
    required this.packageName,
    required this.amount,
    required this.dailyReturnOfInvest,
    required this.maxReturnOfInvestDays,
  });

  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(
      id: json['id'],
      packageName: json['package'],
      amount: json['amount'].toDouble(),
      dailyReturnOfInvest: json['daily_return_of_invest'].toDouble(),
      maxReturnOfInvestDays: json['max_return_of_invest_days'],
    );
  }
}
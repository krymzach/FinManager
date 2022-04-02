class User {
  final String fullName;
  final String email;
  final String password;
  final String id;
  final double wealth;
  // Daily Wealth Over Past Year Format:
  // WWWW.WW_MM/DD/YYYY
  // W is for Wealth
  // MM/DD/YYYY is for Date where M is Month, D is Day, Y is Year
  final List<dynamic> dailyWealthOverPastYear;
  final List<dynamic> tickers;
  // Expenses/Incomes Format:
  // PP.PP_CCCCCCCC_MM/DD/YYYY_DESCDESCDESCDESCDESC
  // P is for Price
  // C is for Category
  // MM/DD/YYYY is for Date where M is Month, D is Day, Y is Year
  // DESC is for Description
  final List<dynamic> expenses;
  final List<dynamic> incomes;

  User({
    required this.fullName,
    required this.email,
    required this.password,
    required this.wealth,
    required this.dailyWealthOverPastYear,
    required this.id,
    required this.tickers,
    required this.expenses,
    required this.incomes
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      fullName: json['full_name'],
      email: json['email'],
      password: json['password'],
      wealth: json['wealth'] ?? 0,
      dailyWealthOverPastYear: json['dailyWealthOverPastYear'] ?? [],
      id: json['_id'],
      tickers: json['tickers'] ?? [],
      expenses: json['expenses'] ?? [],
      incomes: json['incomes'] ?? [],
    );
  }
}
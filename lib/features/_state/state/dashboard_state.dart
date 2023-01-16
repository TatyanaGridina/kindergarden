class DashboardState {
  final String title;

  DashboardState({
    this.title = '',
  });

  DashboardState copyWith({
    String? title,
  }) =>
      DashboardState(
        title: title ?? this.title,
      );
}

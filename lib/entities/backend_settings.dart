class BackendSettings {
  String url;
  String login;
  String password;

  BackendSettings({this.url = '', this.login = '', this.password = ''});

  BackendSettings copyWith({
    String? url,
    String? login,
    String? password,
  }) =>
      BackendSettings(
        url: url ?? this.url,
        login: login ?? this.login,
        password: password ?? this.password,
      );
}

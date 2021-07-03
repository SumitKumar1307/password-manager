class Password {
  String service = "";
  String password = "";
  String passwordHidden = "";

  Password(String service, String password) {
    this.service = service;
    this.password = password;
    this.passwordHidden = '*' * password.length;
  }
}

List<Password> passwords = [
  Password("Google", "123456"),
  Password("Twitter", "12346"),
  Password("Instagram", "12356986"),
  Password("Facebook", "12345678"),
  Password("Dribbble", "dribble.com"),
  Password("Epic Games", "epicgames.com"),
  Password("Steam", "steam.org"),
];
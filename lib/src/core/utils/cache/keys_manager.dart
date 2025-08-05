class KeysManager {
  KeysManager._privateConstructor();

  static final KeysManager _instance = KeysManager._privateConstructor();

  factory KeysManager() {
    return _instance;
  }
  // [Boxes]
  static const String userBox = "user_box";
  // [Keys]
  static const String loginAccounts = "login_accounts";

}

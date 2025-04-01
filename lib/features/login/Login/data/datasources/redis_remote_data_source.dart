import 'package:redis/redis.dart';

class RedisRemoteDataSource {
  late final RedisConnection _connection;
  Command? _command;

  RedisRemoteDataSource();

  // ✅ Initialize Redis connection
  Future<void> init() async {
    if(_command != null){
      print("❌ Redis connection already established");
      return;
    }
    try {
      _connection = RedisConnection();
      _command = await _connection.connect('10.0.2.2', 6379);
      print("✅ Redis Connected");
    } catch (e) {
      print("❌ Error connecting to Redis: $e");
      _command = null;
    }
  }

  // ✅ Signup Function
  // Future<bool> signup(String loginid, String password) async {
  //   if (_command == null) {
  //     print("❌ Redis connection is not established");
  //     return false;
  //   }
  //   try {
  //     if (loginid.isEmpty || password.isEmpty) {
  //       print("❌ Please enter loginid and password");
  //       return false;
  //     }
  //     // Check if user already exists
  //     final existingUser = await _command!.send_object([
  //       'HGET',
  //       'user:$loginid',
  //       'password',
  //     ]);
  //     if (existingUser != null) {
  //       print("⚠️ Bhai! Already Registered hai");
  //       return false;
  //     }

  //     // Store user details using HSET
  //     await _command!.send_object([
  //       'HSET',
  //       'user:$loginid',
  //       'password',
  //       password,
  //       'otp',
  //       '12345',
  //     ]);
  //     print("✅ Registered Successfully");
  //     return true;
  //   } catch (e) {
  //     print("❌ Error during signup: $e");
  //     return false;
  //   }
  // }

  // // ✅ Login Function
  // Future<bool> login(String loginid, String password) async {
  //   if (_command == null) {
  //     print("❌ Redis connection is not established");
  //     return false;
  //   }
  //   try {
  //     // Get the stored password for the login ID
  //     final storedPassword = await _command!.send_object([
  //       'HGET',
  //       'user:$loginid',
  //       'password',
  //     ]);
  //     if (storedPassword == password) {
  //       print("✅ Logged In Successfully");
  //       return true;
  //     }
  //     print("❌ Invalid Credentials");
  //     return false;
  //   } catch (e) {
  //     print("❌ Error during login: $e");
  //     return false;
  //   }
  // }

  Future<bool> signup(String loginid, String password) async {
    if (_command == null) {
      print("❌ Redis connection is not established");
      return false;
    }
    try {
      if (loginid.isEmpty || password.isEmpty) {
        print("❌ Please enter login ID and password");
        return false;
      }

      // Check if the user already exists
      final existingUser = await _command!.send_object(['HEXISTS', 'user:$loginid', 'password']);
      if (existingUser == 1) {
        print("⚠️ Bhai! Already Registered hai");
        return false;
      }

      await _command!.send_object([
        'HSET',
        'user:$loginid',
        'password', password,
        'otp', '12345', // Optional field
      ]);

      print("✅ Registered Successfully");
      return true;
    } catch (e) {
      print("❌ Error during signup: $e");
      return false;
    }
  }

  /// **✅ Secure Login Function**
  Future<bool> login(String loginid, String password) async {
    if (_command == null) {
      print("❌ Redis connection is not established");
      return false;
    }
    try {
      // Fetch the stored hashed password from Redis
      final storedPassword = await _command!.send_object([
        'HGET',
        'user:$loginid',
        'password',
      ]);

      if (storedPassword == null) {
        print("❌ User not found");
        return false;
      }

      // Debugging step
      print("🔍 Stored Password from Redis: $storedPassword");

      // Validate password using bcrypt
      if (password == storedPassword.toString()){
        print("✅ Logged In Successfully");
        return true;
      }

      print("❌ Invalid Credentials");
      return false;
    } catch (e) {
      print("❌ Error during login: $e");
      return false;
    }
  }

  // ✅ Forgot Password - Update Password
  Future<bool> updatePassword(String loginid, String newPassword) async {
    if (_command == null) {
      print("❌ Redis connection is not established");
      return false;
    }
    try {
      // Check if user exists
      final exists = await _command!.send_object([
        'HEXISTS',
        'user:$loginid',
        'password',
      ]);
      if (exists == 1) {
        await _command!.send_object([
          'HSET',
          'user:$loginid',
          'password',
          newPassword
        ]);
        print("✅ Password Updated Successfully");
        return true;
      }
      print("❌ User not found");
      return false;
    } catch (e) {
      print("❌ Error during password update: $e");
      return false;
    }
  }

  Future<void> close() async {
    if (_command != null) {
      await _connection.close();
      print("✅ Redis connection closed");
    }
  }
}

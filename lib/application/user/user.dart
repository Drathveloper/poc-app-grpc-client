import 'dart:async';

import 'package:flutter_grpc_poc/domain/user.dart';
import 'package:flutter_grpc_poc/repository/repository/user_api.dart';

class UserService {

  UserService(this._userApiRepository);

  final UserApiRepository _userApiRepository;

  Future<List<ApplicationUser>> bulkLoadCreateUsers({
    users = List<ApplicationUser>
  }) {
    return _userApiRepository.bulkLoadCreateUserUnary(users: users);
  }

  Stream<ApplicationUser> bulkLoadCreateUsersServerStream({
    users = List<ApplicationUser>
  }) {
    return _userApiRepository.bulkLoadCreateUserServerStream(users: users);
  }

  Future<List<ApplicationUser>> bulkLoadCreateUsersClientStream({
    usersStreamController = Stream<ApplicationUser>
  }) {
    return _userApiRepository.bulkLoadCreateUserClientStream(usersStreamController: usersStreamController);
  }

  Stream<ApplicationUser> bulkLoadCreateUsersBidirectionalStream({
    usersStreamController = Stream<ApplicationUser>
  }) {
    return _userApiRepository.bulkLoadCreateUserBidirectionalStream(usersStreamController: usersStreamController);
  }
}

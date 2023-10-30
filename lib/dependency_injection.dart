import 'package:flutter_grpc_poc/application/user/user.dart';
import 'package:flutter_grpc_poc/presentation/user/controllers/create_user.dart';
import 'package:flutter_grpc_poc/presentation/user/screens/create_user_bidirectional.dart';
import 'package:flutter_grpc_poc/presentation/user/screens/create_user_client_stream.dart';
import 'package:flutter_grpc_poc/presentation/user/screens/create_user_server_stream.dart';
import 'package:flutter_grpc_poc/presentation/user/screens/create_user_unary.dart';
import 'package:flutter_grpc_poc/repository/proto/service.pbgrpc.dart';
import 'package:flutter_grpc_poc/repository/repository/user_api.dart';
import 'package:grpc/grpc.dart';

class InjectionContainer {
  late CreateUserUnaryScreen createUserUnaryScreen;
  late CreateUserServerStreamScreen createUserServerStreamScreen;
  late CreateUserClientStreamScreen createUserClientStreamScreen;
  late CreateUserBidirectionalScreen createUserBidirectionalScreen;
}

class DependencyInjection {

  InjectionContainer inject() {
    InjectionContainer container = InjectionContainer();
    final channel = ClientChannel(
        "localhost",
        port: 50052,
        options: const ChannelOptions(credentials: ChannelCredentials.insecure())
    );
    var userServiceClient = UserServiceClient(channel);
    UserApiRepository userApiRepository = UserApiRepository(userServiceClient);
    UserService userService = UserService(userApiRepository);
    CreateUserController createUserController = CreateUserController(userService);
    container.createUserUnaryScreen = CreateUserUnaryScreen(createUserController);
    container.createUserServerStreamScreen = CreateUserServerStreamScreen(createUserController);
    container.createUserClientStreamScreen = const CreateUserClientStreamScreen();
    container.createUserBidirectionalScreen = const CreateUserBidirectionalScreen();
    return container;
  }
}

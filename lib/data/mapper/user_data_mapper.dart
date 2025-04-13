import 'package:injectable/injectable.dart';

import '../../domain/domain.dart';
import '../data.dart';

@injectable
class UserDataMapper extends BaseDataMapper<UserData, UserEntity> {
  const UserDataMapper();

  @override
  UserEntity mapToEntity(UserData? data) {
    return UserEntity(
      id: data?.id ?? '',
      name: data?.name ?? '',
      email: data?.email ?? '',
      avatarUrl: data?.avatarUrl ?? '',
    );
  }
}

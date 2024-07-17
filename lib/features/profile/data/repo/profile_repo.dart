import '../profile_model/profile_model.dart';
import '../wep_service/wep_service.dart';

class ProfileRepo {
  final ProfileWebServices profileWebServices;

  ProfileRepo(this.profileWebServices);

  Future<ProfileModel> getProfile() async {
    final Map<String, dynamic> profileInf =
        await profileWebServices.getProfile();

    return ProfileModel.fromJson(profileInf);
  }
}

import 'package:dartz/dartz.dart';
import 'package:devcode_flutter_starter/data/model/contact_model.dart';
import 'package:devcode_flutter_starter/data/networking/base_service.dart';
import 'package:get/get.dart';

abstract class ContactRepository {
  Future<Either<String, List<ContactItem>>> getContact();
}

class ContactRepositoryImpl extends ContactRepository {

  final baseService = Get.find<BaseService>();

  @override
  Future<Either<String, List<ContactItem>>> getContact() async {
    final response = await baseService.getRequest(url: '/contacts');

    if (response.isOk) {
      final data = ContactModel.fromJson(response.body);

      return Right(data.data ?? []);
    } else {
      return const Left('Tidak ada data');
    }
  }
}
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../components/my_navigate.dart';
import '../../../../components/show_snakBar.dart';
import '../../../../shared/cache_helper.dart';
import '../../../../utilities/routes.dart';
import 'register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isPass = true;
  bool isPassConf = true;
  void changePass() {
    isPass = !isPass;
    emit(ChangePassState());
  }

  void changePassConf() {
    isPassConf = !isPassConf;
    emit(ChangePassState());
  }

  Future<void> register({required BuildContext context}) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) {
        print(value.user);
        navigateAndFinish(context: context, widget: AppRoutes.home);
        CacheHelper.saveData("email", emailController.text);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackBar(
            context: context,
            text: 'يجب ان تكون كلمة المرور 6 حروف او أكثر ',
            success: false);
      } else if (e.code == 'email-already-in-use') {
        showSnackBar(
            context: context,
            text: 'البريد الإلكتروني مستخدم من قبل .',
            success: false);
      }
    } catch (e) {
      showSnackBar(context: context, text: e.toString(), success: false);
      print(e);
    }
  }
}

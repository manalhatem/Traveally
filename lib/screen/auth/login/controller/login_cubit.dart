import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../components/my_navigate.dart';
import '../../../../components/show_snakBar.dart';
import '../../../../utilities/routes.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isPass = true;
  void changePass() {
    isPass = !isPass;
    emit(ChangePassState());
  }

  Future<void> login({required BuildContext context}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) {
        print(value.user);
        navigateAndFinish(context: context, widget: AppRoutes.home);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackBar(
            context: context,
            text: "لا يوجد مستخدم بهذا الايميل.",
            success: false);
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showSnackBar(
            context: context, text: 'كلمة المرور غير صحيحه. ', success: false);
        print('Wrong password provided for that user.');
      }
    }
  }
}

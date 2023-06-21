// FutureBuilder<QuerySnapshot>(
// future: cubit.messages.get(),
// builder: (context, snapShot){
// if(snapShot.hasData){
// for(int i=0; i <snapShot.data!.docs.length;i++ ){
// cubit.messagesList.add(MessageModel.fromJson(snapShot.data!.docs[i]));
// }
// print(snapShot.data!.docs[0]["message"]);
// return SafeArea(
// child: Scaffold(
// body: Padding(
// padding: EdgeInsets.symmetric(horizontal: width(context) * 0.04,
// vertical: height(context) * 0.02),
// child: Column(
// children: [
// Row(
// children: [
// const CircleAvatar(
// radius: 23,
// backgroundImage: AssetImage("assets/images/prof3.jpg"),
// ),
// SizedBox(width: width(context) * 0.04,),
// CustomText(text: "نهال",
// color: Colors.black,
// fontSize: AppFonts.t3,
// fontWeight: FontWeight.w500),
// const Spacer(),
// IconButton(onPressed: () {
// navigatorPop(context);
// },
// icon: const Icon(
// Icons.arrow_forward_outlined, size: 30,))
// ],
// ),
// const Divider(),
// Expanded(
// child: ListView.builder(
// itemCount: cubit.messagesList.length,
// itemBuilder: (context, index) {
// return CustomMessage(isSender: true,
// msg: cubit.messagesList[index]);
// }),
// ),
// ChatCustomTextField(
// suffix: GestureDetector(
// onTap: (){
// cubit.addMessage();
// },
// child: Image.asset(AppImages.send, scale: 3.2,)),
// type: TextInputType.text,
// controller:cubit.messageController,
// ),
// ],
// ),
// )
// ),
// );
// }
// else{
// return Scaffold(body: Center(child: Image.asset(AppImages.loading)));
// }
// });
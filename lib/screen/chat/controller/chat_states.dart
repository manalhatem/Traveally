abstract class ChatStates {}

class InitialChatState extends ChatStates {}
class GetUsersLoading extends ChatStates {}
class GetUsersSuccess extends ChatStates {}
class ChatLoadingMsg extends ChatStates {}
class ChatSuccessMsg extends ChatStates {}
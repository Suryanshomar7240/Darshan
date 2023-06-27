// import 'package:meta/meta.dart';
// import '../models/userModel.dart';

// // User State Model
// @immutable
// class UserState {
//   // Properties or Variables
//   bool loggedIn;
//   String? uid;
//   User? user;

//   // Constructor
//   UserState(
//       {required this.loggedIn,required this.uid, required this.user});

//   // Initial Data
//   factory UserState.initial() {
//     return UserState(loggedIn: false, uid: null, user: null);
//   }

//   // Custom function used in a different way
//   UserState copyWith(UserStateAction action) {
//     return UserState(
//       loggedIn: action.loggedIn ?? loggedIn,
//       uid: action.uid ?? uid,
//       user: action.user ?? user,
//     );
//   }
// }

// class UserStateAction {
//   String type;
//   bool? loggedIn;
//   String? uid;
//   User? user;
//   UserStateAction({
//     required this.type,
//     this.loggedIn,
//     this.uid,
//     this.user
//   });
// }

// // User State Reducer
// UserState userReducer(UserState state, UserStateAction action) {
//   switch (action.type) {
//     case "UPDATE_USER_REDUCER":
//       return state.copyWith(action);
//     default:
//       return state;
//   }
// }

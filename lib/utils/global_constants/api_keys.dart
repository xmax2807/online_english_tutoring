class ApiKeys {
  //Auth and Security
  static const String register = "auth/register";
  static const String loginDefault = "auth/login";
  static const String loginGoogle = "auth/google";
  static const String loginFB = "auth/facebook";
  static const String resetPassword = "user/forgotPassword";
  static const String changePassword = "auth/change-password";
  static const String verifyAccount = "auth/verifyAccount";
  //Tutor
  static const String becomeTeacher = "tutor/register";
  static const String listTutor = "tutor/more";
  static const String feedbackTutor = "user/feedbackTutor";
  static const String tutorInfo = "tutor/";
  static const String searchTutor = "tutor/search";
  static const String addToFav = "user/manageFavoriteTutor";
  // Course
  static const String listCourse = "course";
  static const String courseDetail = "course/";
  //Scedule
  static const String cancelReasons = 'booking/cancel-reason';
  static const String ownSchedule = "schedule";
  static const String schedulesWithTutorId = "schedule";
  static const String bookedClasses = "booking/list/student";
  static const String bookAClass = "booking";
  static const String cancelBooking = "booking/schedule-detail";
  static const String updateStudentReq = "booking/student-request/:bookedId";
  static const String nearestSchedules = "booking/next";
  //UserProfile
  static const String userProfile = "user/info";
  static const String updateInfo = "user/info";
  static const String updateAvatar = "user/uploadAvatar";

  //specialties
  static const String languages = 'category';
  static const String specialties = 'major';
  static const String learnTopic = 'learn-topic';
  static const String testPreparation = 'test-preparation';
  //video call
  static const String totalCallTime = 'call/total';
}

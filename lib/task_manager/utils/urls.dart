class TMUrls {
  static String baseURL = 'https://task-manager-api.ostad.live/api/v1';
  static String SignupURL = '$baseURL/Registration';
  static String LoginURL = '$baseURL/Login';
  static String createTaskURL = '$baseURL/createTask';
  static String taskStatusCountURL = '$baseURL/taskStatusCount';
  static String AllTaskURL(String status) => '$baseURL/listTaskByStatus/$status';
  static String deleteTaskURL(String taskId) => '$baseURL/deleteTask/$taskId';
  static String updateTaskURL(String taskId,String status) => '$baseURL/updateTaskStatus/$taskId/$status';
}
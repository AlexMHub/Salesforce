global class SchedulableClass implements Schedulable {
	global void execute(SchedulableContext sc) {
		MyBatchClass a = new MyBatchClass();
		database.executebatch(a);
	}
}
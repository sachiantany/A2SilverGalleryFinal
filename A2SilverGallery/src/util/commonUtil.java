package util;

import java.util.ArrayList;
import java.util.Properties;

public class commonUtil {
	public static final Properties properties = new Properties();

	public static String generateIDs(ArrayList<String> arrayList) {

		String id;
		int next = arrayList.size();
		next++;
		id = commonConstants.Employee_ID_Prefix + next;
		if (arrayList.contains(id)) {
			next++;
			id = commonConstants.Employee_ID_Prefix + next;
		}
		return id;
	}
	
	public static String generateBusIDs(ArrayList<String> arrayList) {

		String id;
		int next = arrayList.size();
		next++;
		id = commonConstants.Bus_ID_Prefix + next;
		if (arrayList.contains(id)) {
			next++;
			id = commonConstants.Bus_ID_Prefix + next;
		}
		return id;
	}
	
	public static String generateNotificationIDs(ArrayList<String> arrayList) {

		String id;
		int next = arrayList.size();
		next++;
		id = commonConstants.Notification_ID_Prefix + next;
		if (arrayList.contains(id)) {
			next++;
			id = commonConstants.Notification_ID_Prefix + next;
		}
		return id;
	}
	public static String generateSaleIDs(ArrayList<String> arrayList) {

		String id;
		int next = arrayList.size();
		next++;
		id = commonConstants.Sale_ID_Prefix + next;
		if (arrayList.contains(id)) {
			next++;
			id = commonConstants.Sale_ID_Prefix + next;
		}
		return id;
	}
}
		

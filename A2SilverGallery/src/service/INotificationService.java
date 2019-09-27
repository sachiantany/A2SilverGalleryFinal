package service;

import java.util.ArrayList;
import java.util.logging.Logger;

import model.Notification;


public interface INotificationService {

public static final Logger log  = Logger.getLogger(INotificationService.class.getName());
	

	public void addNotification(Notification notification);
	

	public ArrayList<Notification> getNotification();
	

	public Notification getNotificationByID(String NID);
	

	public Notification updateNotification(String NID, Notification notification);
	

	public void removeNotification(String NID);
}


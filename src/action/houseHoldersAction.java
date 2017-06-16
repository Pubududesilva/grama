package action;

import java.awt.event.ActionEvent;

import com.opensymphony.xwork2.ActionSupport;

public class houseHoldersAction extends ActionSupport {

	public String execute() {
		System.out.println("Calling House Holder");
		return "sucess";
		
	}
}

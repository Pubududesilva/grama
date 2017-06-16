package action;

import com.opensymphony.xwork2.ActionSupport;

public class viewTableAction extends ActionSupport {
	public String execute(){
		System.out.println("Hello");
		
		return "sucess";
	}

}

package action;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.im.model.House;
import com.im.model.Societies;

public class saveaddsocietiesAction {
	public String txtorganizationgroup;
	public String txtNameofOrginization;
	public String txtaddressofOrginizationnumber;
	public String txtaddressofOrginizationroad;
	public String txtaddressofOrginizationcity;
	public String txtaddressofOrginizationdistric;
	public String txtRegNumber;
	public String txtStartDate;
	public String txtmembershipnumber;
	public String txtorganizationhelp;
	
public String execute(){
	System.out.println("save socity");
		
		try {
			Societies societies = new Societies();
			societies.setTxtaddressofOrginizationcity(txtaddressofOrginizationcity);
			societies.setTxtaddressofOrginizationdistric(txtaddressofOrginizationdistric);
			societies.setTxtaddressofOrginizationnumber(txtaddressofOrginizationnumber);
			societies.setTxtaddressofOrginizationroad(txtaddressofOrginizationroad);
			societies.setTxtmembershipnumber(txtmembershipnumber);
			societies.setTxtNameofOrginization(txtNameofOrginization);
			societies.setTxtorganizationgroup(txtorganizationgroup);
			societies.setTxtorganizationhelp(txtorganizationhelp);
			societies.setTxtRegNumber(txtRegNumber);
			societies.setTxtStartDate(txtStartDate);
			
			

Configuration c1 = new Configuration();
SessionFactory sf = HibernateUtil.getSessionFactory();
Session session = sf.openSession();
session.beginTransaction();
session.save(societies);
session.getTransaction().commit();

		
	} catch (Exception e) {
		e.printStackTrace();
	}
		
		
		
		
		
		
		return "sucess";
	}

}

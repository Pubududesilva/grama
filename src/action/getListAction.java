package action;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.json.simple.JSONObject;

import com.im.model.Family;

public class getListAction {
	
public List subnumber = new ArrayList<>();
public JSONObject obj = new JSONObject();

	public JSONObject execute(){
		try {


Configuration c1 = new Configuration();
SessionFactory sf = HibernateUtil.getSessionFactory();
Session session = sf.openSession();
session.beginTransaction();
session.getTransaction().commit();

List<Family> employees = session.createQuery("FROM Family where homeSubNumber = 4").list(); 
System.out.println(employees);
for (Iterator iterator = 
employees.iterator(); iterator.hasNext();){
	Family employee = (Family) iterator.next(); 
System.out.print("First Name: " + employee.getEducation_account()); 
subnumber.add(employee.getEducation_account());
obj.put("subvalue", employee.getEducation_account());
}

		
	} catch (Exception e) {
		e.printStackTrace();
	}
		
		return obj;
	}
}

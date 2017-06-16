package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.google.gson.Gson;
import com.im.model.Family;
import com.im.model.House;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;


public class familydetailAction extends ActionSupport {
	public String homeSubNumber;
	public String salararyDetail;
	public String samurdi_account;
	public String people_donation;
	public String people_account;
	public String education_donation;
	public String education_account;
	public String samurdi_donation;
	public String homeNumber;
	public String txtHomeNumber;
	public List subnumber = new ArrayList<>();
	public StringBuilder subNumberStr = new StringBuilder();
	public String jsonRequestdata;
	public JSONObject jsonObj;
	private String name;
	private String familydetail;
	
	
	
	   
public String getFamilydetail() {
		return familydetail;
	}




	public void setFamilydetail(String familydetail) {
		this.familydetail = familydetail;
	}




public String getName() {
		return name;
	}




	public void setName(String name) {
		this.name = name;
	}


public String updatefamilydetails() throws ParseException, IOException {
	
	String x = getFamilydetail();
	String str = familydetail;
	StringBuilder familyIds = new StringBuilder();
	JSONArray jsonarr = (JSONArray)new JSONParser()
            .parse(x);

	

	for (int i = 0; i < jsonarr.size(); i++) {

		JSONObject  object = (JSONObject)jsonarr.get(i);
		
		if(!"".equals(object.get("id").toString())){
			Configuration c1 = new Configuration();
			SessionFactory sf = HibernateUtil.getSessionFactory();
			Session session = sf.openSession();
			session.beginTransaction();
			String x5 = object.get("id").toString();
			Family family = new Family();
			family.setId(Integer.parseInt(object.get("id").toString()));
			family.setHomeSubNumber(object.get("homeSubNumber").toString());
			family.setHomeNumber(object.get("houseId").toString());
			family.setSalararyDetail(object.get("salararyDetail").toString());
			family.setSamurdi_donation(object.get("samurdi_donation").toString());
			family.setSamurdi_account(object.get("samurdi_account").toString());
			family.setPeople_donation(object.get("people_donation").toString());
			family.setPeople_account(object.get("people_account").toString());
			family.setEducation_donation(object.get("education_donation").toString());
			family.setEducation_account(object.get("education_account").toString());
			familyIds.append("'"+object.get("homeSubNumber").toString()+"',");
			session.update(family);
			session.getTransaction().commit();
			
		}
		else{
			Configuration c1 = new Configuration();
			SessionFactory sf = HibernateUtil.getSessionFactory();
			Session session = sf.openSession();
			session.beginTransaction();
			String x5 = object.get("id").toString();
			Family family = new Family();
			family.setHomeSubNumber(object.get("homeSubNumber").toString());
			family.setHomeNumber(object.get("houseId").toString());
			family.setSalararyDetail(object.get("salararyDetail").toString());
			family.setSamurdi_donation(object.get("samurdi_donation").toString());
			family.setSamurdi_account(object.get("samurdi_account").toString());
			family.setPeople_donation(object.get("people_donation").toString());
			family.setPeople_account(object.get("people_account").toString());
			family.setEducation_donation(object.get("education_donation").toString());
			family.setEducation_account(object.get("education_account").toString());
			familyIds.append("'"+object.get("homeSubNumber").toString()+"',");
			session.save(family);
			session.getTransaction().commit();
		}
	
		}
	
	Configuration c1 = new Configuration();
	SessionFactory sf = HibernateUtil.getSessionFactory();
	Session session = sf.openSession();
	session.beginTransaction();
	String familystr = familyIds.toString();
	String substr = familystr.substring(0, familystr.length() - 1);

	String sql = "select * from person_detail where family_id in ("+substr+")";

	SQLQuery query = session.createSQLQuery(sql);


	//Query query = session.createQuery(sql);

	List employees = query.list();

	JSONArray array = new JSONArray();

	List<Object[]> rows = query.list();
	for (Object[] row : rows) {
	    System.out.println(row[0] );
	    System.out.println(row[1] );
	    System.out.println(row[2] );
	    System.out.println(row[3] );
	    
	List<String> list = new ArrayList<>();
		
		
		list.add(row[0].toString() );
		list.add(row[1].toString());
		list.add(row[2].toString());
		list.add(row[3].toString());
		list.add(row[4].toString());
		list.add(row[5].toString());
		list.add(row[6].toString());
		list.add(row[7].toString());
		list.add(row[8].toString());
		list.add(row[9].toString());
		list.add("");
		list.add(row[11].toString());
		list.add(row[12].toString());
		list.add(row[13].toString());
		list.add(row[14].toString());
		list.add(row[15].toString());
		list.add(row[16].toString());
		list.add(row[17].toString());
		list.add(row[18].toString());
		list.add(row[19].toString());
		list.add(row[20].toString());
		list.add(row[21].toString());
		list.add(row[22].toString());
		list.add(row[23].toString());
		list.add(row[24].toString());
		list.add(row[25].toString());
		list.add(row[26].toString());
		array.add(list);
	}

	Gson gson = new Gson();
	String result = gson.toJson(array);
	HttpServletResponse res = ServletActionContext.getResponse();
	res.setContentType("text/plan;charset=utf-8");
	PrintWriter out = res.getWriter();
	out.println(result.toString()+"@@@"+familyIds+"@@");
	System.out.println(result.toString()+"@@@");
	out.flush();
				

	
	return "sucess";
}

public String execute() throws Exception {
	

	
	jsonObj = new JSONObject();
	
	Map sess = ActionContext.getContext().getSession();
//	sess.put("home_number",txtHomeNumber);
	sess.get("home_number");
	System.out.println("Session"+sess.get("home_number"));
		
		try {
			
			String x = getName();
			String str = name;
			JSONObject json = (JSONObject)new JSONParser()
                    .parse(x);
			Family family = new Family();
			
family.setEducation_account(json.get("education_account").toString());
family.setEducation_donation(json.get("education_donation").toString());
family.setHomeSubNumber(json.get("homeSubNumber").toString());
family.setPeople_account(json.get("people_account").toString());
family.setPeople_donation(json.get("people_donation").toString());
family.setSalararyDetail(json.get("salararyDetail").toString());
family.setSamurdi_account(json.get("samurdi_account").toString());
family.setSamurdi_donation(json.get("samurdi_donation").toString());
family.setHomeNumber(json.get("housenumber").toString());
homeNumber = json.get("housenumber").toString();


Configuration c1 = new Configuration();
SessionFactory sf = HibernateUtil.getSessionFactory();
Session session = sf.openSession();
session.beginTransaction();
session.save(family);
session.getTransaction().commit();



Query query = session.createQuery("FROM Family where homeNumber =:code");
query.setParameter("code", homeNumber);
List<Family> employees = query.list();

//List<Family> employees = session.createQuery("FROM Family where homeNumber ="+"'+homeNumber+'").list(); 
System.out.println(employees);
for (Iterator iterator = 
employees.iterator(); iterator.hasNext();){
	Family employee = (Family) iterator.next(); 
System.out.print("First Name: " + employee.getEducation_account()); 
subnumber.add(employee.getHomeSubNumber());
subNumberStr.append(employee.getHomeSubNumber()).append(",");
//jsonObj.put("param", employee.getHomeSubNumber());
}
HttpServletResponse res = ServletActionContext.getResponse();
res.setContentType("text/plan;charset=utf-8");
PrintWriter out = res.getWriter();
out.println(subNumberStr.toString()+"@@@");
out.flush();
		
	} catch (Exception e) {
		e.printStackTrace();
	}
		
		
//		subnumber.add("pubudu");
//		subnumber.add("De Silva");
//		subnumber.add("Thushani");

		
		
		return "sucess";
	}
}

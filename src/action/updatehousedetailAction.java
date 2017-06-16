package action;
import javax.persistence.Query;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.im.model.Family;
import com.im.model.House;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionContext;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;



import org.json.simple.parser.JSONParser;


public class updatehousedetailAction {
	public String txtHomeNumber;
	public String txtRoad;
	public String txtAddress1;
	public String txtAddress2;
	public String txtAddress3;
	public String txtAddress4;
	public String txtTelephone;
	public String txtroof;
	public String txtfloor;
	public String txtwall;
	public String txtflows;
	public String txtland;
	public String txtlandpaper;
	public String txtlandnumber;
	public String water;
	public String txtarea;
	public String electricity;
	public String txttoiletstrue;
	public String txtlandyear;
	public int homeId;
	private String name;
	public String homeNumber; 
	public String houseId;
	public List subnumber = new ArrayList<>();

	public StringBuilder subNumberStr = new StringBuilder();
	
	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String execute(){

		System.out.println("My water " + water);
		try {
			String x = getName();
			String str = name;
			JSONObject json = (JSONObject)new JSONParser()
                    .parse(x);
			House house = new House();
//			house.setId(homeId);
//			house.setHome_number(txtHomeNumber);
//			house.setTxtRoad(txtRoad);
//			house.setTxtAddress1(txtAddress1);
//			house.setTxtAddress2(txtAddress2);
//			house.setTxtAddress3(txtAddress3);
//			house.setTxtAddress4(txtAddress4);
//			house.setTxtTelephone(txtTelephone);
//			house.setTxtroof(txtroof);
//			house.setTxtfloor(txtfloor);
//			house.setTxtwall(txtwall);
//			house.setTxtflows(txtflows);
//			house.setTxtland(txtland);
//			house.setTxtlandpaper(txtlandpaper);
//			house.setTxtlandnumber(txtlandnumber);
//			house.setWater(water);
//			house.setTxtarea(txtarea);
//			house.setElectricity(electricity);
//			house.setTxttoiletstrue(txttoiletstrue);
//			house.setTxtlandyear(txtlandyear);
			
			String house1 = json.get("txtHomeNumber").toString();
			house.setId(Integer.parseInt(json.get("houseId").toString()));
			house.setHome_number(json.get("txtHomeNumber").toString());
			house.setTxtRoad(StringUtils.isNotBlank(json.get("txtRoad").toString()) ? json.get("txtRoad").toString() : "");
			house.setTxtAddress1(json.get("txtAddress1").toString());
			house.setTxtAddress2(json.get("txtAddress2").toString());
			house.setTxtAddress3(json.get("txtAddress3").toString());
			house.setTxtAddress4(json.get("txtAddress4").toString());
			house.setTxtTelephone(json.get("txtTelephone").toString());
			house.setTxtroof(json.get("txtroof").toString());
			house.setTxtfloor(json.get("txtfloor").toString());
			house.setTxtwall(json.get("txtwall").toString());
			house.setTxtflows(json.get("txtflows").toString());
			house.setTxtland(json.get("txtland").toString());
			house.setTxtlandpaper(json.get("txtlandpaper").toString());
			house.setTxtlandnumber(json.get("txtlandnumber").toString());
			house.setWater(json.get("water").toString());
			house.setTxtarea(json.get("txtarea").toString());
			house.setElectricity(json.get("electricity").toString());
			house.setTxttoiletstrue(json.get("txttoiletstrue").toString());
			house.setTxtlandyear(json.get("txtlandyear").toString());
			homeNumber = json.get("txtHomeNumber").toString();
			
			
//			Configuration c1 = new Configuration();
//			SessionFactory sf = HibernateUtil.getSessionFactory();
//			Session session = sf.openSession();
			
//			 SQLQuery sql = sf.getCurrentSession().createSQLQuery("selact sp_updateHouseDetail()");
				 



			//Query query = session.createQuery(sql);

//			List employees = sql.list();
//
//			JSONArray array = new JSONArray();
//
//			List<Object[]> rows = sql.list();
//			
			
			
			

SessionFactory sf = HibernateUtil.getSessionFactory();
Session session = sf.openSession();
session.beginTransaction();
session.update(house);
session.getTransaction().commit();


Configuration c1 = new Configuration();
SessionFactory sf1 = HibernateUtil.getSessionFactory();
Session session1 = sf.openSession();
String sql = "call sp_getfamilydetails('"+homeNumber+"')";
SQLQuery query1 = session.createSQLQuery(sql);
List employees = query1.list();
JSONArray array = new JSONArray();

List<Object[]> rows = query1.list();
for (Object[] row : rows) {	
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
	System.out.println("list "+list);
	array.add(list);
}


			
Gson gson = new Gson();
String result = gson.toJson(array);
System.out.println(result);
HttpServletResponse res = ServletActionContext.getResponse();
res.setContentType("text/plan;charset=utf-8");
PrintWriter out = res.getWriter();
out.println(result.toString()+"@@@"+homeNumber+"@@");
out.flush();
			

		
	} catch (Exception e) {
		e.printStackTrace();
	}
		
		
		
		
		
		
		return "sucess";
	}

}

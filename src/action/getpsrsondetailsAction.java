package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.*;

import javax.persistence.Entity;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Holder;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.mapping.Map;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.google.gson.Gson;
import com.im.model.Family;
import com.im.model.House;
import com.im.model.Person;
import com.im.model.search_house_holder;
import com.opensymphony.xwork2.ActionSupport;



public class getpsrsondetailsAction extends ActionSupport {
	public StringBuilder subNumberStr = new StringBuilder();
	public List subnumber = new ArrayList<>();
	public List<House>  housearr= new ArrayList<>();
	private String msg;
	private String familydetail;
	public String getFamilydetail() {
		return familydetail;
	}
	public void setFamilydetail(String familydetail) {
		this.familydetail = familydetail;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	public String updatepersontails() throws ParseException, IOException{
		
		String x = getFamilydetail();
		String str = familydetail;
		StringBuilder familyIds = new StringBuilder();
		JSONArray jsonarr = (JSONArray)new JSONParser()
	            .parse(x);
		



		for (int i = 0; i < jsonarr.size(); i++) {

			JSONObject  object = (JSONObject)jsonarr.get(i);
			
			if(!"".equals(object.get("id").toString())){

				String x5 = object.get("id").toString();
				Person family = new Person();
				family.setId(Integer.parseInt(object.get("id").toString()));
				family.setPersonSubNumber(object.get("person_sub_no").toString());
				family.setTxtfirstName(object.get("first_name").toString());
				family.setTxtInitial(object.get("relationship").toString());
				family.setTxtIdNumber(object.get("id_number").toString());
				family.setTxtTelephoneNumber(object.get("telephone_number").toString());
				family.setTxtGeneric(object.get("generic").toString());
				family.setTxtBrithday(object.get("birthday").toString());
				family.setTxtsex(object.get("sex").toString());
				family.setTxtSurname(object.get("householder_status").toString());
				
				family.setTxtnameByLetter(object.get("name_by_letter").toString());
				family.setTxtPasspoertNumber(object.get("passport_number").toString());
				family.setTxtEmail(object.get("email").toString());
				family.setTxtReligion(object.get("religion").toString());
				family.setTxtBirthDistric(object.get("birth_distric").toString());
				family.setTxtMarage(object.get("marage").toString());
				family.setTxtJobcatagory(object.get("job_catagory").toString());
				family.setTxtBeforeDistric(object.get("before_live_distric").toString());
				family.setTxtHealth(object.get("health_status").toString());
				family.setTxtJobName(object.get("job_name").toString());
				family.setTxtReasonforLive(object.get("reason_for_commin_live").toString());
				family.setTxtEducationCatagory(object.get("education_catagory").toString());
				family.setTxtSinhalaKnoledge(object.get("sinhala_knoledge").toString());
				family.setTxtEnglishKnoledge(object.get("english_knoledge").toString());
				family.setComputerLiteracy(object.get("computer_knoledge").toString());
				family.setTxtTamilKnoledge(object.get("tamil_knoledge").toString());
				family.setTxtFamilyId(object.get("family_id").toString());
				
				
				
				Configuration c1 = new Configuration();
				SessionFactory sf = HibernateUtil.getSessionFactory();
				Session session = sf.openSession();
				session.beginTransaction();
				session.update(family);
				session.getTransaction().commit();
				
			}
			else{
				
				String x5 = object.get("id").toString();
				Person family = new Person();
				family.setPersonSubNumber(object.get("person_sub_no").toString());
				family.setTxtfirstName(object.get("first_name").toString());
				family.setTxtInitial(object.get("relationship").toString());
				family.setTxtIdNumber(object.get("id_number").toString());
				family.setTxtTelephoneNumber(object.get("telephone_number").toString());
				family.setTxtGeneric(object.get("generic").toString());
				family.setTxtBrithday(object.get("birthday").toString());
				family.setTxtsex(object.get("sex").toString());
				family.setTxtSurname(object.get("householder_status").toString());
				
				family.setTxtnameByLetter(object.get("name_by_letter").toString());
				family.setTxtPasspoertNumber(object.get("passport_number").toString());
				family.setTxtEmail(object.get("email").toString());
				family.setTxtReligion(object.get("religion").toString());
				family.setTxtBirthDistric(object.get("birth_distric").toString());
				family.setTxtMarage(object.get("marage").toString());
				family.setTxtJobcatagory(object.get("job_catagory").toString());
				family.setTxtBeforeDistric(object.get("before_live_distric").toString());
				family.setTxtHealth(object.get("health_status").toString());
				family.setTxtJobName(object.get("job_name").toString());
				family.setTxtReasonforLive(object.get("reason_for_commin_live").toString());
				family.setTxtEducationCatagory(object.get("education_catagory").toString());
				family.setTxtSinhalaKnoledge(object.get("sinhala_knoledge").toString());
				family.setTxtEnglishKnoledge(object.get("english_knoledge").toString());
				family.setComputerLiteracy(object.get("computer_knoledge").toString());
				family.setTxtTamilKnoledge(object.get("tamil_knoledge").toString());
				family.setTxtFamilyId(object.get("family_id").toString());
				Configuration c1 = new Configuration();
				SessionFactory sf = HibernateUtil.getSessionFactory();
				Session session = sf.openSession();
				session.beginTransaction();
				session.save(family);
				session.getTransaction().commit();
			}
		
			}
		
		
		return "sucess";
	}
	
	
	public String execute(){
		System.out.println("Hello");
		setMsg("Hello " );
		
		try {
			Configuration c1 = new Configuration();
			SessionFactory sf = HibernateUtil.getSessionFactory();
			Session session = sf.openSession();
			String sql = "select * from vw_searchfamiles";
			SQLQuery query = session.createSQLQuery(sql);

			
//			Query query = session.createQuery(sql);
			
			List employees = query.list();
			JSONArray array = new JSONArray();

			List<Object[]> rows = query.list();
		    for (Object[] row : rows) {		        
List<String> list = new ArrayList<>();			
				
				list.add(row[0].toString() );
				list.add(row[1].toString());
				list.add(row[2].toString());
				list.add(row[3].toString());
				list.add(row[4].toString());
				list.add(row[5].toString());
				list.add(row[6].toString());
				System.out.println("list "+list);
				array.add(list);
		    }
			 
		    
			
			
			Gson gson = new Gson();
			String result = gson.toJson(array);
			System.out.println(result);
			HttpServletResponse res = ServletActionContext.getResponse();
			res.setContentType("text/plan;charset=utf-8");
			PrintWriter out = res.getWriter();
			out.println(result.toString()+"@@@");
			out.flush();
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
		
		
		
		return "sucess";
		
	}

	

}

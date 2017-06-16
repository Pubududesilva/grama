package action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.google.gson.Gson;
import com.im.model.Family;
import com.im.model.Person;
import com.im.model.Road;

public class persondetailAction {
	public String personSubNumber;
	public String txtfirstName;
	public String txtInitial;
	public String txtIdNumber;
	public String txtTelephoneNumber;
	public String txtGeneric;
	public String txtBrithday;
	public String txtsex;
	public String txtSurname;
	public String txtnameByLetter;
	public String txtPasspoertNumber;
	public String txtEmail;
	public String txtReligion;
	public String txtBirthDistric;
	public String txtMarage;
	public String txtJobcatagory;
	public String txtBeforeDistric;
	public String txtHealth;
	public String txtJobName;
	public String txtReasonforLive;
	public String txtEducationCatagory;
	public String txtSinhalaKnoledge;
	public String txtEnglishKnoledge;
	public String computerLiteracy;
	public String txtTamilKnoledge;
	private String name;
	private String gramadata;

	public String getName() {
		return name;
	}

	public String getGramadata() {
		return gramadata;
	}

	public void setGramadata(String gramadata) {
		this.gramadata = gramadata;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPersonDetailsByID() {
		try {

			SessionFactory sf = HibernateUtil.getSessionFactory();
			Session session = sf.openSession();
			session.beginTransaction();

			// String sql = "select f.home_sub_number, p.first_name,
			// p.id_number, h.road_name from family_detail f JOIN person_detail
			// p ON f.home_sub_number = p.person_sub_no JOIN house_detail h ON
			// f.home_number = h.home_number";
			String sql = "select * from person_detail where id_number =  " + "'" + getName() + "'";

			SQLQuery query = session.createSQLQuery(sql);

			// Query query = session.createQuery(sql);

			List employees = query.list();

			JSONArray array = new JSONArray();

			List<Object[]> rows = query.list();
			for (Object[] row : rows) {
				System.out.println(row[0]);
				System.out.println(row[1]);
				System.out.println(row[2]);
				System.out.println(row[3]);

				List<String> list = new ArrayList<>();

				list.add(row[0].toString());
				list.add(row[1].toString());
				list.add(row[2].toString());
				list.add(row[3].toString());
				list.add(row[4].toString());
				list.add(row[5].toString());
				list.add(row[6].toString());
				list.add(row[7].toString());
				list.add(row[8].toString());
				list.add(row[9].toString());
				list.add(row[10].toString());
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
			out.println(result.toString() + "@@@");
			System.out.println(result.toString() + "@@@");
			out.flush();

		} catch (Exception e) {
			// TODO: handle exception
		}

		return "sucess";
	}

	public String saveGramaPersonData() {
		// TODO Auto-generated method stub
		try {
			String x = getGramadata();
			String str = name;
			JSONObject json = (JSONObject) new JSONParser().parse(x);
			String x1 = getGramadata();
			String road = json.get("txtRoda").toString();
			List<String> list = new ArrayList<String>(Arrays.asList(road.split(",")));
			Configuration c1 = new Configuration();
			SessionFactory sf = HibernateUtil.getSessionFactory();
			Session session = sf.openSession();
			session.beginTransaction();
			
			
			String sqlClient = "truncate table road";
			SQLQuery query = session.createSQLQuery(sqlClient);
			int rowValue = query.executeUpdate();
			
//			session.getTransaction().commit();
			for(int  y= 0; y< list.size();y++){
				Road road2 = new Road();

				road2.setRoadName(list.get(y));
				session.save(road2);
				
			}
			session.getTransaction().commit();
			
			String str1 = name;
	
			

		} catch (Exception e) {
			System.out.println(e);
		}

		return "sucess";
	}

	public String execute() {

		try {
			String x = getName();
			String str = name;
			JSONObject json = (JSONObject) new JSONParser().parse(x);
			Person person = new Person();
			person.setComputerLiteracy(json.get("computerLiteracy").toString());
			person.setPersonSubNumber(json.get("personSubNumber").toString());
			person.setTxtBeforeDistric(json.get("txtBeforeDistric").toString());
			person.setTxtBirthDistric(json.get("txtBirthDistric").toString());
			person.setTxtBrithday(json.get("txtBrithday").toString());
			person.setTxtEducationCatagory(json.get("txtEducationCatagory").toString());
			person.setTxtEmail(json.get("txtEmail").toString());
			person.setTxtEnglishKnoledge(json.get("txtEnglishKnoledge").toString());
			person.setTxtfirstName(json.get("txtfirstName").toString());
			person.setTxtGeneric(json.get("txtGeneric").toString());
			person.setTxtHealth(json.get("txtHealth").toString());
			person.setTxtIdNumber(json.get("txtIdNumber").toString());
			person.setTxtIdNumber(json.get("txtIdNumber").toString());
			person.setTxtJobcatagory(json.get("txtJobcatagory").toString());
			person.setTxtJobName(json.get("txtJobName").toString());
			person.setTxtMarage(json.get("txtMarage").toString());
			person.setTxtPasspoertNumber(json.get("txtPasspoertNumber").toString());
			person.setTxtReasonforLive(json.get("txtReasonforLive").toString());
			person.setTxtReligion(json.get("txtReligion").toString());
			person.setTxtsex(json.get("txtsex").toString());
			person.setTxtSinhalaKnoledge(json.get("txtSinhalaKnoledge").toString());
			person.setTxtSurname(json.get("txtSurname").toString());
			person.setTxtInitial(json.get("txtSurname").toString());
			person.setTxtTamilKnoledge(json.get("txtTamilKnoledge").toString());
			person.setTxtTelephoneNumber(json.get("txtTelephoneNumber").toString());
			person.setTxtFamilyId(json.get("personSubNumber").toString());

			Configuration c1 = new Configuration();
			SessionFactory sf = HibernateUtil.getSessionFactory();
			Session session = sf.openSession();
			session.beginTransaction();
			session.save(person);
			session.getTransaction().commit();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "sucess";
	}

}

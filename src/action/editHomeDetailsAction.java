package action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.json.simple.JSONArray;

import com.google.gson.Gson;
import com.im.model.Family;
import com.opensymphony.xwork2.ActionSupport;

public class editHomeDetailsAction extends ActionSupport {
	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String execute() {
		System.out.println("Hello" + getName());

		try {

			Configuration c1 = new Configuration();
			SessionFactory sf = HibernateUtil.getSessionFactory();
			Session session = sf.openSession();
			session.beginTransaction();

			String sql = "call sp_updateHouseDetail('" + getName() + "')";
			SQLQuery query = session.createSQLQuery(sql);

			// Query query = session.createQuery(sql);

			List employees = query.list();
			JSONArray array = new JSONArray();

			List<Object[]> rows = query.list();
			for (Object[] row : rows) {
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
				System.out.println("list " + list);
				array.add(list);
			}
			
			String sqlRoad = "select * from vw_get_road_name";
			SQLQuery queryRoad = session.createSQLQuery(sqlRoad);
			JSONArray arrayRoad = new JSONArray();

			List<Object[]> rowRoad = queryRoad.list();
			
			  for (Object[] row : rowRoad) {		        
				  List<String> list = new ArrayList<>();			
				  				
//				  				list.add(row[0].toString() );
				  				list.add(row[1].toString());
				  				System.out.println("list "+list);
				  				arrayRoad.add(list);
				  		    }
				  			 

		

			Gson gson = new Gson();
			String result = gson.toJson(array);
			String resultRoad = gson.toJson(arrayRoad);
			HttpServletResponse res = ServletActionContext.getResponse();
			res.setContentType("text/plan;charset=utf-8");
			PrintWriter out = res.getWriter();
			out.println(result.toString() + "@@@"+resultRoad+"@@");
			System.out.println(result.toString() + "@@@");
			out.flush();

		} catch (Exception e) {
			// TODO: handle exception
		}

		return "sucess";
	}
}

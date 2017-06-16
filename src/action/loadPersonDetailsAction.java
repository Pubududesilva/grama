package action;

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
import com.google.gson.Gson;
import com.im.model.Family;
import com.im.model.House;
import com.im.model.search_house_holder;
import com.opensymphony.xwork2.ActionSupport;



public class loadPersonDetailsAction extends ActionSupport {
	public StringBuilder subNumberStr = new StringBuilder();
	public List subnumber = new ArrayList<>();
	public List<House>  housearr= new ArrayList<>();
	private String msg;
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String execute(){
		System.out.println("Hello");
		setMsg("Hello " );
		
		try {
			Configuration c1 = new Configuration();
			SessionFactory sf = HibernateUtil.getSessionFactory();
			Session session = sf.openSession();
			String sql = "select * from vw_searchpersons";
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
				list.add(row[7].toString());
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
			// TODO: handle exception
		}
		
		
		
		
		return "sucess";
		
	}

}

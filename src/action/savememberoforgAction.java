package action;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.im.model.House;
import com.im.model.Member;

public class savememberoforgAction {
	public String txtposition;
	public String txtMemberfirstName;
	public String txtMemberIdentityNumber;
	public String txtMemberTelephone;
	public String txtMemberAddress;
	public String txtMemberRoad;
	public String txtMembercity;
	public String txtMemberdiscrict;
	
	
public String execute(){
		
		try {
			Member member = new Member();
			member.setTxtMemberAddress(txtMemberAddress);
			member.setTxtMembercity(txtMembercity);
			member.setTxtMemberdiscrict(txtMemberdiscrict);
			member.setTxtMemberfirstName(txtMemberfirstName);
			member.setTxtMemberIdentityNumber(txtMemberIdentityNumber);
			member.setTxtMemberRoad(txtMemberRoad);
			member.setTxtMemberTelephone(txtMemberTelephone);
			member.setTxtposition(txtposition);
			

Configuration c1 = new Configuration();
SessionFactory sf = HibernateUtil.getSessionFactory();
Session session = sf.openSession();
session.beginTransaction();
session.save(member);
session.getTransaction().commit();

		
	} catch (Exception e) {
		e.printStackTrace();
	}
		
		
		
		
		
		
		return "sucess";
	}

}

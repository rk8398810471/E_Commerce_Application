package hello;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.LineNumberReader;
import java.sql.*;
import java.util.*;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class new_database {
	
	ArrayList <seller_edit>arr=new ArrayList<seller_edit>();
	public static Connection c=null;
	static{
	    try {
	        Class.forName ("oracle.jdbc.OracleDriver");
	        c=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","sql123");
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	
	public static boolean already_id_present(String idd,int w)
	{
		ResultSet r=null;
		try
		{
		PreparedStatement ps=null;
		String q="";
		if(w==1)
		q="select id from user_info where id=?";
		else
			q="select id from seller_info where id=?";
		ps=c.prepareStatement(q);
		ps.setString(1, idd);
		r=ps.executeQuery();
		if(r.next())
			return true;
		else
			return false;
		}
		catch(Exception e)
		{
			System.out.println("Exception hai");
			return true;
		}
		
	}
	
	public static int cart_lines(String id)
	{
		ResultSet r=null;
		int i=0;
		try
		{
		PreparedStatement ps=null;
		String q="";
			q="select user_id from cart where user_id=?";
		ps=c.prepareStatement(q);
		ps.setString(1, id);
		r=ps.executeQuery();
		
		while(r.next())
		{
			i++;
		}
		
		}
		catch(Exception e)
		{
			System.out.println("Exception hai");
			
		}
		return i;
	}
	
	public static boolean item_already_present(String id,String photo)
	{
		ResultSet r=null;
		try
		{
		PreparedStatement ps=null;
		String q="";
		
		q="select * from seller_items where seller_id=? and photo=?";
		ps=c.prepareStatement(q);
		ps.setString(1, id);
		ps.setString(2, photo);
		r=ps.executeQuery();
		if(r.next())
			return true;
		else
			return false;
		}
		catch(Exception e)
		{
			System.out.println("Exception hai");
			return true;
		}
		
	}
	
	public String  seller_items_name(String id,String photo)
	{
		String h="";
		ResultSet r=null;
		try
		{
		PreparedStatement ps=null;
		String q="";
		
		q="select * from seller_items where seller_id=? and photo=?";
		ps=c.prepareStatement(q);
		ps.setString(1, id);
		ps.setString(2, photo);
		r=ps.executeQuery();
		
		if(r.next())
		h=r.getString("item_name");
		}
		catch(Exception e)
		{
			System.out.println("Exception hai");
			
		}
		return h;
	}
	
	
	public static boolean already_id_presentwithpet(String idd,String pett,int w)
	{
		ResultSet r=null;
		try
		{
		PreparedStatement ps=null;
		String q="";
		if(w==1)
		 q="select id from user_info where id=? and pet=?";
		else
			q="select id from seller_info where id=? and pet=?";
		ps=c.prepareStatement(q);
		ps.setString(1, idd);
		ps.setString(2, pett);
		r=ps.executeQuery();
		if(r.next())
			return true;
		else
			return false;
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage()+" Exception hhai");
			return true;
		}
		
	}
	
	public static boolean already_id_presentwithpass(String idd,String passs,int w)
	{
		ResultSet r=null;
		try
		{
		PreparedStatement ps=null;
		String q="";
		if(w==1)
		q="select id from user_info where id=? and password=?";
		else
	 q="select id from seller_info where id=? and password=?";
		ps=c.prepareStatement(q);
		ps.setString(1, idd);
		ps.setString(2, passs);
		r=ps.executeQuery();
		if(r.next())
			return true;
		else
			return false;
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage()+" Exception hhai");
			return true;
		}
		
	}
	
	public static String get_welcome_name(String id,int w)
	{
		String name="";
		ResultSet r=null;
		try
		{
		PreparedStatement ps=null;
		String q="";
		if(w==1)
		q="select name from user_info where id=?";
		else
	 q="select name from seller_info where id=?";
		ps=c.prepareStatement(q);
		ps.setString(1, id);
		r=ps.executeQuery();
		if(r.next())
		{
			name=r.getString("name");
		}
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage()+" Exception hhai");
		//	return true;
		}
		return name;
	}
	
	/*public static void main(String args[])
	{
		
	}*/
	
	public static String get_pass(String idd,int w)
	{
		ResultSet r=null;
		String ff=null;
	
		String q="";
		if(w==1)
			q="select password from user_info where id=?";
		else
			q="select password from seller_info where id=?";
		try
		{
			PreparedStatement ps=c.prepareStatement(q);
			ps.setString(1, idd);
			
			r=ps.executeQuery();
			if(r.next())
			{
				ff=r.getString("password");
			}
			else
			{
				
			}
		}
		catch(Exception e)
		{
			
		}
		return ff;
	
	}
	
	
	public static void add_user_data(String name,String id,String pass,String pet,String address,int w)
	{
		PreparedStatement ps=null;
		String q="";
if(w==1)
	q="insert into user_info values(?,?,?,?)";
else
	q="insert into seller_info values(?,?,?,?,?)";
		try
		{
		ps=c.prepareStatement(q);
		ps.setString(1, name);
		ps.setString(2, id);
		ps.setString(3, pass);
		ps.setString(4, pet);
		if(w==2)
			ps.setString(5, address);
		ps.executeQuery();
		}
		catch(Exception e)
		{
			System.out.println("Exception hai 1");
		}
		}
	
	public ResultSet get_data_for_edit(String g)
	{		
		PreparedStatement ps=null;
		String q="";
	q="select * from seller_items where seller_id=?";
	ResultSet r=null;	
	try
		{
		ps=c.prepareStatement(q);
		ps.setString(1, g);
		 r=ps.executeQuery();
		
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
			System.out.println("Exception hai 1");
		}
		
		return r;
	}
	
	public ResultSet get_data_for_edit_search(String g,String search)
	{		
		PreparedStatement ps=null;
		String q="";
	q="select * from seller_items where seller_id=? and item_name like '%"+search+"%'";
	ResultSet r=null;	
	try
		{
		ps=c.prepareStatement(q);
		ps.setString(1, g);
		 r=ps.executeQuery();
		 System.out.println("Gya andr");
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
			System.out.println("Exception hai 1");
		}
		
		return r;
	}
	
	//
	
	public void update_cart(String seller_id,String user_id,String photo,int quan)
	{
PreparedStatement ps=null;
		
		String q="";
	q="update cart set quantity=quantity+? where seller_id=? and photo=? and user_id=?";

		try
		{
			
		//	System.out.println(1);
		ps=c.prepareStatement(q);
		//System.out.println(2);
		//ps.setInt(1, quantity);
		ps.setInt(1, quan);
		//System.out.println(3);
		
		ps.setString(2, seller_id);
		ps.setString(3, photo);
		ps.setString(4, user_id);
		
	//	System.out.println(4);
		ps.executeQuery();
		
//		System.out.println(5);
		}
		catch(Exception e)
		{
			System.out.println("Exception hai 1");
		}
		
	}
	
	
	public void enter_data_for_update(int price,String discount,String instock,String item_name,String description,String photo,String id)
	{
PreparedStatement ps=null;
		
		String q="";
	q="update seller_items set price=?, discount=?,instock=?,item_name=?,description=? where seller_id=? and photo=?";

		try
		{
			
		//	System.out.println(1);
		ps=c.prepareStatement(q);
		//System.out.println(2);
		ps.setInt(1, price);
		//System.out.println(3);
		ps.setString(2, discount);
		ps.setString(3, instock);
		ps.setString(4, item_name);
		ps.setString(5, description);
		ps.setString(6, id);
		ps.setString(7, photo);
		
	//	System.out.println(4);
		ps.executeQuery();
		
//		System.out.println(5);
		}
		catch(Exception e)
		{
			System.out.println("Exception hai 1");
		}
		
	}
	
	public int get_quantity_from_seller_items(String seller_id,String photo)
	{
PreparedStatement ps=null;
		ResultSet r=null;
		String stock="";
		String q="";
	q="select instock from seller_items where seller_id=? and photo=?";

		try
		{
		ps=c.prepareStatement(q);
		ps.setString(1, seller_id);
		ps.setString(2, photo);
		r=ps.executeQuery();
		while(r.next())
			stock=r.getString("instock");
//		System.out.println(5);
		}
		catch(Exception e)
		{
			System.out.println("Exception hai 1");
		}
		int h=Integer.parseInt(stock);
		return h;
	}

	
	
	public int get_quantity_from_cart(String seller_id,String photo,String user_id)
	{
PreparedStatement ps=null;
		ResultSet r=null;
		int stock=0;
		String q="";
	q="select quantity from cart where seller_id=? and photo=? and user_id=?";

		try
		{
			
		//	System.out.println(1);
		ps=c.prepareStatement(q);
		//System.out.println(2);
		ps.setString(1, seller_id);
		//System.out.println(3);
		ps.setString(2, photo);
		ps.setString(3, user_id);		
		
	//	System.out.println(4);
		r=ps.executeQuery();
		while(r.next())
			stock=r.getInt("quantity");
//		System.out.println(5);
		}
		catch(Exception e)
		{
			System.out.println("Exception hai 1");
		}
		
		return stock;
	}

	public int get_quantity_from_cloth_size(String seller_id,String photo,String size)
	{
PreparedStatement ps=null;
		ResultSet r=null;
		String stock="";
		String q="";
	q="select * from cloth_size where seller_id=? and photo=? ";

		try
		{
			
		//	System.out.println(1);
		ps=c.prepareStatement(q);
		//System.out.println(2);
		ps.setString(1, seller_id);
		//System.out.println(3);
		ps.setString(2, photo);
		r=ps.executeQuery();
		while(r.next())
			stock=r.getString(size);
//		System.out.println(5);
		}
		catch(Exception e)
		{
			System.out.println("Exception hai 1");
		}
		int h=Integer.parseInt(stock);
		return h;
	}

	
	
	public String get_address(String id)
	{		
		PreparedStatement ps=null;
		String q="";
	q="select address from seller_info where id=?";
	ResultSet r=null;	
	try
		{
		ps=c.prepareStatement(q);
		ps.setString(1, id);
		 r=ps.executeQuery();
		 while(r.next())
		q=r.getString("address");
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
			System.out.println("Exception hai 1");
		}
		
		return q;
	}
	
	public String get_dis(String id,String photo)
	{

PreparedStatement ps=null;
		ResultSet r=null;
	String d="";
		String q="";
	q="select discount from seller_items where seller_id=? and photo=?";
		try
		{
		
		ps=c.prepareStatement(q);
ps.setString(1,id);
ps.setString(2,photo);
		r=ps.executeQuery();
		while(r.next())
			d=r.getString("discount");
		}
		catch(Exception e)
		{
			System.out.println("Exception hai 1");
		}
		return d;
		
	}
	public String get_nam(String id,String photo)
	{

PreparedStatement ps=null;
		ResultSet r=null;
	String d="";
		String q="";
	q="select item_name from seller_items where seller_id=? and photo=?";
		try
		{
		
		ps=c.prepareStatement(q);
ps.setString(1,id);
ps.setString(2,photo);
		r=ps.executeQuery();
		while(r.next())
			d=r.getString("item_name");
		}
		catch(Exception e)
		{
			System.out.println("Exception hai 1");
		}
		return d;
		
	}
	
	public int get_pri(String id,String photo)
	{

PreparedStatement ps=null;
		ResultSet r=null;
		int d=0;
		String q="";
	q="select price from seller_items where seller_id=? and photo=?";
		try
		{
		
		ps=c.prepareStatement(q);
ps.setString(1,id);
ps.setString(2,photo);
		r=ps.executeQuery();
		while(r.next())
			d=r.getInt("price");
		}
		catch(Exception e)
		{
			System.out.println("Exception hai 1");
		}
		return d;
		
	}
	
	
	public ResultSet get_all_resultset(String id)
	{
		
PreparedStatement ps=null;
		ResultSet r=null;
		String q="";
	q="select * from cart where user_id=?";
		try
		{
			
		//	System.out.println(1);
		ps=c.prepareStatement(q);
ps.setString(1,id);
		r=ps.executeQuery();
		
//		System.out.println(5);
		}
		catch(Exception e)
		{
			System.out.println("Exception hai 1");
		}
return r;
		
		
	}
	
	
	
	public ResultSet get_all_address(String id)
	{
		System.out.println(1);
PreparedStatement ps=null;
System.out.println(1);

		ResultSet ri=null;
		System.out.println(1);
		String q="";
		System.out.println(1);
	q="select name,mobile,email_id,pincode,address from add_ress where user_id=?";
	System.out.println(1);
		try
		{
			System.out.println(1);
		//	System.out.println(1);
		ps=c.prepareStatement(q);
		System.out.println(1);
ps.setString(1,id);
System.out.println(1);

		ri=(ResultSet)ps.executeQuery();
		System.out.println(1);
		
//		System.out.println(5);
		if(ri.next())
			System.out.println("peacock");	
		}
		catch(Exception e)
		{
			System.out.println("Exception hai 1");
		}
		
return ri;
		
		
	}
	
	public ResultSet get_all_add(String id)
	{
		System.out.println(1);
PreparedStatement ps=null;
System.out.println(1);

		ResultSet ri=null;
		System.out.println(1);
		String q="";
		System.out.println(1);
	q="select * from add_ress where user_id=?";
	System.out.println(1);
		try
		{
			System.out.println(1);
		//	System.out.println(1);
		ps=c.prepareStatement(q);
		System.out.println(1);
ps.setString(1,id);
System.out.println(1);

		ri=(ResultSet)ps.executeQuery();
		System.out.println(1);
		
//	
		}
		catch(Exception e)
		{
			System.out.println("Exception hai 1");
		}
		
return ri;
		
		
	}
	
	public String get_date()
	{		
		 Date date = new Date();
	      String am_pm;
	      Calendar calendar = new GregorianCalendar();
	      if(calendar.get(Calendar.AM_PM) == 0)
	          am_pm = "AM";
	       else
	          am_pm = "PM";
	      /* we can also get time using 
	       * String i=calendar.get(Calendar.HOUR 0r MINUTE or SECOND);
	       */
	      return date.toString()+" "+am_pm;
	}
	
	public static boolean already_present_in_cart(String seller,String user, String photo, String size)
	{
		PreparedStatement ps=null;
	    int f;
		String q="";
		String h="";
		System.out.println("check "+user+user.length()+" "+seller+seller.length()+" "+photo+photo.length()+" "+size+size.length());
		String s=" ";
	q="select user_id from cart where seller_id=? and photo=? and user_id=? and size_cloth=?";
	ResultSet r=null;	
	try
		{
		ps=c.prepareStatement(q);
		ps.setString(1, seller);
		ps.setString(2,photo);
		ps.setString(3,user);
		ps.setString(4,size);
		r=ps.executeQuery();
		if(r.next())
		{System.out.println("check true");
			return true;
		}
		else
		{
			return false;		
		}
		
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
			System.out.println("Exception hai 1");
		}
	return false;
	
	}
	
	public ResultSet get_data_for_update(String id,String photo)
	{		
		PreparedStatement ps=null;
		String q="";
	q="select * from seller_items where seller_id=? and photo=?";
	ResultSet r=null;	
	try
		{
		ps=c.prepareStatement(q);
		ps.setString(1, id);
		ps.setString(2,photo);
		 r=ps.executeQuery();
		
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
			System.out.println("Exception hai 1");
		}
		
		return r;
	}
	
	public static int at_checkout(String seller_id,String photo,String cloth)
	{		
		String s="s";
		String m="m";
		String l="l";
		String xl="xl";
		String xxl="xxl";
		int mi=0;
		PreparedStatement ps=null;
		String q="";
		String cr="no";
		System.out.println(cloth);
		if(cloth==null || cloth.equals(cr) )
		{
			System.out.println("hahahah");
	q="select instock from seller_items where seller_id=? and photo=?";
		}
		else
		{
			
			if(cloth.equals(s))
		q="select s from cloth_size where seller_id=? and photo=?";
			if(cloth.equals(m))
				q="select m from cloth_size where seller_id=? and photo=?";

			if(cloth.equals(l))
				q="select l from cloth_size where seller_id=? and photo=?";

			if(cloth.equals(xl))
				q="select xl from cloth_size where seller_id=? and photo=?";

			if(cloth.equals(xxl))
				q="select xxl from cloth_size where seller_id=? and photo=?";

			
		}
			//q="select instock from seller_items where seller_id=? and photo=?";		
	ResultSet r=null;	
	try
		{
		ps=c.prepareStatement(q);
		ps.setString(1, seller_id);
		ps.setString(2,photo);
		 r=ps.executeQuery();
		 
		if(r.next() )
		{
			
			if(cloth==null || cloth.equals(cr) )
			{
				String rr=r.getString("instock");
				if(rr!="" && rr!=null )
				mi=Integer.parseInt(rr);
			}
			else
			{
				if(cloth.equals(s))
					mi=Integer.parseInt(r.getString("s"));
						if(cloth.equals(m))
							mi=Integer.parseInt(r.getString("m"));

						if(cloth.equals(l))
							mi=Integer.parseInt(r.getString("l"));
						if(cloth.equals(xl))
							mi=Integer.parseInt(r.getString("xl"));

						if(cloth.equals(xxl))
							mi=Integer.parseInt(r.getString("xxl"));

			}
		}
		 
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
			System.out.println("Exception hai 1111");
		}
		return mi;
	
	}
	
	public String get_seller_name(String id)
	{		
		String d="";
		PreparedStatement ps=null;
		String q="";
	q="select name from seller_info where id=?";
	ResultSet r=null;	
	try
		{
		ps=c.prepareStatement(q);
		ps.setString(1, id);
		
		 r=ps.executeQuery();
		 while(r.next())
		d=r.getString("name");
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
			System.out.println("Exception hai 1");
		}
		
		return d;
	}
	
	public ResultSet show_all_products()
	{		
		PreparedStatement ps=null;
		String q="";
	q="select * from seller_items";
	ResultSet r=null;	
	try
		{
		ps=c.prepareStatement(q);
		 r=ps.executeQuery();
		
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
			System.out.println("Exception hai 1");
		}
		
		return r;
	}
	
	
	public ResultSet show_all_products_price(String apply)
	{
		int p=Integer.parseInt(apply);
		PreparedStatement ps=null;
		String q="";
	q="select * from seller_items where price<?";
	ResultSet r=null;	
	try
		{
		ps=c.prepareStatement(q);
		ps.setInt(1, p);
		 r=ps.executeQuery();
		
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
			System.out.println("Exception hai 1");
		}
		
		return r;
	}
	
	public void delete_size(String id,String photo)
	{
	PreparedStatement ps=null;
		
		String q="";
	q="delete from cloth_size where seller_id=? and photo=?";
try
		{
		ps=c.prepareStatement(q);
		ps.setString(1, id);
		ps.setString(2, photo);
		ps.executeQuery();
		}
		catch(Exception e)
		{
			System.out.println("Exception hai 1");
		}

		
	}
	
	public void insert_into_add_ress(String id,String pin,String state,String address,String email,String mobile,String name)
	{
	PreparedStatement ps=null;
		String q="";
	q="insert into add_ress values(?,?,?,?,?,?,?)";
		try
		{
			System.out.println(1);
		ps=c.prepareStatement(q);
		System.out.println(2);
		ps.setString(1, id);
		System.out.println(3);
		ps.setString(2, pin);
		System.out.println(3);
		ps.setString(3, state);
		System.out.println(3);
		ps.setString(4, address);
		System.out.println(3);
		ps.setString(5, email);
		System.out.println(67);
		ps.setString(6, mobile);
		System.out.println(3);
		ps.setString(7, name);
		System.out.println(3);
		ps.executeQuery();
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage()+"Exception hai 1");
		}	
	}
	public int get_quant(String seller_id,String photo)
	{

		PreparedStatement ps=null;
		String q="";
		
		
	q="select instock from seller_items where seller_id=? and photo=?";
	String h="";
		try
		{
			System.out.println("1");
		ps=c.prepareStatement(q);
		System.out.println("2");
		ps.setString(1, seller_id);
		ps.setString(2, photo);
	
		ResultSet r=ps.executeQuery();
		while(r.next())
		{
			h=r.getString("instock");
		}
		}
		catch(Exception e)
		{
			System.out.println("get_quant");
		}
	int v=Integer.parseInt(h);
	System.out.println(v);
	return v; 
	
	}
	
	
	public int get_quant_cloth(String seller_id,String photo,String cloth)
	{

		PreparedStatement ps=null;
		String q="";
		
		
	q="select * from cloth_size where seller_id=? and photo=?";
	String h="";
		try
		{
			System.out.println("1");
		ps=c.prepareStatement(q);
		System.out.println("2");
		ps.setString(1, seller_id);
		ps.setString(2, photo);
	
		ResultSet r=ps.executeQuery();
		while(r.next())
		{
			h=r.getString(cloth);
		}
		}
		catch(Exception e)
		{
			System.out.println("get_quant_cloth");
		}
	int v=Integer.parseInt(h);
	System.out.println(v);
	return v; 
	
	}
	
	public void reduce_quantity(String seller_id,String photo,int quant,int prev_quant)
	{
		PreparedStatement ps=null;
		String q="";
		int f=prev_quant-quant;
		String fi=""+f+"";
	q="update seller_items set instock=? where seller_id=? and photo=?";

		try
		{
			System.out.println("1");
		ps=c.prepareStatement(q);
	ps.setString(1, fi);
	ps.setString(2, seller_id);
	ps.setString(3, photo);
	ps.executeQuery();
		}
		catch(Exception e)
		{
			System.out.println("reduce_quantity");
		}
	}
	
	public void reduce_quantity_cloth(String seller_id,String photo,int quant,int prev_quant,String cloth)
	{
		PreparedStatement ps=null;
		String q="";
		int f=prev_quant-quant;
		String fi=""+f+"";
		//String fi="9";
		String s="s";
		String m="m";
		String l="l";
		String xl="xl";
		String xxl="xxl";
		if(cloth.equals(s))
	q="update cloth_size set s=? where seller_id=? and photo=?";
		if(cloth.equals(m))
			q="update cloth_size set m=? where seller_id=? and photo=?";

		if(cloth.equals(l))
			q="update cloth_size set l=? where seller_id=? and photo=?";

		if(cloth.equals(xl))
			q="update cloth_size set xl=? where seller_id=? and photo=?";

		if(cloth.equals(xxl))
			q="update cloth_size set xxl=? where seller_id=? and photo=?";

		
		try
		{
			System.out.println("1");
		ps=c.prepareStatement(q);
	//ps.setString(1, cloth);
	System.out.println("2");
	ps.setString(1,fi);
	System.out.println("3");
	ps.setString(2,seller_id);
	System.out.println("4");
	ps.setString(3, photo);
	System.out.println("5");
	ps.executeQuery();
	System.out.println("6");
		}
		catch(Exception e)
		{
			System.out.println("reduce_quantity_cloth");
		}
	}
	
	public void insert_into_order_place(String user_id,String pincode,String state,String address,String email_id,String mobile,String name,String seller_id,String photo,int quantity,String status,String date_,String size)
	{
	PreparedStatement ps=null;
		String q="";
	q="insert into order_place values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try
		{
			System.out.println(1);
		ps=c.prepareStatement(q);
		System.out.println(2);
		ps.setString(1, user_id);
		System.out.println(3);
		ps.setString(2, pincode);
		System.out.println(3);
		ps.setString(3, state);
		System.out.println(3);
		ps.setString(4, address);
		System.out.println(3);
		ps.setString(5, email_id);
		System.out.println(67);
		ps.setString(6, mobile);
		System.out.println(3);
		ps.setString(7, name);
		System.out.println(3);
	//	System.out.println(4);
		ps.setString(8, seller_id);
		System.out.println(3);
		ps.setString(9, photo);
		System.out.println(3);
		ps.setInt(10, quantity);
		System.out.println(3);
		ps.setString(11, status);
		System.out.println(3);
		ps.setString(12, date_);
		ps.setString(13, size);
		System.out.println(3);
		ps.executeQuery();
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage()+"insert_into_order_place");
		}
	}
	

	public void delete_address(String name,String mobile,String email_id,String pincode,String address,String user_id)
	{
	PreparedStatement ps=null;
		
		String q="";
	q="delete from add_ress where name=? and mobile=? and email_id=? and address=? and pincode=? and user_id=?";
System.out.println(pincode+name+mobile+email_id+address+user_id);
		try
		{
			
			System.out.println(1);
		ps=c.prepareStatement(q);
		System.out.println(2);
		ps.setString(1, name);
		System.out.println(3);
		ps.setString(2, mobile);
		ps.setString(3, email_id);
		ps.setString(4, address);
		ps.setString(5, pincode);
		ps.setString(6, user_id);
		System.out.println(4);
		ps.executeQuery();
		
	System.out.println(5);
		}
		catch(Exception e)
		{
			System.out.println("Exception hai 1");
		}

		
	}
	
	public String get_state(int no )
	{
		StringBuffer buffer=new StringBuffer();
        String line = "";
        int lineNo;
       
        try {
            LineNumberReader ln = new LineNumberReader(new FileReader("C:\\Users\\rajat\\Desktop\\t.txt"));
                int count = 0;
                while (ln.readLine() != null){
                count++;   
                }
                ln.close();
                FileReader fr = new FileReader("C:\\Users\\rajat\\Desktop\\t.txt");

                BufferedReader br = new BufferedReader(fr);
                for (lineNo = 1; lineNo <= count; lineNo++) {
                    if(lineNo==no){
                        for (lineNo = no; lineNo <= no; lineNo++) {
                               buffer.append(br.readLine());
                               buffer.append("\n");
                        }
                    }
                    else
                                br.readLine();
                }
        } catch (IOException e) {
                e.printStackTrace();
        }
        return buffer.toString();
	}
	
	
	public int get_linenumber(String phrase)
	{
		String fileName ="C:\\Users\\rajat\\Desktop\\t.txt";
		
int lineID = 0;
List lineNumbers = new ArrayList();
Pattern pattern =  Pattern.compile(phrase);
Matcher matcher = null;
		try {
			Scanner fileScanner = new Scanner(new File(fileName));
while(fileScanner.hasNextLine()){
	String line = fileScanner.nextLine();
	lineID++;
	matcher = pattern.matcher(line);
	if(matcher.find()){
		lineNumbers.add(lineID);
	  
	}
	

}
		}
		catch(Exception e)
		{
			
		}
if(lineNumbers.isEmpty())
return 0;
else
return (int)lineNumbers.get(0);
	}
	
	
	public void remove_cart(String user,String seller,String photo,String size)
	{
	PreparedStatement ps=null;
		
		String q="";
	q="delete from cart where user_id=? and seller_id=? and photo=? and size_cloth=?";

		try
		{
			
		//	System.out.println(1);
		ps=c.prepareStatement(q);
		//System.out.println(2);
		ps.setString(1, user);
		//System.out.println(3);
		ps.setString(2, seller);
		ps.setString(3, photo);
		ps.setString(4,size);
	//	System.out.println(4);
		ps.executeQuery();
		
//		System.out.println(5);
		}
		catch(Exception e)
		{
			System.out.println("Exception hai 1");
		}

		
	}
	
	public ResultSet show_all_products_search(String search)
	{		
		PreparedStatement ps=null;
		String q="";
	q="select * from seller_items where item_name like '%"+search+"%'";
	ResultSet r=null;	
	try
		{
		ps=c.prepareStatement(q);
		 r=ps.executeQuery();
		
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
			System.out.println("Exception hai 1");
		}
		
		return r;
	}
	
	public ResultSet show_all_products_search_price(String apply,String search)
	{		
		PreparedStatement ps=null;
		String q="";
	q="select * from seller_items where item_name like '%"+search+"%' and price<?";
	ResultSet r=null;	
	try
		{
		ps=c.prepareStatement(q);
		ps.setInt(1, Integer.parseInt(apply));
		 r=ps.executeQuery();
		
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
			System.out.println("Exception hai 1");
		}
		
		return r;
	}
	
	
	public ResultSet get_size(String id,String photo)
	{		
		PreparedStatement ps=null;
		String q="";
	q="select * from cloth_size where seller_id=? and photo=?";
	ResultSet r=null;	
	try
		{
		ps=c.prepareStatement(q);
		ps.setString(1, id);
		ps.setString(2, photo);
		 r=ps.executeQuery();
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
			System.out.println("Exception hai 1");
		}
		
		return r;
	}
	public ResultSet get_order_place(String id)
	{		
		PreparedStatement ps=null;
		String q="";//and status not like'%"+search+"%'
		String search="delivered";
	q="select * from order_place where user_id=?and status not like'%"+search+"%'";
	ResultSet r=null;	
	try
		{
		ps=c.prepareStatement(q);
		ps.setString(1, id);
		
		 r=ps.executeQuery();
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
			System.out.println("Exception hai 1");
		}
		
		return r;
	}
	
	public ResultSet get_order_delivered(String id)
	{		
		PreparedStatement ps=null;
		String q="";//and status not like'%"+search+"%'
		String search="delivered";
	q="select * from order_place where user_id=?and status like'%"+search+"%'";
	ResultSet r=null;	
	try
		{
		ps=c.prepareStatement(q);
		ps.setString(1, id);
		
		 r=ps.executeQuery();
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
			System.out.println("Exception hai 1");
		}
		
		return r;
	}
	
	public void lll(String user_id,String seller_id,String photo,String status,String size,String d)
	{		
		PreparedStatement ps=null;
		String q="";
		
	q="update order_place set status=? where seller_id=? and user_id=? and photo=? and size_of=? and date_=?";
	ResultSet r=null;	
	try
		{
		ps=c.prepareStatement(q);
		ps.setString(1, status);
		ps.setString(2,seller_id);
		ps.setString(3, user_id);
		ps.setString(4, photo);
		ps.setString(5, size);
		ps.setString(6, d);
		 int h=ps.executeUpdate();
		 if(h==1)
			 System.out.println("done done done");
		 else
			 System.out.println("done done");
		 System.out.println("date= "+d);
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
			System.out.println("Exception hai 1");
		}
		

	}
	
	public void l()
	{		
		
		Statement s=null;
		ResultSet r=null;
		try
		{
			System.out.println("table data");
			s=c.createStatement();
			r=s.executeQuery("select * from order_place");
			String format="%-7s%-7s%-15s%-15s%-15s%-15s\n";   // %-SIZEs is syntax for any datatype
			while(r.next())  // next is for checking next is present or not
			{
			System.out.format(format, r.getString("user_id"), r.getString("seller_id"),r.getString("photo"),r.getString("status"),r.getString("size_of"),r.getString("date_"));  // giving format as a string
		}
			}
		catch(Exception e)
		{ 
			System.out.println(e.getMessage());
		}
		}
	
	
	public ResultSet get_orders(String id)
	{		
		PreparedStatement ps=null;
		String q="";//and status not like'%"+search+"%'
		String search="delivered";
	q="select * from order_place where seller_id=?";
	ResultSet r=null;	
	try
		{
		ps=c.prepareStatement(q);
		ps.setString(1, id);
		
		 r=ps.executeQuery();
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
			System.out.println("Exception hai 1");
		}
		
		return r;
	}
	
	public static void delete_by_seller(String idd,String photoo)
	{
		PreparedStatement ps=null;
		
		String q="";
	q="delete from seller_items where seller_id=? and photo=?";

		try
		{
			
		//	System.out.println(1);
		ps=c.prepareStatement(q);
		//System.out.println(2);
		ps.setString(1, idd);
		//System.out.println(3);
		ps.setString(2, photoo);
	//	System.out.println(4);
		ps.executeQuery();
		
//		System.out.println(5);
		}
		catch(Exception e)
		{
			System.out.println("Exception hai 1");
		}
	}
	
	public static void delete_cart(String id)
	{
		PreparedStatement ps=null;
		
		String q="";
	q="delete from cart where user_id=? ";

		try
		{
			
		//	System.out.println(1);
		ps=c.prepareStatement(q);
		//System.out.println(2);
		ps.setString(1, id);
		//System.out.prn(4);
		ps.executeQuery();
		
//		System.out.println(5);
		}
		catch(Exception e)
		{
			System.out.println("delete_cart");
		}
	}
	
	
	public static void add_sizes(String id,String photo,String s,String m,String l,String xl,String xxl)
	{
	
		PreparedStatement ps=null;
		String q="";
	q="insert into cloth_size values(?,?,?,?,?,?,?)";

		try
		{
			System.out.println("1");
		ps=c.prepareStatement(q);
		System.out.println("1");
		ps.setString(7, xxl);
		System.out.println("2");
		ps.setString(4, m);
		System.out.println("3");
		ps.setString(1, id);
		System.out.println("4");
		ps.setString(2,photo);
		System.out.println("5");
		ps.setString(3,s);
		System.out.println("1526");
		ps.setString(5,l);
		System.out.println("7");
		ps.setString(6,xl);
		System.out.println("8");
		ps.executeQuery();
		System.out.println("9");
		}
		catch(Exception e)
		{
			System.out.println("Exception hai 1mm");
		}
	
		
	}
	
	public static void data_into_cart(String seller_id,String photo,String user_id,int quantity,String size)
	{
	
		PreparedStatement ps=null;
		String q="";
	q="insert into cart values(?,?,?,?,?)";

		try
		{
			System.out.println("1");
		ps=c.prepareStatement(q);
		System.out.println("1553");
		ps.setString(1, seller_id);
		System.out.println("2");
		ps.setString(2, photo);
		System.out.println("3");
		ps.setString(3, user_id);
		System.out.println("4");
		ps.setInt(4,quantity);
		System.out.println("5");
		ps.setString(5,size);
		System.out.println("6");
		ps.executeQuery();
		System.out.println("7");
		}
		catch(Exception e)
		{
			System.out.println("Exception hai 1mm");
		}
	
		System.out.println("8");
	}
	
	
	public static void update_sizes(String id,String photo,String s,String m,String l,String xl,String xxl)
	{
	
		PreparedStatement ps=null;
		String q="";
	q="update cloth_size set s=?,m=?,l=?,xl=?,xxl=? where seller_id=? and photo=?";

		try
		{
			System.out.println("1");
		ps=c.prepareStatement(q);
		System.out.println("1558");
		ps.setString(7, photo);
		System.out.println("2");
		ps.setString(4, xl);
		System.out.println("3");
		ps.setString(1, s);
		System.out.println("4");
		ps.setString(2,m);
		System.out.println("5");
		ps.setString(3,l);
		System.out.println("6");
		ps.setString(5,xxl);
		System.out.println("7");
		ps.setString(6,id);
		System.out.println("8");
		ps.executeQuery();
		System.out.println("9");
		}
		catch(Exception e)
		{
			System.out.println("Exception hai 1mm");
		}
	
		
	}
	


	
	public static void add_seller_data(String id,String item_name,int price,String discount,String stock,String description,String fileName,String hh)
	{
	
		PreparedStatement ps=null;
		String q="";
	q="insert into seller_items values(?,?,?,?,?,?,?,?)";

		try
		{
			System.out.println("a");
		ps=c.prepareStatement(q);
		System.out.println("b");
		ps.setString(7, id);
		System.out.println("c");
		ps.setString(4, item_name);
		System.out.println("d");
		ps.setInt(1, price);
		System.out.println("e");
		ps.setString(2,discount);
		System.out.println("f");
		ps.setString(3,stock);
		System.out.println("g");
		ps.setString(5,description);
		System.out.println("h");
		ps.setString(6,fileName);
		ps.setString(8,hh);
		System.out.println("i");
		ps.executeQuery();
		System.out.println("j");
		}
		catch(Exception e)
		{
			System.out.println("Exception hai 1kk");
		}
	
		
	}
	
	
	}
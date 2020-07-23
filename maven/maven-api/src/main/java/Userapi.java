import java.io.Reader;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.liurui.Service.userService;
import com.liurui.pojo.User;
import com.liurui.utils.ReturnResult;

@Controller
@RequestMapping("api/")
public class Userapi {
    
	@Autowired
	private userService us;
	
	
	/*
	 * public Userapi(userService us) { this.us =us; }
	 */
	
	
	@RequestMapping("index")
	public String index(@RequestParam(value="id",required=false)String id,Model model) {
		int Id=0;
		if(id!=""&& id!=null) {
			Id =Integer.parseInt(id);
		}
		List<User> list =us.getUser(Id);
		
		System.out.println("查询成功");
		model.addAttribute("List",list);
		if(id!=""&& id!=null) {
			return "/WEB-INF/index";
		}else {
			return "/WEB-INF/addorupdate";
		}
		
	}
	
	@RequestMapping("add")
	@ResponseBody
	public ReturnResult add(String name,String age,String sex,String pssionsid) {
		int Age =Integer.parseInt(age);
		int Pssionsid =Integer.parseInt(pssionsid);
		User user =new User();
		user.setAge(Age);
		user.setName(name);
		user.setPssionsid(Pssionsid);
		user.setSex(sex);
		int row =us.add(user);
		ReturnResult rs =new ReturnResult();
		if(row>0) {
			rs.getSuccess("添加成功");
		}else {
			rs.getFail("添加失败");
		}
		System.out.println(rs.getMessage());
		return rs;
	} 
	
	@RequestMapping("drop")
	@ResponseBody
	public ReturnResult drop(String id) {
		int Id =Integer.parseInt(id);
		int row =us.drop(Id);
		ReturnResult rs =new ReturnResult();
		if(row>0) {
			rs.getSuccess("删除成功");
		}else {
			rs.getFail("删除失败");
		}
		System.out.println(rs.getMessage());
		return rs;
	}
	
	@RequestMapping("baocun")
	public ReturnResult baocun(String id,String name,String age,String sex,String pssionsid) {
		int Id =Integer.parseInt(id);	
		int Age =Integer.parseInt(age);
		int Pssionsid =Integer.parseInt(pssionsid);
		User user =new User();
		user.setAge(Age);
		user.setName(name);
		user.setPssionsid(Pssionsid);
		user.setSex(sex);
		user.setId(Id);
		int row=us.update(user);
		ReturnResult rs =new ReturnResult();
		if(row>0) {
			rs.getSuccess("修改成功");
		}else {
			rs.getFail("修改失败");
		}
		
		return rs;
	}
	
	@RequestMapping("tz")
	public String tz() {
		return "/WEB-INF/addorupdate";
	}
}

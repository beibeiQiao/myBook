package interceptor;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.entity.User;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class Interceptor extends AbstractInterceptor{
	
	private String sessionName;//用来传递当前用户的信息
	private String excludeName;//凡是例外的action就不需要拦截
	private List<String> list;
	
	public List<String> strSplit(String str){
		String[] s=str.split(",");
		List<String> list=new ArrayList<String>();
		for(String ss:s){
			list.add(ss.trim());
		}
		return list;
	}
	
	public void init(){
		list=strSplit(excludeName);//拦截器初始化时把例外的action放入list中
	}
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		System.out.println("进入了拦截器！");
		String actionName=invocation.getProxy().getActionName();//得到跳转的action名称
		Map<String,Object> session=invocation.getInvocationContext().getSession();
		
		if(list.contains(actionName)){//如果请求合法
			System.out.println("---请求合法,没有被拦截---");
			return invocation.invoke();//struts2继续处理后续的事
		}else{
			System.out.println("---该action被拦截了---");
			
			User user=(User)session.get(sessionName);
			if(user!=null){
				//获取HttpServletRequest对象
				HttpServletRequest request=ServletActionContext.getRequest();
				String path=request.getRequestURI().replaceAll("/book","");
				System.out.println("path:"+path);
				//存入session，这个参数在struts.xml中会作为参数出现
				session.put("prePage", path);
				return "login";
			}else{
				return invocation.invoke();//通知struts跳转到action中
			}
		}           
	}                          
                               
}                              
                               
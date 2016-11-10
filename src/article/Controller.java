package article;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(
		urlPatterns = {
				"/Controller",
				"*.kosta"
		},
		initParams = {
				@WebInitParam(name = "propertyConfig", value = "command.properties")
		})

public class Controller extends HttpServlet{

	// variable
	private static final long serialVersionUID = 1L;
	private Map<String, Object> commandMap = new HashMap<String, Object>();
	
	// constructor
	public Controller(){
		
		super();
		
	}
	
	// init method
	@Override
	public void init(ServletConfig config) throws ServletException {
		
		String props = config.getInitParameter("propertyConfig");
		String realFolder = "/property"; // properties 파일이 저장된 폴더

		ServletContext context = config.getServletContext(); // 웹 어플리케이션 루트 경로
		String realPath = context.getRealPath(realFolder) + "\\" + props; // realFolder를 웹어플리케이션 시스템상의 절대경로로 변경
		
		Properties pr = new Properties(); // 명령어와 처리클래스의 매핑정보를 저장할 Properties 객체를 생성
		FileInputStream f = null;
		
		try{
			
			f = new FileInputStream(realPath);
			pr.load(f);
			
		} catch(IOException e) {
			e.printStackTrace();
		} finally {
			if(f != null){ try{f.close();} catch(IOException e){} }
		}
		
		// Set 객체의 iterator() 메소드를 사용해 Iterator 객체를 얻어냄
		Iterator<?> keyIter = pr.keySet().iterator();
		
		// Iterator 객체에 저장된 명령어와 처리클래스를 commandMap에 저장
		while( keyIter.hasNext() ){
			
			String command = (String)keyIter.next();
			String className = pr.getProperty(command);
			
			try{
				
				Class<?> commandClass = Class.forName(className);
				Object commandInstance = commandClass.newInstance();
				commandMap.put(command,	commandInstance);
				
			} catch(ClassNotFoundException e) {
				throw new ServletException(e);
			} catch(InstantiationException e) {
				throw new ServletException(e);
			} catch(IllegalAccessException e) {
				throw new ServletException(e);
			}
					
		}
			
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		requestPro(request, response); // 웹 브라우저 요청처리 메소드 호출
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		requestPro(request, response); // 웹 브라우저 요청처리 메소드 호출
		
	}
	
	private void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String view = null;
		Service service = null;
		
		try{
			
			String command = request.getRequestURI();
			
			if(command.indexOf(request.getContextPath()) == 0){
				command = command.substring(request.getContextPath().length());
			}
			
			service = (Service)commandMap.get(command);
			view = service.execute(request, response);
	
		} catch(Throwable e) {
			throw new ServletException(e);
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
		
	}
	
}

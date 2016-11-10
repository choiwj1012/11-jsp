package article;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SelectAllService implements Service {
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		List<Article> articles = ArticleDao.getInstance().selectAllDao(1, 3);
		System.out.println(articles);
		request.setAttribute("articles", articles);
		
		return "/selectAllView.jsp";
		
	}
	

	
}

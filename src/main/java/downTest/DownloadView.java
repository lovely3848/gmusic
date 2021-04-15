package downTest;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.BeanNameAware;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.context.support.WebApplicationObjectSupport;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.AbstractView;

/* ** 추상 클래스 AbstractView code 일부
 
  public abstract class AbstractView extends WebApplicationObjectSupport 
   									implements View, BeanNameAware {

	public static final String DEFAULT_CONTENT_TYPE = "text/html;charset=ISO-8859-1";
	~ ~ ~ ~
	private String contentType = DEFAULT_CONTENT_TYPE;
*/

public class DownloadView extends AbstractView {

	public DownloadView() {
		
		setContentType("application/download; utf-8");
		// 상위 추상 클래스에 정의되어있음.
	}

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		File file = (File) model.get("downloadFile");
		// "downloadFile" : 컨트롤러의 매핑메서드에서 리턴된 File 객체의 name 과 같아야 한다
		System.out.println("DownloadView --> file.getPath() : " + file.getPath());
		System.out.println("DownloadView --> file.getName() : " + file.getName());

		System.out.println("DownloadView --> getContentType() : " + getContentType());

		response.setContentType(getContentType()); // 상위 추상 클래스에 정의되어있음.
		response.setContentLength((int) file.length());

		String userAgent = request.getHeader("User-Agent");
		boolean ie = userAgent.indexOf("MSIE") > -1;
		String fileName = null;

		if (ie) {
			fileName = URLEncoder.encode(file.getName(), "utf-8");
		} else {
			fileName = new String(file.getName().getBytes("utf-8"), "ISO-8859-1");
		} // end if;

		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		OutputStream out = response.getOutputStream();
		FileInputStream fis = null;

		try {
			fis = new FileInputStream(file);
			FileCopyUtils.copy(fis, out);
		} catch (Exception e) {
			System.out.println("** DownloadView Exception => " + e.toString());
		} finally {
			if (fis != null) {
				try {
					fis.close();
				} catch (Exception e) {
				}
			}
		} // try end;

		out.flush();

	}// renderMergedOutputModel()

} // class

package testFinal;

import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by dell2 on 2017/6/18.
 */
@WebServlet(name = "Test2_ZQ")
public class Test2_ZQ extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 设置响应内容类型
        response.setContentType("text/html;charset=UTF-8");
        String str=request.getParameter("userID");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=utf-8");
        Map<String,String> map=new HashMap<String,String>();
        map.put("returnCode","0");
        map.put("returnValue",str);
        JSONObject jsonObject=JSONObject.fromObject(map);
        String jsonStr=jsonObject.toString();
        PrintWriter printWriter=response.getWriter();
        printWriter.append(jsonStr);
        printWriter.flush();
    }
}

package msh.NonMemberOrder.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import msh.NonMemberOrder.domain.NonMemberOrderVO;
import msh.NonMemberOrder.model.NonMemberOrderDAO;
import msh.NonMemberOrder.model.NonMemberOrderDAO_imple;

public class NonMember_deliveryAction extends AbstractController {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String method = request.getMethod();
        int n = 0;

        if ("POST".equalsIgnoreCase(method)) {
        	NonMemberOrderDAO ndao = new NonMemberOrderDAO_imple();
            String ordernum = request.getParameter("ordernum");
            String name = request.getParameter("name");
            String pwd = request.getParameter("pwd");
            String postcode = request.getParameter("postcode");
            String address = request.getParameter("address");
            String detailaddress = request.getParameter("detailaddress");
            String extraaddress = request.getParameter("extraaddress");
            String phoneNumber = request.getParameter("phoneNumber");

            NonMemberOrderVO nvo = new NonMemberOrderVO();
            nvo.setOrdernum(ordernum);
            nvo.setName(name);
            nvo.setPwd(pwd);
            nvo.setPostcode(postcode);
            nvo.setAddress(address);
            nvo.setDetailaddress(detailaddress);
            nvo.setExtraaddress(extraaddress);
            nvo.setPhoneNumber(phoneNumber);

            try {
                n = ndao.add_NonMember(nvo);
            } catch (Throwable e) {
                e.printStackTrace();
            }

            JSONObject jsonObj = new JSONObject();
            jsonObj.put("n", n);

            String json = jsonObj.toString();
            request.setAttribute("json", json);

            String message = "";
            String loc = "";

            // add_NonMember 작업이 성공했는지 확인 (조건을 필요에 따라 조정)
            try {
                if (n == 1) {
                    message = "비회원 정보 설정 성공!";
                }
            } catch (Throwable e) {
                e.printStackTrace();
            }
            
            request.setAttribute("nvo", nvo);
            request.setAttribute("message", message);
            super.setRedirect(false);
            super.setViewPage("/WEB-INF/msh.NonMemberOrder/NonMember_Success.jsp");

        } else {
            // POST 방식으로 넘어오지 않았다면
            String message = "비정상적인 경로를 통해 들어왔습니다.!!";
            String loc = "javascript:history.back()";

            request.setAttribute("message", message);
            request.setAttribute("loc", loc);

            super.setRedirect(false);
            super.setViewPage("/WEB-INF/msg.jsp");
        }
    }
}

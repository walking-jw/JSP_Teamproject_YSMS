package com.ysms.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ysms.common.LoginedUserInfo;
import com.ysms.dao.Dao_MyInfo_UpdateProfile;

public class MyInfoUpdateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String updateResult = null;
		String pw = request.getParameter("pw1");
		String phone = request.getParameter("phone1") + "-" + request.getParameter("phone2") + "-" + request.getParameter("phone3");
		
		Dao_MyInfo_UpdateProfile dao = new Dao_MyInfo_UpdateProfile();
		updateResult = dao.updateUserInfo(LoginedUserInfo.id, pw, phone);
		
		request.setAttribute("updateTty", 1);
		request.setAttribute("updateResult", updateResult);
	}

}

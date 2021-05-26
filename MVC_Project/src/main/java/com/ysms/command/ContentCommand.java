package com.ysms.command;

import javax.servlet.http.HttpServletRequest;


import javax.servlet.http.HttpServletResponse;

import com.ysms.common.FilePath;
import com.ysms.dao.Dao_Share;
import com.ysms.dto.Dto_Share;


public class ContentCommand implements Command {

	FilePath file = new FilePath();
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		int no = Integer.parseInt(request.getParameter("no"));

		Dao_Share dao = new Dao_Share();
		Dto_Share dto = dao.detail(no);
		
		System.out.println(no);
		//파일이 업로드되있는 상태라면 (이름+경로) - 경로를 해서 파일 이름만 추출해서 request로 전송
		if(dto.getFilePath() != null) {
			String filePath = dto.getFilePath();
			String fileName = filePath.substring(file.Image.length());
			request.setAttribute("fileName", fileName);
		}
		request.setAttribute("DETAIL", dto);
		System.out.println(no);
	}

}

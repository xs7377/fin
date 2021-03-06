package com.choa.attend;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class AttendService {

	@Inject
	private AttendDAO attendDAO;
	
	//totalCheck
	public int totalCheck(String m_id) throws Exception{
		int total = attendDAO.totalCheck(m_id);
		if(total == 0) {
			total = 0;
		}
		
		return total;
	}
	
	//출석체크
	public int attendCheck(String m_id)throws Exception{
		return attendDAO.attendCheck(m_id);
	}
	
	
	public int attendCut(String m_id) throws Exception{
		return attendDAO.attendCut(m_id);
	}
	
	public int attendReset(String m_id) throws Exception{
		return attendDAO.attendReset(m_id);
	}
	
	
	//클리어
	public int attendClear() throws Exception{
		return attendDAO.attendClear();
	}
	
}

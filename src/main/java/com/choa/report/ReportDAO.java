package com.choa.report;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choa.util.PageMaker;
import com.choa.util.RowMaker;

@Repository
public class ReportDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static String NAMESPACE="ReportMapper.";
	
	public List<ReportDTO> reportList(int curPage) throws Exception{
		Map<String, Object> map=new HashMap<String, Object>();
		PageMaker pageMaker=new PageMaker(curPage);
		RowMaker rowMaker=pageMaker.getRowMaker();
		rowMaker.makeRow(curPage, 10);
		
		map.put("startRow", rowMaker.getStartRow());
		map.put("lastRow", rowMaker.getLastRow());
		return sqlSession.selectList(NAMESPACE+"reportList",map);
	}
	
	//count 몇 회 신고 당했는지
	public int reportCount(String to_id) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"reportCount", to_id);
	}
	
	
	//view
	public ReportDTO reportView(int num) throws Exception{
		
		return sqlSession.selectOne(NAMESPACE+"reportView", num);
	}
	
	//check 이미 신고당했는지
	public ReportDTO reportCheck(ReportDTO reportDTO) throws Exception{
		
		return sqlSession.selectOne(NAMESPACE+"reportCheck",reportDTO);
	}

	//신고
	public int report(ReportDTO reportDTO) throws Exception{
		
		return sqlSession.insert(NAMESPACE+"report", reportDTO);
	}
	
	//읽고서 신고 접수하면 check_num=1
	public int reportRead(int num) throws Exception{
		return sqlSession.update(NAMESPACE+"reportRead",num);
	}
	
	
	//신고이유 타당하지 않으면 삭제
	public int reportDelete(int num) throws Exception{
		return sqlSession.delete(NAMESPACE+"reportDelete",num);
	}
	
	//Rollback 읽고서 메시지 안 가면 다시 롤백
	public int reportRollback(int num) throws Exception{
		return sqlSession.update(NAMESPACE+"reportRollback",num);
	}
	
	
	
}

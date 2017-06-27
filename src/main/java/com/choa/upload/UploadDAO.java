package com.choa.upload;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UploadDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private String NAME_SPACE = "UploadMapper.";

	public void imgUpload(UploadDTO uploadDTO){
		sqlSession.insert(NAME_SPACE+"imgUpload", uploadDTO);
	}
	
	public List<UploadDTO> imgView(UploadDTO uploadDTO) throws Exception{
		return sqlSession.selectList(NAME_SPACE+"imgView", uploadDTO);
	}
	
	public int imgDelete(String fName){
		return sqlSession.delete(NAME_SPACE+"imgDelete", fName);
	}
	
	
	public void noImage(UploadDTO uploadDTO){
		sqlSession.insert(NAME_SPACE+"noImage", uploadDTO);
	}
}

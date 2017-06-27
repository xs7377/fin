package com.choa.fin;

import static org.junit.Assert.*;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import com.choa.auction.AuctionDTO;

public class FinalTest extends AbstractTest {

	@Inject
	private SqlSession sqlSession;
	private String NAME_SPACE="AuctionMapper.";
	@Test
	public void test() {
		String search="셔츠";
		List<AuctionDTO> l=sqlSession.selectList(NAME_SPACE+"getSearch");
		assertNotNull(l);
	}

}

package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.*;
import com.sist.vo.*;
import com.sist.mapper.*;
@Repository
public class TrainingDAO {
	@Autowired
	private TrainingMapper mapper;
	
	public List<TrainingVO> trainListData(Map map)
	{
		return mapper.trainListData(map);
	}
	public int trainListCount()
	{
		return mapper.trainListCount();
	}
	public TrainingVO trainDetailData(int tno) {
	    // 매퍼로부터 받은 데이터를 vo에 할당
	    TrainingVO vo = mapper.trainDetailData(tno);
	    
	    // vo 객체가 null인지 확인
	    if (vo != null) {
	        // 이미지 링크를 수정하여 |로 구분되게 변경
	        String img = vo.getImg().replace("^", "|");
	        
	        // vo 객체에 수정된 이미지 링크를 설정
	        vo.setImg(img);
	    }
	    
	    return vo;
	}
}

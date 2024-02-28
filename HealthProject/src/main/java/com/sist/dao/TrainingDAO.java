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
	    if (vo != null && vo.getImg() != null) {
	        // 이미지 URL들을 ^로 분할하여 배열로 만듭니다.
	        String[] imgUrls = vo.getImg().split("\\^");
	        
	        // 각 이미지 URL을 출력합니다.
	        for (String imgUrl : imgUrls) {
	            System.out.println(imgUrl);
	        }
	    }
	    
	    return vo;
	}
}

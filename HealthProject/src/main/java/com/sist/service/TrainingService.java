package com.sist.service;
import java.util.*;
import com.sist.vo.*;
public interface TrainingService {
	public List<TrainingVO> trainListData(Map map);
	public int trainListCount();
	public TrainingVO trainDetailData(int tno);
}

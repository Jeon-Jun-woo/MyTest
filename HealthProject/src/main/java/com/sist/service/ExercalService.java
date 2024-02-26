package com.sist.service;

import java.util.*;
import com.sist.vo.*;

public interface ExercalService {
	public List<ExerCalVO> exerListData(Map map);
	public int exerciseListCount();
	public ExerCalVO exerDetailData(int eno);
	public List<ExerCalVO> exerFindData(Map map);
}

package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;
import com.sist.vo.*;
import com.sist.service.*;

@RestController
public class NgoodsRestController {
	@Autowired
	private NgoodsService service;
	
	
}

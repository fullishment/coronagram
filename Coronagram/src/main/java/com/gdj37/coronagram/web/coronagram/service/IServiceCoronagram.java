package com.gdj37.coronagram.web.coronagram.service;

import java.util.HashMap;
import java.util.List;

public interface IServiceCoronagram {

	public List<HashMap<String, String>> getPostList(HashMap<String, String> params)throws Throwable;
	
}

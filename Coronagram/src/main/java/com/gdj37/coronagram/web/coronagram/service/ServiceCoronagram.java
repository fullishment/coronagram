package com.gdj37.coronagram.web.coronagram.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.coronagram.web.coronagram.dao.IDaoCoronagram;

@Service
public class ServiceCoronagram implements IServiceCoronagram{
	@Autowired
	public IDaoCoronagram iDaoCoronagrma;

	@Override
	public List<HashMap<String, String>> getPostList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoCoronagrma.getPostList(params);
	}

	@Override
	public List<HashMap<String, String>> getPostCmt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoCoronagrma.getPostCmt(params);
	}

	@Override
	public int aHeart(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoCoronagrma.aHeart(params);
	}

	@Override
	public int dHeart(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoCoronagrma.dHeart(params);
	}

	@Override
	public int addPostCmt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoCoronagrma.addPostCmt(params);
	}

	@Override
	public List<HashMap<String, String>> getListFollow(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoCoronagrma.getListFollow(params);
	}

	@Override
	public List<HashMap<String, String>> getNotFollow(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoCoronagrma.getNotFollow(params);
	}

	@Override
	public int FollowAdd(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDaoCoronagrma.FollowAdd(params);
	}

}

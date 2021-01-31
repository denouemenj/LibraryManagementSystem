package com.jiayu.service;

import java.util.List;

import com.jiayu.exception.SortException;
import com.jiayu.pojo.Sort;

public interface SortService {
	public List<Sort> findAll();

	public Sort findById(Integer id);

	public void add(String sname);

	public List<Sort> findBySname(String sname);

	public void modify(Integer id,String sname);
	
	public void remove(Integer id) throws SortException;
}

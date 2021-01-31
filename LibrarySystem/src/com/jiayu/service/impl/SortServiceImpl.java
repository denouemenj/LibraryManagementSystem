package com.jiayu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.jiayu.exception.SortException;
import com.jiayu.mapper.BooksMapper;
import com.jiayu.mapper.SortMapper;
import com.jiayu.pojo.Books;
import com.jiayu.pojo.Sort;
import com.jiayu.service.SortService;

@Service
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
public class SortServiceImpl implements SortService {

	@Autowired
	private SortMapper sortMapper;
	
	@Autowired
	private BooksMapper booksMapper;

	@Override
	public List<Sort> findAll() {
		return sortMapper.selectAll();
	}

	@Override
	public Sort findById(Integer id) {
		return sortMapper.selectById(id);
	}

	@Override
	public void add(String sname) {
		sortMapper.insert(sname);
	}

	@Override
	public List<Sort> findBySname(String sname) {
		return sortMapper.selectBySname(sname);
	}

	@Override
	public void modify(Integer id,String sname) {
		sortMapper.update(id,sname);
	}

	@Override
	public void remove(Integer id) throws SortException {
		// 先判断是否存在该类别的图书
		Books book=new Books();
		book.setSid(id);
		int count = booksMapper.getCount(book);
		if(count>0){
			throw new SortException("该类别不能删除");
		}
		
		// 如果该类别下不存在对应图书，则执行删除操作
		sortMapper.delete(id);
	}

}

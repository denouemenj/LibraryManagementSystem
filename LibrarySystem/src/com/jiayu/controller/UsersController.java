package com.jiayu.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.jiayu.pojo.Books;
import com.jiayu.pojo.Borrows;
import com.jiayu.pojo.Reserve;
import com.jiayu.pojo.Users;
import com.jiayu.service.BooksService;
import com.jiayu.vo.Page;

@Controller
@RequestMapping("/user")
public class UsersController {
	@Autowired
	private BooksService booksService;

	@RequestMapping("/index")
	public String toIndex() {
		return "/users/index";
	}

	@RequestMapping("/quit")
	public String quit(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:/index";
	}

	@RequestMapping("/show")
	public String toShow(Model model, Books book) {
		System.out.println(book);
		if (book.getSid() != null) {
			model.addAttribute("sid", book.getSid());
		}
		if (!"".equals(book.getBname()) || book.getBname().length() > 0) {
			model.addAttribute("bname", book.getBname());
		}
		Page page = booksService.getAllBooks(book);
		model.addAttribute("page", page);
		model.addAttribute("currentPage", book.getCurrentPage());
		model.addAttribute("totalPage", page.getTotalPage());
		return "/users/show";
	}

	@RequestMapping("/borrow")
	public String toBorrow(Model model, Integer id) {
		Books book = booksService.getBook(id);
		System.out.println(book);
		model.addAttribute("book", book);
		return "/users/borrows";
	}

	@RequestMapping("/insert")
	public String insertBorrow(Borrows borrow, HttpSession session) {
		Users user = (Users) session.getAttribute("user");
		System.out.println("id" + borrow);
		borrow.setUid(user.getId());
		Date date = new Date();
		borrow.setStartTime(date);
		borrow.setStatus(0);
		booksService.insertBorrow(borrow);
		// booksService.updateBooks(borrow.getBid());
		return "redirect:/user/back";
	}


	@RequestMapping("/back")
	public String getBorrows(Model model, HttpSession session) {
		Users user = (Users) session.getAttribute("user");
		List<Borrows> borrows = booksService.getBorrows(user.getId());
		model.addAttribute("borrows", borrows);
		return "users/back";
	}

	@RequestMapping("/showBackBook")
	public String showBackBook(Model model, HttpSession session) {
		Users user = (Users) session.getAttribute("user");
		List<Borrows> backs = booksService.getBacks(user.getId());
		model.addAttribute("backs", backs);
		return "users/showBackBook";
	}

	@RequestMapping("/backBooks")
	public String backBooks(Integer id) {
		booksService.updateBacks(id);
		return "redirect:/user/showBackBook";
	}

	@RequestMapping("/reserve")
	public String reserveBooks(Reserve reserve, HttpSession session) {
		Users user = (Users) session.getAttribute("user");
		reserve.setUid(user.getId());
		Date date = new Date();
		System.out.println(date);
		reserve.setStartTime(date);
		booksService.insertReserve(reserve);
		return "redirect:/user/showReserveBook";
	}


	@RequestMapping("/showReserveBook")
	public String showReserveBook(Model model, HttpSession session) {
		Users user = (Users) session.getAttribute("user");
		List<Reserve> reserveBooks = booksService.getReserveBook(user.getId());
		model.addAttribute("reserveBooks", reserveBooks);
		return "/users/reserveBook";
	}
	
}

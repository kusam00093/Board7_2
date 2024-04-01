package com.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.board.domain.BoardVo;
import com.board.mapper.BoardMapper;
import com.board.menus.domain.MenuVo;
import com.board.menus.mapper.MenuMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/Board")
public class BoardController {
	
	@Autowired
	private BoardMapper boardMapper;
	@Autowired
	private MenuMapper menuMapper;
	
	@RequestMapping("/List")
	//public ModelAndView list(@Param String menu_id) {
	public ModelAndView list(MenuVo menuVo) {
		
		log.info("=====================================menuVo : {}",menuVo);
		
		
		
		// 메뉴목록
		List<MenuVo> menuList = menuMapper.getMenuList();
		
		
		// 게시물 목록
		List<BoardVo> boardList = boardMapper.getBoardList(menuVo);  
		//System.out.println(boardList);
		ModelAndView mv = new ModelAndView();
		
		MenuVo mVo = menuMapper.getMenu(menuVo.getMenu_id());		
		String menu_id = mVo.getMenu_id();
		String menu_name = mVo.getMenu_name();
		
		mv.addObject("menu_id",menu_id);
		mv.addObject("menu_name",menu_name);
		
		mv.addObject("boardList",boardList);
		mv.addObject("menuList",menuList);
		mv.setViewName("board/list");
		return mv;
	}
	
	@RequestMapping("/WriteForm")
	public ModelAndView writeForm(MenuVo menuVo) {
		
		// 메뉴 목록 조회
		List<MenuVo> menuList = menuMapper.getMenuList();
		System.out.println("[==MenuList==]"+menuList);
		
		// ?menu_id=MENU01 넘어온 menu_id 를 처리
		String menu_id = menuVo.getMenu_id();
		ModelAndView mv = new ModelAndView();
		mv.addObject("menu_id",menu_id);
		mv.addObject("menuList",menuList);
		mv.setViewName("/board/write");
		return mv;
	}
	
	@RequestMapping("/Write")
	public ModelAndView write(BoardVo boardVo) {
		boardMapper.insertBoard(boardVo);

		String menu_id = boardVo.getMenu_id();
		ModelAndView mv = new ModelAndView(); 
		
		mv.setViewName("redirect:/Board/List?menu_id=" + menu_id);
		return mv;
	}
	/*
	@RequestMapping("/View")
	public ModelAndView view(BoardVo boardVo) {
		HashMap<String, Object> map = boardMapper.getBoard(boardVo);
		//String menu_id = boardVo.getMenu_id();
		ModelAndView mv = new ModelAndView(); 
		//mv.addObject("bo",menu_id);
		mv.addObject("bo",map);
		mv.setViewName("/board/view");
		return mv;
	}*/
//	@RequestMapping("/View")
//	public ModelAndView view(BoardVo boardVo) {
//		List<BoardVo> boList = boardMapper.getBoList(boardVo);  
//		ModelAndView mv = new ModelAndView(); 
//		mv.addObject("bo",boList.get(0));
//		mv.setViewName("/board/view");
//		return mv;
//	}
	@RequestMapping("/View")
	public ModelAndView view(BoardVo boardVo) {
		
		//메뉴 목록 조회
		List<MenuVo> menuList = menuMapper.getMenuList();
		
		// 조회수 증가 (현재 bno 의 hit = hit +1)
		
		boardMapper.incHit(boardVo);
		
		// bno로 조회한 게시글 정보
		BoardVo vo = boardMapper.getBoard(boardVo);
		
		// vo.content 안의 \n을 '<br>'로 변경한다
		
		String content  = vo.getContent();  
		if(content != null){
		       content  = content.replace("\n", "<br>");		
		vo.setContent( content  );
		}
		
 		ModelAndView mv = new ModelAndView();
		mv.addObject("bo",vo);
		mv.addObject("menuList",menuList);
		mv.setViewName("/board/view");
		return mv;
	}
	
/*
	@RequestMapping("/UpdateForm")
	public ModelAndView updateForm(BoardVo boardVo) {
		List<MenuVo> menuList = menuMapper.getMenuList();
		
		BoardVo vo = boardMapper.getView(boardVo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("bo",vo);
		mv.addObject("menuList",menuList);
		mv.setViewName("/board/update");
		return mv;
	}*/
	@RequestMapping("/UpdateForm")
	public ModelAndView updateForm(BoardVo boardVo) {
		BoardVo vo = boardMapper.getBoard(boardVo);
		List<MenuVo> menuList = menuMapper.getMenuList();
		ModelAndView mv = new ModelAndView();
		mv.addObject("bo",vo);
		mv.addObject("menuList",menuList);
		mv.setViewName("board/update");
		return mv;
	} 
	
	@RequestMapping("/Update")
	public ModelAndView update(BoardVo boardVo) {
		int bno = boardVo.getBno();
		boardMapper.getUpdate(boardVo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Board/View?bno="+bno);
		return mv;
	}
	
	@RequestMapping("/Delete")
	public ModelAndView delete(BoardVo boardVo) {
		// 게시글 삭제
		boardMapper.deleteBoard(boardVo);
		
		// 다시 조회
		ModelAndView mv = new ModelAndView();
		
		String menu_id = boardVo.getMenu_id();
		mv.setViewName("redirect:/Board/List?menu_id=" + menu_id);
		return mv;
	}
	
	
}

package com.kh.board.model.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import com.kh.board.model.dao.BoardDao;
import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.Category;
import com.kh.board.model.vo.Reply;
import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;

public class BoardService {

	//총게시글 개수 구하는 메서드
	public int selectListCount() {
		Connection conn = JDBCTemplate.getConnection();
		
		//처리된 행수가 아닌 총 게시글의 개수를 조회해온것
		int listCount = new BoardDao().selectListCount(conn);
		
		JDBCTemplate.close(conn);
		
		return listCount;
	}

	public ArrayList<Board> selectList(PageInfo pi) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Board> list = new BoardDao().selectList(conn, pi);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	public int insertBoard(Board b, Attachment at) {
		Connection conn = JDBCTemplate.getConnection();
		//게시글이 작성될때 첨부파일이 있거나 또는 없는 경우도 생각하여 작업하기
		int result = new BoardDao().insertBoard(conn, b);
		
		//첨부파일이 없어도 게시글 커밋은 해야하니까 해당 조건에 부합하게 1로 초기화 해놓기
		int result2 = 1;
		//첨부파일이 있는 경우에 Attachment 테이블에 insert 작업하기
		if(at!=null) {
			result2 = new BoardDao().insertAttachment(conn, at);
		}
		
		if(result>0 && result2>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result*result2; //둘중 하나라도 0이 나오면 0을 반환
	}
	
	public ArrayList<Category> categoryList() {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Category> list = new BoardDao().categoryList(conn);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	public Board selectBoard(int bno) {
		Connection conn = JDBCTemplate.getConnection();
		
		Board board = new BoardDao().selectBoard(conn, bno);
		
		JDBCTemplate.close(conn);
		
		return board;
	}

	public int increaseCount(int bno) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new BoardDao().increaseCount(conn, bno);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	public Attachment selectAttachBoard(int bno) {
		Connection conn = JDBCTemplate.getConnection();
		
		Attachment attachment = new BoardDao().selectAttachBoard(conn, bno);
		
		JDBCTemplate.close(conn);
		
		return attachment;
	}

	public int deleteBoard(int bno) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new BoardDao().deleteBoard(conn, bno);	
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	//게시글 수정 메서드
	public int updateBoard(Board b, Attachment at) {
		Connection conn = JDBCTemplate.getConnection();	
		//새로운 첨부파일 없고 기존 첨부파일도 없는 경우 - board update
		//새로운 첨부파일 있고 기존 첨부파일 없는경우 - board update / attachment-insert
		//새로운 첨부파일 있고 기존 첨부파일 있는 경우 - board update / attachment update
		
		int result = new BoardDao().updateBoard(conn, b);
		
		int result2 = 1;
		
		if(at != null) { //새롭게 추가된 첨부파일이 있는 경우
			if(at.getFileNo() != 0) { //기존의 첨부파일이 있었을 경우(변경)
				result2 = new BoardDao().updateAttachment(conn, at);
			}else {//기존의 첨부파일이 없었을 경우 (추가)
				result2 = new BoardDao().newInsertAttachment(conn, at);
			}
		}
		
		if(result>0 && result2>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
			
		return result*result2;
	}

	//사진게시글 작성 메소드
	public int insertPhotoBoard(Board b, ArrayList<Attachment> list) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new BoardDao().insertPhotoBoard(conn,b);
		int result2 = new BoardDao().insertAttachmentList(conn,list);
		if(result>0 && result2>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		//둘중하나라도 0이라면 0 돌려주기
		return result*result2;
	}

	//사진게시글 목록조회메소드
	public ArrayList<Board> selectAttachmentList() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Board> list = new BoardDao().selectAttachmentList(conn);
		JDBCTemplate.close(conn);
		return list;
	}

	public ArrayList<Attachment> selectAttachmentList(int boardNo) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Attachment> list = new BoardDao().selectAttachmentList(conn,boardNo);
		JDBCTemplate.close(conn);
		return list;
	}

	public int insertReply(Reply r) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new BoardDao().insertReply(conn,r);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public ArrayList<Reply> selectReply(int bno) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Reply> rlist = new BoardDao().selectReply(conn,bno);
		JDBCTemplate.close(conn);
		return rlist;
	}


}

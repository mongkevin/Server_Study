package com.kh.board.model.vo;

import java.util.Date;

public class Board {
	private int boardNo;//	BOARD_NO	NUMBER
	private int boardType;//	BOARD_TYPE	NUMBER
	private String category;//	CATEGORY_NO	- String
	private String boardTitle;//	BOARD_TITLE	VARCHAR2(100 BYTE)
	private String boardContent;//	BOARD_CONTENT	VARCHAR2(4000 BYTE)
	private String boardWriter;//	BOARD_WRITER	NUMBER
	private int count;//	COUNT	NUMBER	
	private Date createDate;//	CREATE_DATE	DATE
	private String status;//	STATUS	VARCHAR2(1 BYTE)
	
	//대표이미지 경로 + 파일명(변경된) 담을 필드 하나 생성하기
	private String titleImg;
	
	//사진게시판 게시글 목록 조회해올 생성자
	public Board(int boardNo, String boardTitle, int count, String titleImg) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.count = count;
		this.titleImg = titleImg;
	}

	public Board(String boardTitle, String boardContent, String boardWriter, int count, Date createDate,
			String titleImg) {
		super();
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardWriter = boardWriter;
		this.count = count;
		this.createDate = createDate;
		this.titleImg = titleImg;
	}

	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Board(int boardNo, String category, String boardTitle, String boardWriter, int count, Date createDate) {
		super();
		this.boardNo = boardNo;
		this.category = category;
		this.boardTitle = boardTitle;
		this.boardWriter = boardWriter;
		this.count = count;
		this.createDate = createDate;
	}

	public Board(int boardNo, int boardType, String category, String boardTitle, String boardContent,
			String boardWriter, int count, Date createDate, String status) {
		super();
		this.boardNo = boardNo;
		this.boardType = boardType;
		this.category = category;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardWriter = boardWriter;
		this.count = count;
		this.createDate = createDate;
		this.status = status;
	}
	
	public Board(int boardNo, String category, String boardTitle, String boardWriter, Date createDate, String boardContent) {
		super();
		this.boardNo = boardNo;
		this.category = category;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardWriter = boardWriter;
		this.createDate = createDate;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getBoardType() {
		return boardType;
	}
public String getTitleImg() {
		return titleImg;
	}

	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}
	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getBoardWriter() {
		return boardWriter;
	}

	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardType=" + boardType + ", category=" + category + ", boardTitle="
				+ boardTitle + ", boardContent=" + boardContent + ", boardWriter=" + boardWriter + ", count=" + count
				+ ", createDate=" + createDate + ", status=" + status + "]";
	}
	
	
}

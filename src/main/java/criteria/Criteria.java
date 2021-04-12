package criteria;

//Criteria :( 판단이나 결정을 위한) 기준.
//=> 출력할 Row를 select 하기 위한 클래스
public class Criteria {
	private int currPage;   	// 현재 페이지번호
	private int rowPerPage;		// 페이지당 보여줄 글 갯수
	private int sno;  		// startRno 페이지의 시작 글
	private int eno;  		// endRno 페이지의 마지막 글
	
	private String searchType;
	private String keyword;
	
	// 기본값 생성자로 초기화
	public Criteria() {
		this.currPage=1;
		this.rowPerPage=10;
	}// 생성자
	
	// 1) 출력할(요청받은) PageNo set
	public void setCurrPage(int currPage) {
		if(currPage>1) {
			this.currPage=currPage;
		}else {
			this.currPage=1;
		}
	}
	// 2) 1페이지당 보여줄 Row(Record,듀플) 갯수 확인
	// => 제한조건 점검( 50개까지만 허용 )
	public void setRowPerPage(int rowPerPage) {
		if(rowPerPage<1 || rowPerPage>50) {
			this.rowPerPage=10;
		}else {
			this.rowPerPage=rowPerPage;
		}
	}
	
	// 3) startRowNo, endRowNo 계산
	public void setSnoEno() {
		if(this.sno <1 ) { this.sno =1; }
		this.sno = (this.currPage-1)*this.rowPerPage + 1;
		this.eno = this.sno+this.rowPerPage -1;
	}

	public int getCurrPage() {
		return currPage;
	}

	public int getRowPerPage() {
		return rowPerPage;
	}

	public int getSno() {
		return sno;
	}

	public int getEno() {
		return eno;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public void setEno(int eno) {
		this.eno = eno;
	}

	@Override
	public String toString() {
		return "Criteria [currPage=" + currPage + ", rowPerPage=" + rowPerPage + ", sno=" + sno + ", eno=" + eno
				+ ", searchType=" + searchType + ", keyword=" + keyword + "]";
	}
	
}// class

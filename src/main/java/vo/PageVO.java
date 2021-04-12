package vo;

import java.util.List;

// member , board 모두 사용 가능하도록 Generic 설정
public class PageVO<T>  {
	
	private List<T> list ; // 목록리스트 저장
	private int currPage ;       // 현재 페이지번호
	private int rowPerPage = 8;  // 페이지당 보여줄 Row 갯수
	private int totalRowCount;   // 전체 레코드갯수
	private int sno;             // startRno
	private int eno;             // endRno
	private int pageNoCount = 3; 
		// 한 화면에 출력되는 클릭 가능한 PageNo 갯수
		// => paging2 에서 사용
	
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	public int getCurrPage() {
		return currPage;
	}
	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}
	public int getRowPerPage() {
		return rowPerPage;
	}
	public void setRowPerPage(int rowPerPage) {
		this.rowPerPage = rowPerPage;
	}
	public int getTotalRowCount() {
		return totalRowCount;
	}
	public void setTotalRowCount(int totalRowCount) {
		this.totalRowCount = totalRowCount;
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public int getEno() {
		return eno;
	}
	public void setEno(int eno) {
		this.eno = eno;
	}
	public int getPageNoCount() {
		return pageNoCount;
	}
	public void setPageNoCount(int pageNoCount) {
		this.pageNoCount = pageNoCount;
	}
	@Override
	public String toString() {
		return "PageVO [list=" + list + ", currPage=" + currPage + ", rowPerPage=" + rowPerPage + ", totalRowCount="
				+ totalRowCount + ", sno=" + sno + ", eno=" + eno + ", pageNoCount=" + pageNoCount + "]";
	}
} //class

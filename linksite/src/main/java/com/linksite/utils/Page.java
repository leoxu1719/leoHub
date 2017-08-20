package com.linksite.utils;

import javax.servlet.http.HttpServletRequest;

import org.w3c.dom.html.HTMLIsIndexElement;

import com.mysql.jdbc.StringUtils;


public class Page {

	private Integer rows=10;//每页显示记录
	private Integer page=1;//开始查询的页，默认从第一页开始查询
	private Integer recordCount=0;//总记录数
	private Integer pageCount=0;//总页数
	private String sort;//排序的字段
	private String order;//desc,dsc
	
	public Page(){

	}
	
	public Page(HttpServletRequest request){
		String page = request.getParameter("page");
		String rows = request.getParameter("rows");
		if(StringUtil.isNotEmpty(page) || StringUtil.isNotEmpty(rows)){
			this.rows = Integer.valueOf(rows);
			this.page = Integer.valueOf(page);
			
			//省略 sort
			
			this.order =  request.getParameter("order");
		}
	}
	
	/**数据库首次查询的集合行*/
	public int getFirstResult(){
		pageCount = getPageCount();
		if(page<=0){
			page=1;
		}else if(page > pageCount){
			page = pageCount;
		}
		return (page-1) * rows;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getRecordCount() {
		return recordCount;
	}

	public void setRecordCount(Integer recordCount) {
		this.recordCount = recordCount;
	}

	public Integer getPageCount() {
		return recordCount % rows == 0 ? recordCount/rows : recordCount/rows+1;
	}

	public void setPageCount(Integer pageCount) {
		this.pageCount = pageCount;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}
	
	
}

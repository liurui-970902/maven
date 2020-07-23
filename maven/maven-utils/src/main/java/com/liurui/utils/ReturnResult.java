package com.liurui.utils;


/**
 * 状态工具类
 * @author 99266
 *
 */
public class ReturnResult {
	private int status;
	private String message;
	/**
	 * 失败方法
	 * @param result
	 * @return
	 */
	public ReturnResult getFail(Object result) {
		this.status = -1;
		this.message = result.toString();
		return this;
	}
	/**
	 * 成功方法
	 * @param result
	 * @return
	 */
	public ReturnResult getSuccess(Object result) {
		this.status = 1;
		this.message = result.toString();
		return this;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
}

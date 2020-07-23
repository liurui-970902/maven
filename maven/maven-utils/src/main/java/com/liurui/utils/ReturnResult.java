package com.liurui.utils;


/**
 * ״̬������
 * @author 99266
 *
 */
public class ReturnResult {
	private int status;
	private String message;
	/**
	 * ʧ�ܷ���
	 * @param result
	 * @return
	 */
	public ReturnResult getFail(Object result) {
		this.status = -1;
		this.message = result.toString();
		return this;
	}
	/**
	 * �ɹ�����
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

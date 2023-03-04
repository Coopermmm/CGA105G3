package com.empfunc.controller;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.emp.model.EmpService;
import com.emp.model.EmpVO;
import com.empfunc.model.EmpFuncService;
import com.empfunc.model.EmpFuncVO;
import com.func.model.FuncService;

public class EmpFuncServlet extends HttpServlet{
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
//		if ("getEmpID_For_Display".equals(action)) {
//
//			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
//			req.setAttribute("errorMsgs", errorMsgs);
//
//			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
//			String str = req.getParameter("emp_id"); 
//			Integer emp_id = Integer.valueOf(str);
//			/*************************** 2.開始查詢資料 *****************************************/
//			EmpFuncService empFuncSvc = new EmpFuncService();
//			List<EmpFuncVO> empFuncVO = empFuncSvc.getByEmpID(emp_id);
//			
//			if (empFuncVO.isEmpty()) {
//				errorMsgs.put("emp_id","此員工無任何權限");
//			}
//			if (!errorMsgs.isEmpty()) {
//				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/empFunc/listAllEmpFunc.jsp");
//				failureView.forward(req, res);
//				return;
//			}
//
//			/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
//			req.setAttribute("empFuncVO", empFuncVO); 
//			String url = "/back_end/empFunc/listOneEmpFunc.jsp";
//			RequestDispatcher successView = req.getRequestDispatcher(url); 
//			successView.forward(req, res);
//		}
		
		if ("getEmpID_For_Display".equals(action)) {


			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			String str = req.getParameter("emp_id"); 
			Integer emp_id = Integer.valueOf(str);
			/*************************** 2.開始查詢資料 *****************************************/
			EmpService empSvc = new EmpService();
			EmpVO empVO = empSvc.getOneEmp(emp_id);
			/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
			req.setAttribute("empVO", empVO); 
			String url = "/back_end/empFunc/NewListOne.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); 
			successView.forward(req, res);
		}
		
		if ("getFuncID_For_Display".equals(action)) {

			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			String str = req.getParameter("func_id"); 
			Integer func_id = Integer.valueOf(str);
			/*************************** 2.開始查詢資料 *****************************************/
			EmpFuncService empFuncSvc = new EmpFuncService();
			List<EmpFuncVO> empFuncVO = empFuncSvc.getByFuncID(func_id);
			/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
			req.setAttribute("empFuncVO", empFuncVO); 
			String url = "/back_end/empFunc/listOneEmpFunc.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); 
			successView.forward(req, res);
		}
		
//		if ("delete".equals(action)){
//			String str = req.getParameter("emp_id"); 
//			Integer emp_id = Integer.valueOf(str);
//			String str2 = req.getParameter("func_id"); 
//			Integer func_id = Integer.valueOf(str2);
//			
//			EmpFuncService empFuncSvc = new EmpFuncService();
//			empFuncSvc.deleteEmpFunc(emp_id, func_id);
//			
//			String url = "/back_end/empFunc/listAllEmpFunc.jsp";
//			RequestDispatcher successView = req.getRequestDispatcher(url); 
//			successView.forward(req, res);
//		}
		
		if ("getOne_For_Update".equals(action)){
			String str = req.getParameter("emp_id"); 
			Integer emp_id = Integer.valueOf(str);
			
			EmpService empSvc = new EmpService();
			EmpVO empVO = empSvc.getOneEmp(emp_id);
			req.setAttribute("empVO", empVO);
			
			String url = "/back_end/empFunc/updateEmpFunc.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); 
			successView.forward(req, res);
		}
		
		if ("update".equals(action)) {

			FuncService funcSvc = new FuncService();
			EmpFuncService empFuncSvc = new EmpFuncService();
			
			Integer emp_id = Integer.valueOf(req.getParameter("emp_id"));
			
			//建立一個集合，存放被修改的權限多選項
			Set<Integer> fIDSet = new LinkedHashSet<Integer>();
			for (int i = 1; i <= funcSvc.getAll().size(); i++) {
				if (req.getParameter("func" + i) == null) {
					continue;
				} else {
					fIDSet.add(Integer.valueOf(req.getParameter("func" + i)));
				}
			}
			
			// 搜尋該員工原有的權限
			List<EmpFuncVO> empFuncVOList = empFuncSvc.getByEmpID(emp_id);
			// 將該員工的權限轉存成另一個集合(裡面只有int)
			Set<Integer> func_id_OriginSet = new LinkedHashSet<Integer>();
			for (EmpFuncVO empFuncVO : empFuncVOList) {
				func_id_OriginSet.add(empFuncVO.getFunc_id());
			}
			
			// 比對二個Set集合
			// 依序取出舊集合中的值，若新集合中沒有該值，則刪除該值
			for (Integer func_id_Origin : func_id_OriginSet) {
				if (!fIDSet.contains(func_id_Origin)) {
					empFuncSvc.deleteEmpFunc(emp_id, func_id_Origin);
				}
			}
			// 依序取出新集合中的值，若舊集合中沒有該值，則新增該值
			for (Integer fID : fIDSet) {
				if (!func_id_OriginSet.contains(fID)) {
					empFuncSvc.addEmpFunc(emp_id, fID);
				}
			}
			
			RequestDispatcher successView = req.getRequestDispatcher("/back_end/empFunc/listAllEmpFunc.jsp");
			successView.forward(req, res);
		}
		
		
		
//		if("insert".equals(action)){
//			List<String> errorMsgs = new LinkedList<String>();
//			req.setAttribute("errorMsgs", errorMsgs);
//			
//			String str1 = req.getParameter("emp_id"); 
//			Integer emp_id = Integer.parseInt(str1);
//			String str2 = req.getParameter("func_id"); 
//			Integer func_id = Integer.valueOf(str2);
//			
//			// 要錯誤處理判斷要新增的權限，不是已經有了的
//			EmpFuncService empFuncSvc = new EmpFuncService();
//			List<EmpFuncVO> empFuncVO = empFuncSvc.getByEmpID(emp_id);
//			for(EmpFuncVO empFunc : empFuncVO) {
//				if(empFunc.getFunc_id() == func_id) {
//					errorMsgs.add("此員工已有該權限"); 
//				}
//			}
//			if (!errorMsgs.isEmpty()) {
//				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/empFunc/addEmpFunc.jsp");
//				failureView.forward(req, res);
//				return;
//			}
//			
//			// 若沒有錯誤，新增
//			empFuncSvc.addEmpFunc(emp_id, func_id);
//			// 再用員工編號查詢一次，並丟給另個頁面顯示
//			List<EmpFuncVO> empFuncVO2 = empFuncSvc.getByEmpID(emp_id);
//			req.setAttribute("empFuncVO", empFuncVO2);
//			
//			String url = "/back_end/empFunc/listOneEmpFunc.jsp";
//			RequestDispatcher successView = req.getRequestDispatcher(url); 
//			successView.forward(req, res);
//		}
		
		
		
	}
}

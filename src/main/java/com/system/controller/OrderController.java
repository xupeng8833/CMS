package com.system.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.system.entity.OrderEntity;
import com.system.service.OrderService;
import com.system.utils.PageUtils;
import com.system.utils.Query;
import com.system.utils.R;
import com.system.utils.excel.ExcelFileGenerator;


/**
 * 订单表
 * 
 * @author xp
 * @email 962270789@qq.com
 * @date 2017-11-19 17:01:01
 */
@RestController
@RequestMapping("/sys/order")
public class OrderController {
	@Autowired
	private OrderService orderService;
	
	/**
	 * 列表
	 */
//	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("sys:order:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<OrderEntity> orderList = orderService.queryList(query);
		int total = orderService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(orderList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	
	
	/**
	 * 
	 * @param 导出excel的方法
	 * @return 
	 * @return
	 * @throws IOException 
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("/exportExl")
	@RequiresPermissions("sys:order:exportExl")
	public R exportExl(
			HttpServletRequest request,
			HttpServletResponse response) throws IOException{
		//查询列表数据
//        Query query = new Query(params);

		List<OrderEntity> orderList = orderService.queryList(null);
		ArrayList dataList = new ArrayList();
		
		 for (int i = 0; i < orderList.size(); i++) {
			 OrderEntity orderEntity = orderList.get(i);
			 ArrayList templist = new ArrayList(); 
			 
			 Long orderId = orderEntity.getOrderId();
			 templist.add(orderId);
			 
			 String productName = orderEntity.getProductName();
			 templist.add(productName);
			 
			 Long productNum = orderEntity.getProductNum();
			 templist.add(productNum);
			 
			 Long orderPrice = orderEntity.getOrderPrice();
			 templist.add(orderPrice);
			 
			 Long machineNum = orderEntity.getMachineNum();
			 templist.add(machineNum);
			 
			 Long userId = orderEntity.getUserId();
			 templist.add(userId);
			 
			 Date createTime = orderEntity.getCreateTime();
			 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			 templist.add(sdf.format(createTime));
			 
			 Long payType = orderEntity.getPayType();
			 if(payType==0){
				 templist.add("微信支付");
			 }else{
				 templist.add("支付宝支付");
			 }
			 dataList.add(templist);
			 
		 }
		 ArrayList fieldName=getFieldName();    //excel标题数据集
	     ArrayList fieldData=dataList;    //excel数据内容
		 
	     String myexcel="订单管理";
         response.reset();
         response.setContentType("application/vnd.ms-excel;charset=utf-8");   
         response.setHeader("Content-Disposition", "attachment;filename=" + new String(myexcel.getBytes(),"iso-8859-1") + ".xls");
         response.setCharacterEncoding("utf-8");    
         OutputStream ouputStream = response.getOutputStream();   
         ExcelFileGenerator efg=new ExcelFileGenerator(fieldName, fieldData);//调用另一个类的方法，详见下
         try {
             HSSFWorkbook mybook = efg.expordExcel();//调用另一个类的方法，详见下
             mybook.write(ouputStream);//写入到输出流
         } catch (Exception e) {
             e.printStackTrace();
         }
		 
         ouputStream.flush();   
         ouputStream.close();
		return R.ok();
	}
	
	 //模拟提供excel中的标题数据集
	 @SuppressWarnings({ "unchecked", "rawtypes" })
	 public ArrayList getFieldName(){
	    String str[]={"订单号","商品名称","数量","订单金额","售卖机器编号","购买人ID","购买时间","支付方式"};//设置excel的第一行作为标题
	    ArrayList list=new ArrayList();
	    for(int i=0;i<str.length;i++){
	      list.add(str[i]);
	    }
	    return list;
	  }
}

package com.system.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.math.BigDecimal;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.system.entity.OpsCustomerOrderEntity;
import com.system.entity.OrderEntity;
import com.system.service.OpsCustomerOrderService;
import com.system.utils.PageUtils;
import com.system.utils.Query;
import com.system.utils.R;
import com.system.utils.excel.ExcelFileGenerator;


/**
 * 
 * @Package com.system.controller 
 * @Description: (小王子订单管理) 
 * @author xupeng xupeng@agree.com.cn   
 * @date 2017年11月29日 下午4:40:18 
 * @version V1.0
 */
@RestController
@RequestMapping("opscustomerorder")
public class OpsCustomerOrderController {
	@Autowired
	private OpsCustomerOrderService opsCustomerOrderService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("opscustomerorder:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<OpsCustomerOrderEntity> opsCustomerOrderList = opsCustomerOrderService.queryList(query);
		int total = opsCustomerOrderService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(opsCustomerOrderList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{opsCustomerOrderId}")
	@RequiresPermissions("opscustomerorder:info")
	public R info(@PathVariable("opsCustomerOrderId") Long opsCustomerOrderId){
		OpsCustomerOrderEntity opsCustomerOrder = opsCustomerOrderService.queryObject(opsCustomerOrderId);
		
		return R.ok().put("opsCustomerOrder", opsCustomerOrder);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("opscustomerorder:save")
	public R save(@RequestBody OpsCustomerOrderEntity opsCustomerOrder){
		opsCustomerOrderService.save(opsCustomerOrder);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("opscustomerorder:update")
	public R update(@RequestBody OpsCustomerOrderEntity opsCustomerOrder){
		opsCustomerOrderService.update(opsCustomerOrder);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("opscustomerorder:delete")
	public R delete(@RequestBody Long[] opsCustomerOrderIds){
		opsCustomerOrderService.deleteBatch(opsCustomerOrderIds);
		
		return R.ok();
	}
	
	
	/**
	 * 
	 * @Package com.system.controller 
	 * @Description: (数据导出功能) 
	 * @author xupeng xupeng@agree.com.cn   
	 * @date 2017年11月29日 下午4:39:18 
	 * @version V1.0
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("/exportExl")
	@RequiresPermissions("opscustomerorder:exportExl")
	public R exportExl(
			HttpServletRequest request,
			HttpServletResponse response) throws IOException{
		List<OpsCustomerOrderEntity> orderList = opsCustomerOrderService.queryList(null);
		
		ArrayList dataList = new ArrayList();
		
		 for (int i = 0; i < orderList.size(); i++) {
			 OpsCustomerOrderEntity orderEntity = orderList.get(i);
			 ArrayList templist = new ArrayList(); 
			 
			 Long orderId = orderEntity.getOpsCustomerOrderId();
			 templist.add(orderId);
			 
			 String productName = orderEntity.getOpsProductName();
			 templist.add(productName);
			 
			 Long customerId = orderEntity.getOpsCustomerId();
			 templist.add(customerId);
			 
			 BigDecimal orderPrice = orderEntity.getOpsProductAmount();
			 templist.add(orderPrice);
			 
			 String productStatus = orderEntity.getOpsProductStatus();
			 templist.add(productStatus);
			 
			 String storeName = orderEntity.getOpsStoreName();
			 templist.add(storeName);
			 
			 String storeAddress = orderEntity.getOpsStoreAddress();
			 templist.add(storeAddress);
			 
			 Long opsDesktopMachineId = orderEntity.getOpsDesktopMachineId();
			 templist.add(opsDesktopMachineId);

			 String opsTransactionMode = orderEntity.getOpsTransactionMode();
			 templist.add(opsTransactionMode);
			 
			 String opsTransactionStatus = orderEntity.getOpsTransactionStatus();
			 templist.add(opsTransactionStatus);
			 
			 String opsScene = orderEntity.getOpsScene();
			 templist.add(opsScene);
			 
			 String opsDomain = orderEntity.getOpsDomain();
			 templist.add(opsDomain);
			 
			 String opsType = orderEntity.getOpsType();
			 templist.add(opsType);
			 
			 Date createTime = orderEntity.getCreateTime();
			 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			 templist.add(sdf.format(createTime));
			 
			 dataList.add(templist);
			 
		 }
		 ArrayList fieldName=getFieldName();    //excel标题数据集
		 
	     String myexcel="订单管理";
        response.reset();
        response.setContentType("application/vnd.ms-excel;charset=utf-8");   
        response.setHeader("Content-Disposition", "attachment;filename=" + new String(myexcel.getBytes(),"iso-8859-1") + ".xls");
        response.setCharacterEncoding("utf-8");    
        OutputStream ouputStream = response.getOutputStream();   
        ExcelFileGenerator efg=new ExcelFileGenerator(fieldName, dataList);//调用另一个类的方法，详见下
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
	    String str[]={"订单编号","商品名称","用户id","商品金额","商品类型","店名","商店地址","桌面机器编号","交易方式","交易状态","场景","功能区","类型","交易时间"};//设置excel的第一行作为标题
	    ArrayList list=new ArrayList();
	    for(int i=0;i<str.length;i++){
	      list.add(str[i]);
	    }
	    return list;
	  }
}

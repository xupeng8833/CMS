$(function () {
    $("#jqGrid").jqGrid({
        url: '../sys/order/list',
        datatype: "json",
        colModel: [			
			{ label: '订单号', name: 'orderId', index: 'order_id',sortable: false, width: 80 }, 			
			{ label: '商品名称', name: 'productName', index: 'product_name', sortable: false,width: 80 }, 			
			{ label: '数量', name: 'productNum', index: 'product_num', sortable: false,width: 80 }, 			
			{ label: '订单金额', name: 'orderPrice', index: 'order_price', sortable: false,width: 80 }, 			
			{ label: '售卖机器编号', name: 'machineNum', index: 'machine_num', sortable: false,width: 80 }, 
			{ label: '购买人ID', name: 'userId', index: 'user_id', sortable: false,width: 80 }, 
			{ label: '购买时间', name: 'createTime', index: 'create_time', sortable: false,width: 80 }	,
			{ label: '支付方式 ', name: 'payType', index: 'pay_type',sortable: false, width: 80 ,formatter:
				function (value, grid, rows, state) {
				if(value === 0){
					return "微信支付"	
				}else if(value === 1){
					return "支付宝支付"
				}
				
			}}			
        ],
		viewrecords: true,
        height: 385,
        rowNum: 10,
		rowList : [10,30,50],
        rownumWidth: 25, 
        autowidth:true,
        pager: "#jqGridPager",
        jsonReader : {
            root: "page.list",
            page: "page.currPage",
            total: "page.totalPage",
            records: "page.totalCount"
        },
        prmNames : {
            page:"page", 
            rows:"limit", 
            order: "order"
        },
        gridComplete:function(){
        	//隐藏grid底部滚动条
        	$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" }); 
        }
    });
});

//执行一个laydate实例
laydate.render({
  elem: '#benginTime' //指定元素
 ,type: 'datetime'
 ,theme: '#393D49'
});

laydate.render({
  elem: '#endTime' //指定元素
  ,type: 'datetime'
  ,theme: '#393D49'
});


var vm = new Vue({
	el:'#rrapp',
	data:{
		q:{
			orderId: null,
			productName: null,
			machineNum: null,
			userId: null
		},
		showList: true,
		title: null,
		order: {}
	},
	methods: {
		query: function () {
			$("#jqGrid").jqGrid('setGridParam',{ 
                postData:{'userId': vm.q.userId,'orderId': vm.q.orderId
                	,'productName': vm.q.productName,'machineNum': vm.q.machineNum
                	,'benginTime': $("#benginTime").val(),'endTime': $("#endTime").val()},
                page:1 
            }).trigger("reloadGrid");
		},
		exportExl: function (event) {
			window.location.href="../sys/order/exportExl";
	},
		reload: function (event) {
			vm.showList = true;
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			$("#jqGrid").jqGrid('setGridParam',{ 
                page:page
            }).trigger("reloadGrid");
		}
	}
});
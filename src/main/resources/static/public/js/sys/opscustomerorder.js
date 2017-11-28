$(function () {
	/*$.get("../public/js/data/province.json", function(data){
		alert(data);
	});*/
    $("#jqGrid").jqGrid({
        url: '../opscustomerorder/list',
        datatype: "json",
        colModel: [			
			{ label: '订单号', name: 'opsCustomerOrderId', index: 'ops_customer_order_id', width: 50, key: true },
			{ label: '商品名称', name: 'opsProductName', index: 'ops_product_name', width: 80 }, 			
			{ label: '用户id', name: 'opsCustomerId', index: 'ops_customer_id', width: 80 ,hidden: true}, 			
			{ label: '商品金额', name: 'opsProductAmount', index: 'ops_product_amount', width: 80 }, 			
			{ label: '商品类型', name: 'opsProductStatus', index: 'ops_product_status', width: 80 }, 			
			{ label: '店名', name: 'opsStoreName', index: 'ops_store_name', width: 80 }, 			
			{ label: '商店地址', name: 'opsStoreAddress', index: 'ops_store_address', width: 80 }, 			
			{ label: '桌面机器编号', name: 'opsDesktopMachineId', index: 'ops_desktop_machine_id', width: 80 }, 			
			{ label: '交易方式', name: 'opsTransactionMode', index: 'ops_transaction_mode', width: 80 }, 			
			{ label: '交易状态', name: 'opsTransactionStatus', index: 'ops_transaction_status', width: 80 }, 			
			{ label: '场景', name: 'opsScene', index: 'ops_scene', width: 80 }, 			
			{ label: '功能区', name: 'opsDomain', index: 'ops_domain', width: 80 }, 			
			{ label: '类型', name: 'opsType', index: 'ops_type', width: 80 }, 			
			{ label: '交易时间时间', name: 'createTime', index: 'create_time', width: 80 }	, 			
			{ label: '操作', name: 'opsCustomerOrderId', index: 'opsCustomerOrderId', width: 50, key: true ,formatter:
				function (value, grid, rows, state) {
					return "<a href=\"#\"  style=\"color:#337ab7;font-weight:700;text-decoration: none\"  onclick=\"refundment(" + value + ")\">退款</a>";	
				}}			
        ],
		viewrecords: true,
        height: 385,
        rowNum: 10,
		rowList : [10,30,50],
        rownumbers: true, 
        rownumWidth: 25, 
        autowidth:true,
        multiselect: true,
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

//退款操作
function refundment(id){
	alert(id);
}



var vm = new Vue({
	el:'#rrapp',
	data:{
	   q:{
	    opsCustomerOrderId: null,
		productName: null,
		machineNum: null,
		userId: null
		},
		items:[{text:'A',value:'a'},{text:'B',value:'b'},{text:'C',value:'c'}],
		selected:'',
		showList: true,
		title: null,
		opsCustomerOrder: {},
		
		arr: '../public/js/data/province.json',
		prov: '',
		city: '',
		district: '区',
		cityArr: [],
		districtArr: []
	},
	methods: {
		query: function () {
			$("#jqGrid").jqGrid('setGridParam',{ 
                postData:{'opsCustomerOrderId': vm.q.opsCustomerOrderId,'orderId': vm.q.orderId
                	,'productName': vm.q.productName,'machineNum': vm.q.machineNum
                	,'benginTime': $("#benginTime").val(),'endTime': $("#endTime").val()},
                page:1 
            }).trigger("reloadGrid");
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.opsCustomerOrder = {};
		},
		update: function (event) {
			var opsCustomerOrderId = getSelectedRow();
			if(opsCustomerOrderId == null){
				return ;
			}
			vm.showList = false;
            vm.title = "修改";
            
            vm.getInfo(opsCustomerOrderId)
		},
		saveOrUpdate: function (event) {
			var url = vm.opsCustomerOrder.opsCustomerOrderId == null ? "../opscustomerorder/save" : "../opscustomerorder/update";
			$.ajax({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.opsCustomerOrder),
			    success: function(r){
			    	if(r.code === 0){
						alert('操作成功', function(index){
							vm.reload();
						});
					}else{
						alert(r.msg);
					}
				}
			});
		},
		getInfo: function(opsCustomerOrderId){
			$.get("../opscustomerorder/info/"+opsCustomerOrderId, function(r){
                vm.opsCustomerOrder = r.opsCustomerOrder;
            });
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
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
//        rownumbers: true, 
        rownumWidth: 25, 
        autowidth:true,
//        multiselect: true,
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

var vm = new Vue({
	el:'#rrapp',
	data:{
		q:{
			userId: null,
			orderId: null
		},
		showList: true,
		title: null,
		order: {}
	},
	methods: {
		query: function () {
			$("#jqGrid").jqGrid('setGridParam',{ 
                postData:{'userId': vm.q.userId,'orderId': vm.q.orderId},
                page:1 
            }).trigger("reloadGrid");
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.order = {};
		},
		update: function (event) {
			var id = getSelectedRow();
			if(id == null){
				return ;
			}
			vm.showList = false;
            vm.title = "修改";
            
            vm.getInfo(id)
		},
		saveOrUpdate: function (event) {
			var url = vm.order.id == null ? "../sys/order/save" : "../sys/order/update";
			$.ajax({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.order),
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
		del: function (event) {
			var ids = getSelectedRows();
			if(ids == null){
				return ;
			}
			
			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: "../sys/order/delete",
				    data: JSON.stringify(ids),
				    success: function(r){
						if(r.code == 0){
							alert('操作成功', function(index){
								$("#jqGrid").trigger("reloadGrid");
							});
						}else{
							alert(r.msg);
						}
					}
				});
			});
		},
		getInfo: function(id){
			$.get("../sys/order/info/"+id, function(r){
                vm.order = r.order;
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
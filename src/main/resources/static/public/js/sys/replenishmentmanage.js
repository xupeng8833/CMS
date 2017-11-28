$(function () {
    $("#jqGrid").jqGrid({
        url: '../replenishmentmanage/list',
        datatype: "json",
        colModel: [			
			{ label: 'opsReplenishmentNum', name: 'opsReplenishmentNum', index: 'ops_replenishment_num', width: 50, key: true },
			{ label: '店长编号', name: 'opsStoreManagerId', index: 'ops_store_manager_id', width: 80 }, 			
			{ label: '店名', name: 'opsStoreName', index: 'ops_store_name', width: 80 }, 			
			{ label: '联系人姓名', name: 'opsLinkmanName', index: 'ops_linkman_name', width: 80 }, 			
			{ label: '上次补货时间', name: 'createTime', index: 'create_time', width: 80 }, 			
			{ label: '是否有申请 0代表没有 1代表有', name: 'opsApplicationStatus', index: 'ops_application_status', width: 80 }, 			
			{ label: '上次补纸量', name: 'opsLastAmountPaper', index: 'ops_last_amount_paper', width: 80 }, 			
			{ label: '期初纸量', name: 'opsInitialPaperQuantity', index: 'ops_initial_paper_quantity', width: 80 }, 			
			{ label: '当前出纸率', name: 'opsPaperYield', index: 'ops_paper_yield', width: 80 }, 			
			{ label: '剩余纸量', name: 'opsPaperSurplus', index: 'ops_paper_surplus', width: 80 }, 			
			{ label: '单日出纸量', name: 'opsPaperOutput', index: 'ops_paper_output', width: 80 }, 			
			{ label: '补货周期', name: 'opsReplenishmentCycle', index: 'ops_replenishment_cycle', width: 80 }, 			
			{ label: '商品名称', name: 'opsProductName', index: 'ops_product_name', width: 80 }, 			
			{ label: '商品类型', name: 'opsProductType', index: 'ops_product_type', width: 80 }, 			
			{ label: '异常状态', name: 'opsErrorState', index: 'ops_error_state', width: 80 }, 			
			{ label: '异常备注', name: 'opsErrorRemark', index: 'ops_error_remark', width: 80 }			
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

var vm = new Vue({
	el:'#rrapp',
	data:{
		q:{
			reportNum: null,
			productName: null,
			machineNum: null,
			userId: null
		},
		showList: true,
		title: null,
		replenishmentManage: {}
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.replenishmentManage = {};
		},
		update: function (event) {
			var opsReplenishmentNum = getSelectedRow();
			if(opsReplenishmentNum == null){
				return ;
			}
			vm.showList = false;
            vm.title = "修改";
            
            vm.getInfo(opsReplenishmentNum)
		},
		saveOrUpdate: function (event) {
			var url = vm.replenishmentManage.opsReplenishmentNum == null ? "../replenishmentmanage/save" : "../replenishmentmanage/update";
			$.ajax({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.replenishmentManage),
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
			var opsReplenishmentNums = getSelectedRows();
			if(opsReplenishmentNums == null){
				return ;
			}
			
			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: "../replenishmentmanage/delete",
				    data: JSON.stringify(opsReplenishmentNums),
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
		getInfo: function(opsReplenishmentNum){
			$.get("../replenishmentmanage/info/"+opsReplenishmentNum, function(r){
                vm.replenishmentManage = r.replenishmentManage;
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
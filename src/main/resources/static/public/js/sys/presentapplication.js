$(function () {
    $("#jqGrid").jqGrid({
        url: '../sys/presentapplication/list',
        datatype: "json",
        colModel: [			
			{ label: '提现流水单号', name: 'applicationNum', index: 'application_num', width: 80 , sortable: false}, 			
			{ label: '提现用户ID', name: 'applyNameNum', index: 'apply_name_num', width: 80 , sortable: false}, 			
			{ label: '账号名称', name: 'accountName', index: 'account_name', width: 80 , sortable: false}, 			
			{ label: '手机号', name: 'mobile', index: 'mobile', width: 80 , sortable: false}, 			
			{ label: '运营商名称', name: 'operatorName', index: 'operator_name', width: 80 , sortable: false}, 			
			{ label: '可提现金额', name: 'cashAvailable', index: 'cash_available', width: 80 , sortable: false}, 			
			{ label: '提现金额', name: 'withdrawalAmount', index: 'withdrawal_amount', width: 80 , sortable: false}, 			
			{ label: '申请时间', name: 'createTime', index: 'create_time', width: 80 },
			{ label: '处理状态', name: 'auditState', index: 'audit_state', width: 80 , sortable: false,formatter:
				function (value, grid, rows, state) {
				if(value === 0){
					return "未审核";	
				}else if(value === 1){
					return "已审核";
				}
				
			}}, 			
			{ label: '操作', name: 'id', index: 'id', width: 50, key: true ,formatter:
				function (value, grid, rows, state) {
					return "<a href=\"#\"  style=\"color:#337ab7;font-weight:700;text-decoration: none\"  onclick=\"getApplicationInfo(" + value + ")\">操作</a>";	
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

//点击操作
var applicationNumId = null;
function getApplicationInfo(id){
	applicationNumId=id;
	alert("审核成功！！");
	//document.getElementById("getApplicationInfo").click();
}

var vm = new Vue({
	el:'#rrapp',
	data:{		
		q:{
			applicationNum: null,
			applyNameNum: null,
			mobile: null,
			accountName: null
		},
		items:[{text:'全部',value:''},{text:'未审核',value:0},{text:'已审核',value:1}],  
		showList: true,
		title: null,
		presentApplication: {}
	},
	methods: {
		query: function () {
			$("#jqGrid").jqGrid('setGridParam',{ 
                postData:{'applicationNum': vm.q.applicationNum,'applyNameNum': vm.q.applyNameNum
                	,'mobile': vm.q.mobile,'accountName': vm.q.accountName
                	,'benginTime': $("#benginTime").val(),'endTime': $("#endTime").val()
                	,'auditState': $("#auditStateId").val()},
                page:1 
            }).trigger("reloadGrid");
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.presentApplication = {};
		},
		update: function (event) {
			//var id = getSelectedRow();
			if(applicationNumId == null){
				return ;
			}
			vm.showList = false;
            vm.title = "审核";
            vm.getInfo(applicationNumId)
		},
		saveOrUpdate: function (event) {
			var url = vm.presentApplication.id == null ? "../sys/presentapplication/save" : "../sys/presentapplication/update";
			$.ajax({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.presentApplication),
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
				    url: "../sys/presentapplication/delete",
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
			$.get("../sys/presentapplication/info/"+id, function(r){
                vm.presentApplication = r.presentApplication;
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
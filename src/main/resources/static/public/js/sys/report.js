$(function () {
    $("#jqGrid").jqGrid({
        url: '../sys/report/list',
        datatype: "json",
        colModel: [			
			{ label: '报修单号', name: 'reportNum', index: 'report_num',sortable: false, width: 80 }, 			
			{ label: '报修机器编号', name: 'machineNum', index: 'machine_num',sortable: false, width: 80 }, 			
			{ label: '报修人', name: 'reporterName', index: 'reporter_name', sortable: false,width: 80 }, 			
			{ label: '报修人身份', name: 'reporterType', index: 'reporter_type',sortable: false, width: 80,formatter:
				function (value, grid, rows, state) {
				if(value === 0){
					return "客户"	
				}else if(value === 1){
					return "代理商"
				}else if(value === 2){
					return "补货员"
				}
				
			} }, 			
			{ label: '报修备注', name: 'reportContent', index: 'report_content', sortable: false,width: 80 }, 
			{ label: '维修反馈信息', name: 'repairContent', index: 'repair_content', sortable: false,width: 80 ,hidden: true}, 			
			{ label: '购买时间', name: 'createTime', index: 'create_time', sortable: false,width: 80 }	,
			{ label: '操作', name: 'id', index: 'id', sortable: false,width: 80 ,formatter:
				function (value, grid, rows, state) {
					return "<a href=\"#\"  style=\"color:#337ab7;font-weight:700;text-decoration: none\"  onclick=\"getReportInfo(" + value + ")\">操作</a>"	
				}
			}			
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


//点击操作隐藏按钮的功能
//调用回复按钮
var reportId = null;
function getReportInfo(id){
	reportId = id
    document.getElementById("getReportInfo").click(); 
};

var vm = new Vue({
	el:'#rrapp',
	data:{
		q:{
			reportNum: null,
			machineNum: null,
			reporterName: null
		},
		showList: true,
		title: null,
		report: {}
	},
	methods: {
		query: function () {
			$("#jqGrid").jqGrid('setGridParam',{ 
                postData:{'reportNum': vm.q.reportNum,'machineNum': vm.q.machineNum
                	,'reporterName': vm.q.reporterName
                	,'benginTime': $("#benginTime").val(),'endTime': $("#endTime").val()},
                page:1 
            }).trigger("reloadGrid");
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.report = {};
		},
		update: function (event) {
			//var id = getSelectedRow();
			if(reportId == null){
				return ;
			}
			vm.showList = false;
            vm.title = "修改";
            
            vm.getInfo(reportId)
		},
		saveOrUpdate: function (event) {
			var url = vm.report.id == null ? "../sys/report/save" : "../sys/report/update";
			$.ajax({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.report),
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
				    url: "../sys/report/delete",
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
			$.get("../sys/report/info/"+id, function(r){
                vm.report = r.report;
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
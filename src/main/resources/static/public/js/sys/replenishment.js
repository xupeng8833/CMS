$(function () {
    $("#jqGrid").jqGrid({
        url: '../sys/replenishment/list',
        datatype: "json",
        colModel: [			
			{ label: '补货单号', name: 'replenishmentNum', index: 'replenishment_num', width: 80 }, 			
			{ label: '补货机器编号', name: 'machineNum', index: 'machine_num', width: 80 }, 			
			{ label: '补货商品', name: 'productName', index: 'product_name', width: 80 }, 			
			{ label: '补充数量', name: 'productNum', index: 'product_num', width: 80 }, 			
			{ label: '申请人', name: 'applyName', index: 'apply_name', width: 80 }, 			
			{ label: '申请人身份', name: 'reporterIdentity', index: 'reporter_identity', width: 80 }, 			
			{ label: '补充状态', name: 'applyType', index: 'apply_type', width: 80 }, 			
			{ label: '补货人名称', name: 'replenishmentName', index: 'replenishment_name', width: 80 ,hidden: true},
			{ label: '机器所属经销商', name: 'machineDealer', index: 'machine_dealer', sortable: false,width: 80 ,hidden: true}, 
			{ label: '机器所属补货员', name: 'machineClerk', index: 'machine_clerk', sortable: false,width: 80 ,hidden: true}, 
			{ label: '机器所在地址', name: 'machineAddr', index: 'machine_addr', sortable: false,width: 80 ,hidden: true},
			{ label: '申请时间', name: 'createTime', index: 'create_time', width: 80 },		
			{ label: '操作', name: 'id', index: 'id', width: 50, key: true,formatter:
				function (value, grid, rows, state) {
					return "<a href=\"#\"  style=\"color:#337ab7;font-weight:700;text-decoration: none\"  onclick=\"getReplenishmentInfo(" + value + ")\">操作</a>"	
				} }			
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

//调用回复按钮
var replenishmentId = null;
function getReplenishmentInfo(id){
	replenishmentId = id
    document.getElementById("getReplenishmentInfo").click(); 
};


var vm = new Vue({
	el:'#rrapp',
	data:{
		q:{
			replenishmentNum: null,
			machineNum: null,
			applyName: null
		},
		showList: true,
		title: null,
		replenishment: {}
	},
	methods: {
		query: function () {
			$("#jqGrid").jqGrid('setGridParam',{ 
                postData:{'replenishmentNum': vm.q.replenishmentNum,'machineNum': vm.q.machineNum
                	,'applyName': vm.q.applyName
                	,'benginTime': $("#benginTime").val(),'endTime': $("#endTime").val()},
                page:1 
            }).trigger("reloadGrid");
		},
		update: function (event) {
			//var id = getSelectedRow();
			if(replenishmentId == null){
				return ;
			}
			vm.showList = false;
            vm.title = "补货详情";
            
            vm.getInfo(replenishmentId)
		},
		saveOrUpdate: function (event) {
			var url = vm.replenishment.id == null ? "../sys/replenishment/save" : "../sys/replenishment/update";
			$.ajax({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.replenishment),
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
				    url: "../sys/replenishment/delete",
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
			$.get("../sys/replenishment/info/"+id, function(r){
                vm.replenishment = r.replenishment;
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
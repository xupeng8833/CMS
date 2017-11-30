$(function () {
    $("#jqGrid").jqGrid({
        url: '../sp/list',
        datatype: "json",
        colModel: [			
			{ label: 'spId', name: 'spId', index: 'sp_id', width: 50, key: true },
			{ label: '商品名称', name: 'spNm', index: 'sp_nm', width: 80 }, 			
			{ label: '售价', name: 'spPrice', index: 'sp_price', width: 80 }, 			
			{ label: '类别', name: 'spType', index: 'sp_type', width: 80 }, 			
			{ label: '规格', name: 'spGuige', index: 'sp_guige', width: 80 }, 			
			{ label: '品牌', name: 'spPinpai', index: 'sp_pinpai', width: 80 }, 			
			{ label: 'PN码', name: 'spPn', index: 'sp_pn', width: 80 }, 			
			{ label: '状态:正常,下架', name: 'spStatus', index: 'sp_status', width: 80 }, 			
			{ label: '机器编号', name: 'spJiqiid', index: 'sp_jiqiid', width: 80 }, 			
			{ label: '商品图片', name: 'spImage', index: 'sp_image', width: 80 }, 			
			{ label: '状态   0：隐藏   1：显示', name: 'status', index: 'status', width: 80 }			
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
		showList: true,
		title: null,
		sp: {
			spType: null,
			spNm: null,
			spPn: null
		}
	},
	methods: {
		query: function () {
			$("#jqGrid").jqGrid('setGridParam',{ 
                postData:{'spNm': vm.sp.spNm,'spType': vm.sp.spType
                	,'spPn': vm.sp.spPn},
                page:1 
            }).trigger("reloadGrid");
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.sp = {};
		},
		update: function (event) {
			var spId = getSelectedRow();
			if(spId == null){
				return ;
			}
			vm.showList = false;
            vm.title = "修改";
            
            vm.getInfo(spId)
		},
		saveOrUpdate: function (event) {
			var url = vm.sp.spId == null ? "../sp/save" : "../sp/update";
			$.ajax({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.sp),
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
			var spIds = getSelectedRows();
			if(spIds == null){
				return ;
			}
			
			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: "../sp/delete",
				    data: JSON.stringify(spIds),
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
		getInfo: function(spId){
			$.get("../sp/info/"+spId, function(r){
                vm.sp = r.sp;
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
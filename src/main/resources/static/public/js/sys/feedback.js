$(function () {
    $("#jqGrid").jqGrid({
        url: '../sys/feedback/list',
        datatype: "json",
        colModel: [			
			{ label: '意见反馈ID', name: 'feedbackId', index: 'feedback_id', width: 50, key: true },
			{ label: '用户id', name: 'userId', index: 'user_id', width: 80 }, 			
			{ label: '联系电话', name: 'mobile', index: 'mobile', width: 80 }, 			
			{ label: '身份', name: 'identity', index: 'identity', width: 80 ,formatter: function(value, options, row){
				if (value==0){
					return "客户";
				}
				else if (value==1){
					return "代理商";
				}
				else if (value==2){
					return "补货员";
				}
				}}, 			
			{ label: '反馈时间', name: 'createTime', index: 'create_time', width: 80 }	,
			{ label: '回复', name: 'replyType', index: 'reply_type', width: 80 ,formatter:
				function (value, grid, rows, state) {
					if(value === 0){
						return "<a href=\"#\"  style=\"color:#337ab7;font-weight:700;text-decoration: none\"  onclick=\"reply(" + rows.feedbackId + ")\">回复</a>"	
					}else if(value === 1){
						return "已回复"
					}
					
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

//调用回复按钮
var feedbackId = null;
function reply(id){
	 feedbackId = id
	 document.getElementById("updateFeedback").click();
}


var vm = new Vue({
	el:'#rrapp',
	data:{
		q:{
			userId: null,
			mobile: null
		},
		showList: true,
		title: null,
		feedback: {}
	},
	methods: {
		query: function () {
			$("#jqGrid").jqGrid('setGridParam',{ 
                postData:{'userId': vm.q.userId,'mobile': vm.q.mobile},
                page:1 
            }).trigger("reloadGrid");
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.feedback = {};
		},
		update: function (event) {
			if(feedbackId == null){
				return ;
			}
			vm.showList = false;
            vm.title = "回复回馈";
            vm.getInfo(feedbackId)
		},
		saveOrUpdate: function (event) {
			var url = vm.feedback.feedbackId == null ? "../sys/feedback/save" : "../sys/feedback/update";
			$.ajax({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.feedback),
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
			var feedbackIds = getSelectedRows();
			if(feedbackIds == null){
				return ;
			}
			
			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: "../sys/feedback/delete",
				    data: JSON.stringify(feedbackIds),
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
		getInfo: function(feedbackId){
			$.get("../sys/feedback/info/"+feedbackId, function(r){
                vm.feedback = r.feedback;
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
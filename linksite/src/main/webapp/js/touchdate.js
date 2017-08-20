/**
 * 日历插件
 * 版本：2.0
 * 依赖：lib.js
 * 新版特性：
 * 1、支持左右滑动切换月份
 * 2、上下滑动关闭插件
 * 3、插件语言拓展
 * 
 * 改进：
 * 1、优化设置指定日期，并且到月份视图
 * 2、onpicked事件改为onchange事件
 * 3、优化了默认日期的设置
 * 4、优化了触摸处理
 * 
 * 微信项目下如何使用插件？
 * 在html页面汇中引入：
 * wx/touchplugin/css/touchdate.css
 * wx/touchplugin/js/touchdate.js
 * 
 * 构造配置参数对象属性说明
 * var paramsobject={
		defaultvalue【可选，yyyy-MM-dd格式的字串】//指定默认日期
		isshow【可选：boolean类型】,//是否默认显示日期
		lan【可选：参考language对象的可选属性，可自行拓展，字串】,//日历展示语言
		limitstart:【可选：Date类型】,//可选开始日期
		limitend:【可选：Date类型】,//可选截止范围
		outlimitedclickable：【可选：boolean类型】，超出限定范围的是否可以点击
		onchange:【可选，function类型，回传所选的日期字串，格式为yyyy-MM-dd】,//日期更改事件监听
		onselect:【可选，function类型，回传所选的日期字串，格式为yyyy-MM-dd】,//日期选择事件监听
		markArray【可选，用于标记的时间对象范围数组】//标记范围对象数据，结构[{start:Date,end:Date,msg:"班",color:"red"},...]
		//markClass:【配置markArray使用，标记的样式class】//标记类【例如：标记预售:wool_mark_sale，标记电子票：wool_mark_ticket】
 * };
 * 
 * 方法：
 * setDate(date);//设置日期，参数为Date类型对象或者yyyy-MM-dd格式的字串
 * show(widthAnimation);//显示插件 参数widthAnimation：是否执行动画，boolean类型
 * hide(widthAnimation);//显示插件，参数同show方法
 * toggle(widthAnimation);//开关插件，参数同show方法
 *
 *更新时间：2016-02-23
 * 
 */
(function(){
	//语言
	var language={
			"ZH-CN":{
				previousMonth:"上月",
				nextMonth:"下月",
				year:"年",
				month:"月",
				date:"日",
				today:"今天",
				weeks:["周日","周一","周二","周三","周四","周五","周六"],
				monthes:["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"]
			},
		"EN":{
			previousMonth:"last Month",
			nextMonth:"next Month",
			year:"-",
			month:"",
			date:"",
			today:"today",
			weeks:["Sun","Mon","Tues","Wed","Thur","Fri","Sat"],
			monthes:["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
		}
	};
	//2016节气+高峰购票
	/*var jieqi2016=new Array('0106小寒','0120大寒','0204立春','0219雨水','0305惊蛰','0320春分',
			'0404清明','0419谷雨','0505立夏','0520小满','0605芒种','0621夏至','0707小暑',
			'0722大暑','0807立秋','0823处暑','0907白露','0923秋分','1008寒露','1023霜降',
			'1108立冬','1122小雪','1207大雪','1221冬至',
			'0101元旦','0207除夕','0208春节','0222元宵节','0501劳动节','0601儿童节',
			'0609端午节','0915中秋节','1001国庆节','1224平安夜','1225圣诞节');*/
	//节气
	//var jieqiobj={2016:jieqi2016};

	var oneday = 1000  *  60 *  60 *24;//一天
	/**通过lib包调用*/
	$.extend($,{
		touchDate:function(params){
			var mToday = new Date();//今天
			var mTodayFormat = mToday.format("yyyy-MM-dd");
			var mSelectedDay = mTodayFormat;//默认选中的日期
			
			var pms = $.extend({
				defaultvalue:mSelectedDay,//指定默认日期
				isshow:false,//是否默认展示日期
				lan:"ZH-CN",//日历展示语言
				limitstart:null,//可选开始范围
				limitend:null,//可选截止范围
				outlimitedclickable:false,//可选范围外的日期是否可以点击
				onchange:null,//更改事件
				onselect:null,//选择事件
				markArray:null,//标记范围，结构[{start:date,end:date},...]
				inline:false,//是否在页面直接显示，true为是，false为弹出
				showBody:null,//当inline为true时：必须传日历控件的父级对象进来
				//markClass:null//标记类【标记预售:wool_mark_sale】
			},params);
			
			mSelectedDay = pms.defaultvalue;
			
			var _picker = this;
			var mMoveAnislide;//月份切换动画
			var lan = language[pms.lan];//默认中文
			var mIdx =-1;//日期的初始位置
			var mLastIdx =mIdx;
			var mCountIdx=new Date().getFullYear();//初始年份
			var mDateBack;//遮罩
			var mDateFrame;//框架
			var mPreviousMonth;//上月
			var mYearMonth;//当前年月视图
			var mNextMonth;//下月
			var mMover;//滑动器
			var mSelectDate=new Date(mSelectedDay.replaceAll("-","/"));//默认日期
			var mGuideView;
			var mBody = document.body;
			//绘制框架
			function fnDrowFrame(){
				mDateBack = $.create("div",mBody).addClass("wooldateback");
				//框架
				if(pms.inline){
					mDateFrame = $.create("div",pms.showBody);
				}else{
					mDateFrame = $.create("div",mBody).addClass("wooldateFrame");
				}
				//工具栏
				var toolBar = $.create("div",mDateFrame).attr("class","flexbox wooltouch_tool font_14");
				mPreviousMonth = $.create("div",toolBar).attr("class","flexboxitem wooltouch_previousmonth")
				.html("&lt;&lt;"+lan.previousMonth);
				mYearMonth = $.create("div",toolBar).attr("class","flexboxitem wooltouch_curmonth font_16");
				mNextMonth = $.create("div",toolBar).attr("class","flexboxitem wooltouch_nextmonth").
				html(lan.nextMonth+"&gt;&gt;");
				
				//星期
				var week = $.create("ul",mDateFrame).attr("class","flexbox wooltouch_week font_14");
				for(var i=0;i<7;i++){
					$.create("li",week).html(lan.weeks[i]);
				}
				//月份框架
				var monthwrap = $.create("div",mDateFrame).attr("class","woolcontainer font_14");
				mMover =   $.create("div",monthwrap).attr("class","flexbox wooltouch_move");
				var table = fnAddMonthView();
				for(var i=0;i<2;i++){
					table.clone(true).appendTo(mMover);
				}
				//展示默认日期
				updateYearMonth(mSelectDate);
				fnInitEvent();
				initview();
				fnFillPickData(mSelectDate);
			}
			
			//填充可预览的日期视图
			function fnFillPickData(date){
				mSelectDate = new Date(date.getTime());
				mSelectedDay = mSelectDate.format("yyyy-MM-dd");
				date.setDate(1);
				date.setMonth(date.getMonth()-1);
				var tables = mMover.find("table");
				for(var i=0;i<3;i++){
					var dt =new Date(date.getTime());
					dt.setMonth(dt.getMonth()+i);
					fnMonthData(tables[i],dt);
				}
			}
			
			//调到指定的日期
			function fnChangeTo(date){
				updateYearMonth(date);
				fnFillPickData(date);
			}

			//创建单个月份视图
			function fnAddMonthView(){
				var table = $.create("table",mMover).attr("class","flexboxitem table wooltouch_month");
				for(var m=0;m<6;m++){
					var tr = $.create("tr",table);
					for(var i=0;i<7;i++){
						$.create("td",tr);
					}
				}
				return table;
			}
			
			//是否正在切换月份
			function fnIsChanging(){
				return mMoveAnislide && mMoveAnislide.isAnimation();
			}
			
			//日期事件监听
			function fnInitEvent(){
				mDateBack.tap(function(){
					if(!pms.inline){
						_picker.hide(true);
					}
				});
				
				mMover.parent().onTap("td",function(){
					//alert(11)
					if(!pms.outlimitedclickable && this.hasClass("wool_disabled")){
						return;
					}
					mSelectedDay = this.attr("data-date");
					if(!this.hasClass("wool_selected")){
						//alert(22)
						mSelectDate = new Date(mSelectedDay.replaceAll("-","/"));
						var lastselect = mMover.find(".wool_selected",true);
						if(lastselect){
							$.each(lastselect,function(){
								this.removeClass("wool_selected");
							});
						}
						var needupdate = mMover.find("td",true);
						if(needupdate){
							$.each(needupdate,function(){
								if(this.attr("data-date")==mSelectedDay){
							//		alert(33)
									this.addClass("wool_selected")
								}
							});
						}
						//日期更改事件
						if(pms.onchange){
							pms.onchange(mSelectedDay);
						}
					}
					//日期选择时间
					if(pms.onselect){
						pms.onselect(mSelectedDay);
					}
					if(!pms.inline){
						_picker.toggle(true);
					}
				});
				
				
				
				mPreviousMonth.parent().onTap(".wooltouch_previousmonth,.wooltouch_nextmonth",function(){
					if(fnIsChanging()){
						return;
					}
					if(this.hasClass("wooltouch_previousmonth")){
						//点击展示上月
						var start = mMover.offsetWidth*mIdx;
						mIdx++;
						var end = mMover.offsetWidth*mIdx;
						completeani(mMover,start,end);
					}else if(this.hasClass("wooltouch_nextmonth")){
						//点击展示下月
						var start = mMover.offsetWidth*mIdx;
						mIdx--;
						var end = mMover.offsetWidth*mIdx;
						completeani(mMover,start,end);
					}
					
				});
			
				
				//左右滑动切换月份
				mMover.slide(function(e,recorder){
					if(!recorder.isVertical()){
						e.preventDefault();
						e.stopPropagation();
						if(recorder.moveX>=0 && mIdx==0 || recorder.moveX<=0 && Math.abs(mIdx)>=2){
							return;
						}
						if(recorder.isMoving()){
							var css =  "translateX("+(this.offsetWidth*mIdx+recorder.moveX)+"px)";
							this.css({"transform":css,"-webkit-transform":css});
						}else{
							var start = this.offsetWidth*mIdx+recorder.moveX;
							if(recorder.moveX>50){
								mIdx++;
							}else if(recorder.moveX<-50){
								mIdx--;
							}
							var end = this.offsetWidth*mIdx;
							completeani(this,start,end);
						}
					}
				});
			}
			
			//更新年月栏
			function updateYearMonth(date){
				var format = date.format("yyyy"+lan.year+"MM"+lan.month);
				mYearMonth.html(format).attr("data-date",date.getTime());
			}
			
			//填充指定月份的日期数据
			function fnMonthData(monthview,date){
				date.setDate(1);//trim
				var curYear = date.getFullYear();//当前年份
				var curMonth = date.getMonth();//当前月份
				var maxcurdate = fnMaxDayOfMonth(curYear,curMonth+1);//当月最大数
				var firstDayNumber = date.getDay()||7;//当月第一天的星期数
				var tdview = monthview.find("td");
				var cellidx=0;
				if(firstDayNumber>0){
					var lastdate = new Date(date.getTime());
					lastdate.setMonth(lastdate.getMonth()-1);
					var lastYear = lastdate.getFullYear();
					var lastMonth = lastdate.getMonth();
					var maxlastdate = fnMaxDayOfMonth(lastYear,lastMonth+1);//上月最大数
					//展示上个月的数据
					for(var i=firstDayNumber;i>0;i--){
						var date = new Date(lastYear,lastMonth,maxlastdate+1-i);
						var view = tdview[cellidx].removeAttr("class");
						fnFillCell(view,date,false);
						cellidx++;
					}
				}
				//展示当月数据
				for(var i=0;i<maxcurdate;i++){
					var date = new Date(curYear,curMonth,i+1);
					var view = tdview[cellidx].removeAttr("class");
					fnFillCell(view,date,true);
					cellidx++;
				}
				if(cellidx<42){
					var nextdate = new Date(date.getTime());
					nextdate.setDate(1);
					nextdate.setMonth(nextdate.getMonth()+1);
					var nextYear = nextdate.getFullYear();
					var nextMonth = nextdate.getMonth();
					var maxnextdate = fnMaxDayOfMonth(nextYear,nextMonth+1);//上月最大数
					//展示下月数据
					var lastdays = 42-cellidx;
					for(var i=0;i<lastdays;i++){
						var date = new Date(nextYear,nextMonth,i+1);
						var view = tdview[cellidx].removeAttr("class");
						fnFillCell(view,date,false);
						cellidx++;
					}
				}
			}
			
			//填充日期表格
			function fnFillCell(view,date,iscurmonth){
				var dnum = date.getDate();
				var showtext ;
				var format = date.format("yyyy-MM-dd");
				if(iscurmonth && mTodayFormat == format){
					view.addClass("wool_today");
					showtext=lan.today;
				}else if(dnum==1){
					showtext = lan.monthes[date.getMonth()];
					view.addClass("font_12")
				}else{
					showtext = dnum;
				}
				
				//标记范围
				var markArray = pms.markArray;
				var daytime = date.getTime();
				//可选范围
				if(pms.limitstart || pms.limitend){
					var reta = pms.limitstart && Math.ceil((daytime-pms.limitstart.getTime()) / oneday)<0;
					var retb = pms.limitend && Math.ceil((pms.limitend.getTime()-daytime) /  oneday)<1;
					if(reta || retb){
						view.addClass("wool_disabled");//在限制范围之外的都不可以点击
					}
				}
				
				if(mSelectedDay==format){
					view.addClass("wool_selected");
				}
				view.empty().attr("data-date",format).html(showtext);
				
				
				//标记范围
				if($.isArray(markArray)){
					for(var i=0;i<markArray.length;i++){
						var selDate = markArray[i].date;
						if(format == selDate){
							if(selDate){
								view.css({
									verticalAlign: "top",
									textAlign: "left",
									padding: "5px 0 0 5px"
								});
								$.create("div",view).addClass("wool_mark_bj_day").textes(markArray[i].msg).css({
									color : markArray[i].color
								});
								break;
							}
						}
					}
				}
			}
			
			//获取该年月的最大日期
			function fnMaxDayOfMonth(Year,Month){
			    var d = new Date(Year,Month,0);
			    return d.getDate();
			}
			
			//完成切换月份动画
			function completeani(elem,start,end){
		        mMoveAnislide = new $.animate(function(){
		        	var distant = this.easeValue(start, end);
					var css =  "translateX("+distant+"px)";
					elem.css({"transform":css,"-webkit-transform":css});
		        });
		        mMoveAnislide.duration=400;
		        mMoveAnislide.onend=fnOnAnimationEnd;
		        mMoveAnislide.execute();
			}
			
			//结束更新视图
			function fnOnAnimationEnd(){
				mDateCards =  mMover.find("table");
				if(mLastIdx !=mIdx){
					var updatecar;
					var date = new Date(parseInt(mYearMonth.attr("data-date")));
					var updateDate;
					if(mIdx>mLastIdx){
						mMover.insertBefore(mDateCards[2],mDateCards[0]);
						updatecar = mMover.find("table")[0];
						date.setMonth(date.getMonth()-1);
						updateDate = new Date(date.getTime());
						updateDate.setMonth(date.getMonth()-1);
						//需要更新第三个视图
					}else{
						updatecar = mDateCards[0].appendTo(mMover);
						mMover.find("table")[2];
						date.setMonth(date.getMonth()+1);
						updateDate = new Date(date.getTime());
						updateDate.setMonth(date.getMonth()+1);
						//需要更新第一个视图
					}
					var css =  "translateX("+(mMover.offsetWidth*mLastIdx)+"px)";
					mMover.css({"transform":css,"-webkit-transform":css});
					initview();
					updateYearMonth(date);
					fnMonthData(updatecar,updateDate);
				}
			}
			//初始化视图
			function initview(){
				var css =  "translateX("+(mBody.offsetWidth*mLastIdx)+"px)";
				mMover.css({"transform":css,"-webkit-transform":css});
				mIdx=-1;
			}
			//设置日期
			this.setDate=function(date){
				if(date){
					if(typeof date == "string"){
						date = new Date(date.replaceAll("-","/"));
					}
					fnChangeTo(date);
				}
			};
			//开日历框的动画
			function fnToggleView(start,end,opstart,opend,isanimate,callback){
		        var mAnislide = new $.animate(function(){
		        	var distantmove = this.easeValue(start, end);
		        	var distantopacity = this.easeValue(opstart, opend);
					var cssmove =  "translateY("+distantmove+"px)";
					mDateFrame.css({"transform":cssmove,"-webkit-transform":cssmove,opacity:distantopacity});
		        });
		        mAnislide.duration=isanimate?400:1;
		        mAnislide.onend=callback;
		        mAnislide.execute();
			}
			//开关遮罩的动画
			function fnToggleBackView(start,end,isanimate,callback){
				var mAnislide = new $.animate(function(){
					var distant = this.easeValue(start, end);
					mDateBack.css("opacity",distant);
				});
				mAnislide.duration=isanimate?400:1;
				mAnislide.onend=callback;
				mAnislide.execute();
			}
			//可外部调用的显示方法
			this.show=function(isanimate){
				if(mDateFrame.isHidden()){
					var curYM = new Date(parseInt(mYearMonth.attr("data-date"))).format("yyyy-MM");
					var selYM= mSelectDate.format("yyyy-MM");
					if(curYM!=selYM){
						this.setDate(mSelectDate);
					}
					if(!pms.inline){
						mDateBack.showView();
						mDateFrame.showView();
						var viewheight = mDateFrame.offsetHeight;
						var slideheight =($.clientXY().y-viewheight)/2;
						fnToggleView(-viewheight,slideheight,0,1,isanimate);
						fnToggleBackView(0,1,isanimate);
					}
				}
			};
			//可外部调用的隐藏方法
			this.hide=function(isanimate){
				if(!mDateFrame.isHidden()){
					var viewheight = mDateFrame.offsetHeight;
					var slideheight =($.clientXY().y-viewheight)/2;
					fnToggleView(slideheight,-viewheight,1,0,isanimate,function(){
						mDateFrame.hideView();
					});
					fnToggleBackView(1,0,isanimate,function(){
						mDateBack.hideView();
					});
				}
			};
			
			//可外部调用的开关方法
			this.toggle=function(isanimate){
				if(mDateFrame.isHidden()){
					this.show(isanimate);
				}else{
					this.hide(isanimate);
				}
			}
			//构建视图
			fnDrowFrame();
			//初始化展示
			if(pms.isshow){
				this.show(true);
			}
		}
	});
	
})(window);
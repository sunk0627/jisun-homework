(function(ssq){
	var	struc={}, config={}, listener={};
	ssq(document).ready(function(){ struc.init() });
	function trace(a){ var b=""; for(var i=0;i<arguments.length;i++){if(i>0)b+=", ";b+=arguments[i];} try{console.log(b);}catch(e){}}
	struc = {
		init : function() {
			struc.regist(); 
			struc.pageMethod();
			listener.start();
		},
		regist : function() {

		},
		pageMethod : function () {			
			ja.init();	
		}
	};
	listener = {
		start : function(){
			ssq(window).bind("resize", listener.resizePage); listener.resizePage();
			/*ssq("a[href=#]").on("click",function(e){
				e.preventDefault();
			});*/
			ssq(window).on('scroll', function() {

			});
		},
		resizePage : function(e) {

		}
	};
	

	var ja = {
		moreBtn: null,

		init: function(){
			ja.terms();
		},
		terms: function(){
			moreBtn = ssq('.member__contents .member-box.join .inp-box .terms .more__btn');

			moreBtn.on('click', function(){
				ssq(this).parent('div').parent('div').toggleClass('open');
			});


			// 2022-08-24 약관 내용보기
			moreBtn2 = ssq('.join2_220824 .inp-box .terms .more__btn');

			moreBtn2.on('click', function(){
				ssq(this).parent('div').find('.cs-agree-con').show();
			});
			ssq('.cs-agree-con .btn_close').on('click', function(){
				ssq('.cs-agree-con').hide();
			});
		}
	}

	
})(jQuery);
$(function(){
	// 본인인증

	$('.selfv_all label').on('click', function(){
		$('.selfv_list').toggleClass('open');
	});
	$('.selfv_list .btn-view').on('click', function(e){
		e.preventDefault();
		$(this).parent().find('.cs-agree-con').show();
	});
	$('.selfv_list .btn_close').on('click', function(e){
		$('.cs-agree-con').hide();
	});
	// tab
	$('.selfv_list > li').each(function(idx){
		$(this).find('.cs-agree-con').addClass('_lyr0' + idx);

		$('.selfv_list > li .cs-agree-con._lyr0' + idx + ' .tab li').on('click', function(e){
			console.log('click');
			e.preventDefault();

			var tab_idx = $(this).index();

			$('.selfv_list > li .cs-agree-con._lyr0' + idx + ' .tab li').removeClass('on');
			$(this).addClass('on');

			$('.selfv_list > li .cs-agree-con._lyr0' + idx + ' .tab-content').hide();
			$('.selfv_list > li .cs-agree-con._lyr0' + idx + ' .tab-content').eq(tab_idx).show();
		});
	});

	//이용약관
	
	$('.join2_220824 .terms__con--all._down label').on('click', function(){
		var tInput = $(this).parent().find('input');

		if(tInput.prop('checked') == true){
			$(this).parents('.terms__con--all').siblings().removeClass('show');
		}else {
			$(this).parents('.terms__con--all').siblings().addClass('show');
		}
		//$(this).parents('.terms__con--all').siblings().toggleClass('show');
		//$(this).parents('.terms__con--all._down').toggleClass('show');
	});
	
	$('.join2_220824 .terms__con--all.toggle_all label').on('click', function(){
		var tInput = $(this).parent().find('input');

		if(tInput.prop('checked') == true){
			$('.join2_220824 .member-box.join .inp-box .terms.new210302 .agree_mkt').removeClass('show');
			$('.join2_220824 .marketing').removeClass('show');
		}else {
			$('.join2_220824 .member-box.join .inp-box .terms.new210302 .agree_mkt').addClass('show');
			$('.join2_220824 .marketing').addClass('show');
		}
	});

	$('#smsAgree').on('click', function(){
		var tInput = $(this).parent().find('input');
		console.log('aaa');

		if(tInput.prop('checked') == true){
			$('.join2_220824 .marketing').removeClass('show');
		}else {
			$('.join2_220824 .marketing').addClass('show');
		}
	});
});
<!-- #include virtual = "/mo/layout/initialize.asp" -->
<!-- #include virtual = "/mo/layout/doc_title.asp" -->
<!-- #include virtual = "/mo/layout/html_header_220822.asp" -->
<!-- #include virtual = "/include/function_erp.asp" -->

	<!-- 개별 css, js -->
	<script src="/mo/resource/js/pages/join_220822.js"></script>
<script src="/pc/resource/js/pages/member_220822.js?v=202103080001"></script>
<%
if session("MemberID") <> "" then 
%>
<Script>
	alert("고객님께서는 로그인 상태입니다.");
	location.href = "/mypage/mypage.asp";
</Script>
<%
response.end
End If
%>

<%
	returnUrl = Request.ServerVariables("HTTP_HOST")
	if Request.ServerVariables("HTTPS") = "off" then 
		NOWHTTP = "http://"
	else
		NOWHTTP = "https://"
	end if	
%>

<script language="javascript" src="/pc/resource/js/pages/passwordStrengthMeter.js"></script>
<script language="javascript">
	jQuery(document).ready(function() {
		jQuery("#memberPassword").keyup(
			function(){				
				document.getElementById("pwResult").innerHTML = passwordStrengthString(jQuery("#memberPassword").val(),"");
			}
		)
	})

	function gotoScroll(val) {
		var offsetVal = jQuery(val).offset(); 
	<%
	'////////////////////////// mobile check ///////////////////////////////
	arrAgent = request.ServerVariables("HTTP_USER_AGENT")

	if mobile_check(arrAgent) Then 
	%>	var topval = (offsetVal.top) - 100;<%
		imgFolder = "3"
	else
	%>	var topval = (offsetVal.top) - 220;<%
		imgFolder = "2"
	end if
	'////////////////////////// mobile check ///////////////////////////////
	%>	
		jQuery("body,html").animate({scrollTop:topval},100);
		//scrollTop(offsetVal);
	}

	jQuery(function(){
		jQuery("#MemberIsEvent").change(function(){
			if ( jQuery(this).prop("checked") == true ) {
				jQuery("#MemberIsMaillinglist, #MemberIsSMS").prop("checked", true);
			} else {
				jQuery("#MemberIsMaillinglist, #MemberIsSMS").prop("checked", false);
			}
		})
		
		jQuery("#MemberIsMaillinglist, #MemberIsSMS").change(function(){
			var allCnt = jQuery("#MemberIsMaillinglist, #MemberIsSMS").length;
			var chkCnt = jQuery("#MemberIsMaillinglist:checked, #MemberIsSMS:checked").length;
			
			if ( allCnt - chkCnt == 0 ) {
				//jQuery("#MemberIsEvent").prop("checked", true);
			} else {
				//jQuery("#MemberIsEvent").prop("checked", false);
			}
		})

		jQuery("#MemberIsEvent_m").change(function(){
			if ( jQuery(this).prop("checked") == true ) {
				jQuery("#MemberIsMaillinglist_m, #MemberIsSMS_m").prop("checked", true);
			} else {
				jQuery("#MemberIsMaillinglist_m, #MemberIsSMS_m").prop("checked", false);
			}
		})
		
		jQuery("#MemberIsMaillinglist_m, #MemberIsSMS_m").change(function(){
			var allCnt = jQuery("#MemberIsMaillinglist_m, #MemberIsSMS_m").length;
			var chkCnt = jQuery("#MemberIsMaillinglist_m:checked, #MemberIsSMS_m:checked").length;
			
			if ( allCnt - chkCnt == 0 ) {
				//jQuery("#MemberIsEvent").prop("checked", true);
			} else {
				//jQuery("#MemberIsEvent").prop("checked", false);
			}
		})
	})
</script>
<script type="text/javascript">
$(document).ready(function() {
    $("#joinId").bind("keyup", function() {
    $( this ).val($( this ).val().toLowerCase());
    }); 
});

// dynamic 추가
function fn_append(rootName) {
	var pluscnt = jQuery("#" + rootName + " div").length;
//	console.log(pluscnt);
	if (pluscnt < 5)
	{
		var $div = $('input[id^="man"]:last');
		var num = parseInt($div.prop("id").match(/\d+/g), 10) +1;

		var cloneObj = jQuery("#" + rootName + " div:first-child").clone();
		cloneObj.find("cc:last-child").empty();
		cloneObj.find("cc:last-child").append("<a href='#none' onclick='fn_remove(this); return false;'><img src='/images/recruite/btn_gift_minus.gif'></a>");
		cloneObj.find(":input").val("");

		cloneObj.find('input[id^="man"]:last').attr("id","man" + num);
		cloneObj.find('input[id^="man"]:last').attr("name","MemberGender" + num);
		cloneObj.find('input[id^="man"]:last').val("M");
		cloneObj.find('label[for^="man"]:last').attr("for","man" + num);
		cloneObj.find('input[id^="woman"]:last').attr("id","woman" + num);
		cloneObj.find('input[id^="woman"]:last').attr("name","MemberGender" + num);
		cloneObj.find('input[id^="woman"]:last').val("F");
		cloneObj.find('label[for^="woman"]:last').attr("for","woman" + num);

		jQuery("#" + rootName).append(cloneObj); 
	}else{
		alert("항목은 5개까지만 입력가능합니다.");
	}
}
var num = 0;
function fn_append2(rootName) {
	var pluscnt = jQuery("#" + rootName + " div").length;
//	console.log(pluscnt);
	if (pluscnt < 5)
	{
		var $div = $('input[id^="man"]:last');
		if (num == 0){
			num = parseInt($("input[id^='custChSqor']:last").val()) +1;
		}else{
			num++;
		}

		var cloneObj = jQuery("#" + rootName + " div:first-child").clone();
		cloneObj.find("cc:last-child").empty();
		cloneObj.find("cc:last-child").append("<a href='#none' onclick='fn_remove(this); return false;'><img src='/images/recruite/btn_gift_minus.gif'></a>");
		cloneObj.find(":input").val("");

		cloneObj.find('input[id^="man"]:last').attr("id","man" + num);
		cloneObj.find('input[id^="man"]:last').attr("name","MemberGender" + num);
		cloneObj.find('input[id^="man"]:last').val("M");
		cloneObj.find('label[for^="man"]:last').attr("for","man" + num);
		cloneObj.find('input[id^="woman"]:last').attr("id","woman" + num);
		cloneObj.find('input[id^="woman"]:last').attr("name","MemberGender" + num);
		cloneObj.find('input[id^="woman"]:last').val("F");
		cloneObj.find('label[for^="woman"]:last').attr("for","woman" + num);

		
		jQuery("#" + rootName).append(cloneObj); 
	}else{
		alert("항목은 5개까지만 입력가능합니다.");
	}
}

// dynamic 제거
function fn_remove(obj) {
	
//	jQuery(obj).parents("div")[0].remove();
	jQuery(obj).parents("div").eq(0).remove();
}
function fn_remove2(obj,n) {
	jQuery(obj).parents("div")[0].remove();
}

function fn_reset(rootName){

		var cloneObj = jQuery("#" + rootName + " div:first-child").clone();
		cloneObj.find("cc:last-child").empty();
		cloneObj.find("cc:last-child").append("<cc><a href='javascript:fn_append(\"" + rootName + "\");void(0);' class='plus'><img src='/images/recruite/img_apply_plus.png'/></a><button type='button' class='reset' onclick='fn_reset(\"" + rootName + "\");'>초기화</button></cc>");
		cloneObj.find(":input").val("");
		num = 1;
		cloneObj.find('input[id^="man"]:last').attr("id","man" + num);
		cloneObj.find('input[id^="man"]:last').attr("name","MemberGender" + num);
		cloneObj.find('label[for^="man"]:last').attr("for","man" + num);
		cloneObj.find('input[id^="woman"]:last').attr("id","woman" + num);
		cloneObj.find('input[id^="woman"]:last').attr("name","MemberGender" + num);
		cloneObj.find('label[for^="woman"]:last').attr("for","woman" + num);
		cloneObj.find("bb:last-child").empty()

		jQuery("#" + rootName).empty();

		jQuery("#" + rootName).append(cloneObj); 

}

function checkidN(){

   if (document.myform.memberId.value.length < 4) {
      //alert("\회원 ID는 4자리 이상이어야 합니다.");
		$("#idCheckText").html("회원 ID는 4자리 이상이어야 합니다.");
		$("#idCheckText").addClass("hd_txt");
      document.myform.memberId.focus();
      return;
   }else{
		$("#idCheckText").removeClass("hd_txt");
   }
    var strAll = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890_";
    var strFirst = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    var memberId = document.myform.memberId.value;
    
    if(strFirst.indexOf(memberId.substring(0,1))<0) {
      //alert("\nID 첫 글자는 영문자만 가능합니다.");
		$("#idCheckText").html("ID 첫 글자는 영문자만 가능합니다.");
		$("#idCheckText").addClass("hd_txt");
      document.myform.memberId.focus();
      return;
    }else{
		$("#idCheckText").removeClass("hd_txt");
    }
    
    for(var n=0; n < memberId.length; n++) {
      thisChar = memberId.substring(n, n+1);
        if(thisChar==' ')
        {
            //alert("\n공백이 포함된 ID 는 조회할 수 없습니다.") ;
			$("#idCheckText").html("공백이 포함된 ID 는 조회할 수 없습니다.");
			$("#idCheckText").addClass("hd_txt");
            document.myform.memberId.focus();
            return;
        }else{
			$("#idCheckText").removeClass("hd_txt");
		}
    }
    
    for (i=0; i < memberId.length; i++) {
        if(strAll.indexOf(memberId.substring(i,i+1))<0)
        {
           // alert("\nID 에 허용할 수 없는 문자가 입력되었습니다\n\n다시 입력해 주십시요.");
			$("#idCheckText").html("ID 에 허용할 수 없는 문자가 입력되었습니다.다시 입력해 주십시요.");
			$("#idCheckText").addClass("hd_txt");
            document.myform.memberId.focus();
            return;
        }else{
			$("#idCheckText").removeClass("hd_txt");
		}
    }

	jQuery.ajax({
		type: 'GET',
		url: '/member/popup_idcheck2.asp?mb_id=' + memberId ,
		dataType: 'html',
		success: function(html) {
			layer.source(html,'idCheckPop', {
				alignX : 0.5,
				alignY : 0.5,
				background : true, 
				backgroundColor : 'black',
				backgroundOpacity : 0.7,
				closeButtonId : 'closeBtn1'
			});
		},
		error: function(e) {
//			alert('e');
		}
	});
}
var idchk_temp;
function useid()
{
	if (document.myformid.mb_id.value.length < 4  )
	{
	   alert("\회원 ID는 4자리 이상이어야 합니다.");
	   document.myformid.mb_id.focus();
	   return;
	}
	 var strAll = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
	 var strFirst = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
	 var memberId = document.myformid.mb_id.value;
		 
	 if(strFirst.indexOf(memberId.substring(0,1))<0)
	 {
	   alert("\nID 첫 글자는 영문자만 가능합니다.");
	   document.myformid.mb_id.focus();
	   return;
	 }
		 
	 for(var n=0; n < memberId.length; n++)
	 {
	   thisChar = memberId.substring(n, n+1);
	     if(thisChar==' ')
	     {
	         alert("\n공백이 포함된 ID 는 조회할 수 없습니다.") ;
	         document.myformid.mb_id.focus();
	         return;
	     }
	 }
		 
	 for (i=0; i < memberId.length; i++)
	 {
	     if(strAll.indexOf(memberId.substring(i,i+1))<0)
	     {
	         alert("\nID 에 허용할 수 없는 문자가 입력되었습니다\n\n다시 입력해 주십시요.");
	         document.myformid.mb_id.focus();
	         return;
	     }
	 }
	
	document.myform.memberId.value=document.myformid.mb_id.value
	//#HJ 2015-11-18 변경할수있도록! 재입력시에는 id_check값 없앴음! 
	//parent.document.myform.memberId.readOnly = true;
	idchk_temp = "ok";
	document.myform.id_check.value = "ok";
	layer.closeAll();
}
function submitid()
{
	if (document.myformid.mb_id.value.length < 4  )
	{
	   alert("\회원 ID는 4자리 이상이어야 합니다.");
	   document.myformid.mb_id.focus();
	   return;
	}
	 var strAll = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
	 var strFirst = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
	 var memberId = document.myformid.mb_id.value;
		 
	 if(strFirst.indexOf(memberId.substring(0,1))<0)
	 {
	   alert("\nID 첫 글자는 영문자만 가능합니다.");
	   document.myformid.mb_id.focus();
	   return;
	 }
		 
	 for(var n=0; n < memberId.length; n++)
	 {
	   thisChar = memberId.substring(n, n+1);
	     if(thisChar==' ')
	     {
	         alert("\n공백이 포함된 ID 는 조회할 수 없습니다.") ;
	         document.myformid.mb_id.focus();
	         return;
	     }
	 }
		 
	 for (i=0; i < memberId.length; i++)
	 {
	     if(strAll.indexOf(memberId.substring(i,i+1))<0)
	     {
	         alert("\nID 에 허용할 수 없는 문자가 입력되었습니다\n\n다시 입력해 주십시요.");
	         document.myformid.mb_id.focus();
	         return;
	     }
	 }
		 
	if(document.myformid.mb_id.value == ""){alert("아이디를 입력하세요");document.myformid.mb_id.focus();return;}
	layer.closeAll();
	jQuery.ajax({
		type: 'GET',
		url: '/member/popup_idcheck.asp?mb_id=' + memberId ,
		dataType: 'html',
		success: function(html) {
			layer.source(html,'idCheckPop', {
				alignX : 0.5,
				alignY : 0.5,
				background : true, 
				backgroundColor : 'black',
				backgroundOpacity : 0.7,
				closeButtonId : 'closeBtn1'
			});
		},
		error: function(e) {
//			alert('e');
		}
	});

}

	/* Timer */
	var timer;
	function countdown( elementId, seconds ){
	  var element, endTime, hours, mins, msLeft, time;
	  
	  function updateTimer(){
		msLeft = endTime - (+new Date);
		if ( msLeft < 0 ) {
			location.reload();
		} else {
		  time = new Date( msLeft );
		  hours = time.getUTCHours();
		  mins = time.getUTCMinutes();
		  element.innerHTML = (hours ? hours + ':' + ('0' + mins).slice(-2) : mins) + ':' + ('0' + time.getUTCSeconds()).slice(-2);
		  clearTimeout(timer);
		  timer = setTimeout( updateTimer, time.getUTCMilliseconds());
		  // if you want this to work when you unfocus the tab and refocus or after you sleep your computer and come back, you need to bind updateTimer to a $(window).focus event^^
		}
	  }

	  element = document.getElementById( elementId );
	  endTime = (+new Date) + 1000 * seconds;
	  updateTimer();
	}
</script>  
</head>
<body class="hd__style">
	<!-- start of :: wrap -->
	<div id="wrap">
        <!-- #include virtual = "/mo/layout/doc_header.asp" -->	

		<!-- start of :: contents -->
		<div id="contents" class="member__contents join2 join2_220824">
			<section class="member-box join ">
				
				<div class="kakao_join_box">
					<p class="kakao_txt">
						카카오 간편 회원가입으로 보다<br>
						간편하게 회원가입이 가능합니다.
					</p>
					<a href="javascript:snsJoin('KK');void(0);"><img src="/mo/resource/images/membership/kakao_join_btn.png" alt=""></a>
				</div>

				<h2 class="tit__style2">필수정보 입력</h2>
				
				

				<div class="inp-box">
						<form name="idform">
							<input type="hidden" name="mb_id" id="mb_id" value="" >
						</form>
					<form name="myform" class="join_form join_form_style ">
						<input type="hidden" name="joinMode" id="joinMode" value="<%=joinMode%>">
						<input type="hidden" name="id_check" id="id_check" value="no" >
						<input type="hidden" name="join_cert" id="join_cert" value="no" >
						<input type="hidden" name="memberTel2" id="memberTel2" value="<%=memberTel%>" >
						<input type="hidden" name="custNo" id="custNo" value="<%=custNo%>" >
						<input type="hidden" name="joinGbn" id="joinGbn" value="" >
						<input type="hidden" name="DI" id="DI" value="<%=DI%>" >
						<input type="hidden" name="CI" id="CI" value="<%=CI%>" >
						<input type="hidden" name="uid" id="uid" value="<%=vUid%>">
						<input type="hidden" name="compCd" id="compCd" value="<%=vcompCd%>">
						<input type="hidden" name="birthY" id="birthY" value="" >
						<input type="hidden" name="birthM" id="birthM" value="" >
						<input type="hidden" name="birthD" id="birthD" value="" >
					
						

						<div class="id">
							<label for="joinId">
								아이디
								<span class="star">*</span>
								<!-- 활성화시 추가되는 class명 .hd_txt -->
								<small class="" id="idCheckText"">아이디를 입력해주세요.</small>
							</label><!-- 빨간 별표 클래스 star -->
							<input type="text" name="memberId" id="joinId" class="inp__style1" maxlength="16" onChange="document.myform.id_check.value='';" style="text-transform: lowercase;"/>
							<button type="button" class="idcheck__btn btn__style1" onclick="checkidN()">중복확인</button>
						</div>
						<div>
							<label for="memberPassword">
								비밀번호
								<span class="star">*</span>	
								<small class="" id="pwResult3">비밀번호를 입력해주세요.</small>
							</label>
							<input type="password" name="memberPassword" id="memberPassword" maxlength="16" class="inp__style1" placeholder="8-16자 영문,숫자,특수문자 조합" />
							&nbsp;<em id="pwResult" style="color:#cc3333; font-style:normal; font-family:dotum; font-size:12px;"></em>&nbsp;
						</div>
						<div>
							<label for="myPwCheck">
								비밀번호 확인
								<span class="star">*</span>
								<small class="" id="pwResult2">비밀번호가 일치하지 않습니다.</small>
							</label>
							<input type="password" name="memberPassword2" id="memberPassword2" maxlength="16" class="inp__style1" placeholder="비밀번호를 한번 더 입력해주세요." />
						</div>
						<div class="">
							<label for="joinName" style="margin-right: 100%;">
								이름
								<span class="star">*</span>	
								<small class="" id="nameCheckText">이름을 입력해주세요.</small>
							</label>
							<e class="name" id="memberNameTxt"><input type="text" name="memberName" id="memberName" class="inp__style1" maxlength="16"></e>
						</div>
						<div class="gender" id="bday3">		
							<span>
								<input type="radio" id="NationalInfo0" name="NationalInfo" value="0" checked="" class="rd__style2">
								<label for="NationalInfo0">내국인</label>
							</span>
							<span class="ml15">
								<input type="radio" id="NationalInfo1" name="NationalInfo" value="1" class="rd__style2">
								<label for="NationalInfo1">외국인</label>
							</span>
						</div>
						<div class="">
							<label for="">
								생년월일
								<span class="star">*</span>
								<small class="" id="bdayCheckText">생년월일을 입력하세요.</small>
							</label>
							<div id="bday2" style="display:none;"></div>
							<div class="bday select__style" id="bday">
								<select name="birthYmn" id="birthYmn" class="birthY">
										<option value="">----</option>
<%
									For i = Year(now)-14 To 1930 Step -1
%>
											<option value="<%=i%>" <%If cstr(i) = cstr(birthY) Then %> selected <%End If %>><%=i%></option>
<%
									Next
%>

								</select>
								<span>년</span>
								<select name="birthMMn" id="birthMMn" class="birthM">
										<option value="">----</option>
<%
									For i = 1 To 9
%>
										<option value="0<%=i%>">0<%=i%></option>
<%
									Next

									For i = 10 To 12
%>
										<option value="<%=i%>" ><%=i%></option>
<%
									Next
%>
		
								</select>
								<span>월</span>
								<select name="birthDMn" id="birthDMn" class="birthD">
											<option value="">----</option>
	<%
										For i = 1 To 9 %>
											<option value="0<%=i%>" >0<%=i%></option>
	<%
										Next

										For i = 10 To 31
	%>
											<option value="<%=i%>" ><%=i%></option>
	<%
										Next
	%>
								</select>
								<span class="mr">일</span>	
							</div>
						</div>
						<div class="gend gender">
							<div class="" id="bday3">													
								<span>
									<input type="radio" id="MemberGenderM" name="MemberGender" value="M" checked="" class="rd__style2">
									<label for="MemberGenderM">남자</label>
								</span>
								<span class="ml15">
									<input type="radio" id="MemberGenderW" name="MemberGender" value="F" class="rd__style2">
									<label for="MemberGenderW">여자</label>
								</span>
							</div>
						</div>
						<div class="txt mt16 ">
							※ 14세 미만은 가입하실 수 없습니다.
						</div>
						<div class="phn">
							<label for="">
								휴대폰
								<span class="star">*</span>
								<small class="" id="phoneCheckText">휴대폰 번호를 입력하세요.</small>
							</label>
							<div id="hplist2" style="display:none;"></div>
							<div id="hplist" class="select__style slt-box">
								<select name="cellphone" id="cellphone" class="phone-sel" onchange="categoryOp();">
										<option value="1">SKT</option>
										<option value="2">KT</option>
										<option value="3">LGU+</option>
										<option value="5">알뜰폰(SKT)</option>
										<option value="6">알뜰폰(KT)</option>
										<option value="7">알뜰폰(LGU+)</option>
									</select>
									<input type="text" id="phone1" name="phone1" class="inp_style" title="휴대폰 통신사 번호 입력창" maxlength="3" validate="required;" validatetext="휴대전화번호">
									<span class="hyphen">ㅡ</span>
									<input type="text" id="phone2" name="phone2" class="inp_style" title="휴대폰 중간 번호 입력창" maxlength="4" validate="required;" validatetext="휴대전화번호">
									<span class="hyphen">ㅡ</span>
									<input type="text" id="phone3" name="phone3" class="inp_style" title="휴대폰 마지막 번호 입력창" maxlength="4" validate="required;" validatetext="휴대전화번호">
									<span class="error-msg"></span>
									<input type="hidden" name="mobileCo" id="mobileCo" validate="required;" validatetext="통신사" value="1">
									<input type="hidden" name="mobileNumber" id="mobileNumber">
								</div>
						</div>
						<div class="self-verif-box" style="margin-bottom: 100px;">
							<div class="head hbox">
								<label for="">
									본인 인증
									<span class="star">*</span>
									<small class="" id="certCheckText">본인인증을 진행해주세요.</small>
								</label>
								<button type="button" class="selfv_btn btn__style1 fr" onclick="confirmJoin();" id="loginbtn">본인인증</button>	
								<button type="button" class="arr-down" id="loginbtn2" style="display:none;"></button>
							</div>

							<div class="selfv_all cbox">
								<div class="inp arr-down">
									<input type="checkbox" class="chk__style  _basic_type" name="Certall1" id="Certall1" onclick="CertagreeAll();">
									<label for="Certall1">본인 인증을 위한 약관 모두 동의</label>	
								</div>
							</div>

							<ul class="selfv_list">
								<li>
									<input type="checkbox" class="chk__style _basic_type" name="Certagree1" id="Certagree1" onclick="Certagrees();">
									<label for="Certagree1">개인정보이용동의</label>
									<a href="" class="btn-view fr">전문보기</a>
															<div class="cs-agree-con _lyr00" style="margin: 0;">
																<div class="head">
																	<h2>개인정보이용동의</h2>
																	<button type="button" class="btn_close"><img src="/pc/resource/images/common/ico_x_bk_18x18.png" alt=""></button>
																</div>
																<ul class="tab">
																	<li class="on">
																		<a href="">SKT</a>
																	</li>
																	<li class="">
																		<a href="">KT</a>
																	</li>
																	<li class="">
																		<a href="">LG U+</a>
																	</li>
																</ul>
																<div class="tab-content on">

																	<p>[SK텔레콤 귀중]</p><br>
																	본인은 SK텔레콤(주)(이하 ‘회사’라 합니다)가 제공하는 본인확인서비스(이하 ‘서비스’라 합니다)를 이용하기 위해, 다음과 같이 ‘회사’가 본인의 개인정보를 수집/이용하고, 개인정보의 취급을 위탁하는 것에 동의합니다. <br>
																	<br>
																	<p>1. 수집항목</p>
																	- 이용자의 성명, 이동전화번호, 가입한 이동전화 회사, 생년월일, 성별 <br>
																	- 연계정보(CI), 중복가입확인정보(DI) <br>
																	- 이용자가 이용하는 웹사이트 또는 Application 정보, 이용일시<br>
																	- 내외국인 여부 <br>
																	- 가입한 이동전화회사 및 이동전화브랜드<br>
																	<br>
																	<p>2. 이용목적</p>
																	- 이용자가 웹사이트 또는 Application에 입력한 본인확인정보의 정확성 여부 확인(본인확인서비스 제공) <br>
																	- 해당 웹사이트 또는 Application에 연계정보(CI)/중복가입확인정보(DI) 전송 <br>
																	- 서비스 관련 상담 및 불만 처리 등 <br>
																	- 이용 웹사이트/Application 정보 등에 대한 분석 및 세분화를 통한, 이용자의 서비스 이용 선호도 분석<br>
																	<br>
																	<p>3. 개인정보의 보유기간 및 이용기간</p>
																	- 이용자가 서비스를 이용하는 기간에 한하여 보유 및 이용. 다만, 아래의 경우는 제외
																	- 법령에서 정하는 경우 해당 기간까지 보유(상세 사항은 회사의 개인정보처리방침에 기재된 바에 따름) <br>
																	<br>
																	<p>4. 본인확인서비스 제공을 위한 개인정보의 취급위탁 </p>
																	수탁자 : NICE평가정보(주), (주)다날, (주)드림시큐리티, SCI평가정보(주), NHN한국사이버결제(주), (주)KG모빌리언스, 코리아크레딧뷰로(주), 한국모바일인증(주)<br>
																	취급위탁 업무 : 본인확인정보의 정확성 여부 확인(본인확인서비스 제공), 연계정보(CI)/중복가입확인정보(DI) 생성 및 전송, 서비스 관련 상담 및 불만 처리, 휴대폰인증보호 서비스, 이용자의 서비스 이용 선호도 분석정보 제공관련 시스템 구축·광고매체 연동 및 위탁영업 등 <br>
																	※ 수탁자의 상세 개인정보 취급 위탁 내용은 각 수탁자가 정하는 절차와 방법에 따라 수탁자 홈페이지 등에 게시된 수탁자의 개인정보 처리방침 및 제3자 제공 동의 방침 등에 따릅니다. <br>
																	<br>
																	<p>5. 위 개인정보 수집·이용 및 취급위탁에 동의하지 않으실 경우, 서비스를 이용하실 수 없습니다.</p>
																	※ 회사가 제공하는 서비스와 관련된 개인정보의 취급과 관련된 사항은, 회사의 개인정보처리방침(회사 홈페이지 www.sktelecom.com )에 따릅니다.<br>
																	<br>
																	<p>[NICE평가정보(주) 귀중]</p>
																	NICE평가정보(주)(이하 ‘회사’)는 SK텔레콤(주)의 업무를 대행하여 휴대폰본인확인서비스를 제공함에 있어 고객으로부터 개인정보를 수집하고 이용하기 위해 ‘정보통신망 이용촉진 및 정보보호에 관한 법률’에 따라서 다음과 같이 본인의 동의를 받습니다.<br>
																	<br>
																	<p>1. 개인정보의 내용</p>
																	가. 정보항목 <br>

																	- 생년월일, 성명, 성별, 내/외국인 구분, 휴대폰번호, 가입한 이동통신사, IP주소<br>

																	나. 수집방법 <br>
																	- 본인인증 요청시 회원사 서비스 페이지 또는 본인인증 팝업창 페이지에서 이용자가 직접 입력<br>
																	- 본인인증 과정에서 시스템에서 생성되는 정보 수집(Ex. IP주소)<br>
																	<br>
																	<p>2. 개인정보의 이용목적과 제공정보</p>
																	가. 이용 목적

																	- 고객의 회원가입, ID/PW찾기, 거래동의 등을 위한 휴대폰 본인확인 결과<br>
																	- 휴대폰 소지 확인을 위한 SMS 인증번호 전송 <br>
																	- 부정 이용 방지 및 수사의뢰 <br>
																	- 휴대폰번호보호서비스 해제(서비스 가입자에 한함)<br>
																	- 기타 법률에서 정한 목적

																	<br>
																	나. 제공하는 개인정보<br>
																	- 성명, 성별, 생년월일, 내/외국인, 휴대폰번호, 이동통신사, IP주소, CI, DI [제공사 : 서비스회원사(업체별 선택 및 이용방식에 따라 전부 또는 일부를 제공)]<br>
																	- 성명, 성별, 생년월일, 휴대폰번호, 이동통신사 [제공사 : SKT, KT, LGU+]<br>
																	- 휴대폰번호 [제공사 : SKT, KT, LGU+]<br>
																	<br>
																	<p>3. 개인정보의 보유 및 이용기간</p>
																	이용자의 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명기한 기간 동안 보유합니다.<br>
																	<br>
																	가. 회사 내부 방침에 의한 정보보유 사유 - 본인확인 발생 및 차단기록, 휴대폰번호<br>
																	보유 이유: 부정 이용 방지 및 민원 처리 <br>
																	보유 기간: 1년<br>
																	<br>
																	나. 관계법령에 의한 정보보유 사유<br>
																	- 이용자 불만 또는 분쟁 처리에 관한 기록<br>
																	보유 이유: 전자상거래 등에서의 소비자보호에 관한 법률<br>
																	보유 기간: 3년<br>
																	<br>


																																	</div>
																																	<div class="tab-content">
																	<p>[(주)케이티 귀중]</p><br>
																	(주)케이티(이하 ‘회사’라 함)가 제공하는 본인확인서비스를 이용하기 위해, 다음과 같이 ‘회사’가 본인의 개인정보를 수집 및 이용하고, 개인정보의 취급을 위탁하는 것에 동의합니다.<br>
																	<br>
																	<p>1.수집항목</p>
																	- 이용자가 가입한 이동통신사, 휴대폰번호, 성명, 성별, 생년월일, 내/외국인 구분<br>
																	- 연계정보(CI), 중복가입확인정보(DI)<br>
																	- 이용자가 본인확인을 요청한 서비스명 및 URL정보, 본인확인 이용일시, IP 주소<br>
																	<br>
																	<p>2.이용목적</p>
																	- 인터넷사업자의 서비스(회원가입, ID/PW찾기 등) 이용에 필요한 이용자 본인확인 여부 및 정보 전달 <br>
																	(※ 이용자가 본인확인을 요청한 인터넷사업자에 한합니다.) <br>
																	- (주)케이티 등 이동통신사에 이용자 정보를 전송하여 본인확인 및 휴대폰 정보의 일치 여부 확인<br>
																	- 휴대폰 사용자 확인을 위한 SMS 인증번호 전송 <br>
																	- 부정 이용 방지 및 수사의뢰 <br>
																	- 이용자 본인 요청에 의한 본인확인 이력정보 제공<br>
																	- 휴대폰번호보호서비스 가입여부 확인(서비스 가입자에 한함)<br>
																	<br>
																	<p>3.개인정보의 보유 및 이용기간</p>
																	"회사"는 이용자의 개인정보를 이용목적이 달성되거나 보유 및 보존기간이 종료하면 해당 정보를 지체없이 파기 하며 별도의 보관을 하지 않습니다. 단, 관련 법령 및 회사방침에 따라 보존하는 목적과 기간은 아래와 같습니다.<br>
																	- 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년(전자상거래등에서의 소비자보호에 관한 법률)<br>
																	<br>
																	<p>4.본인확인서비스 제공을 위한 개인정보의 취급 위탁</p>
																	-수탁자 : NICE평가정보<br>
																	-취급위탁 업무 : 본인확인정보의 정확성 여부 확인, 연계정보(CI) 및 중복가입확인정보(DI) 전송, 서비스 관련 상담 및 불만 처리 등<br>
																	<br>
																	<p>5. 상기 개인정보 수집 및 이용과 취급위탁에 동의하지 않는 경우, 서비스를 이용할 수 없습니다.</p>
																	<br>
																	‘회사’가 제공하는 서비스의 개인정보 취급과 관련된 사항은 아래의 ‘회사’ 홈페이지에 기재된 개인정보처리방침에 따릅니다.<br>
																	-(주)케이티 : www.kt.com<br>
																	<br>
																	본인은 상기 내용을 숙지하였으며 이에 동의합니다.<br>
																	<br>
																	<p>[NICE평가정보(주) 귀중]</p>
																	NICE평가정보(주)(이하 ‘회사’)는 (주)케이티의 업무를 대행하여 휴대폰본인확인서비스를 제공함에 있어 고객으로부터 개인정보를 수집하고 이용하기 위해 ‘정보통신망 이용촉진 및 정보보호에 관한 법률’에 따라서 다음과 같이 본인의 동의를 받습니다.<br>
																	<br>
																	<p>1. 개인정보의 내용</p>
																	가. 정보항목 <br>

																	- 생년월일, 성명, 성별, 내/외국인 구분, 휴대폰번호, 가입한 이동통신사, IP주소<br>

																	나. 수집방법 <br>
																	- 본인인증 요청시 회원사 서비스 페이지 또는 본인인증 팝업창 페이지에서 이용자가 직접 입력<br>
																	- 본인인증 과정에서 시스템에서 생성되는 정보 수집(Ex. IP주소)<br>
																	<br>
																	<p>2. 개인정보의 이용목적과 제공정보</p>
																	가. 이용 목적
																	- 고객의 회원가입, ID/PW찾기, 거래동의 등을 위한 휴대폰 본인확인 결과<br>
																	- 휴대폰 소지 확인을 위한 SMS 인증번호 전송 <br>
																	- 부정 이용 방지 및 수사의뢰 <br>
																	- 휴대폰번호보호서비스 해제(서비스 가입자에 한함)<br>
																	- 기타 법률에서 정한 목적

																	<br>
																	나. 제공하는 개인정보<br>
																	- 성명, 성별, 생년월일, 내/외국인, 휴대폰번호, 이동통신사, IP주소, CI, DI [제공사 : 서비스회원사(업체별 선택 및 이용방식에 따라 전부 또는 일부를 제공)]<br>
																	- 성명, 성별, 생년월일, 휴대폰번호, 이동통신사 [제공사 : SKT, KT, LGU+]<br>
																	- 휴대폰번호 [제공사 : SKT, KT, LGU+]<br>
																	<br>
																	<br>
																	<p>3. 개인정보의 보유 및 이용기간</p>
																	이용자의 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명기한 기간 동안 보유합니다.<br>
																	<br>
																	가. 회사 내부 방침에 의한 정보보유 사유 - 본인확인 발생 및 차단기록, 휴대폰번호<br>
																	보유 이유: 부정 이용 방지 및 민원 처리 <br>
																	보유 기간: 1년<br>
																	<br>
																	나. 관계법령에 의한 정보보유 사유<br>
																	- 이용자 불만 또는 분쟁 처리에 관한 기록<br>
																	보유 이유: 전자상거래 등에서의 소비자보호에 관한 법률<br>
																	보유 기간: 3년

																																	</div>
																																	<div class="tab-content">

																	<p>[LG유플러스(주) 귀중]</p><br>
																	LG유플러스(주) (이하 ‘회사’라 함)가 제공하는 본인확인서비스를 이용하기 위해, 다음과 같이 ‘회사’가 본인의 개인정보를 수집 및 이용하고, 개인정보의 취급을 위탁하는 것에 동의합니다.<br>
																	<br>
																	<p>1.수집항목</p>
																	-고객의 생년월일, 이동전화번호, 성명, 성별, 내/외국인 구분<br>
																	-연계정보(CI), 중복가입확인정보(DI) <br>
																	-고객이 이용하는 웹사이트 등<br>
																	<br>
																	<p>2.이용목적</p>
																	-고객이 웹사이트 또는 Application 등에 입력한 본인확인정보의 정확성 여부 확인<br>
																	-해당 웹사이트 또는 Application 등에 연계정보(CI)와 중복가입확인정보)DI) 전송<br>
																	-서비스 관련 상담 및 불만 처리<br>
																	-기타 법룰에서 정한 목적<br>
																	<br>
																	<p>3.개인정보의 보유 및 이용기간</p>
																	-고객이 서비스를 이용하는 기간에 한하여 보유 및 이용을 원칙으로 하되, 법률에서 정하는 경우 해당 기간까지 보유 및 이용(세부사항은 ‘회사’의 개인정보처리방침에 따름)<br>
																	<br>
																	<p>4.본인확인서비스 제공을 위한 개인정보의 취급 위탁</p>
																	<table width="100%" style="margin-top:5px;font-size: 1em; border: 1px solid rgb(221, 221, 221); border-image: none;" cellspacing="0" cellpadding="0" summary="본인확인서비스 제공을 위한 개인정보 취급 수탁자별 위탁업무내용에 관한 테이블">
																		<caption style="position:absolute;top:-5000px;left:-5000px;margin:0;padding:0;font-size:0px;line-height:0;width:0;height:0;overflow:hidden;color:transparent;">본인확인서비스 제공을 위한 개인정보 취급 수탁자별 위탁업무내용에 관한 테이블</caption>
																		<colgroup>
																			<col width="50%">
																			<col width="*">
																		</colgroup>
																		<thead>
																			<tr>
																				<th style="padding: 5px; border-right: 1px solid #bbb; border-bottom: 1px solid #fff; background: #E8E8E8; text-align: center;" scope="col">수탁자</th>
																				<th style="padding: 5px; background: #E8E8E8; border-bottom: 1px solid #fff; text-align: center;" scope="col">위탁업무내용</th>
																			</tr>
																		</thead>
																		<tbody>
																			<tr>
																				<td bgcolor="#FFFFFF" style="border-right: 1px solid #D2D2D2; border-bottom: 1px solid #D2D2D2; padding: 10px 10px;" class="">NICE평가정보(주)</td>
																				<td bgcolor="#FFFFFF" style="border-bottom: 1px solid #D2D2D2; padding: 10px 10px;" class="">본인확인 서비스 중계 업무 제공</td>
																			</tr>
																			<tr>
																				<td bgcolor="#FFFFFF" style="border-right: 1px solid #D2D2D2; border-bottom: 1px solid #D2D2D2; padding: 10px 10px;" class="">CS리더, LB휴넷, 아이알링크 주식회사, (주)씨에스원파트너</td>
																				<td bgcolor="#FFFFFF" style="border-bottom: 1px solid #D2D2D2; padding: 10px 10px;" class="">고객센터 운영</td>
																			</tr>
																			<tr>
																				<td bgcolor="#FFFFFF" style="border-right: 1px solid #D2D2D2; border-bottom: 1px solid #D2D2D2; padding: 10px 10px;" class="">미디어로그</td>
																				<td bgcolor="#FFFFFF" style="border-bottom: 1px solid #D2D2D2; padding: 10px 10px;" class="">PASS 어플리케이션 및 웹사이트 운영/관리</td>
																			</tr>
																			<tr>
																				<td bgcolor="#FFFFFF" style="border-right: 1px solid #D2D2D2; border-bottom: 1px solid #D2D2D2; padding: 10px 10px;" class="">아톤</td>
																				<td bgcolor="#FFFFFF" style="border-bottom: 1px solid #D2D2D2; padding: 10px 10px;" class="">PASS 서비스 장애 및 VOC 처리</td>
																			</tr>
																		</tbody>
																	</table>
																	<br>
																	<p>5. 상기 개인정보 수집 및 이용과 취급위탁에 동의하지 않는 경우, 서비스를 이용할 수 없습니다.</p>
																	‘회사’가 제공하는 서비스의 개인정보 취급과 관련된 사항은 아래의 ‘회사’ 홈페이지에 기재된 개인정보처리방침에 따릅니다.<br>
																	-LG유플러스(주)  : www.lguplus.co.kr<br>
																	<br>
																	본인은 상기 내용을 숙지하였으며 이에 동의합니다.<br>
																	<br>

																	<br>
																	<p>[NICE평가정보(주) 귀중]</p>
																	NICE평가정보(주)(이하 ‘회사’)는 LG유플러스(주) 의 업무를 대행하여 휴대폰본인확인서비스를 제공함에 있어 고객으로부터 개인정보를 수집하고 이용하기 위해 ‘정보통신망 이용촉진 및 정보보호에 관한 법률’에 따라서 다음과 같이 본인의 동의를 받습니다.<br>
																	<br>
																	<p>1. 개인정보의 내용</p>
																	가. 정보항목 <br>

																	- 생년월일, 성명, 성별, 내/외국인 구분, 휴대폰번호, 가입한 이동통신사, IP주소<br>

																	나. 수집방법 <br>
																	- 본인인증 요청시 회원사 서비스 페이지 또는 본인인증 팝업창 페이지에서 이용자가 직접 입력<br>
																	- 본인인증 과정에서 시스템에서 생성되는 정보 수집(Ex. IP주소)<br>
																	<br>
																	<p>2. 개인정보의 이용목적과 제공정보</p>
																	가. 이용 목적
																	- 고객의 회원가입, ID/PW찾기, 거래동의 등을 위한 휴대폰 본인확인 결과<br>
																	- 휴대폰 소지 확인을 위한 SMS 인증번호 전송 <br>
																	- 부정 이용 방지 및 수사의뢰 <br>
																	- 휴대폰번호보호서비스 해제(서비스 가입자에 한함)<br>
																	- 기타 법률에서 정한 목적

																	<br>
																	나. 제공하는 개인정보<br>
																	- 성명, 성별, 생년월일, 내/외국인, 휴대폰번호, 이동통신사, IP주소, CI, DI [제공사 : 서비스회원사(업체별 선택 및 이용방식에 따라 전부 또는 일부를 제공)]<br>
																	- 성명, 성별, 생년월일, 휴대폰번호, 이동통신사 [제공사 : SKT, KT, LGU+]<br>
																	- 휴대폰번호 [제공사 : SKT, KT, LGU+]<br>
																	<br>
																	<p>3. 개인정보의 보유 및 이용기간</p>
																	이용자의 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명기한 기간 동안 보유합니다.<br>
																	<br>
																	가. 회사 내부 방침에 의한 정보보유 사유 - 본인확인 발생 및 차단기록, 휴대폰번호<br>
																	보유 이유: 부정 이용 방지 및 민원 처리 <br>
																	보유 기간: 1년<br>
																	<br>
																	나. 관계법령에 의한 정보보유 사유<br>
																	- 이용자 불만 또는 분쟁 처리에 관한 기록<br>
																	보유 이유: 전자상거래 등에서의 소비자보호에 관한 법률<br>
																	보유 기간: 3년
						
																</div>
															</div>
								</li>
								<li>
									<input type="checkbox" class="chk__style _basic_type" name="Certagree2" id="Certagree2" onclick="Certagrees();">
									<label for="Certagree2">고유식별정보처리 동의</label>
									<a href="" class="btn-view fr">전문보기</a>
															<div class="cs-agree-con _lyr01" style="margin: 0;">
																<div class="head">
																	<h2>고유식별정보처리 동의</h2>
																	<button type="button" class="btn_close"><img src="/pc/resource/images/common/ico_x_bk_18x18.png" alt=""></button>
																</div>
																<ul class="tab">
																	<li class="on">
																		<a href="">SKT</a>
																	</li>
																	<li>
																		<a href="">KT</a>
																	</li>
																	<li>
																		<a href="">LG U+</a>
																	</li>
																</ul>
																<div class="tab-content on">
<p>[SK텔레콤 귀중]</p><br>
본인은 SK텔레콤(주)(이하 ‘회사’라 합니다)가 제공하는 본인확인서비스(이하 ‘서비스’라 합니다)를 이용하기 위해, 다음과 같이 본인의 개인정보를 회사가 아래 기재된 제3자에게 제공하는 것에 동의합니다.<br>
<br>
<p>1. 개인정보를 제공받는 자</p>
- NICE평가정보(주), SCI평가정보(주)<br>
<br>
<p>2. 개인정보를 제공받는 자의 개인정보 이용목적</p>
- 연계정보(CI)/중복가입확인정보(DI) 생성 및 회사에 제공<br>
- 부정 이용 방지 및 민원 처리<br>
<br>
<p>3. 제공하는 개인정보 항목</p>
- 회사가 보유하고 있는 이용자의 주민등록번호<br>
<br>
<p>4. 개인정보를 제공받는 자의 개인정보 보유 및 이용기간</p>
- 연계정보(CI)/중복가입확인정보(DI) 생성 후 3개월<br>
<br>
<p>5. 위 개인정보 제공에 동의하지 않으실 경우, 서비스를 이용할 수 없습니다</p>
<br>
<p>[NICE평가정보 귀중]</p><br>
NICE평가정보(주) (이하 “회사”)가 에스케이텔레콤(주), (주)케이티, LG유플러스(주)의 업무 대행을 통해 제공하는 휴대폰본인확인서비스와 관련하여 고객으로부터 수집한 고유식별정보를 이용 및 처리하거나 제3자에게 제공하고자 할 때에는 ‘정보통신망 이용촉진 및 정보보호 등에 관한 법률’에 따라서 고객으로 부터 동의를 받아야 합니다.<br>
<br>
<p>제1조 [고유식별정보의 이용 및 처리 목적]</p><br>
“회사”는 고객의 고유식별정보를 아래의 목적으로 이용 및 처리할 수 있습니다.<br>
1. 본인확인서비스 제공<br>
2. 부정 이용 방지 및 수사의뢰<br>
3. 휴대폰번호보호서비스 해제 (서비스 가입자에 한함)<br>
제 2조 [고유식별정보의 이용 및 처리 내용]<br>
에스케이텔레콤(주), (주)케이티, LG유플러스(주)의 통신사 또는 통신사의 대행업무를 수행하는 사업자에 정보를 전송하여 방송통신위원회에서 고시로 지정한 휴대폰본인확인기관을 통해 본인여부를 확인하고 결과를 제공받기 위해 고유식별정보가 이용 및 처리됩니다.<br>
-이용 및 처리되는 고유식별정보 : 주민등록번호(내국인), 외국인등록번호(외국인)s<br>
상기와 같이 고유식별정보 이용 및 처리에 동의합니다.<br>


																</div>
																<div class="tab-content">

<p>[(주)케이티 귀중]</p><br>
주)케이티 (이하 "본인확인기관")가 NICE평가정보(주) (이하 "회사")을 통해 제공하는 휴대폰 본인확인 서비스 관련하여 이용자로부터 수집한 고유식별정보를 이용하거나 타인에게 제공할 때에는 '정보통신망 이용촉진 및 정보보호 등에 관한 법률'(이하 "정보통신망법")에 따라 이용자의 동의를 얻어야 합니다.<br>
■ 제 1 조[고유식별정보의 처리 동의] <br>
"본인확인기관"은 정보통신망법 제23조의2 제2항에 따라 인터넷상에서 주민등록번호를 입력하지 않고도 본인임을 확인할 수 있는 휴대폰 본인확인서비스를 제공하기 위해 고유식별정보를 처리합니다.<br>
■ 제 2 조[고유식별정보의 제공 동의] <br>
"본인확인기관 지정 등에 관한 기준(방송통신위원회 고시)"에 따라 "회사"와 계약한 정보통신서비스 제공자 의 연계서비스 및 중복가입확인을 위해 아래와 같이 본인의 고유식별정보를 '다른 본인확인기관'에 제공하는 것에 동의합니다.<br>
 [고유식별정보 제공 동의]<br>
<p>1. 제공자(본인확인기관)</p> 
(주)케이티<br>
<p>2. 제공 받는자(본인확인기관)</p> 
코리아크레딧뷰로㈜, SCI평가정보㈜<br>
<p>3. 제공하는 항목</p> 
주민등록번호(내국인), 외국인등록번호(국내거주외국인)<br>
<p>4. 제공 목적</p> 
CI(연계정보), DI(중복가입확인정보)의 생성 및 전달<br>
<p>5. 보유 및 이용기간</p> 
CI(연계정보), DI(중복가입확인정보) 생성 즉시 폐기<br>
<br>
<p>[NICE평가정보 귀중]</p>
NICE평가정보(주) (이하 “회사”)가 에스케이텔레콤(주), (주)케이티, LG유플러스(주)의 업무 대행을 통해 제공하는 휴대폰본인확인서비스와 관련하여 고객으로부터 수집한 고유식별정보를 이용 및 처리하거나 제3자에게 제공하고자 할 때에는 ‘정보통신망 이용촉진 및 정보보호 등에 관한 법률’에 따라서 고객으로 부터 동의를 받아야 합니다.<br>
<br>
<p>제1조 [고유식별정보의 이용 및 처리 목적]</p><br>
“회사”는 고객의 고유식별정보를 아래의 목적으로 이용 및 처리할 수 있습니다.<br>
1. 본인확인서비스 제공<br>
2. 부정 이용 방지 및 수사의뢰<br>
3. 휴대폰번호보호서비스 해제 (서비스 가입자에 한함)<br>
제 2조 [고유식별정보의 이용 및 처리 내용]<br>
에스케이텔레콤(주), (주)케이티, LG유플러스(주)의 통신사 또는 통신사의 대행업무를 수행하는 사업자에 정보를 전송하여 방송통신위원회에서 고시로 지정한 휴대폰본인확인기관을 통해 본인여부를 확인하고 결과를 제공받기 위해 고유식별정보가 이용 및 처리됩니다.<br>
-이용 및 처리되는 고유식별정보 : 주민등록번호(내국인), 외국인등록번호(외국인)<br>
상기와 같이 고유식별정보 이용 및 처리에 동의합니다.<br>

																</div>
																<div class="tab-content">

<p>[LG유플러스(주) 귀중]</p>
LG유플러스(주)(이하 ‘회사’)가 휴대폰본인확인서비스(이하 ‘서비스’)를 제공하기 위해 고유식별정보를 다음과 같이 제3자에게 제공 및 처리 하는 데에 동의합니다.<br>
<br>
<p>1.고유식별정보를 제공받는자</p>
- NICE평가정보㈜, SCI평가정보㈜, 코리아크레딧뷰로㈜<br>
<br>
<p>2.고유식별정보를 제공받는자의 목적</p>
- 연계정보(CI)와 중복가입확인정보(DI)의 생성 및 ‘회사’ 제공<br>
- 부정 이용 방지 및 민원 처리<br>
<br>
<p>3.고유식별정보 제공 항목: ‘회사’가 보유하고 있는 고객의 주민등록번호와 외국인등록번호</p>
<p>4.고유식별정보를 제공받는 자의 보유 및 이용기간: 제공받는자의 개인정보처리방침에 따름</p>
<p>5.상기 고유식별정보 처리에 대한 내용에 동의하지 않으실 경우, ‘서비스’를 이용할 수 없습니다.</p>
상기와 같이 고유식별정보 이용 및 처리에 동의합니다.<br>
<br>
<p>[NICE평가정보 귀중]</p><br>
NICE평가정보(주) (이하 “회사”)가 에스케이텔레콤(주), (주)케이티, LG유플러스(주)의 업무 대행을 통해 제공하는 휴대폰본인확인서비스와 관련하여 고객으로부터 수집한 고유식별정보를 이용 및 처리하거나 제3자에게 제공하고자 할 때에는 ‘정보통신망 이용촉진 및 정보보호 등에 관한 법률’에 따라서 고객으로 부터 동의를 받아야 합니다.<br>
<br>
<p>제1조 [고유식별정보의 이용 및 처리 목적]</p><br>
“회사”는 고객의 고유식별정보를 아래의 목적으로 이용 및 처리할 수 있습니다.<br>
1. 본인확인서비스 제공<br>
2. 부정 이용 방지 및 수사의뢰<br>
3. 휴대폰번호보호서비스 해제 (서비스 가입자에 한함)<br>
제 2조 [고유식별정보의 이용 및 처리 내용]<br>
에스케이텔레콤(주), (주)케이티, LG유플러스(주)의 통신사 또는 통신사의 대행업무를 수행하는 사업자에 정보를 전송하여 방송통신위원회에서 고시로 지정한 휴대폰본인확인기관을 통해 본인여부를 확인하고 결과를 제공받기 위해 고유식별정보가 이용 및 처리됩니다.<br>
-이용 및 처리되는 고유식별정보 : 주민등록번호(내국인), 외국인등록번호(외국인)<br>
상기와 같이 고유식별정보 이용 및 처리에 동의합니다.<br>

																</div>
															</div>
								</li>
								<li>
									<input type="checkbox" class="chk__style _basic_type" name="Certagree3" id="Certagree3" onclick="Certagrees();">
									<label for="Certagree3">서비스이용약관 동의</label>
									<a href="" class="btn-view fr">전문보기</a>
															<div class="cs-agree-con _lyr02" style="margin: 0;">
																<div class="head">
																	<h2>서비스이용약관동의</h2>
																	<button type="button" class="btn_close"><img src="/pc/resource/images/common/ico_x_bk_18x18.png" alt=""></button>
																</div>
																<ul class="tab">
																	<li class="on">
																		<a href="">SKT</a>
																	</li>
																	<li>
																		<a href="">KT</a>
																	</li>
																	<li>
																		<a href="">LG U+</a>
																	</li>
																</ul>
																<div class="tab-content on">
    <p>[서비스 이용약관]</p><br>
    <br>
    <p>제1조 (목적)</p>
    본 약관은 NICE평가정보(주) (이하 "회사"라 한다)이 제공하는 본인확인서비스(이하 "서비스"라 한다)에 관한 이용조건 및 절차 등 기본적인 사항을 규정함을 목적으로 합니다.<br> 
    <br>
    <p>제2조 (약관의 효력 및 변경) </p>
    1. 본 약관은 "이용자"에게 "서비스" 화면에 게시하거나, 기타의 방법으로 공지하는 것으로 효력이 발생합니다.<br> 
    2. "회사"는 약관의 규제에 관한 법률 및 기타 관련 법령에 위배되지 않는 범위에서 본 약관의 내용을 개정할 수 있으며, 변경된 경우에는 제1항과 같은 방법으로 공지합니다. 다만 "이용자"의 권리와 의무에 관한 중요한 사항은 변경된 내용의 시행 15일 이전에 공지합니다.<br> 
    3. "이용자"는 변경된 약관에 대한 내용을 알지 못하여 발생하는 손해 및 피해에 대해서는 "회사"가 책임을 지지 않습니다. <br>
    <br>
    <p>제3조 (약관 외 준칙) </p>
    본 약관에 명시되지 아니한 사항에 대해서는 정보통신망 이용 촉진 및 정보보호 등에 관한 법률등 기타 관련 법령 또는 상관례에 따릅니다.<br> 
    <br>
    <p>제4조 (용어의 정의) </p>
    본 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br> 
    1. "본인확인서비스"라 함은 "이용자"가 인터넷상에서 휴대폰 등의 인증수단을 이용하여, 본인임을 안전하게 식별 및 확인해 주는 서비스를 말합니다.<br> 
    2. "이용자"라 함은 "회사"에서 제공하는 "서비스"의 이용을 위해 자신의 "본인확인정보"를 "회사" 및 "본인확인기관" 등에게 제공하고, 본인임을 확인 받고자 하는 자를 말합니다.<br> 
    3. "본인확인정보"라 함은 "이용자"가 입력한 생년월일, 성별, 성명, 내/외국인, 휴대폰번호, 통신사 등 본인 식별에 필요한 "이용자"의 정보를 말합니다. <br>
    4. "본인확인기관"이라 함은 주민등록번호를 사용하지 아니하고 본인을 확인하는 방법 또는 서비스를 제공하는 자로 방송통신위원회로부터 본인확인기관으로 지정을 받은 자를 의미합니다.<br> 
    5. "인터넷사업자"라 함은 인터넷을 이용하여 정보를 제공하거나, 정보의 제공을 매개하는 일을 업으로 하는 자로 "회사"와 계약을 통해 운영하며, 인터넷 웹사이트의 "이용자"에 대한 "본인확인정보"를 제공 받는 사업체를 말합니다.<br> 
    6. "중복가입확인정보"라 함은 웹사이트에 가입하고자 하는 이용자의 중복 확인을 위해 제공되는 정보를 말합니다. <br>
    7. "연계정보" 라 함은 "인터넷사업자"의 온ㆍ오프라인 서비스 연계 등의 목적으로 "이용자"를 식별하기 위해 제공되는 정보를 말합니다.<br> 
    <br>
    <p>제5조 (회사의 의무) </p>
    1. "회사"는 "서비스" 제공과 관련하여 인지한 "이용자"의 "본인확인정보"를 본인의 승낙 없이 제3자에게 누설하거나 배포하지 않습니다. 단, 국가기관의 요구가 있는 경우, 범죄에 대한 수사상의 목적이 있는 경우 등 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우에는 그러하지 않습니다.<br> 
    2. "회사"는 "이용자"에게 안전한 "서비스" 제공을 위하여 지속적으로 "서비스"의 예방점검, 유지보수 등을 이행하며, "서비스"의 장애가 발생하는 경우, 이를 지체 없이 수리 및 복구합니다. <br>
    3. "회사"는 "이용자"가 제기한 의견, 불만이 타당하다고 인정되는 경우 적절한 절차를 거쳐 이를 지체 없이 처리하거나 처리에 관한 일정을 통지하여야 합니다. <br>
    4. "회사"는 접근매체의 발급 주체가 아닌 경우에는 접근 매체의 위조나 변조로 발생한 사고로 인하여, "이용자"에게 발생한 손해에 대하여 배상책임이 없습니다. <br>
    <br>
    <p>제6조 (이용자의 의무) </p>
    1. "이용자"는 "서비스"를 이용함에 있어서 다음 각호에 해당하는 행위를 하여서는 안되며, "회사"는 위반 행위에 따르는 일체의 법적 책임을 지지 않습니다.<br> 
    1) 타 "이용자"의 "본인확인정보"를 부정하게 사용 및 도용하는 행위 <br>
    2) "회사"의 저작권, 제3자의 저작원 등 기타 권리를 침해하는 행위 <br>
    3) 범죄 행위 <br>
    4) 기타 관련 법령에 위배되는 행위<br> 
    2. "이용자"는 자신의 접근매체를 제3자에게 누설 또는 노출하거나 방치하여서는 안되며, 접근 매체의 도용이나 위조 또는 변조를 방지하기 위하여 충분한 주의를 기울여야 합니다.<br> 
    3. "이용자"는 본 약관에서 규정하는 사항과 "서비스"에 대한 이용안내 또는 주의사항을 준수하여야 합니다. <br>
    <br>
    <p>제7조 (서비스의 내용) </p>
    1. "서비스"는 "이용자"가 주민등록번호의 입력 없이, 본인명의로 된 인증수단(휴대폰 등)을 이용하여 본인 확인이 가능한 인증 서비스 입니다.<br> 
    2. "인터넷사업자"는 회원가입, ID/PW찾기, 성인인증, 기타 본인확인이 필요한 컨텐츠 요청 시 "이용자"에게 "서비스"를 제공 합니다. <br>
    3. "이용자"는 자신의 생년월일, 성명, 성별, 내/외국인, 휴대폰번호, 통신사 등의 정보를 입력 후, 입력한 정보가 일치한 경우 해당 휴대폰번호로 1회성 비밀번호(승인번호)가 발송되며, 수신된 승인번호를 정확하게 입력하는 것으로 본인 확인이 이루어 집니다.<br> 
    <br>
    <p>제8조 (서비스 제공시간) </p>
    1. "서비스"의 이용은 연중무휴 1일 24시간을 원칙으로 합니다. 다만, 정기 점검 및 기타 기술상의 이유로 "서비스"가 일시 중지될 수 있고 또한, 운영상의 목적으로 "회사"가 정한 기간에도 일시 중지될 수 있습니다.<br> 
    2. "회사"는 효율적인 업무 수행을 위하여 필요하다고 판단하는 경우 "서비스"를 일정 범위로 분할 하여 각 범위 별로 이용가능 시간을 달리 정할 수 있으며, 이 경우 그 내용을 공지 합니다. <br>
    <br>
    <p>제9조 (서비스 제공의 중지) </p>
    1. "회사"는 다음 각 호에 해당하는 사유가 있는 경우 "서비스" 제공의 전부 또는 일부를 중지할 수 있습니다.<br> 
    1) "서비스"를 위한 설비의 보수 등 공사로 인한 부득이한 경우 <br>
    2) 정전, 제반 설비의 장애 또는 이용량의 폭주 등으로 정상적인 "서비스" 이용에 지장이 있는 경우<br> 
    3) "서비스" 계약종료 등과 같은 "인터넷사업자"의 제반 사정으로 "서비스"를 유지할 수 업는 경우 <br>
    4) 기타 천재지변, 국가비상사태 등 불가항력적 사유가 있는 경우 <br>
    2. "회사"는 "서비스"의 변경, 중지로 발생하는 문제에 대해서는 어떠한 책임도 지지 않습니다.<br> 
    <br>
    <p>제10조 (서비스의 안전성 확보) </p>
    1. "회사"는 "서비스"의 안전성과 신뢰성을 확보하기 위하여 업무처리지침의 제정 및 시행, 정보처리시스템 및 전산자료의 관리 등의 관리적 조치와 모니터링 체계 및 해킹방지시스템 구축 및 운영 등의 기술적 조치를 취하고 있습니다.<br> 
    2. "회사"는 서버 및 통신기기의 정상작동여부 확인을 위하여 정보처리시스템 자원 상태의 감시, 경고 및 제어가 가능한 모니터링 체계를 갖추고 있습니다. <br>
    3. "회사"는 해킹 침해 방지를 위하여 다음 각 호의 시스템 및 프로그램을 설치하여 운영합니다. <br>
    1) 침입차단시스템 설치 <br>
    2) 침입탐지시스템 설치 <br>
    3) 그 밖에 필요한 보호장비 또는 암호프로그램 등 정보보호시스템 설치<br> 
    4. "회사"는 컴퓨터바이러스 감염을 방지하기 위하여 다음 각 호를 포함한 대책을 수립, 운영하고 있습니다.<br> 
    1) 출처, 유통경로 및 제작자가 명확하지 아니한 응용프로그램은 사용을 자제하고 불가피할 경우에는 컴퓨터바이러스 검색프로그램으로 진단 및 치료 후 사용할 것<br> 
    2) 컴퓨터바이러스 검색, 치료 프로그램을 설치하고 최신 버전을 유지할 것 <br>
    3) 컴퓨터바이러스 감염에 대비하여 방어, 탐색 및 복구 절차를 마련할 것 <br>
    <br>
    <p>제11조 (이용자의 개인정보보호) </p>
    "회사"는 관련법령이 정하는 바에 따라서 "이용자"의 개인정보를 보호하기 위하여 노력합니다. "이용자"의 개인정보보호에 관한 사항은 관련법령 및 "회사"가 정하는 "개인정보처리방침"에 정한 바에 따릅니다.<br> 
    <br>
    <p>제12조 (개인정보의 위탁) </p>
    "회사"는 수집된 개인정보의 취급 및 관리 등의 업무를 스스로 수행함을 원칙으로 하나, 필요한 경우 업무의 일부 또는 전부를 "회사"가 선정한 회사에 위탁할 수 있습니다. 개인정보의 위탁에 관한 사항은 관련법령 및 "회사"가 정하는 "개인정보처리방침"에 정한 바에 따릅니다.<br> 
    <br>
    <p>제13조 (손해배상) </p>
    "회사"는 "서비스"의 이용과 관련하여 "이용자"에게 발생한 "회사"측의 중과실에 의한 손해를 제외한 어떠한 손해에 관하여도 책임을 지지 않습니다.<br> 
    <br>
    <p>제14조 (회사와 인터넷사업자와의 관계) </p>
    1. "회사"는 "인터넷사업자"가 제공하는 서비스 상품 또는 용역 등에 대하여 보증책임을 지지 않습니다.<br> 
    2. "회사"와 "인터넷사업자"는 독자적으로 사이트를 운영하며, "인터넷사업자"와 "이용자"간에 행해진 거래에 대하여 고의 또는 중과실이 있는 경우를 제외하고는 어떠한 책임도 지지 않습니다.<br> 
    <br>
    <p>제15조 (면책) </p>
    1. "회사"의 고의 또는 과실 없이 "서비스"를 제공할 수 없는 경우에는 "서비스" 제공에 관한 책임이 면제됩니다.<br> 
    2. "회사"는 "이용자" 또는 제3자 측의 사정으로 인한 "서비스" 이용의 장애에 대하여 책임을 지지 않습니다. <br>
    3. "회사"는 고의 또는 중과실이 없는 한 "이용자"가 "서비스"를 이용하여 기대하는 수익을 상실한 것에 대하여 책임을 지지 않으며 그밖에 "서비스"를 통하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않습니다.<br> 
    4. "회사"는 "이용자"가 "서비스"에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 관하여는 고의 또는 중과실이 없는 한 일체의 책임을 지지 않습니다. <br>
    5. 계약만료 또는 요금 미납의 결과로 사용자계정이 정지되거나, 보관 파일이 삭제된 후 이에 따르는 손해에 대하여 책임을 지지 않습니다. <br>
    <br>
    <p>제16조 (관할 법원) </p>
    1. "회사"와 "이용자"는 "서비스"와 관련하여 분쟁이 발생한 경우, 원만하게 해결하기 위하여 필요한 모든 노력을 하여야 합니다.<br> 
    2. 제1항의 협의에서도 분쟁이 해결되지 않은 경우 등, 약관과 관련하여 분쟁으로 인한 소송이 제기될 경우 동 소송은 서울중앙지방법원을 관할 법원으로 합니다.<br> 
    <br>
    부칙
    (시행일) 이 약관은 공시한 날로부터 시행합니다.<br>
    <br>
																
																</div>
																<div class="tab-content">

    <p>[서비스 이용약관]</p><br>
    <br>
    <p>제1조 (목적)</p>
    본 약관은 NICE평가정보(주) (이하 "회사"라 한다)이 제공하는 본인확인서비스(이하 "서비스"라 한다)에 관한 이용조건 및 절차 등 기본적인 사항을 규정함을 목적으로 합니다.<br> 
    <br>
    <p>제2조 (약관의 효력 및 변경) </p>
    1. 본 약관은 "이용자"에게 "서비스" 화면에 게시하거나, 기타의 방법으로 공지하는 것으로 효력이 발생합니다.<br> 
    2. "회사"는 약관의 규제에 관한 법률 및 기타 관련 법령에 위배되지 않는 범위에서 본 약관의 내용을 개정할 수 있으며, 변경된 경우에는 제1항과 같은 방법으로 공지합니다. 다만 "이용자"의 권리와 의무에 관한 중요한 사항은 변경된 내용의 시행 15일 이전에 공지합니다.<br> 
    3. "이용자"는 변경된 약관에 대한 내용을 알지 못하여 발생하는 손해 및 피해에 대해서는 "회사"가 책임을 지지 않습니다. <br>
    <br>
    <p>제3조 (약관 외 준칙) </p>
    본 약관에 명시되지 아니한 사항에 대해서는 정보통신망 이용 촉진 및 정보보호 등에 관한 법률등 기타 관련 법령 또는 상관례에 따릅니다.<br> 
    <br>
    <p>제4조 (용어의 정의) </p>
    본 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br> 
    1. "본인확인서비스"라 함은 "이용자"가 인터넷상에서 휴대폰 등의 인증수단을 이용하여, 본인임을 안전하게 식별 및 확인해 주는 서비스를 말합니다.<br> 
    2. "이용자"라 함은 "회사"에서 제공하는 "서비스"의 이용을 위해 자신의 "본인확인정보"를 "회사" 및 "본인확인기관" 등에게 제공하고, 본인임을 확인 받고자 하는 자를 말합니다.<br> 
    3. "본인확인정보"라 함은 "이용자"가 입력한 생년월일, 성별, 성명, 내/외국인, 휴대폰번호, 통신사 등 본인 식별에 필요한 "이용자"의 정보를 말합니다. <br>
    4. "본인확인기관"이라 함은 주민등록번호를 사용하지 아니하고 본인을 확인하는 방법 또는 서비스를 제공하는 자로 방송통신위원회로부터 본인확인기관으로 지정을 받은 자를 의미합니다.<br> 
    5. "인터넷사업자"라 함은 인터넷을 이용하여 정보를 제공하거나, 정보의 제공을 매개하는 일을 업으로 하는 자로 "회사"와 계약을 통해 운영하며, 인터넷 웹사이트의 "이용자"에 대한 "본인확인정보"를 제공 받는 사업체를 말합니다.<br> 
    6. "중복가입확인정보"라 함은 웹사이트에 가입하고자 하는 이용자의 중복 확인을 위해 제공되는 정보를 말합니다. <br>
    7. "연계정보" 라 함은 "인터넷사업자"의 온ㆍ오프라인 서비스 연계 등의 목적으로 "이용자"를 식별하기 위해 제공되는 정보를 말합니다.<br> 
    <br>
    <p>제5조 (회사의 의무) </p>
    1. "회사"는 "서비스" 제공과 관련하여 인지한 "이용자"의 "본인확인정보"를 본인의 승낙 없이 제3자에게 누설하거나 배포하지 않습니다. 단, 국가기관의 요구가 있는 경우, 범죄에 대한 수사상의 목적이 있는 경우 등 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우에는 그러하지 않습니다.<br> 
    2. "회사"는 "이용자"에게 안전한 "서비스" 제공을 위하여 지속적으로 "서비스"의 예방점검, 유지보수 등을 이행하며, "서비스"의 장애가 발생하는 경우, 이를 지체 없이 수리 및 복구합니다. <br>
    3. "회사"는 "이용자"가 제기한 의견, 불만이 타당하다고 인정되는 경우 적절한 절차를 거쳐 이를 지체 없이 처리하거나 처리에 관한 일정을 통지하여야 합니다. <br>
    4. "회사"는 접근매체의 발급 주체가 아닌 경우에는 접근 매체의 위조나 변조로 발생한 사고로 인하여, "이용자"에게 발생한 손해에 대하여 배상책임이 없습니다. <br>
    <br>
    <p>제6조 (이용자의 의무) </p>
    1. "이용자"는 "서비스"를 이용함에 있어서 다음 각호에 해당하는 행위를 하여서는 안되며, "회사"는 위반 행위에 따르는 일체의 법적 책임을 지지 않습니다.<br> 
    1) 타 "이용자"의 "본인확인정보"를 부정하게 사용 및 도용하는 행위 <br>
    2) "회사"의 저작권, 제3자의 저작원 등 기타 권리를 침해하는 행위 <br>
    3) 범죄 행위 <br>
    4) 기타 관련 법령에 위배되는 행위<br> 
    2. "이용자"는 자신의 접근매체를 제3자에게 누설 또는 노출하거나 방치하여서는 안되며, 접근 매체의 도용이나 위조 또는 변조를 방지하기 위하여 충분한 주의를 기울여야 합니다.<br> 
    3. "이용자"는 본 약관에서 규정하는 사항과 "서비스"에 대한 이용안내 또는 주의사항을 준수하여야 합니다. <br>
    <br>
    <p>제7조 (서비스의 내용) </p>
    1. "서비스"는 "이용자"가 주민등록번호의 입력 없이, 본인명의로 된 인증수단(휴대폰 등)을 이용하여 본인 확인이 가능한 인증 서비스 입니다.<br> 
    2. "인터넷사업자"는 회원가입, ID/PW찾기, 성인인증, 기타 본인확인이 필요한 컨텐츠 요청 시 "이용자"에게 "서비스"를 제공 합니다. <br>
    3. "이용자"는 자신의 생년월일, 성명, 성별, 내/외국인, 휴대폰번호, 통신사 등의 정보를 입력 후, 입력한 정보가 일치한 경우 해당 휴대폰번호로 1회성 비밀번호(승인번호)가 발송되며, 수신된 승인번호를 정확하게 입력하는 것으로 본인 확인이 이루어 집니다.<br> 
    <br>
    <p>제8조 (서비스 제공시간) </p>
    1. "서비스"의 이용은 연중무휴 1일 24시간을 원칙으로 합니다. 다만, 정기 점검 및 기타 기술상의 이유로 "서비스"가 일시 중지될 수 있고 또한, 운영상의 목적으로 "회사"가 정한 기간에도 일시 중지될 수 있습니다.<br> 
    2. "회사"는 효율적인 업무 수행을 위하여 필요하다고 판단하는 경우 "서비스"를 일정 범위로 분할 하여 각 범위 별로 이용가능 시간을 달리 정할 수 있으며, 이 경우 그 내용을 공지 합니다. <br>
    <br>
    <p>제9조 (서비스 제공의 중지) </p>
    1. "회사"는 다음 각 호에 해당하는 사유가 있는 경우 "서비스" 제공의 전부 또는 일부를 중지할 수 있습니다.<br> 
    1) "서비스"를 위한 설비의 보수 등 공사로 인한 부득이한 경우 <br>
    2) 정전, 제반 설비의 장애 또는 이용량의 폭주 등으로 정상적인 "서비스" 이용에 지장이 있는 경우<br> 
    3) "서비스" 계약종료 등과 같은 "인터넷사업자"의 제반 사정으로 "서비스"를 유지할 수 업는 경우 <br>
    4) 기타 천재지변, 국가비상사태 등 불가항력적 사유가 있는 경우 <br>
    2. "회사"는 "서비스"의 변경, 중지로 발생하는 문제에 대해서는 어떠한 책임도 지지 않습니다.<br> 
    <br>
    <p>제10조 (서비스의 안전성 확보) </p>
    1. "회사"는 "서비스"의 안전성과 신뢰성을 확보하기 위하여 업무처리지침의 제정 및 시행, 정보처리시스템 및 전산자료의 관리 등의 관리적 조치와 모니터링 체계 및 해킹방지시스템 구축 및 운영 등의 기술적 조치를 취하고 있습니다.<br> 
    2. "회사"는 서버 및 통신기기의 정상작동여부 확인을 위하여 정보처리시스템 자원 상태의 감시, 경고 및 제어가 가능한 모니터링 체계를 갖추고 있습니다. <br>
    3. "회사"는 해킹 침해 방지를 위하여 다음 각 호의 시스템 및 프로그램을 설치하여 운영합니다. <br>
    1) 침입차단시스템 설치 <br>
    2) 침입탐지시스템 설치 <br>
    3) 그 밖에 필요한 보호장비 또는 암호프로그램 등 정보보호시스템 설치<br> 
    4. "회사"는 컴퓨터바이러스 감염을 방지하기 위하여 다음 각 호를 포함한 대책을 수립, 운영하고 있습니다.<br> 
    1) 출처, 유통경로 및 제작자가 명확하지 아니한 응용프로그램은 사용을 자제하고 불가피할 경우에는 컴퓨터바이러스 검색프로그램으로 진단 및 치료 후 사용할 것<br> 
    2) 컴퓨터바이러스 검색, 치료 프로그램을 설치하고 최신 버전을 유지할 것 <br>
    3) 컴퓨터바이러스 감염에 대비하여 방어, 탐색 및 복구 절차를 마련할 것 <br>
    <br>
    <p>제11조 (이용자의 개인정보보호) </p>
    "회사"는 관련법령이 정하는 바에 따라서 "이용자"의 개인정보를 보호하기 위하여 노력합니다. "이용자"의 개인정보보호에 관한 사항은 관련법령 및 "회사"가 정하는 "개인정보처리방침"에 정한 바에 따릅니다.<br> 
    <br>
    <p>제12조 (개인정보의 위탁) </p>
    "회사"는 수집된 개인정보의 취급 및 관리 등의 업무를 스스로 수행함을 원칙으로 하나, 필요한 경우 업무의 일부 또는 전부를 "회사"가 선정한 회사에 위탁할 수 있습니다. 개인정보의 위탁에 관한 사항은 관련법령 및 "회사"가 정하는 "개인정보처리방침"에 정한 바에 따릅니다.<br> 
    <br>
    <p>제13조 (손해배상) </p>
    "회사"는 "서비스"의 이용과 관련하여 "이용자"에게 발생한 "회사"측의 중과실에 의한 손해를 제외한 어떠한 손해에 관하여도 책임을 지지 않습니다.<br> 
    <br>
    <p>제14조 (회사와 인터넷사업자와의 관계) </p>
    1. "회사"는 "인터넷사업자"가 제공하는 서비스 상품 또는 용역 등에 대하여 보증책임을 지지 않습니다.<br> 
    2. "회사"와 "인터넷사업자"는 독자적으로 사이트를 운영하며, "인터넷사업자"와 "이용자"간에 행해진 거래에 대하여 고의 또는 중과실이 있는 경우를 제외하고는 어떠한 책임도 지지 않습니다.<br> 
    <br>
    <p>제15조 (면책) </p>
    1. "회사"의 고의 또는 과실 없이 "서비스"를 제공할 수 없는 경우에는 "서비스" 제공에 관한 책임이 면제됩니다.<br> 
    2. "회사"는 "이용자" 또는 제3자 측의 사정으로 인한 "서비스" 이용의 장애에 대하여 책임을 지지 않습니다. <br>
    3. "회사"는 고의 또는 중과실이 없는 한 "이용자"가 "서비스"를 이용하여 기대하는 수익을 상실한 것에 대하여 책임을 지지 않으며 그밖에 "서비스"를 통하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않습니다.<br> 
    4. "회사"는 "이용자"가 "서비스"에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 관하여는 고의 또는 중과실이 없는 한 일체의 책임을 지지 않습니다. <br>
    5. 계약만료 또는 요금 미납의 결과로 사용자계정이 정지되거나, 보관 파일이 삭제된 후 이에 따르는 손해에 대하여 책임을 지지 않습니다. <br>
    <br>
    <p>제16조 (관할 법원) </p>
    1. "회사"와 "이용자"는 "서비스"와 관련하여 분쟁이 발생한 경우, 원만하게 해결하기 위하여 필요한 모든 노력을 하여야 합니다.<br> 
    2. 제1항의 협의에서도 분쟁이 해결되지 않은 경우 등, 약관과 관련하여 분쟁으로 인한 소송이 제기될 경우 동 소송은 서울중앙지방법원을 관할 법원으로 합니다.<br> 
    <br>
    부칙 
    (시행일) 이 약관은 공시한 날로부터 시행합니다.<br>
    <br>
																</div>
																<div class="tab-content">

    <p>[서비스 이용약관]</p><br>
    <br>
    <p>제1조 (목적)</p>
    본 약관은 NICE평가정보(주) (이하 "회사"라 한다)이 제공하는 본인확인서비스(이하 "서비스"라 한다)에 관한 이용조건 및 절차 등 기본적인 사항을 규정함을 목적으로 합니다.<br> 
    <br>
    <p>제2조 (약관의 효력 및 변경)</p>
    1. 본 약관은 "이용자"에게 "서비스" 화면에 게시하거나, 기타의 방법으로 공지하는 것으로 효력이 발생합니다.<br> 
    2. "회사"는 약관의 규제에 관한 법률 및 기타 관련 법령에 위배되지 않는 범위에서 본 약관의 내용을 개정할 수 있으며, 변경된 경우에는 제1항과 같은 방법으로 공지합니다. 다만 "이용자"의 권리와 의무에 관한 중요한 사항은 변경된 내용의 시행 15일 이전에 공지합니다.<br> 
    3. "이용자"는 변경된 약관에 대한 내용을 알지 못하여 발생하는 손해 및 피해에 대해서는 "회사"가 책임을 지지 않습니다. <br>
    <br>
    <p>제3조 (약관 외 준칙) </p>
    본 약관에 명시되지 아니한 사항에 대해서는 정보통신망 이용 촉진 및 정보보호 등에 관한 법률등 기타 관련 법령 또는 상관례에 따릅니다.<br> 
    <br>
    <p>제4조 (용어의 정의) </p>
    본 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br> 
    1. "본인확인서비스"라 함은 "이용자"가 인터넷상에서 휴대폰 등의 인증수단을 이용하여, 본인임을 안전하게 식별 및 확인해 주는 서비스를 말합니다.<br> 
    2. "이용자"라 함은 "회사"에서 제공하는 "서비스"의 이용을 위해 자신의 "본인확인정보"를 "회사" 및 "본인확인기관" 등에게 제공하고, 본인임을 확인 받고자 하는 자를 말합니다.<br> 
    3. "본인확인정보"라 함은 "이용자"가 입력한 생년월일, 성별, 성명, 내/외국인, 휴대폰번호, 통신사 등 본인 식별에 필요한 "이용자"의 정보를 말합니다. <br>
    4. "본인확인기관"이라 함은 주민등록번호를 사용하지 아니하고 본인을 확인하는 방법 또는 서비스를 제공하는 자로 방송통신위원회로부터 본인확인기관으로 지정을 받은 자를 의미합니다.<br> 
    5. "인터넷사업자"라 함은 인터넷을 이용하여 정보를 제공하거나, 정보의 제공을 매개하는 일을 업으로 하는 자로 "회사"와 계약을 통해 운영하며, 인터넷 웹사이트의 "이용자"에 대한 "본인확인정보"를 제공 받는 사업체를 말합니다.<br> 
    6. "중복가입확인정보"라 함은 웹사이트에 가입하고자 하는 이용자의 중복 확인을 위해 제공되는 정보를 말합니다. <br>
    7. "연계정보" 라 함은 "인터넷사업자"의 온ㆍ오프라인 서비스 연계 등의 목적으로 "이용자"를 식별하기 위해 제공되는 정보를 말합니다.<br> 
    <br>
    <p>제5조 (회사의 의무)</p>
    1. "회사"는 "서비스" 제공과 관련하여 인지한 "이용자"의 "본인확인정보"를 본인의 승낙 없이 제3자에게 누설하거나 배포하지 않습니다. 단, 국가기관의 요구가 있는 경우, 범죄에 대한 수사상의 목적이 있는 경우 등 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우에는 그러하지 않습니다.<br> 
    2. "회사"는 "이용자"에게 안전한 "서비스" 제공을 위하여 지속적으로 "서비스"의 예방점검, 유지보수 등을 이행하며, "서비스"의 장애가 발생하는 경우, 이를 지체 없이 수리 및 복구합니다. <br>
    3. "회사"는 "이용자"가 제기한 의견, 불만이 타당하다고 인정되는 경우 적절한 절차를 거쳐 이를 지체 없이 처리하거나 처리에 관한 일정을 통지하여야 합니다. <br>
    4. "회사"는 접근매체의 발급 주체가 아닌 경우에는 접근 매체의 위조나 변조로 발생한 사고로 인하여, "이용자"에게 발생한 손해에 대하여 배상책임이 없습니다. <br>
    <br>
    <p>제6조 (이용자의 의무)</p>
    1. "이용자"는 "서비스"를 이용함에 있어서 다음 각호에 해당하는 행위를 하여서는 안되며, "회사"는 위반 행위에 따르는 일체의 법적 책임을 지지 않습니다.<br> 
    1) 타 "이용자"의 "본인확인정보"를 부정하게 사용 및 도용하는 행위 <br>
    2) "회사"의 저작권, 제3자의 저작원 등 기타 권리를 침해하는 행위 <br>
    3) 범죄 행위 <br>
    4) 기타 관련 법령에 위배되는 행위<br> 
    2. "이용자"는 자신의 접근매체를 제3자에게 누설 또는 노출하거나 방치하여서는 안되며, 접근 매체의 도용이나 위조 또는 변조를 방지하기 위하여 충분한 주의를 기울여야 합니다.<br> 
    3. "이용자"는 본 약관에서 규정하는 사항과 "서비스"에 대한 이용안내 또는 주의사항을 준수하여야 합니다. <br>
    <br>
    <p>제7조 (서비스의 내용)</p>
    1. "서비스"는 "이용자"가 주민등록번호의 입력 없이, 본인명의로 된 인증수단(휴대폰 등)을 이용하여 본인 확인이 가능한 인증 서비스 입니다.<br> 
    2. "인터넷사업자"는 회원가입, ID/PW찾기, 성인인증, 기타 본인확인이 필요한 컨텐츠 요청 시 "이용자"에게 "서비스"를 제공 합니다. <br>
    3. "이용자"는 자신의 생년월일, 성명, 성별, 내/외국인, 휴대폰번호, 통신사 등의 정보를 입력 후, 입력한 정보가 일치한 경우 해당 휴대폰번호로 1회성 비밀번호(승인번호)가 발송되며, 수신된 승인번호를 정확하게 입력하는 것으로 본인 확인이 이루어 집니다.<br> 
    <br>
    <p>제8조 (서비스 제공시간)</p>
    1. "서비스"의 이용은 연중무휴 1일 24시간을 원칙으로 합니다. 다만, 정기 점검 및 기타 기술상의 이유로 "서비스"가 일시 중지될 수 있고 또한, 운영상의 목적으로 "회사"가 정한 기간에도 일시 중지될 수 있습니다.<br> 
    2. "회사"는 효율적인 업무 수행을 위하여 필요하다고 판단하는 경우 "서비스"를 일정 범위로 분할 하여 각 범위 별로 이용가능 시간을 달리 정할 수 있으며, 이 경우 그 내용을 공지 합니다. <br>
    <br>
    <p>제9조 (서비스 제공의 중지)</p>
    1. "회사"는 다음 각 호에 해당하는 사유가 있는 경우 "서비스" 제공의 전부 또는 일부를 중지할 수 있습니다.<br> 
    1) "서비스"를 위한 설비의 보수 등 공사로 인한 부득이한 경우 <br>
    2) 정전, 제반 설비의 장애 또는 이용량의 폭주 등으로 정상적인 "서비스" 이용에 지장이 있는 경우<br> 
    3) "서비스" 계약종료 등과 같은 "인터넷사업자"의 제반 사정으로 "서비스"를 유지할 수 업는 경우 <br>
    4) 기타 천재지변, 국가비상사태 등 불가항력적 사유가 있는 경우 <br>
    2. "회사"는 "서비스"의 변경, 중지로 발생하는 문제에 대해서는 어떠한 책임도 지지 않습니다.<br> 
    <br>
    <p>제10조 (서비스의 안전성 확보)</p>
    1. "회사"는 "서비스"의 안전성과 신뢰성을 확보하기 위하여 업무처리지침의 제정 및 시행, 정보처리시스템 및 전산자료의 관리 등의 관리적 조치와 모니터링 체계 및 해킹방지시스템 구축 및 운영 등의 기술적 조치를 취하고 있습니다.<br> 
    2. "회사"는 서버 및 통신기기의 정상작동여부 확인을 위하여 정보처리시스템 자원 상태의 감시, 경고 및 제어가 가능한 모니터링 체계를 갖추고 있습니다. <br>
    3. "회사"는 해킹 침해 방지를 위하여 다음 각 호의 시스템 및 프로그램을 설치하여 운영합니다. <br>
    1) 침입차단시스템 설치 <br>
    2) 침입탐지시스템 설치 <br>
    3) 그 밖에 필요한 보호장비 또는 암호프로그램 등 정보보호시스템 설치<br> 
    4. "회사"는 컴퓨터바이러스 감염을 방지하기 위하여 다음 각 호를 포함한 대책을 수립, 운영하고 있습니다.<br> 
    1) 출처, 유통경로 및 제작자가 명확하지 아니한 응용프로그램은 사용을 자제하고 불가피할 경우에는 컴퓨터바이러스 검색프로그램으로 진단 및 치료 후 사용할 것<br> 
    2) 컴퓨터바이러스 검색, 치료 프로그램을 설치하고 최신 버전을 유지할 것 <br>
    3) 컴퓨터바이러스 감염에 대비하여 방어, 탐색 및 복구 절차를 마련할 것 <br>
    <br>
    <p>제11조 (이용자의 개인정보보호)</p>
    "회사"는 관련법령이 정하는 바에 따라서 "이용자"의 개인정보를 보호하기 위하여 노력합니다. "이용자"의 개인정보보호에 관한 사항은 관련법령 및 "회사"가 정하는 "개인정보처리방침"에 정한 바에 따릅니다.<br> 
    <br>
    <p>제12조 (개인정보의 위탁) </p>
    "회사"는 수집된 개인정보의 취급 및 관리 등의 업무를 스스로 수행함을 원칙으로 하나, 필요한 경우 업무의 일부 또는 전부를 "회사"가 선정한 회사에 위탁할 수 있습니다. 개인정보의 위탁에 관한 사항은 관련법령 및 "회사"가 정하는 "개인정보처리방침"에 정한 바에 따릅니다.<br> 
    <br>
    제13조 (손해배상)
    "회사"는 "서비스"의 이용과 관련하여 "이용자"에게 발생한 "회사"측의 중과실에 의한 손해를 제외한 어떠한 손해에 관하여도 책임을 지지 않습니다.<br> 
    <br>
    <p>제14조 (회사와 인터넷사업자와의 관계)</p>
    1. "회사"는 "인터넷사업자"가 제공하는 서비스 상품 또는 용역 등에 대하여 보증책임을 지지 않습니다.<br> 
    2. "회사"와 "인터넷사업자"는 독자적으로 사이트를 운영하며, "인터넷사업자"와 "이용자"간에 행해진 거래에 대하여 고의 또는 중과실이 있는 경우를 제외하고는 어떠한 책임도 지지 않습니다.<br> 
    <br>
    <p>제15조 (면책)</p>
    1. "회사"의 고의 또는 과실 없이 "서비스"를 제공할 수 없는 경우에는 "서비스" 제공에 관한 책임이 면제됩니다.<br> 
    2. "회사"는 "이용자" 또는 제3자 측의 사정으로 인한 "서비스" 이용의 장애에 대하여 책임을 지지 않습니다. <br>
    3. "회사"는 고의 또는 중과실이 없는 한 "이용자"가 "서비스"를 이용하여 기대하는 수익을 상실한 것에 대하여 책임을 지지 않으며 그밖에 "서비스"를 통하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않습니다.<br> 
    4. "회사"는 "이용자"가 "서비스"에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 관하여는 고의 또는 중과실이 없는 한 일체의 책임을 지지 않습니다. <br>
    5. 계약만료 또는 요금 미납의 결과로 사용자계정이 정지되거나, 보관 파일이 삭제된 후 이에 따르는 손해에 대하여 책임을 지지 않습니다. <br>
    <br>
    <p>제16조 (관할 법원)</p>
    1. "회사"와 "이용자"는 "서비스"와 관련하여 분쟁이 발생한 경우, 원만하게 해결하기 위하여 필요한 모든 노력을 하여야 합니다.<br> 
    2. 제1항의 협의에서도 분쟁이 해결되지 않은 경우 등, 약관과 관련하여 분쟁으로 인한 소송이 제기될 경우 동 소송은 서울중앙지방법원을 관할 법원으로 합니다.<br> 
    <br>
    부칙 
    (시행일) 이 약관은 공시한 날로부터 시행합니다.<br>
    <br>
																</div>
															</div>
								</li>
								<li>
									<input type="checkbox" class="chk__style _basic_type" name="Certagree4" id="Certagree4" onclick="Certagrees();">
									<label for="Certagree4">통신사이용약관 동의</label>
									<a href="" class="btn-view fr">전문보기</a>
															<div class="cs-agree-con _lyr03" style="margin: 0;">
																<div class="head">
																	<h2>통신사이용약관 동의</h2>
																	<button type="button" class="btn_close"><img src="/pc/resource/images/common/ico_x_bk_18x18.png" alt=""></button>
																</div>
																<ul class="tab">
																	<li class="on">
																		<a href="">SKT</a>
																	</li>
																	<li>
																		<a href="">KT</a>
																	</li>
																	<li>
																		<a href="">LG U+</a>
																	</li>
																</ul>
																<div class="tab-content on">

    <p>[SK텔레콤 이용약관]</p><br>
    <p>제1조 (목적)</p>
    이 약관은 ‘본인확인서비스’를 제공하는 에스케이텔레콤 주식’회사’(이하 ‘‘회사’’라 합니다)와 ‘본인확인서비스’ 이용자 (이하 ‘이용자’라 합니다)간에 ‘본인확인서비스’ 이용에 관한 ‘회사’와 ‘이용자’의 권리와 의무, 기타 제반 사항을 정함을 목적으로 합니다.<br>
    <br>
    <p>제2조 (용어의 정의)</p>
    ① ‘본인확인서비스’라 함은 ‘이용자’가 유무선 인터넷 웹’사이트’ 및 스마트폰 Application 등(이하 ‘사이트’라 합니다)에서 본인 명의로 개통한 휴대폰을 이용하여, 본인확인정보를 입력하고 인증 절차를 통하여 본인 여부와 본인이 등록한 정보의 정확성을 확인하여 주는 서비스를 말합니다.<br>
    ② ‘본인확인정보’라 함은 본인확인을 위하여 ‘이용자’가 입력한 본인의 생년월일, 성별, 성명, 내/외국인 여부, 본인명의로 개통된 이동전화번호, 기타 ‘회사’와 ‘이용자’간에 별도로 설정한 번호 등 ‘이용자’에 대한 ‘본인확인서비스’ 제공을 위해 필요한 정보를 말합니다.<br>
    ③ ‘이용자’라 함은 ‘사이트’에서 ‘회사’가 제공하는 ‘본인확인서비스’를 이용하는 자를 말하며, ‘회사’의 이동전화서비스 가입자와 ‘회사’의 이동전화망을 이용하여 개별적으로 이동전화서비스를 제공하는 별정통신사업자의 가입자중 ‘회사’의 ‘본인확인서비스’를 이용하는 자를 말합니다.<br>
    ④ ‘중복가입확인정보’라 함은 ‘이용자’가 ‘사이트’에 가입하거나 ‘사이트’에서 특정 서비스 이용, 구매 등 어떤 행동을 할 때, 해당 ‘이용자’의 기 가입/이용 여부를 확인하기 위하여 생성되는 정보를 말합니다.<br>
    ⑤ ‘본인확인기관’이라 함은 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등 ‘본인확인서비스’ 관련 법령에 따라 주민등록번호를 수집·이용하고, ‘사이트’에서 주민등록번호를 사용하지 아니하고 본인을 확인할 수 있도록 해주는 방법(이하 ‘대체수단’이라 합니다)을 개발·제공·관리하는 업무를 담당하는 사업자를 말합니다.<br>
    ⑥ ‘연계 식별정보’라 함은 ‘이용자’가 가입/등록한 ‘사이트’들간의 서비스 또는 Contents, point등의 연계, 정산 등의 목적으로 ‘사이트’에 가입/등록한 ‘이용자’를 식별하기 위하여 생성되는 정보를 말합니다.<br>
    ⑦ ‘대행기관’은 ‘이용자’가 ‘사이트’에서 ‘본인확인서비스’를 제공받을 수 있도록, ‘사이트’와 ‘회사’간의 ‘본인확인서비스’를 중계하고 ‘이용자’에게 ‘본인확인서비스’ 이용방법의 안내와 문의 등 지원업무를 담당하는 등, ‘회사’가 위탁한 업무범위내에서 ‘회사’를 대신하여 ‘이용자’에게 ‘본인확인서비스’와 관련된 업무를 제공하는 사업자를 말합니다.<br>
    ⑧ ‘사이트’라 함은 유무선 인터넷 웹’사이트’, 스마트폰 Application 등을 통하여 ‘이용자’에게 상품, 서비스, Contents, Point 등 각종 재화와 용역을 유/무료로 제공하는 개인, 법인, 기관, 단체 등을 말합니다.<br>
    ⑨ ‘접근매체’란 ‘본인확인서비스’ 이용을 위해 ‘이용자’ 및 ‘이용자’가 입력하는 내용 등의진실성과 정확성을 담보하는 수단으로서, ‘이용자’가 입력하는 제2항의 정보, I-PIN ID 및 Password 등 ‘본인확인기관’에서 발급받은 정보, 기타 ‘이용자’가 ‘회사’ 및 ‘사이트’에서 설정한 ID 및 Password 등의 정보, ‘이용자’ 명의의 이동전화 번호 등을 말합니다.<br>
    ⑩ ‘대체수단’이라 함은 ‘중복가입확인정보’ 및 연계식별정보를 포함하여, 주민등록정보를 사용하지 아니하고 본인여부를 식별 및 확인할 수 있는 수단을 말합니다.<br>
    ⑪ ‘부가서비스’라 함은 ‘회사’가 ‘본인확인서비스’와 관련하여 추가적인 보안·인증절차 등을 유료 또는 무료로 제공하는 서비스를 말하여, 유료인 경우에는 ‘이용자’에 대해 ‘회사’의 이동전화서비스 청구서에 합산하여 ‘부가서비스’ 이용요금을 청구하고 이동전화 요금과 함께 수납합니다.<br>
    <br>
    <p>제3조 (약관의 명시 및 변경)</p>
    ① ‘회사’는 이 약관을 ‘회사’가 운영하는 ‘사이트’ 등에 게시하거나 ‘이용자’의 ‘본인확인서비스’ 이용시 공개하여 ‘이용자’가 이 약관의 내용을 확인할 수 있도록 합니다. 또한 ‘이용자’의 요청이 있는 경우 전자문서의 형태로 약관 사본을 ‘이용자’에게 교부합니다.<br>
    ② ‘회사’는 필요하다고 인정되는 경우 이 약관을 변경할 수 있으며, ‘회사’가 약관을 변경할 경우에는 적용일자 및 변경사유를 명시하여 ‘회사’가 운영하는 ‘사이트’에서 적용일자 15일 전부터 공지합니다. <br>
    ③ ‘회사’가 전항에 따라 변경 약관을 공지 또는 통지하면서 ‘이용자’에게 약관 변경 적용일 까지 거부의사를 표시하지 않으면 약관의 변경에 동의한 것으로 간주한다는 내용을 명확하게 공지 또는 통지하였음에도 ‘이용자’가 명시적으로 약관 변경에 대한 거부의사를 표시하지 아니하면 ‘이용자’가 변경 약관에 동의한 것으로 간주합니다. ‘이용자’는 변경된 약관 사항에 동의하지 않으면 ‘본인확인서비스’ 이용을 중단하고 이용 계약을 해지할 수 있습니다.<br>
    ④ ‘이용자’ 또는 ‘사이트’가 이 약관의 내용(약관 변경시 변경된 내용 포함)을 알지 못하여 발생하는 손해 및 피해에 대해서는 ‘회사’는 일체 책임을 지지 않습니다.<br>
    <br>
    <p>제4조 (이용 계약의 성립)</p>
    ‘이용자’가 ‘사이트’ 등에 게시되거나 ‘본인확인서비스’ 이용시 공개되는 이 약관의 내용에 “동의” 버튼을 누르거나 체크하면 약관에 동의하고, ‘본인확인서비스’ 이용을 신청한 것으로 간주합니다.<br>
    <br>
    <p>제5조 (본인확인정보 및 ‘접근매체’의 관리 등)</p>
    ① ‘회사’는 ‘본인확인서비스’ 제공시 ‘이용자’가 사용한 ‘접근매체’와 입력된 본인확인정보, ‘사이트’에서 제공하는 정보 등을 이용하여, ‘이용자’의 신원, 권한 및 ‘본인확인서비스’를 요청한 내역 등을 확인 할 수 있습니다.<br>
    ② ‘이용자’는 자신의 본인확인 정보 및 ‘접근매체’를 제3자에게 대여하거나 사용을 위임하거나 양도 또는 담보 목적으로 제공할 수 없으며, 본인확인정보 및 ‘접근매체’의 도용이나 위조·변조 등을 방지하기 위해 충분한 주의를 기울여야 합니다.<br>
    ③ ‘이용자’는 자신의 본인확인정보 및 ‘접근매체’를 제3자에게 누설 또는 노출하거나 방치하여서는 안됩니다.<br>
    ④ ‘이용자’는 ‘접근매체’의 분실·도난·유출·위조·변조 등 또는 본인확인정보 유출 등의 사실을 인지할 경우 ‘회사’에 즉시 통지하여야 하며, ‘회사’는 ‘이용자’의 통지를 받은 때부터 즉시 ‘본인확인서비스’를 중지합니다.<br>
    <br>
    <p>제6조 (‘본인확인서비스’ 안내)</p>
    ① ‘회사’가 제공하는 ‘본인확인서비스’는, ‘이용자’가 입력한 본인확인정보에 대해, ‘이용자’가 본인 명의로 개통하고 사용하고 있는 이동전화 서비스 관련 정보·’중복가입확인정보’·’연계 식별정보’를 이용하여, 본인 식별 또는 본인의 성년·미성년 여부, 중복가입여부 등을 확인하여주는 서비스 입니다. 단, ‘회사’의 이동전화망을 이용하여 개별적으로 이동전화서비스를 제공하는 별정통신사업자의 가입자에 대해서는 개별 별정통신사업자가 ‘회사’에 취급을 위탁한 정보만을 기반으로 본문의 서비스를 제공합니다.<br>
    ② ‘회사’는 직접 또는 ‘대행기관’을 통하여 ‘사이트’에, 서비스 화면 또는 Socket형태로 ‘본인확인서비스’를 제공하며, ‘사이트’는 ‘사이트’ 운영과 관련된 법령과 ‘사이트’ 이용약관에 따라 ‘이용자’에게 ‘본인확인서비스’ 이용 수단을 제공합니다.<br>
    ③ ‘이용자’는 특정 ‘사이트’에서 ‘회사’ 및 ‘대행기관’의 이용약관, ‘사이트’의 이용약관에 동의하는 경우, 해당 ‘사이트’에서 ‘회사’가 제공하는 ‘본인확인서비스’를 이용하실 수 있습니다.<br>
    ④ 제3항에 따라 각 이용약관에 동의한 경우, ‘이용자’가 자신의 생년월일, 성명, 성별, 내/외국인, 본인 명의로 가입한 이동통신사와 이동전화 번호 등의 정보를 입력하고, 입력한 정보가 일치하는 경우에 ‘이용자’의 이동전화 번호로 송신되는 1회성 암호(승인암호)를 정확하게 입력하는 것으로 본인 확인이 이루어 집니다. 단, ‘회사’가 직접 운영하는 ‘사이트’ 또는 관련 법령 등에 따라 주민등록번호의 수집·이용이 허용되는 ‘사이트’에서는 생년월일 대신 주민등록번호를 받을 수 있습니다.<br>
    ⑤ 제4항에 따라 본인확인이 완료된 ‘이용자’에 대해서는 해당 ‘이용자’의 본인확인정보, ‘중복가입확인정보’ 및 ‘연계 식별정보’를 ‘회사’가 보유하고 있는 경우, ‘사이트’의 요청에 따라 ‘사이트’에 제공될 수 있으며, 제공된 정보는 각 ‘사이트’가 ‘이용자’와 체결한 약관, 계약에 따라 운영·관리·폐기됩니다.<br>
    <br>
    <p>제7조(‘본인확인서비스’의 ‘부가서비스’)</p>
    ① ‘회사’는 ‘본인확인서비스’ 이용과 관련하여, 보다 강화된 보안을 필요로 하는 ‘이용자’가 가입을 신청하는 경우에 한하여, 별도의 ‘부가서비스’를 유료 또는 무료로 제공합니다.<br>
    ② ‘회사’가 제공하는 ‘부가서비스’는 다음 각 호와 같으며, 상세 서비스 내용 및 이용 조건은 서비스별 이용약관에 따릅니다.<br>
    1. 휴대폰 인증보호 서비스 (월 1천원, 부가가치세 별도)<br>
    <br>
    <p>제8조 (‘대체수단’의 생성 및 제공)</p>
    ① ‘회사’는 ‘이용자’의 이동전화 가입시 수집한 주민등록번호를 토대로 ‘대체수단’을 생성하고 ‘사이트’에 제공할 수 있습니다.<br>
    ② ‘회사’의 ‘대체수단’ 생성 및 제공방법은 다음 각 호와 같습니다.<br>
    1. ‘이용자’의 이동전화 가입시, 제3의 ‘본인확인기관’에 실명 사용여부를 질의하고, 이에 따라 ‘대체수단’을 받아와서 저장하는 방법<br>
    2. ‘이용자’의 ‘본인확인서비스’ 이용시, 제3의 ‘본인확인기관’간의 합의를 통하여 비밀번호 등 ‘대체수단’ 규격을 정한 후, 이에 따라 ‘회사’가 생성하거나 제3의 ‘본인확인기관’으로부터 제공받는 방법<br>
    3. ‘이용자’의 ‘본인확인서비스’ 이용시, 해당 ‘이용자’의 이동전화가입시 ‘회사’가 제공받은 주민등록번호와 해당 ‘이용자’가 이용하고 있는 ‘사이트’의 일련번호를 제3의 ‘본인확인기관’에 제공하고, 이에 해당되는 ‘대체수단’을 받아와서 제공하는 방법<br>
    ③ 제1항 제3호에 따라 ‘회사’가 제3의 ‘본인확인기관’으로부터 ‘대체수단’을 제공받은 경우, 해당 ‘대체수단’의 정확성 유무에 대해서는 ‘회사’가 책임지지 않습니다.<br>
    <br>
    <p>제9조 (‘본인확인서비스’ 제공시간)</p>
    ① ‘본인확인서비스’의 이용은 연중무휴 1일 24시간을 원칙으로 합니다. 다만, 정기 점검 및 기타 기술상의 이유, 기타 운영상의 사유와 목적에 따라 ‘회사’가 정한 기간에 일시 중지될 수 있으며, 각 ‘사이트’의 기술상, 운영상의 사유와 목적에 따라 일시 중지될 수 있습니다.<br>
    ② ‘회사’는 ‘본인확인서비스’ 중지에 따라 ‘이용자’에게 별도의 보상은 하지 않습니다. 단 ‘본인확인서비스’를 이용기간에 따라 정액제 형태로 유료 판매하는 경우, 정액제 유료 ‘이용자’에게는 중지시간이 24시간을 초과한 경우에 한하여, 월 이용금액을 해당월의 날짜 수로 일할 계산하여 환불 또는 차감하며, 이용금액의 과금 당사자가 ‘회사’인 경우에는 ‘회사’가, ‘대행기관’인 경우에는 ‘대행기관’이 환불 또는 차감하여 드립니다.<br>
    <br>
    <p>제10조 (‘회사’의 권리와 의무)</p>
    ① ‘회사’가 ‘접근매체’의 발급주체가 아닌 경우에는 ‘접근매체’의 위조·변조·누설 등으로 인해 ‘이용자’에게 발생한 손해에 대하여 배상책임이 없습니다.<br>
    ② ‘이용자’가 제5조 제2항 내지 제4항의 내용을 준수하지 아니하거나, ‘회사’가 부정사용 여부를 확인할 수 없는 ‘접근매체’ 또는 본인확인정보의 이용으로 인해 발생한 ‘이용자’의 손해에 대하여 ‘회사’는 배상책임이 없습니다.<br>
    ③ ‘회사’는 ‘본인확인서비스’ 제공과 관련하여 인지한 ‘이용자’의 본인확인정보를 본인의 승낙 없이 제3자에게 누설하거나 배포하지 않습니다. 단, 국가기관의 요구가 있는 경우, 범죄에 대한 수사상의 목적이 있는 경우 등 관계 법령에서 정한 절차에 따른 요청이 있는 경우에는 그러하지 않습니다.<br>
    ④ ‘회사’는 ‘이용자’에게 안정적인 ‘본인확인서비스’ 제공을 위하여 지속적으로 관련 시스템이나 절차, 기능 등의 예방점검, 유지보수 등을 이행하며, ‘본인확인서비스’의 장애가 발생하는 경우, 이를 지체 없이 수리 및 복구합니다.<br>
    ⑤ ‘회사’는 복제폰, 대포폰, 휴대폰 소액대출(일명 휴대폰깡) 등 시장 질서를 교란시키는 불법행위에 의한 피해 방지를 위하여 불법행위가 의심되는 ‘이용자’ 또는 회선에 대한 ‘본인확인서비스’ 이용을 제한하거나 중지하는 것은 물론, 관계 법령에 따라 행정 및 사법기관에 수사를 의뢰할 수 있습니다.<br>
    ⑥ ‘회사’는 ‘회사’가 제공하는 이동전화 등 통신역무의 요금을 정상적으로 납부하지 않거나 일부 특수 요금제에 가입한 ‘이용자’에 대하여 ‘본인확인서비스’ 이용을 제한할 수 있습니다.<br>
    ⑦ ‘회사’는 ‘이용자’가 ‘회사’의 이동전화 등 통신역무 이용을 위해 제출한 가입신청서 또는 이와 관련된 본인확인 절차가, 명의도용, 관련 서류 위·변조 등 위법 행위가 개입된 사실을 확인하는 즉시 해당 ‘이용자’ 및 회선에 대한 ‘본인확인서비스’ 제공을 중지하며, 해당 ‘이용자’와 회선에 대해 관련 법령 및 통신역무 이용약관에 따른 조치를 취할 수 있습니다.<br>
    ⑧ ‘이용자’중 ‘회사’의 이동전화망을 이용하여 개별적으로 이동전화서비스를 제공하는 별정통신사업자의 가입자에 대해서는, 개별 별정통신사업자의 본인확인절차 미비, 명의도용, 관련 서류 위·변조, 본인확인정보의 오류 등에 대해 ‘회사’는 일절 책임을 부담하지 않고, 개별 별정통신사업자가 일체의 책임을 부담합니다.<br>
    <br>
    <p>제11조 (‘이용자’의 권리와 의무)</p>
    ① ‘이용자’는 ‘본인확인서비스’를 이용함에 있어서 다음 각 호에 해당하는 행위를 하여서는 안되며, ‘회사’는 ‘이용자’의 다음 각 호의 행위에 대해 일체의 법적 책임을 지지 않습니다.<br>
    1. 본인이 아닌 타인의 본인확인정보를 부정하게 사용 및 도용하는 행위<br>
    2. ‘회사’ 및 ‘대행기관’, ‘사이트’의 저작권, 제3자의 저작권 등 기타 권리를 침해하는 행위<br>
    3. 법령에 규정하는 제반 범죄 및 위법 행위<br>
    4. 이 약관에 규정된 ‘이용자’의 의무 또는 준수사항을 위반하는 행위<br>
    ② ‘이용자’는 이 약관에서 규정하는 사항과 ‘본인확인서비스’에 대한 이용안내 또는 주의사항 등을 준수하여야 합니다. <br>
    ③ ‘이용자’는 제5조의 의무를 이행하여야 합니다.<br>
    <br>
    <p>제12조 (‘이용자’ 정보의 제공 범위)</p>
    ① ‘회사’는 ‘본인확인서비스’를 제공함에 있어 취득한 ‘이용자’의 정보를 ‘이용자’의 동의 없이 제3자에게 제공, 누설하거나 업무상 목적 외에 사용하지 않습니다.<br>
    ② ‘이용자’가 개인정보의 수집·이용·제공에 동의하고 이용하는 ‘사이트’ 또는 신용카드사 등 제3자가, ‘이용자’의 이동전화 번호 및 해당 ‘사이트’·신용카드사 등 제3자가 보유한 ‘대체수단’의 진실성 여부를 ‘회사’에 대해 확인할 경우, ‘회사’는 해당 이동전화 번호 및 ‘대체수단’의 진실성 여부를, 확인을 요청한 ‘사이트’ 또는 신용카드사 등 제3자에게 회신할 수 있습니다.<br>
    <br>
    <p>제13조 (‘본인확인서비스’의 안정성 확보)</p>
    ① ‘회사’는 ‘본인확인서비스’의 안전성과 신뢰성, 보안성을 확보하기 위하여 해킹방지시스템 및 보안관리 체계 구성, 접근제한 등 기술적, 관리적 조치를 취합니다.<br>
    ② ‘회사’는 ‘본인확인서비스’ 관련 서버 및 통신기기의 정상작동여부 확인을 위하여 정보처리시스템 자원 상태의 감시, 경고 및 제어가 가능한 모니터링 체계를 갖춥니다.<br>
    ③ ‘회사’는 해킹 침해 방지를 위하여 다음 각 호의 시스템 및 프로그램을 설치하여 운영합니다. <br>
    1. 침입 차단 및 탐지시스템 설치<br>
    2. 그 밖에 필요한 보호장비 또는 암호프로그램 등 정보보호시스템 설치 <br>
    ④ ‘회사’는 컴퓨터바이러스 감염을 방지하기 위하여 바이러스 방지를 위한 방어, 탐색, 복구 절차를 자체적으로 운영합니다.<br>
    <br>
    <p>제14조 (‘이용자’의 개인정보보호)</p>
    ① ‘이용자’의 개인정보 보호는 ‘회사’가 관련 법령과 ‘회사’가 수립하여 운영하는 개인정보 처리방침 등에 따릅니다. 자세한 ‘회사’의 개인정보 수집·이용 범위 등은 이동전화 가입신청서와 ‘회사’ 대표 ‘사이트’(www.sktelecom.com)에서 제공되는 개인정보 처리방침을 참조하시기 바랍니다.<br>
    ② ‘이용자’중 ‘회사’의 이동전화망을 이용하여 개별적으로 이동전화서비스를 제공하는 별정통신사업자의 가입자에 대해서는, 해당 가입자가 속한 개별 별정통신사업자가 개인정보보호 및 수집·이용·제공 등에 대한 법적 절차 준수와 관련된 일체의 책임을 부담하며, 해당 가입자에 대한 개인정보 수집·이용 범위 등은 개별 별정통신사업자의 개인정보 처리방침을 참조하시기 바랍니다.<br>
    ③ 제1항과 제2항의 개인정보 처리방침에서 정한 바 이외에, ‘회사’는 ‘본인확인서비스’를 위하여  다음 각 호의 경우에 ‘이용자’ 개인정보의 일부를 ‘회사’가 선정한 사업자에게 제공할 수 있습니다.<br>
    1. ‘이용자’의 ‘본인확인서비스’ 이용시 ‘사이트’가 필요로 하는 ‘이용자’ 식별정보(‘중복가입확인정보’, ‘대체수단’)의 생성 및 관리, 제공을 위하여 ‘이용자’의 주민등록정보를 제3의 ‘본인확인기관’에게 제공할 수 있습니다.<br>
    2. ‘회사’가 수집 또는 제공받은 개인정보(‘중복가입확인정보’, ‘대체수단’)는 ‘회사’ 또는 ‘대행기관’을 통해 ‘사이트’에게 제공합니다.<br>
    3. ‘본인확인서비스’를 위한 ‘회사’의 개인정보의 수집·이용·제공범위 및 개인정보의 취급을 위탁하는 수탁자와 위탁업무내용 등은 이 약관이 게시되는 화면에 별도로 링크하여 제공합니다.<br>
    <br>
    <p>제15조 (약관 외 준칙)</p>
    이 약관에 명시되지 아니한 사항에 대해서는 정보통신망 이용 촉진 및 정보보호 등에 관한 법률 등 기타 관련 법령 또는 상관례에 따릅니다. <br>
    <br>
    <p>제16조 (관할법원)</p>
    ① ‘본인확인서비스’ 이용과 관련하여 ‘회사’와 ‘이용자’ 사이에 분쟁이 발생한 경우, ‘회사’와 ‘이용자’는 분쟁의 해결을 위해 성실히 협의합니다.<br>
    ② 제1항의 협의에서도 분쟁이 해결되지 않을 경우 양 당사자는 민사소송법상의 관할 법원에 소를 제기할 수 있습니다.<br>
    <br>
    <br>
    부칙
    (시행일) 이 약관은 공지한 날로부터 시행합니다.

																</div>
																<div class="tab-content">

    <p>[㈜케이티 이용약관]</p> <br>
    <p>제1조 (목적)</p>
    본 약관은 주민등록번호 대체 본인확인서비스를 제공하는 주식회사 케이티(이하 “회사”)와 이용 고객(이하 “이용자”)간에 서비스 제공에 관한 이용조건 및 절차 등 기타 필요한 사항을 규정함을 목적으로 합니다.<br>
    <br>
    <p>제2조 (용어의 정의)</p>
    본 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br>
    ① “본인확인서비스”라 함은 이용자가 인터넷상에서 본인명의의 휴대폰(이용자 개인 명의 휴대폰 또는 법인 명의 휴대폰으로서 이용자가 본인확인서비스에 가입한 휴대폰)을 이용하여, 주민등록번호 입력 없이도 본인임을 안전하게 식별 및 확인해 주는 서비스를 말합니다.<br>
    ② “간편본인확인서비스”라 함은 본인확인서비스를 이용함에 있어 입력하는 본인확인정보를 성명과 휴대폰번호로 간소화하고 “PASS” 애플리케이션을 이용하는 방식을 의미합니다.<br>
    ③ “PASS”라 함은 회사가 제공하는 애플리케이션(Application, 이하 ‘PASS 앱’)으로서 이용자가 PASS 앱에 등록한 인증수단을 확인하는 행위(예. 비밀번호 입력, 지문인식 등)를 통해 이용자 본인임을 안전하게 식별 및 확인하고 단말기의 점유를 확인하는 서비스를 말합니다.<br>
    ④ “이용자”라 함은 회사 또는 대행기관에서 제공하는 본인확인서비스의 이용을 위해 자신의 본인확인정보를 회사, 대행기관, 본인확인기관 등에게 제공하고, 본인임을 확인 받고자 하는 자로서 다음 각호의 자를 말합니다.<br>
    1.	회사의 개인 명의 이동전화서비스 가입자<br>
    2.	회사의 이동전화망을 이용하여 자체적으로 이동전화서비스를 제공하는 별정통신사업자의 가입자 중 개인 명의 가입자<br>
    3.	회사의 법인 명의 이동전화서비스 가입자의 휴대폰을 실제 사용하는 자로서 명의인의 법인으로부터 필요한 서류를 발급 받아 이를 회사에 제출하고 본인확인서비스에 가입한 자<br>
    ⑤  “본인확인정보”라 함은 이용자가 입력한 생년월일, 성별, 성명, 내/외국인, 휴대폰번호, 통신사 등 본인 식별에 필요한 이용자의 정보를 말합니다.<br>
    ⑥ “중복가입확인정보”라 함은 웹사이트에 가입하고자 하는 이용자의 중복확인을 위해 제공되는 정보를 말 합니다.<br>
    ⑦ “연계정보”라 함은 인터넷사업자의 온ㆍ오프라인 서비스 연계 등의 목적으로 이용자를 식별하기 위해 제공되는 정보를 말합니다.<br>
    ⑧ “본인확인기관”이라 함은 주민등록번호를 사용하지 아니하고 본인을 확인하는 방법 또는 본인확인서비스를 제공 하는 자로 방송통신위원회로부터 본인확인기관으로 지정을 받은 자를 의미합니다.<br>
    ⑨ “대행기관”이라 함은 회사를 대신하여 본인확인서비스의 제공 및 지원 등의 중계 업무를 담당하는 곳으로 회사와 업무지원에 대한 계약이 완료되어 인터넷사업자에 본인확인서비스를 제공하는 사업체를 말합니다.<br>
    ⑩ “인터넷사업자”라 함은 인터넷을 이용하여 정보를 제공하거나, 정보의 제공을 매개하는 일을 업으로 하는 자로 회사 또는 대행기관과의 서비스 계약을 통해, 인터넷 웹사이트에서 이용자에 대한 본인확인정보를 제공받는 사업체를 말합니다.<br>
    ⑪ “접근매체”라 함은 본인확인을 함에 있어 이용자 본인확인의 진실성과 정확성을 확보하기 위하여 사용 되는 수단 또는 정보로서 회사에 등록된 이용자의 전화번호, 이용자의 생체정보, 이상의 수단이나 정보를 사용하는데 필요한 비밀번호 등을 말합니다.<br>
    <br>
    <p>제3조 (약관의 명시 및 변경)</p>
    ① 회사는 본 약관을 회사가 운영하는 사이트에 게시하거나 본인확인서비스 이용시 이용자가 내용을 확인할 수 있도록 공개합니다.<br>
    ② 회사는 약관의 규제에 관한 법률 및 기타 관련 법령에 위배되지 않는 범위에서 본 약관의 내용을 개정 할 수 있으며, 변경된 경우에는 회사가 운영하는 사이트에서 공지합니다. 다만 “이용자”의 권리와 의무에 관한 중요한 사항은 변경된 내용의 시행 15일 이전에 공지합니다.<br>
    ③ 이용자는 개정된 약관 사항에 동의하지 않을 권리가 있으며, 개정된 약관에 동의하지 않는 경우, 본 서비스의 이용을 중단하고 이용 계약을 해지할 수 있습니다. 이용자가 회사의 전항 단서에 따른 약관의 불리한 변경에 대하여 적용예정일까지 회사에게 부동의 의사를 표시하지 않거나 이용계약을 해지하지 않은 경우 변경된 약관을 승인한 것으로 봅니다.<br>
    ④ 이용자가 변경된 약관에 대한 내용을 알지 못하여 발생하는 손해 및 피해에 대해서는 회사가 책임을 지지 않습니다.<br>
    <br>
    <p>제4조 (접근매체의 관리 등)</p>
    ⑤ 회사는 서비스 제공 시 접근매체를 이용하여 이용자의 신원, 권한 및 거래지시의 내용 등을 확인 할 수 있습니다.<br>
    ⑥ 이용자는 접근매체를 제3자에게 대여하거나 사용을 위임하거나 양도 또는 담보 목적으로 제공할 수 없습니다.<br>
    ⑦ 이용자는 자신의 접근매체를 제3자에게 누설 또는 노출하거나 방치하여서는 안되며, 접근매체의 도용 이나 위조 또는 변조를 방지하기 위해 충분한 주의를 기울여야 합니다.<br>
    ⑧ 회사가 접근매체의 발급주체가 아닌 경우에는 접근매체의 위조나 변조로 발생한 사고로 인하여 이용자에게 발생한 손해에 대하여 배상책임이 없습니다.<br>
    <br>
    <p>제5조 (본인확인서비스 안내)</p>
    ① 본인확인서비스는 이용자가 주민등록번호의 입력 없이, 본인명의로 된 개통된 휴대폰정보(이용자 개인 명의로 개통된 휴대폰 정보 또는 법인 명의로 개통된 휴대폰으로서 이용자가 본인확인서비스에 가입한 정보)를 이용하여 본인 식별 또는 본인 확인이 가능한 생년월일 기반의 주민등록번호 대체 휴대폰인증 서비스 입니다.<br>
    ② 회사는 대행기관을 통해 인터넷사업자에게 본인확인서비스를 제공하며, 인터넷사업자는 회원가입, ID/PW 찾기, 성인인증, 기타 본인확인이 필요한 경우 이용자에게 본인확인서비스를 제공 합니다.<br>
    ③ 이용자는 자신의 생년월일, 성명, 성별, 내/외국인, 휴대폰번호, 통신사 등의 정보를 입력하며(법인 명의로 개통된 휴대폰으로서 이용자가 본인확인서비스에 가입한 경우에는 본인확인서비스 가입 시 등록한 비밀번호를 추가로 입력하며), 입력한 정보가 일치한 경우에는 해당 휴대폰번호로 수신된 1회성 비밀번호(승인번호)를 정확하게 입력하는 것으로 본인 식별 또는 본인 확인이 이루어집니다. 단, 이용자가 간편본인확인서비스를 선택한 경우에는 자신의 통신사, 휴대폰번호, 이름만 입력하며, 입력한 정보가 일치한 경우에 해당 휴대폰에 설치 및 가입된 PASS 앱을 통해 이용자가 사전에 등록해둔 인증수단(비밀번호, 지문 등)을 정확하게 입력하는 것으로 본인 식별 또는 본인 확인이 이루어집니다. 이 때, PASS 앱에 미 가입된 상태로 간편본인확인서비스 이용을 시도하는 경우 회사는 영속적인 서비스 제공을 위해 해당 이용자에게 PASS 앱 설치를 안내합니다.<br>
    ④ 본인확인서비스는 본인 명의로 개통된 휴대폰 정보(이용자 개인 명의로 개통된 휴대폰 정보 또는 법인 명의로 개통된 휴대폰으로서 이용자가 본인확인서비스에 가입한 정보)로 본인확인이 이루어집니다. 단, 휴대폰 일시정지 또는 이용정지 시 해당 정지기간 동안에는 본인확인서비스도 정지됩니다. (단, 로밍문자수신이 가능한 일시정지의 경우, 일시정지기간 동안에도 본인확인서비스를 제공합니다.) <br>
    ⑤ 본인 확인이 완료 된 이용자에 대해서는 본인확인정보와 중복가입확인정보 및 연계정보가 인터넷사업 자에게 제공되며, 인터넷사업자는 중복가입확인정보 또는 연계정보 등을 이용하여 이용자 관리 및 컨텐츠를 제공ㆍ운영 합니다.<br>
    <br>
    <p>제6조 (본인확인서비스 제공시간)</p>
    ① 본인확인서비스의 이용은 연중무휴 1일 24시간을 원칙으로 합니다. 다만, 정기 점검 및 기타 기술상의 이유로 본인확인서비스가 일시 중지될 수 있고 또한, 운영상의 목적으로 회사가 정한 기간에도 일시 중지될 수 있습니다.<br>
    ② 회사는 효율적인 업무 수행을 위하여 필요하다고 판단하는 경우 본인확인서비스를 일정 범위로 분할하여 각 범위 별로 이용가능 시간을 달리 정할 수 있으며, 이 경우 그 내용을 공지 합니다.<br>
    <br>
    <p>제7조 (회사의 권리와 의무)</p>
    ① 회사는 이용자가 본인확인서비스 이용시 본 이용약관이나 안내사항 등을 확인하지 않아 발생한 손해, 또는 접근매체를 통해 알 수 있었음에도 불구하고, 이용자가 자신의 접근매체를 누설 또는 노출하거나 방치한 손해 등 이용자의 부주의에 기인한 손해에 대하여 배상책임이 없습니다.<br>
    ② 회사는 본인확인서비스 제공과 관련하여 인지한 이용자의 본인확인정보를 본인의 승낙 없이 제3자에게 누설하거나 배포하지 않습니다. 단, 국가기관의 요구가 있는 경우, 범죄에 대한 수사상의 목적이 있는 경우 등 기타 관계 법령에서 정한 절차에 따른 요청이 있는 경우에는 그러하지 않습니다.<br>
    ③ 회사는 이용자에게 안정적인 본인확인서비스 제공을 위하여 지속적으로 본인확인서비스의 예방점검, 유지보수 등을 이행하며, 본인확인서비스의 장애가 발생하는 경우, 이를 지체 없이 수리 및 복구합니다.<br>
    ④ 회사는 아래와 같은 사유가 발생하는 경우 이용자에 대하여 본인확인서비스를 제한할 수 있습니다.<br>
    1.	다른 사람의 명의사용 등 이용자 등록 시 허위로 신청하는 경우<br>
    2.	이용자 등록 사항을 누락하거나 오기하여 신청하는 경우<br>
    3.	대포폰(이동전화 서비스 본래의 목적과는 달리 불법대출 등 부정사용을 목적으로 타인 명의 무단 개통 또는 명의자를 교사하여 개통하는 휴대전화)을 이용하는 경우<br>
    4.	타인의 명의를 도용한 사실이 있거나 명의 도용을 이유로 처벌받은 경우<br>
    5.	불법 복제와 관련된 사실이 있거나 처벌 받은 경우<br>
    6.	기타 시장질서를 교란시키는 불법행위에 해당하는 경우<br>
    ⑤ 회사는 다음 각 호에 해당하는 경우 서비스의 전부 또는 일부를 중지할 수 있습니다. 회사는 회사의 고의 또는 과실이 없는 한 이로 인하여 발생한 손해에 대하여 배상책임이 없습니다.<br>
    1.	컴퓨터 등 정보통신설비의 보수점검 교체 및 고장, 통신의 두절 등의 사유가 발생한 경우<br>
    2.	서비스를 위한 설비의 보수 등 공사로 인해 부득이한 경우<br>
    3.	서비스 업그레이드 및 시스템 유지보수 등을 위해 필요한 경우<br>
    4.	정전, 제반 설비의 장애 또는 이용량의 폭주 등으로 정상적인 서비스 이용에 지장이 있는 경우<br>
    5.	이용자가 회사의 본인확인서비스 운영을 방해하는 경우<br>
    6.	기타 천재지변, 국가비상사태 등 불가항력적 사유가 있는 경우<br>
    7.	규제기관이 마련한 본인확인서비스 가이드를 준수하지 않고 임의로 변형 적용한 사이트에서 본인확인서비스를 요청하는 경우<br>
    ⑥ 전 항에 의하여 본인확인서비스를 중지하는 경우에는 회사가 이를 공지합니다. 다만, 회사가 통제할 수 없는 사유로 인한 본 서비스의 중단(회사 또는 운영자의 고의 및 과실이 없는 디스크 장애, 시스템 다운 등)으로 인하여 사전 공지가 불가능한 경우에는 그러하지 아니합니다.<br>
    ⑦ 이용자 중 회사의 이동전화망을 이용하여 자체적으로 이동전화서비스를 제공하는 별정통신사업자의 개인 명의 가입자에 대하여는 해당 별정통신사업자의 본인확인절차 미비, 명의도용, 관련 서류 위·변조, 본인확인정보의 오류 등에 대해 회사는 일체 책임을 부담하지 않고 해당 별정통신사업자가 일체의 책임을 부담합니다.<br>
    <br>
    <p>제8조 (이용자의 의무)</p>
    ① 이용자는 본인확인서비스를 이용함에 있어서 다음 각호에 해당하는 행위를 하여서는 안되며, 회사는 위반 행위에 따르는 일체의 법적 책임을 지지 않습니다.<br>
    1.	타 이용자의 본인확인정보를 부정하게 사용 및 도용하는 행위<br>
    2.	회사의 저작권, 제3자의 저작권 등 기타 권리를 침해하는 행위<br>
    3.	범죄 행위<br>
    4.	기타 관련 법령에 위배되는 행위<br>
    ② 이용자는 본 약관에서 규정하는 사항과 본인확인서비스에 대한 이용안내 또는 주의사항 등을 준수하여야 합니다.<br>
    <br>
    <p>제9조 (본인확인정보의 제공금지)</p>
    회사는 서비스를 제공함에 있어 취득한 이용자의 정보 또는 자료를 이용자의 동의 없이 제3자에게 제공, 누설하거나 업무상 목적 외에 사용하지 않습니다.<br>
    <br>
    <p>제10조 (본인확인서비스의 안정성 확보)</p>
    ① 회사는 본인확인서비스의 안전성과 신뢰성을 확보하기 위하여 업무처리지침의 제정 및 시행, 정보 처리시스템 및 전산자료의 관리 등의 관리적 조치와 모니터링 체계 및 해킹방지시스템 구축 및 운영 등의 기술적 조치를 취해야 합니다.<br>
    ② 회사는 서버 및 통신기기의 정상작동여부 확인을 위하여 정보처리시스템 자원 상태의 감시, 경고 및 제어가 가능한 모니터링 체계를 갖추어야 합니다.<br>
    ③ “회사”는 해킹 침해 방지를 위하여 정보보호시스템 및 프로그램을 설치하여 운영합니다.<br>
    ④ “회사”는 컴퓨터바이러스 감염을 방지하기 위하여 다음 각 호를 포함한 대책을 수립, 운영하고 있습니다.<br>
    1.	출처, 유통경로 및 제작자가 명확하지 아니한 응용프로그램은 사용을 자제하고 불가피할 경우에는 컴퓨터바이러스 검색프로그램으로 진단 및 치료 후 사용할 것<br>
    2.	컴퓨터바이러스 검색, 치료 프로그램을 설치하고 최신 버전을 유지할 것<br>
    3.	컴퓨터바이러스 감염에 대비하여 방어, 탐색 및 복구 절차를 마련할 것<br>
    <br>
    <p>제11조 (이용자의 개인정보보호)</p>
    회사는 관련법령이 정하는 방에 따라서 이용자의 개인정보를 보호하기 위하여 노력하며, 이용자의 개인정보에 관한 사항은 관련 법령 및 회사가 정하는 개인정보처리방침에 정한 바에 따릅니다.<br>
    <br>
    <p>제12조 (개인정보의 처리)</p>
    ① 회사는 수집된 개인정보의 처리 및 관리 등의 업무를 스스로 수행함을 원칙으로 하나, 필요한 경우 업무의 일부 또는 전부를 회사가 선정한 사업자에게 위탁할 수 있습니다.<br>
    ② 본인확인서비스 이용 시 이용자의 개인정보 수집 및 이용 동의에 따라 인터넷사업자가 필요로 하는 이용자 식별정보(중복가입확인정보, 연계정보)의 생성 및 제공을 위하여 관련 정보를 타 본인확인기관에게 제공할 수 있으며, 수집된 식별정보(중복가입확인정보, 연계정보)는 본인 식별 및 확인 위한 목적으로 회사 또는 대행기관을 통해 인터넷사업자에게 제공할 수 있습니다.<br>
    ③ 개인정보 처리 및 위탁 등에 관한 사항은 관련법령 및 회사가 정하는 개인정보처리방침에 정한 바에 따릅니다.<br>
    <br>
    <p>제13조 (약관 외 준칙)</p>
    본 약관에 명시되지 아니한 사항에 대해서는 정보통신망 이용 촉진 및 정보보호 등에 관한 법률, 개인정 보보호법 등 기타 관련법령 또는 상관례에 따릅니다.<br>
    <br>
    부칙
    (시행일) 이 약관은 공시한 날로부터 시행합니다.<br>
    부칙
    (시행일) 이 약관은 2016년 8월 2일부터 시행합니다.<br>
    부칙
    (시행일) 이 약관은 2018년 8월 2일부터 시행합니다.<br>
    부칙
    (시행일) 이 약관은 2021년 5월 20일부터 시행합니다.<br>
    부칙
    (시행일) 이 약관은 2021년 9월 14일부터 시행합니다.<br>
    <br>


																</div>
																<div class="tab-content">
<p>[ LG유플러스 휴대폰 본인확인서비스 이용약관 ]</p><br>
<p>제1조 (목적)</p>
  본 약관은 주민번호를 대체한 휴대폰 본인확인서비스(이하 “서비스”)를 제공하는 LG유플러스(이하 “회사”)와 이용 고객(이하 “이용자”)간에 서비스 제공에 관한 이용조건 및 절차 등 기타 필요한 사항을 정함을 목적으로 합니다. <br>
  <br>
  <p>제2조 (용어의 정리)</p>
  본 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br>
  <br>
  1. “휴대폰 본인확인서비스””라 함은 이용자가 인터넷상에서 본인 명의의 휴대폰을 이용하여 주민번호를 입력하지
않고 본인임을 안전하게 식별 및 확인하는 방법을 제공하는 서비스를 말합니다.<br>
  <br>
 2.&nbsp;“이용자”라 함은 서비스의 이용을 위해 자신의 본인확인정보를 회사, 인증대행사 및 타 본인확인기관 등에게 제공하고, 본인임을 확인 받고자 하는 자를 말합니다.<br>
  <br>
 3.&nbsp;“본인확인정보”라 함은 이용자가 입력한 생년월일, 성별, 성명, 내/외국인, 휴대폰번호, 통신사 등 본인 식별에 필요한 이용자의 정보를 말합니다.<br>
  <br>  
 4.&nbsp;“접근매체”라 함은 모바일 통신 단말기(피쳐폰, 스마트폰)를 지칭한다. .<br>
  <br>
 5.&nbsp;“중복가입확인정보(DI)”라 함은 웹사이트에 가입하고자 하는 이용자의 중복확인을 위해 제공되는 정보를 말합니다.<br>
  <br>
  6.&nbsp;“연계정보(CI)”라 함은 인터넷사업자의 온ㆍ오프라인 서비스 연계 등의 목적으로 이용자를 식별하기 위해 제공되는 정보를 말합니다.<br>
  <br>
 7.&nbsp;“본인확인기관”이라 함은 주민등록번호를 사용하지 아니하고 본인을 확인하는 방법 또는 서비스를 제공하는 자로 방송통신위원회로부터 본인확인기관으로 지정을 받은 자를 의미합니다.<br>
  <br>
 8.&nbsp;“인증대행사”이라 함은 회사를 대신하여 서비스의 제공 및 지원 등의 중계 업무를 담당하는 곳으로 회사와 업무지원에 대한 계약이 완료되어 인터넷사업자에서 서비스를 제공하는 사업자를 말합니다.<br>
  <br>
  9.&nbsp;“인터넷사업자”라 함은 인터넷을 이용하여 정보를 제공하거나, 정보의 제공을 매개하는 일을 업으로 하는 자로 회사 또는 인증 대행사와의 서비스 계약을 통해 운영하며, 인터넷 웹사이트의 이용자에 대한 본인확인정보를 제공받는 사업자를 말합니다.<br>
  <br>      
  <br>    
  <p>제3조 (약관의 효력 및 변경)</p>
  1.&nbsp;본 약관은 이용자에게 서비스 화면에 게시하거나, 회사 홈페이지(www.uplus.co.kr)에 게시하여 공지함으로써 효력이 발생합니다. <br>
  <br>
  2.&nbsp;회사는 약관의 규제에 관한 법률 및 기타 관련 법령에 위배되지 않는 범위에서 본 약관의 내용을 개정할 수 있으며, 변경된 경우에는 제1항과 같은 방법으로 공지합니다. 다만 “이용자”의 권리와 의무에 관한 중요한 사항은 변경된 내용의 시행 15일 이전에 공지합니다.<br>
  <br>
  3.&nbsp;이용자는 변경된 약관에 대한 내용을 알지 못하여 발생하는 손해 및 피해에 대해서는 회사가 책임을 지지 않습니다.<br>
  <br><br> 
  <p>제4조 (접근매체의 관리 등)</p>
  1.&nbsp;이용자는 접근매체를 제3자에게 대여하거나 사용을 위임하거나 양도 또는 담보 목적으로 제공할 수 없습니다.
  <br>
  <br>
  2.&nbsp;이용자는 자신의 접근매체를 제3자에게 제공 또는 노출하거나 방치하여서는 안되며, 접근매체의 도용이나 위·변조를 방지하기 위해 충분한 주의를 기울여야 합니다.<br>
  <br>
  <br>
  <p>제5조 (서비스 이용방법)</p>
  1.&nbsp;서비스는 본인명의의 휴대폰을 소지하고 이동전화 서비스를 정상적으로 계속 이용하고 있는 이용자에 한하여 서비스를 제공합니다. {회사의 ‘이동전화이용약관’상 이용 정지(제한 포함), 일시 정지, 계약해지(개통취소 포함) 상태인 이용자에게는 제공 되지 않습니다.}. <br>
  <br>
  2.&nbsp;서비스는 이용자가 주민등록번호를 입력하지 아니하고 본인의 생년월일과 본인 명의로 된 휴대폰정보를 이용하여 본인 식별 또는 본인 확인이 가능하도록 하는 휴대폰인증 서비스 입니다.<br>
  <br>
3.&nbsp;회사는 인증대행사를 통해 인터넷사업자에게 서비스를 제공하며, 인터넷사업자는 회원가입, ID/PW찾기, 성인인증 등 이용자의 본인확인이 필요한 경우 이용자에게 서비스를 제공 합니다.<br>
  <br>
  4.&nbsp;제2항의 경우 이용자가 자신의 생년월일, 성명, 성별, 내/외국인, 휴대폰번호, 통신사 등의 정보를 입력한 후 입력한 정보가 이용자 본인의 정보와 일치한 경우에는 이용자 본인 명의의 휴대폰번호로 수신된 1회성 비밀번호(이하 “승인번호”)를 정확하게 입력하면 본인 식별 또는 본인 확인이 이루어 집니다.<br>
  <br>
  5.&nbsp;제3항과 같이 본인확인이 완료 된 이용자에 대해서는 본인확인정보와 중복가입확인정보 및 연계정보가 인터넷사업자에게 제공되며, 인터넷사업자가 중복가입확인정보 또는 연계정보 등을 이용하여 이용자 관리 및 컨텐츠를 제공 운영 합니다.<br><br>
  <br>  
  <p>제6조 (서비스 제공시간) </p>
  1.&nbsp;회사는 연중무휴 1일 24시간 서비스를 제공함을 원칙으로 합니다. 다만, 회사는 서비스 설비의 장애, 서비스 이용의 폭주 등 기술상의 이유로 서비스를 일시 정지할 수 있고, 서비스 설비 정기 점검 등 운영상의 목적으로 시간을 정하고 공지한 후 서비스를 일시 정지할 수 있습니다.<br>
  <br>
  <br>
  <p>제7조 (회사의 권리와 의무) </p>
  1.&nbsp;회사가 접근매체의 발급주체가 아닌 경우에는 접근매체의 위조나 변조로 발생한 사고로 인하여 이용자에게 발생한 손해에 대하여 배상책임이 없습니다.
  <br>
  <br>
  2.&nbsp;회사는 이용자가 서비스 이용약관이나 안내사항 등을 확인하지 않아 발생한 손해, 이용자에게 책임있는 사유로 접근매체를 누설 또는 노출하거나 방치한 손해 등 이용자의 부주의에 기인한 손해에 대하여 배상책임이 없습니다.<br>
  <br>
  3.&nbsp;회사의 이용자에 대한 손해배상 책임범위는 통상손해에 한합니다. <br>
  <br>
  4.&nbsp;회사는 서비스 제공시 접근매체를 이용하여 이용자의 신원, 권한 및 거래지시의 내용 등을 확인할 수 있습니다.<br>
  <br>
  5.&nbsp;회사는 서비스 제공과 관련하여 인지한 이용자의 본인확인정보를 본인의 승낙 없이 제3자에게 누설하거나 제공하지 않습니다. 단, 국가기관의 요구가 있는 경우, 범죄에 대한 수사상의 목적이 있는 경우 등 기타 관계 법령에서 정한 절차에 따른 요청이 있는 경우에는 그러하지 않습니다.<br>
  <br>
  6.&nbsp;회사는 이용자에게 안정적으로 서비스를 제공하기 위하여 지속적으로 서비스의 예방점검, 유지보수 등을 이행하며 서비스 장애가 발생하는 경우 지체없이 서비스를 복구합니다.<br>
  <br>    
  7.&nbsp;회사는 복제폰, 대포폰, 불법 휴대폰 대출(일명 휴대폰깡) 등 시장질서를 교란시키는 불법행위로 의한 피해를 방지하기 위하여 사전통지 없이 서비스를 제한하거나 중지할 수 있습니다.<br>
  <br><br>  
  <p>제8조 (이용자의 의무)</p>
  1.&nbsp;이용자는 서비스를 이용함에 있어서 다음 각호에 해당하는 행위를 하여서는 안되며, 회사는 위반 행위에 따르는 일체의 법적 책임을 지지 않습니다.<br>
  <br>
 1) 타 이용자의 본인확인정보 및 승인번호를 부정하게 사용 및 도용하는 행위<br>
2) 회사 또는 제3자의 지식재산권 등 기타 권리를 침해하는 행위<br>
3) 범죄 행위 및 범죄적 행위와 관련있는 행위<br>
4) 관련 법령에 위배되는 행위<br>
5) 기타 서비스의 정상적 운영, 유지 등을 방해하거나 지연시키는 행위<br>
<p></p>
  2.&nbsp;이용자는 본 약관에서 규정하는 사항과 서비스에 대한 이용안내 또는 주의사항 등을 준수하여야 합니다.<br>
  <br>
  3.&nbsp;이용자가 본 약관을 위반하여 회사에 손해가 발생한 경우에는 이용자가 모든 손해를 배상하여야 합니다<br>
  <br>  
  <br>
  <p>제9조 (본인인증 정보의 제공금지))</p>
회사는 서비스를 제공함에 있어 취득한 이용자의 정보 또는 자료를 이용자의 동의 없이 제3자에게 제공, 누설하거나 서비스 목적 외에 사용하지 않습니다.<br>
  <br><br>
  <p>제10조 (서비스의 안정성 확보)</p>
  1.&nbsp;회사는 서비스의 안전성과 신뢰성을 확보하기 위하여 업무처리지침의 제정 및 시행, 정보 처리시스템 및 전산자료의 관리 등의 관리적 조치와 모니터링 체계 및 해킹방지시스템 구축 및 운영 등의 기술적 조치를 취해야 합니다.<br>
  <br>
  2.  회사는 서버 및 통신기기의 정상작동여부 확인을 위하여 정보처리시스템 자원 상태의 감시,경고 및 제어가 가능한 모니터링 체계를 갖추어야 합니다.<br>
  <br>
  3. "회사"는 해킹 침해 방지를 위하여 다음 각 호의 시스템 및 프로그램을 설치하여 운영합니다. <br>
  <br>
  ;1) 침입차단시스템 설치 <br>
  ;2) 침입탐지시스템 설치 <br>
  ;3) 그 밖에 필요한 보호장비 또는 암호프로그램 등 정보보호시스템 설치 <br>
  <br>
  4. "회사"는 컴퓨터바이러스 감염을 방지하기 위하여 다음 각 호를 포함한 대책을 수립, 운영하고 있습니다<br>
  <br>
  ;1) 출처, 유통경로 및 제작자가 명확하지 아니한 응용프로그램은 사용을 자제하고 불가피할 경우에는 컴퓨터바이러스 검색프로그램으로 진단 및 치료 후 사용할 것 <br>
  ;2) 컴퓨터바이러스 검색, 치료 프로그램을 설치하고 최신 버전을 유지할 것 <br>
  ;3) 컴퓨터바이러스 감염에 대비하여 방어, 탐색 및 복구 절차를 마련할 것 <br>
  <br><br>
  <p>제11조 (이용자의 개인정보보호) </p>
  회사는 관련법령이 정하는 바에 따라서 이용자의 개인정보를 보호하기 위하여 노력하며, 이용자의 개인정보에 관한 사항은 관련 법령 및 회사가 정하는 개인정보처리방침에 정한 바에 따릅니다.
<br>
  <br><br>
  <p>제12조 (개인정보의 처리) </p>
  1.&nbsp;회사는 서비스 제공을 위하여 수집된 본인확인정보의 취급 및 관리 등의 업무를 스스로 수행함을 원칙으로 하나, 필요한 경우 아래 표와 같이 회사가 선정한 사업자에게 위탁할 수 있습니다.<br>
  <br>
  <p>[개인정보의 취급 위탁]</p>
  <br>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" style=" border:2px solid #333;">
  <tbody>
  <tr>
    <td width="36%" height="40" align="center" style="border-right:1px solid #666;border-bottom:1px solid #666;" class=""><p>수탁자</p></td>
    <td width="64%" height="40" align="center" style="border-bottom:1px solid #666;" class=""><p>위탁업무내용</p></td>
  </tr>
  <tr>
    <td style="border-right:1px solid #666;border-bottom:1px solid #666;" height="50" align="center" class="">에스씨아이평가정보㈜ </td>
    <td height="50" align="center" style="border-bottom:1px solid #666;" class="">연계정보, 중복가입확인정보  생성 및 전송<br>본인확인 서비스 중계 업무 제공</td>
  </tr>
  <tr>
    <td height="30" align="center" style="border-right:1px solid #666;border-bottom:1px solid #666;" class="">한국모바일인증㈜ </td>
    <td height="30" align="center" style="border-bottom:1px solid #666;" class="">본인확인 서비스 중계 업무 제공</td>
  </tr>
  <tr>
    <td height="30" align="center" style="border-right:1px solid #666;border-bottom:1px solid #666;" class="">코리아크레딧뷰로㈜&gt;</td>
    <td height="30" align="center" style="border-bottom:1px solid #666;" class="">본인확인 서비스 중계 업무 제공</td>
  </tr>
  <tr>
    <td height="50" align="center" style="border-right:1px solid #666;border-bottom:1px solid #666;" class=""> NICE평가정보㈜ </td>
    <td height="50" align="center" style="border-bottom:1px solid #666;" class="">연계정보 , 중복가입확인정보  생성 및 전송<br>본인확인 서비스 중계 업무 제공</td>
  </tr>
  <tr>
    <td height="30" align="center" style="border-right:1px solid #666;border-bottom:1px solid #666;" class="">㈜ 다날 </td>
    <td height="30" align="center" style="border-bottom:1px solid #666;" class="">본인확인 서비스 중계 업무 제공 </td>
  </tr>
  <tr>
    <td height="30" align="center" style="border-right:1px solid #666;border-bottom:1px solid #666;" class="">㈜ NHN한국사이버결제 </td>
    <td height="30" align="center" style="border-bottom:1px solid #666;" class="">본인확인 서비스 중계 업무 제공 </td>
  </tr>
  <tr>
    <td height="30" align="center" style="border-right:1px solid #666;border-bottom:1px solid #666;" class="">㈜드림시큐리티 </td>
    <td height="30" align="center" style="border-bottom:1px solid #666;" class="">본인확인 서비스 중계 업무 제공 </td>
  </tr>
  <tr>
    <td height="30" align="center" style="border-right:1px solid #666;border-bottom:1px solid #666;" class="">KG모빌리언스 </td>
    <td height="30" align="center" style="border-bottom:1px solid #666;" class="">본인확인 서비스 중계 업무 제공 </td>
  </tr>
  <tr>
    <td height="30" align="center" style="border-right:1px solid #666;border-bottom:1px solid #666;" class="">CS리더, LB휴넷, 아이알링크 주식회사, (주)씨에스원파트너</td>
    <td height="30" align="center" style="border-bottom:1px solid #666;" class="">고객센터 운영</td>
  </tr>
  <tr>
    <td height="30" align="center" style="border-right:1px solid #666;border-bottom:1px solid #666;" class="">미디어로그</td>
    <td height="30" align="center" style="border-bottom:1px solid #666;" class="">PASS 어플리케이션 및 웹사이트 운영/관리</td>
  </tr>
  <tr>
    <td height="30" align="center" style="border-right:1px solid #666;" class="">아톤</td>
    <td height="30" align="center" style="border-bottom:1px solid #666;" class="">PASS 서비스 장애 및 VOC 처리</td>
  </tr>
  </tbody>
  </table>
  <br><br>
  2.&nbsp;회사는 서비스 제공 시 수집된 식별정보(중복가입확인정보, 연계정보)는 본인 식별 및 확인 위한 목적으로 회사 또는 인증 대행사를 통해 인터넷사업자에게 제공할 수 있습니다.<br>
  <br>
  3.&nbsp;개인정보 처리 및 위탁 등에 관한 사항은 관련법령 및 회사가 정하는 개인정보처리방침에 정한 바에 따릅니다<br>
  <br>  
<p>제13조 (약관 외 준칙) </p>
본 약관에 명시되지 아니한 사항에 대해서는 정보통신망 이용 촉진 및 정보보호 등에 관한 법률 등 기타 관련법령 또는 상관례에 따릅니다. 
 <br>
<br><br>
  <p>부칙 </p>
  (시행일) 이 약관은 공시한 날로부터 시행합니다.<br>
<p></p>

																</div>
															</div>
								</li>
								<!-- <li>
									<input type="checkbox" class="chk__style _basic_type" id="s_agree5">
									<label for="s_agree5">개인정보 제3자 제공 동의</label>
									<a href="" class="btn-view fr">전문보기</a>
								</li> -->
							</ul>

							<div class="certif-box" id="certAfter">
								<div class="num">
									<input type="text" class="inp_style1" placeholder="인증번호" name="sAuthNo" id="sAuthNo" validatetext="인증번호" maxlength="6" validate="required">
									<span id="countdown" class="count_down time"></span>
								</div>
								<div class="btn-confirm">
									<a href="javascript:confirmReturn();void(0);" class="btn__style1  btn-submit">확인</a>
									<a href="javascript:confirmJoin();void(0);" class="btn__style1  btn-resubmit">재전송</a>
								</div>
								<span class="txt">5분 이내로 인증번호(6자리)를 입력해주세요.</span>
								<span class="error-msg">"인증번호"을(를) 입력해 주세요.</span>
								<input type="hidden" name="responsedata" id="responsedata">
								<input type="hidden" name="requestdata" id="requestdata">
							</div>

						</div>


				</div>
			</section>

			<section class="member-box join">
				<h2 class="tit__style2">부가정보 입력<span>(선택)</span></h2>
				
				<div class="inp-box">		
					

					<div class="email tline">
						<label for="userEmail">이메일</label>
						<input type="text" name="email1" id="userEmail" class="inp__style2" value=""/>
						<span>@</span>
						<input type="text" name="email2" id="userEmail2" class="inp__style2" maxlength="50" value="" />

						<select name="email_etc" id="userPhone" onchange="email_chg(this);">
							<option value="">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="hotmail.com">hotmail.com</option>
							<option value="yahoo.co.kr">yahoo.co.kr</option>
							<option value="nate.com">nate.com</option>
							<option value="sayclub.com">sayclub.com</option>
							<option value="lycos.co.kr">lycos.co.kr</option>
							<option value="dreamwiz.com">dreamwiz.com</option>
							<option value="hanmir.com">hanmir.com</option>
							<option value="korea.com">korea.com</option>
							<option value="empal.com">empal.com</option>
						</select>

						<p style="letter-spacing: -1px;">
							이메일에 수신동의 하시면 메일을 통해 신상품 및 여러가지<br>
							정보를 우선적으로 받아보실 수 있습니다.
						</p>
					</div>


					


						
						<div class="terms new210302">
							<p class="tit">KEDS 이용약관 및 마케팅 정보 수신 동의</p>
							<div class="terms__con">								
								<div class="terms__con--all _down toggle_all">
									<p>
										<input type="checkbox" class="chk__style _basic_type" name="all1" id="all1" onclick="agreeAll2022();">
										<label for="all1">
											KEDS 이용약관 및 <br>
											마케팅 정보 수신에 모두 동의 합니다.
											<small class="" id="termsCheckText">필수 약관에 체크해주세요.</small>	
										</label>
									</p>
								</div>
								<div class="">
									<div>
										<p>
											<input type="checkbox" class="chk__style _basic_type" name="agree1" id="agree1" onclick="agrees2022();">
											<label for="agree1">이용약관 <span class="red">(필수)</span></label>
										</p>
										<button type="button" class="more__btn">전문보기</button>
									<div class="cs-agree-con">
										<div class="head">
											<h2>이용약관</h2>
											<button type="button" class="btn_close"><img src="/pc/resource/images/common/ico_x_bk_18x18.png" alt=""></button>
										</div>
										<div class="box _scroll">
											<p>
												<strong>제 1 조 목 적</strong><br><br>
												이 약관은 휠라코리아(주)(이하 “회사”)가 FILA, FILA KIDS, FILA INTIMO, filativa,FILA UNDERWEAR, FILA GOLF,
												OUTLET, ZOO YORK, Keds 브랜드 관련하여 제공하는 서비스 (회사 사이트에서 제공하는 인터넷 관련 서비스를 포함함)를 이용함에 있어서 회사와 회원의 권리, 의무 및 책임사항을 규정하고, 회원의 서비스 이용조건 및 절차에 관한 사항과 기타 필요한 사항을 규정함을 목적으로 합니다.
												<br><br><br>

												<strong>제 2조 용어의 정의</strong><br><br>
												(1) ‘회원’이란 이 약관을 승인하고 회사에 개인정보를 제공하여 회원가입을 신청한 자로서, 매장 및 모바일 어플 등을 통해 가입한 회원과 사이트를 통하여 가입한 회원을 총칭하며, 이 약관에서 정한 절차 또는 관련 법령에 따라 이 약관이 해지되지 않는 한, 회사가 제공하는 정보를 지속적으로 제공받으며, 회사가 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.<br><br>

												(2) ‘서비스'란 회사가 회원에게 제공하는 서비스 정책으로서 회원의 구매이력 등을 관리하고 매장 및 공식 사이트에서 구매에 따른 각종 정보와 구매편의, 다양한 혜택을 제공하기 위하여 만든 서비스 정책(이하 “서비스")을 말합니다. <br><br>

												(3) '회원번호'란 회원의 식별 및 서비스 이용을 위하여 가입 시, 최초 회사가 회원 별로 부여하는 고유한 숫자의 조합을 말합니다.<br><br>

												(4) '아이디(ID)'란 회원의 식별과 사이트 내 서비스 이용을 위하여 사이트에서 회원가입 시, 회원이 등록한 고유의 문자와 숫자의 조합을 말합니다.<br><br>

												(5) ‘비밀번호’란 회원이 본인 여부를 검증하기 위하여, 회원이 등록한 고유의 문자와 숫자의 조합을 말합니다. <br><br>

												(6) ‘매장’이란 회사에서 운영하는 직영점 또는 별도의 가입규약이나 계약을 체결하여 이 약관에 따른 제반 서비스를 공동으로 제공 및 운영하기로 한 매장을 말합니다. 매장 여부는 사이트 내 ‘매장안내' 화면 또는 ZOO YORK 고객센터 (1577-3616) 통해 확인할 수 있습니다.<br><br>

												(7) ‘사이트’란 회사가 상품 등 재화 또는 용역을 회원에게 제공하기 위하여 컴퓨터 등 정보통신 설비를 이용하여 상품 등 재화 또는 용역을 거래할 수 있도록 설정한 가상의 영업장을 말합니다.<br><br>

												(8) ‘포인트’란 회사가 제공하는 서비스를 이용할 때 회사의 재량에 따라 회원에게 부여되는 환가 불가능한 회사 전용의 비재산적 데이터를 말합니다. <br><br>

												(9) ‘쿠폰'이란 회원이 상품을 구매할 때나 회사가 제공하는 서비스를 이용할 때 회사의 재량에 따라 회원에게 발행∙지급되는 할인 수단을 말합니다. 쿠폰은 정률 쿠폰(ex. 15% 할인)과 정액 쿠폰(ex. 5000원 할인)으로 구분됩니다. <br><br><br>

												<strong>제 3조 서비스 개요</strong><br><br>
												(1) 회원이 회사의 서비스를 제공 받기 위해서는 이 약관에서 정하고 있는 제반 절차를 거쳐 회원으로 가입해야 합니다.<br><br>

												(2) 회사는 회원에게 보다 나은 서비스의 제공을 위하여 회원등급을 분류하여 등급에 따라 서비스 및 혜택을 달리하여 제공합니다. 회원등급 및 그에 따른 혜택에 대하여는 이용실적, 기타 회사가 정하는 이용정책에 정한 기준에 따라 부여됩니다. 
												상세한 내역은 해당 서비스 화면[고객센터]-[멤버십]에 공지합니다. <br><br>
												<a href="/customer/notice_view.asp?seq=3&amp;page=1" style="text-decoration:underline;">[멤버십] 바로가기</a><br>

												(3) 서비스는 회원 본인이 직접 회사에서 규정한 탈퇴 양식을 갖춰 멤버십 탈퇴의사를 전달한 경우 또는 관련법령에 따라 1년간 서비스 이용실적이 없는 경우를 제외하고는 유효하게 제공됩니다.<br><br><br>

												<strong>제 4조 회원 가입 절차</strong><br><br>
												(1) 매장 및 모바일 어플을 통해 회원 가입을 신청하는 경우, 회사에서 요청하는 개인정보를 작성한 후 약관 동의 및 실명인증을 진행하고 나면 회원 가입이 됩니다. 본 절차를 통해 가입한 회원은 서비스 혜택을 즉시 부여 받을 수 있습니다.<br><br>

												(2) 사이트를 통해 회원가입 신청을 하는 경우, 사이트 내 회원가입 절차만을 거치면 사이트 및 멤버십 서비스를 모두 이용할 수 있습니다. 단, 전항에 따라 가입한 회원이 사이트 서비스도 이용할 수 있는 회원이 되려면 사이트 내 추가 회원가입 절차를 진행하여 미비된 입력 사항을 추가 기재한 후 사이트 서비스를 이용할 수 있습니다.<br><br>

												(3) 회원의 권리 및 의무는 본인 이외의 타인에게 대여하거나 양도 또는 담보의 목적으로 이용될 수 없습니다. 만일 이를 위반하여 발생하는 모든 책임은 회원에게 귀속됩니다.<br><br><br>

												<strong>제 5조 쿠폰 및 포인트 이용</strong><br><br>

												(1) 쿠폰<br><br>
												가. 쿠폰의 지급 대상, 기준, 사용방식 및 기한 등 구체적인 사항에 대해서는 건별 쿠폰 발생시 별도로 정합니다.<br><br>

												나. 회사가 회원에게 지급한 쿠폰은 매장 또는 사이트 내 [마이페이지] 화면에서 조회가 가능합니다.<br><br>

												다. 쿠폰은 마케팅 수신 동의한 회원에 한하여 휴대전화 문자 또는 모바일 SNS 채널(카카오톡)등을 통해 발행 정보가 안내되며, 발행된 쿠폰은 유효기간 내에 해당 회사의 매장 또는 사이트에서 사용 가능합니다.<br><br>

												라. 쿠폰 사용은 건 별 해당 명시 기간까지 사용 가능하며 유효기간이 지난 쿠폰은 사용할 수 없습니다. 매장에서 쿠폰 사용은 회원번호 확인 후 적용되며, 회원번호를 모를 경우 회원 가입 당시 기재한 회원 휴대전화 번호로 회원여부 확인 후 사용할 수 있습니다. 사이트 상에서 사용하는 경우에는 회원 로그인이 요구됩니다.<br><br>

												마. 회원이 보유한 다수의 쿠폰의 경우 중복 사용 불가하며, 쿠폰 사용 시 쿠폰 금액 보다 적은 금액의 제품 구입 시에는 잔액을 환불해 드리지 않습니다.<br><br>

												(2) 포인트<br><br>
												가. 회원이 적립 받은 포인트의 건별 유효기간은 상이할 수 있습니다.<br><br>

												나. 1포인트는 1원으로 산정되어 보유포인트가 10포인트 이상일 경우 사용 가능하며, 회사의 매장 또는 사이트 내 마이페이지 화면에서 포인트 내역 조회가 가능합니다.<br><br>

												다. 포인트 사용은 건별 유효기간까지 사용 가능하며 유효기간이 지난 포인트는 사용할 수 없습니다. 매장에서 포인트 사용은 회원번호 확인 후 적용되며, 회원번호를 모를 경우 회원 가입 당시 기재한 휴대전화 번호를 토대로 회원여부확인 후 사용할 수 있습니다. 회사 사이트 상에서 사용하는 경우에는 회원 로그인이 요구됩니다.<br><br>

												(3) 쿠폰 및 포인트 사용의 제한∙소멸 등 <br><br>
												가.   포인트 및 쿠폰 의 유효기간 이후에는 자동 소멸되어 이용하실 수 없습니다.<br><br>

												나. 다음의 경우에는 포인트 및 쿠폰 사용이 되지 않습니다. <br>
												- 회사의 직영점, 회사와 계약 된 공식 매장 또는 사이트를 제외한 기타 판매처에서의 구매 시<br>
												- 법인(단체)구매를 통한 할인 시 <br>
												- 별도 사용 제외 품목으로 지정한 상품 구매 시<br>
												- 높은 할인율을 적용하여 판매 하는 매장(면세점)에서의 구매 시<br><br>

												다. 회원에게 적립된 포인트 및 발행 쿠폰은 제3자에게 양도할 수 없으며 상속, 증여, 매매 등의 대상이 되지 않습니다. <br>
												라. 제7조의 사유로 회원 탈퇴 처리된 경우, 적립된 포인트 및 발행된 쿠폰은 그 유효기간에 상관 없이 회원 탈퇴 일자를 기준으로 모두 소멸됩니다. <br>
												마. 회원이 회사의 매장 및 사이트에서 포인트를 사용하여 구매한 상품을 반품 시에는 사용했던 포인트를 유효기간이 경과하지 않은 경우 다시 복원하고, 해당 포인트를 제외한 실제 결제 금액을 환불하여 드립니다.<br>
												바. 쿠폰 및 포인트의 사용에 대한 구체적인 내용은 회사의 사이트에서 고지합니다.<br><br><br>

												<strong>제 6조 부정 구매 및 대응 </strong><br><br>

												(1) 회원이 회사의 매장 및 사이트에서 회사의 상품 등 재화 또는 용역을 구매하는 경우, 그러한 구매가 부정한 목적 또는 방법 (포인트, 쿠폰의 오남용 및 이에 국한하지 않음)에 기한 것으로 부정 구매로 판단될 시 회사는 회원의 당해 구매실적을 취소할 수 있습니다.<br><br>
												(2) 또한 회사는 이 약관 시행<br><br> 이전에 적립한 포인트가 회사의 규정에 따라 합당한 방법으로 적립된 것이 아니라는 합리적 의심이 드는 경우, 회원의 해당 쿠폰∙포인트의 이용 등을 제한할 수 있으며, 기 발행된 쿠폰∙포인트는 원칙적으로 즉시 소멸되거나 무효처리 됩니다. 

												(3) 회사는 쿠폰 및 포인트 소멸 조치와 별도로 해당 회원에게 민∙형사상의 법적 책임을 물을 수 있고, 제3자가 회사에게 소송을 제기하거나 관계기관을 통한 신고, 기타 분쟁을 야기하는 경우 회원은 회사를 면책하고 모든 책임을 부담해야 합니다.<br><br>

												(4) 본 조 제(1)항에 부정구매의 판단은 회사가 1차적으로 담당하며, 회원이 부정구매의 판단에 대해 이의를 제기할 경우, 회사는 회원이 자신의 고의 또는 과실로 인한 부정구매가 발생하지 않았다는 등의 소명을 듣는 예외적인 절차를 마련하여 정상이용 건으로 변경하는 조치를 취할 수 있으나, 회사의 부정사용의 판단에 대하여 회원과 이견이 있는 경우 아래 제29조에 의거, 분쟁을 해결하는 것을 원칙으로 합니다.<br><br>

												(5) 본 조 제(1)항에 따른 포인트 및 쿠폰 소멸 조치에 대하여 회사가 본 약관 제 8조 제 2항에 준하는 ‘고지방법’으로 회원에게 부정구매에 따른 구매실적 취소와 포인트 누적 제한에 관하여 통지한 후, 그 통지가 회원에게 도달된 날로부터 30일 이내에 회원으로부터 회사에 별다른 이의제기가 없을 경우에는 회사는 회원이 해당 조치에 동의한 것으로 간주 합니다.<br><br><br>

												<strong>제 7조 회원 탈퇴 및 휴면 처리</strong><br><br>

												(1) 회원이 탈퇴하고자 할 경우에는 언제든지 ZOO YORK 고객센터 (1577-3616) 및 회사 사이트 내 서비스 화면에서 본인 확인을 거쳐 탈퇴를 요청할 수 있습니다. <br><br>
												 
												(2) 회사는 다음 각 호에 해당하는 사유가 발생하는 경우 해당 회원에게 통지함으로써 회원 자격을 제한•정지 및 상실시켜 휴면 처리 및 탈퇴를 진행할 수 있습니다.<br><br>

												가. 회원 가입 시 허위의 내용을 등록한 경우 - 탈퇴<br>
												나. 부정구매 하거나 기타 서비스를 부정한 방법 또는 목적으로 이용한 경우 – 탈퇴<br>
												다. 회원이 사망한 경우 – 탈퇴<br>
												라. 다른 회원의 회사 사이트 이용을 방해하거나 정보를 도용하여 손해를 끼친 경우 – 탈퇴<br>
												마. 관련법에 따라 1년간 서비스 이용실적이 없는 경우 - 휴면 <br><br>

												

												(3) 이 약관 제 7조 제(2)항 마.호의 사유에 의해 회사가 회원을 휴면 처리할 경우, 관련 법령에 따라 휴면 예정일로부터 30일 전에 회원에게 고지 후 개인 정보를 분리 보관합니다. 회원이 휴면 회원으로 전환 될 경우, 보유하고 있는 쿠폰 및 포인트 중 유효기간이 경과한 쿠폰 및 포인트는 효력을 상실하고 유효기간이 경과되지 않은 쿠폰 및 보유포인트는 휴면 회원이 해지될 경우 사용 가능합니다.<br><br>

												(4) 탈퇴한 회원의 재가입의 경우, 회사가 정하는 회원 재가입 절차에 따라 재가입이 가능합니다.<br><br><br>

												<strong>제 8조 이용약관 효력 및 개정</strong><br><br>

												(1) 이 약관의 내용은 회원이 이 약관에서 정하는 소정의 가입 절차를 거쳐 성공적으로 회원 가입을 완료 함으로써 효력을 발휘합니다. 또한 회사는 이 약관의 내용을 회원이 쉽게 알 수 있도록 회사의 사이트에 게시합니다.<br><br>

												(2) 이 약관은 전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법령을 위배하지 않는 범위에서 개정될 수 있으며, 약관을 개정하고자 할 경우 회사는 개정된 약관을 적용하고자 하는 날로부터 30일 이전에 약관이 개정된다는 사실과 개정된 내용 등을 아래에 규정한 방법 중 1가지 이상의 방법으로 회원에게 고지하여 드립니다. <br>
												- 고지 방법: a)문자 통보, b) 전자우편(E-mail) 통보, c) 회사 사이트(온라인) 게시, d) 매장(오프라인) 게시<br><br>

												(3) 약관 변경 사실이 고지된 이후에도 30일 이내에 이의를 제기하지 않고, 회원이 계속적으로 서비스를 이용하는 경우에는 약관의 변경사항에 동의한 것으로 간주합니다.<br><br>

												(4) 회원이 약관 변경(개정) 사실에 동의하지 않는 경우엔 회사는 개정 약관의 내용을 적용할 수 없으며, 이 경우 회원은 이용계약을 해지할 수 있습니다. 다만, 기존 약관을 적용할 수 없는 특별한 사정이 있는 경우에는 회사는 이용계약을 해지할 수 있습니다.<br><br><br>

												<strong>제 9조 계약의 성립</strong><br><br>

												(1) 계약은 회원이 되고자 하는 자(이하 "가입신청자")가 약관의 내용에 대하여 동의를 한 다음 회원가입을 신청하고, 회사가 이러한 신청에 대하여 승낙함으로써 체결됩니다.<br><br>

												(2) 회사는 회원의 신청에 대하여 서비스 이용을 승낙함을 원칙으로 합니다. 다만, 회사는 다음 각 호에 해당하는 신청에 대하여는 승낙을 하지 않거나 사후에 이용계약을 해지할 수 있습니다.<br>
												- 가입신청자가 이 약관에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 단 회사의 회원 재가입 승낙을 얻은 경우에는 예외로 함.<br>
												- 실명이 아니거나 타인의 명의를 이용한 경우<br>
												- 허위의 정보를 기재하거나, 회사가 제시하는 내용을 기재하지 않은 경우<br>
												- 가입신청자가 만 14세 미만 아동에 해당하는 경우<br>
												- 회원의 귀책사유로 인하여 가입 승낙이 불가능하거나 규정한 제반 사항 및 관련 법령을 위반하여 신청하는 경우<br><br>

												(3) 제(1)항에 따른 회원가입에 있어 회사는 전문기관을 통한 실명확인 및 본인인증을 요청할 수 있습니다.<br><br>

												(4) 회사는 서비스를 제공할 물리적 여유가 없거나, 기술상 또는 업무상 문제가 있는 경우에는 승낙을 유보할 수 있습니다.<br><br>

												(5) 제(2)항과 제(4)항에 따라 회원가입의 승낙을 하지 아니하거나 유보한 경우, 회사는 원칙적으로 이를 가입신청자에게 알리도록 합니다.<br><br>

												(6) 이용계약의 성립 시기는 회사가 가입완료를 신청절차 상에서 표시한 시점으로 합니다.<br><br><br>

												<strong>제10조 지급방법 </strong><br><br>

												회원이 회사의 매장 또는 사이트에서 구매한 상품에 대한 대금지급방법은 다음 각 호의 방법 중 가용한 방법으로 할 수 있습니다. 이 경우, 회사는 회원의 지급방법에 대하여 상품 등의 대금에 어떠한 명목의 수수료도 추가하여 징수할 수 없습니다.<br><br>
												 
												가. 폰뱅킹, 인터넷뱅킹 등의 각종 계좌이체 (매장의 경우, 현금 지불 포함)<br>
												나. 선불카드, 직불카드, 신용카드 등의 각종 카드 결제<br>
												다. 온라인무통장입금<br>
												라. 회사가 지급한 포인트 또는 쿠폰에 의한 결제<br>
												마. 회사가 계약을 맺었거나 회사가 인정한 상품권에 의한 결제 <br>
												바. 기타 전자적 지급 방법에 의한 대금 지급 등<br><br><br>

												<strong>제11조 사이트 내 구매 시 수신확인 통지, 구매신청 변경 및 취소</strong><br><br>
												 
												(1) 회사는 회원의 사이트 내 구매신청이 있는 경우 회원에게 수신확인통지를 합니다.<br><br>
												 
												(2) 전항에 따라 수신확인통지를 받은 회원이 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있고, 회사는 배송 전에 회원의 요청이 있는 경우에는 지체 없이 그 요청에 따라 처리하여야 합니다. 다만 이미 대금을 지불한 경우에는 제14조의 청약철회 등에 관한 규정에 따릅니다.<br><br><br>
												 
												<strong>제12조 사이트 내 구매 시 상품 등의 공급</strong><br><br>

												(1) 회사는 회원과 상품 등의 공급시기에 관하여 별도의 약정이 없는 이상, 회원이 사이트 내에서 상품을 구매한 날부터  [7] 영업일 이내에 상품 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다. 다만, 회원과 상품 등의 공급시기에 관하여 별도의 약정(상품 등의 공급시기에 관한 상세페이지를 통한 안내 포함)이 있었다면 그 약정에 따릅니다. 이때 회사는 회원이 상품 등의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다.<br><br>

												(2) 회사는 회원이 구매한 상품에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다. 만약 회사가 약정 배송기간을 초과한 경우에는 그로 인한 회원의 손해를 배상하여야 합니다. 다만 회사가 고의․과실이 없음을 입증한 경우에는 그러하지 아니합니다.<br><br><br>

												<strong>제13조 환급</strong><br><br>

												회사는 회원이 구매 신청한 상품 등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체 없이 그 사유를 회원에게 통지하고 사전에 상품 등의 대금을 받은 경우에는 대금을 받은 날부터 3영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다.<br><br><br>

												<strong>제14조 청약철회 등</strong><br><br>

												(1) 회사에서 상품 등의 구매에 관한 계약을 체결한 회원은 사이트의 경우 7일 이내에 청약 철회를 할 수 있습니다. 다만, 청약철회에 관하여 관련법령에 달리 정함이 있는 경우에는 동 법 규정에 따릅니다. 
												회원이 상품 등을 배송 받은 경우 다음 각 호의 1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다.<br><br>

												가. 회원에게 책임 있는 사유로 상품 등이 멸실 또는 훼손된 경우(다만, 상품 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다)<br>
												나.  회원의 사용 또는 일부 소비에 의하여 상품 등의 가치가 현저히 감소한 경우<br>
												다. 시간의 경과에 의하여 재판매가 곤란할 정도로 상품 등의 가치가 현저히 감소한 경우<br>
												라. 같은 성능을 지닌 상품 등으로 복제가 가능한 경우 그 원본인 상품 등의 포장을 훼손한 경우<br>

												(2) 전 항의 나.호 내지 라.호의 경우, 회사가 사전에 청약철회 등이 제한되는 사실을 회원이 쉽게 알 수 있는 곳에 명시하거나 상품을 제공하는 등의 조치를 하지 않았다면 회원의 청약철회 등이 제한되지 않습니다<br><br>

												(3) 회원은 본 조 제1항 및 제2항의 규정에도 불구하고 상품 등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 상품 등을 공급받은 날부터 3월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다.<br><br><br>

												<strong>제15조 청약철회 등의 효과</strong><br><br>

												(1) 회사는 회원으로부터 상품 등을 반환 받은 경우 3영업일 이내에 이미 지급받은 상품 등의 대금을 환급합니다. 이 경우 회사가 회원에게 상품 등의 환급을 지연한 때에는 그 지연기간에 대하여 공정거래위원회가 정하여 고시하고 있는 지연이자율을 곱하여 산정한 지연이자를 지급합니다.<br><br>

												(2) 회사는 대금을 환급함에 있어서 회원이 신용카드 또는 기타 전자적 지급방법 등의 결제수단으로 상품 등의 대금을 지급한 때에는 지체 없이 당해 결제수단을 제공한 사업자로 하여금 상품 등의 대금의 청구를 정지 또는 취소하도록 요청합니다.<br><br>

												(3) 청약철회 등의 경우 공급받은 상품 등의 반환에 필요한 비용은 회원이 부담합니다. 회사는 회원에게 청약철회 등을 이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만 상품 등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행되어 회원이 청약철회 등을 하는 경우 상품 등의 반환에 필요한 비용은 회사가 부담합니다.<br><br>

												(4) 회원이 상품 등을 제공받을 때 발송비를 부담한 경우에 회사는 청약철회 시 그 비용을 누가 부담하는지를 회원이 알기 쉽도록 명확하게 표시합니다.<br><br><br>

												<strong>제 16조 사이트 서비스의 제공 및 이용</strong><br><br>

												(1) 회사는 업무상, 기술상의 특별한 장애요인이 없는 한 사이트 서비스를 연중무휴, 1일 24시간 제공함을 원칙으로 합니다.<br><br>

												(2) 회사는 정기점검 등의 필요로 인하여 회사가 정한 기간 또는 다음 각 호의 사유가 있을 경우 서비스 제공을 일시적으로 중단할 수 있으며, 이 경우 제 24조 [회원에 대한 통지]에 따른 방법으로 미리 안내합니다. 다만, 회사가 사전에 안내할 수 없는 부득이한 사유가 있는 경우 사후에 안내할 수 있습니다.<br><br>
												- 서비스 설비의 증설, 교체, 보수점검 등 공사로 인한 경우<br>
												- 전기통신사업법에 규정된 기간통신사업자가 전기 통신 서비스를 중지했을 경우<br>
												- 정전, 통신두절, 전자장치의 장애 발생 등 예상치 못한 사유가 발생한 경우<br>
												- 천재지변 등 불가항력적 사유 등 기타 운영상 상당한 이유가 있는 경우<br><br>

												(3) 제(2)항의 경우 회사는 서비스 중단에 대하여 면책되며, 회원은 회원가입 이후라 할지라도 일부 서비스 이용 시 회사 사정에 따라 서비스 이용이 제한 될 수 있습니다.<br><br><br>

												<strong>제 17조 회원정보의 변경</strong><br><br>

												(1) 회원은 회사 사이트 내 개인정보 관리화면을 통하여 언제든지 본인의 개인정보를 열람하고 수정할 수 있습니다. 다만, 서비스 관리를 위해 필요한 실명, 아이디 등은 수정이 불가능합니다.<br><br>

												(2) 회원은 회원가입 신청시 기재한 사항이 변경 되었을 경우, 사이트에 로그인 후 수정 하거나 ZOO YORK 고객센터 (1577-3616)로 연락하여 본인 확인 후 변경사항을 알려서 수정해야 합니다.<br><br>

												(3) 제(2)항의 변경사항을 회사에 알리지 않아 발생한 불이익에 대하여 회사는 책임지지 않습니다.<br><br><br>

												<strong>제 18조 서비스의 변경</strong><br><br>

												(1) 회사는 상당한 이유가 있는 경우에 운영상, 기술상의 필요에 따라 제공하고 있는 사이트의 전부 또는 일부 서비스를 변경할 수 있습니다.<br><br>

												(2) 회사는 회원에 대한 서비스의 변경이 있는 경우에는 회사는 변경사유, 변경될 서비스의 내용 및 제공일자 등은 그 변경 전에 해당 서비스 초기화면에 게시하며, 이 약관 제8조의 약관 변경의 절차를 진행합니다. <br><br>

												(3) 회사는 무료로 제공되는 서비스의 일부 또는 전부를 이 약관 제8조의 약관 변경 절차를 거쳐 회사의 정책 및 운영의 필요상 수정, 중단, 변경할 수 있으며, 이에 대하여 관련법에 특별한 규정이 없는 한 회원에게 별도의 보상을 하지 않습니다.<br><br><br>

												<strong>제 19조 정보의 제공 및 광고의 게재</strong><br><br>

												(1) 회사는 회원이 서비스 이용 중 필요하다고 인정되는 다양한 정보를 공지사항이나 문자 및 전자우편 (e-mail) 등의 방법으로 회원에게 제공할 수 있습니다. 다만, 회원은 관련법에 따른 거래관련 정보 및 고객문의 등에 대한 답변 등을 제외하고는 언제든지 문자 및 전자우편 (e-mail) 에 대해서 수신 거절을 할 수 있습니다.<br><br>

												(2) 제(1)항의 정보를 회원에게 전송하려고 하는 경우에는 사전 동의를 받아서 전송합니다. 다만, 회원의 거래관련 정보 및 고객문의 등에 대한 회신에 있어서는 제외됩니다.<br><br>

												(3) 회원은 회사가 제공하는 서비스와 관련하여 게시물 또는 기타 정보를 변경, 수정, 제한하는 등의 조치를 취하지 않습니다.<br><br><br>

												<strong>제 20조 회사의 의무</strong><br><br>

												(1) 회사는 관련법과 이 약관이 금지하거나 미풍양속에 반하는 행위를 하지 않으며, 이 약관에서 정한 바에 따라 계속적이고 안정적으로 서비스를 제공하기 위하여 최선을 다하여 노력합니다.<br><br>

												(2) 회사는 회원이 안전하게 서비스를 이용할 수 있도록 개인정보(신용정보 포함)보호를 위해 보안시스템을 갖추어야 하며 개인정보처리방침을 공시하고 준수합니다.<br><br>

												(3) 회사는 서비스이용과 관련하여 발생하는 회원의 불만 또는 피해구제요청을 적절하게 처리할 수 있도록 필요한 인력 및 시스템을 구비합니다.<br><br>

												(4) 회사는 서비스이용과 관련하여 회원으로부터 제기된 의견이나 불만이 정당하다고 인정할 경우에는 이를 처리하여야 합니다. 회원이 제기한 의견이나 불만사항에 대해서는 게시판을 활용하거나 문자 및 전자우편 (e-mail) 등을 통하여 회원에게 처리과정 및 결과를 전달합니다.<br><br><br>

												<strong>제 21조 개인정보보호 의무 및 이용</strong><br><br>

												(1) 회사는 관련 법령에서 정하는 바에 따라 회원의 개인정보를 보호하기 위해 노력합니다. 개인정보의 보호 및 사용에 대해서는 개인정보보호법 및 기타 관련 법령 및 회사의 개인정보처리방침이 적용됩니다. 다만, 회사의 공식 사이트 이외, 회사가 운영하지 않는 사이트에서는 회사의 개인정보처리방침이 적용되지 않습니다.<br><br>

												(2) 회사는 회원의 개인신상 정보를 본인의 승낙 없이 타인에게 누설, 배포하지 않습니다. 다만, 관련법령에 의하여 관계기관 등의 요구가 있는 경우에는 그러하지 아니합니다.<br><br>

												(3) 회사는 회원에게 맞춤서비스, 커뮤니티서비스, 모바일서비스, 쇼핑몰서비스 등 다양한 서비스를 제공할 목적으로 여러 분야의 컨텐츠 사업자 혹은 비즈니스 사업자와 함께 파트너십을 맺어 회원의 개인정보를 이용할 수 있습니다. 이러한 경우에도 개인정보의 제3자 제공은 회원의 사전동의 하에서만 이루어집니다.<br><br><br>

												<strong>제 22조 회원의 의무</strong><br><br>

												(1) 회원은 회사 사이트의 정상적인 운영을 저해하는 다음 각 호의 행위를 하여서는 아니 되며, 관련법령, 이 약관의 규정, 이용안내 및 서비스와 관련하여 공지한 주의사항 등을 준수하여야 하고, 기타 회사의 정상적인 업무에 방해되는 행위를 하여서는 안 됩니다.<br><br>
												가. 신청 또는 변경 시 허위내용의 등록<br>
												나. ID, 비밀번호 등 타인의 정보 도용하거나 부정하게 사용<br>
												다. 다른 ID로 이중등록<br>
												라. 회사가 게시한 정보의 변경<br>
												마. 회사가 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시<br>
												바. 회사와 기타 제3자의 저작권 등 지식재산권 등 기타 권리에 대한 침해<br>
												사. 회사 및 기타 제3자의 명예를 손상시키거나 기타 서비스업무를 방해하는 행위<br>
												아. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공공질서 및 미풍양속에 반하는 정보를 서비스에 공개 또는 게시하는 행위<br>
												자. 회사의 동의 없이 영리를 목적으로 서비스를 사용하는 행위<br>
												차. 서비스 운영을 고의로 방해하거나 서비스의 안정적 운영을 방해하는 행위<br>
												카. 회사의 직원이나 운영자를 가장하거나 사칭하여 또는 타인의 명의를 도용하여 글을 게시하거나 메일 등을 발송하는 행위 <br>
												타. 기타 불법적이거나 부당한 행위 ,<br><br>

												(2) 전항 각 호의 행위 발생 시, 회사 또는 제3자에게 유, 무형의 피해발생이 예상되는 경우, 회사는 회원이 작성한 게시물의 공개를 임시적으로 중단할 수 있으며, 최종 확인과정을 거쳐 해당 게시물을 삭제할 수 있습니다.<br><br><br>

												<strong>제 23조 회원의 아이디 및 비밀번호 등 관리의무</strong><br><br>

												(1) 회원의 "아이디"와 "비밀번호"에 관한 관리책임은 회원에게 있으며, 이를 제3자가 이용하도록 하여서는 안 됩니다.<br><br>

												(2) 회사는 회원의 "아이디"가 개인정보 유출 우려가 있거나, 반사회적 또는 미풍양속에 어긋나거나 회사 및 회사의 운영자로 오인될 우려가 있는 경우, 해당 "아이디"의 이용을 제한할 수 있습니다.<br><br>

												(3) 회원은 "아이디" 및 "비밀번호"가 도용되거나 제3자가 사용하고 있음을 인지한 경우에는 이를 즉시 회사에 통지하고 회사의 안내에 따라야 합니다.<br><br>

												(4) 제3항의 경우에 해당 회원이 회사에 그 사실을 통지하지 않거나, 통지한 경우에도 회사의 안내에 따르지 않아 발생한 불이익에 대하여 회사는 책임지지 않습니다.<br><br>

												(5) 회원의 ID가 부정하게 사용된 경우 회원은 반드시 회사에 그 사실을 통보하여야 하며, 회원의 관리부실로 타인이 ID를 사용하게 되어 일어날 수 있는 제반 손해에 대한 책임은 회원 본인에게 귀속됩니다.<br><br>

												(6) 회원의 개인정보를 변경하여야 하는 경우에는 반드시 회원 본인이 직접 수정하여 등록하여야 합니다.<br><br>

												(7) 회원은 이 약관 및 관련법령에서 규정한 사항을 준수하여야 합니다.<br><br><br>

												<strong>제 24조 회원에 대한 통지</strong><br><br>

												(1) 회사가 회원에 대한 통지를 하는 경우 이 약관에 별도 규정이 없는 한 서비스 내 문자 및 전자우편 (e-mail) 등으로 할 수 있습니다.<br><br>

												(2) 회사는 회원 전체(일부라도 불특정 다수인 경우 포함)에 대한 통지의 경우 7일 이상 회사의 홈페이지에 게시함으로써 제1항의 통지에 갈음할 수 있습니다.<br><br><br>

												<strong>제 25조 회사의 계약해지 및 서비스 이용제한</strong><br><br>

												(1) 회사는 회원이 제9조 제(2)항의 각 호의 어느 하나에 해당되는 행위를 하거나, 관련법령 또는 이 약관을 위반할 경우, 이용계약을 해지하거나 또는 기간을 정하여 서비스 이용을 제한 또는 중지할 수 있습니다.<br><br>

												(2) 본 조에 따라 서비스 이용을 제한하거나 계약을 해지하는 경우에는 회사는 제24조 [회원에 대한 통지]에 따라 통지합니다. 단, 즉시 조치를 취하지 않을 경우, 회사 또는 제3자에게 유, 무형의 손해 발생이 예상되는 경우는 조치를 취한 후, 통지할 수 있습니다.<br><br>

												(3) 회원은 본 조에 따른 이용제한 등에 대해 회사가 정한 절차에 따라 이의신청을 할 수 있습니다. 이 때 이의가 정당하다고 회사가 인정하는 경우 회사는 즉시 서비스의 이용을 재개합니다.<br><br><br>

												<strong>제 26조 저작권 등 권리의 귀속</strong><br><br>

												(1) 회사가 작성한 서비스와 관련된 저작물에 대한 저작권 및 일체의 지식재산권은 회사에 귀속됩니다. 단, 회원의 "게시물"은 해당 게시물의 저작자에게 귀속됩니다.<br><br>

												(2) 회원은 서비스를 이용함으로써 얻은 정보를 회사의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 아니됩니다. <br><br>

												(3) 회사는 서비스와 관련하여 회원에게 회사가 정한 이용조건에 따라 계정, "아이디" 콘텐츠 등을 이용할 수 있는 이용권만을 부여하며, 회원은 이를 양도, 판매, 담보제공 등의 처분행위를 할 수 없습니다.<br><br><br>

												<strong>제 27조 게시물의 관리</strong><br><br>

												(1) 회원의 "게시물"이 관련법에 위반되는 내용을 포함하는 경우, 권리자는 관련법이 정한 절차에 따라 해당 "게시물"의 게시중단 및 삭제 등을 요청할 수 있으며, 회사는 관련법에 따라 조치를 취하여야 합니다.<br><br>

												(2) 회사는 전항에 따른 권리자의 요청이 없는 경우라도 회사 또는 제3자의 권리침해가 인정될 만한 사유가 있거나 기타 회사 정책 및 관련법에 위반되는 경우에는 관련법에 따라 해당 "게시물"에 대해 임시조치 등을 취할 수 있습니다.<br><br><br>

												<strong>제 28조 문자, 전자우편(e-mail), 우편(DM) 발송 및 유선 연락</strong><br><br>

												(1) 회사는 회원의 포인트 및 쿠폰에 대한 정보와 회사의 서비스 등을 제공하기 위해 필요한 경우 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」 등 관련 법령에 따라 문자, 전자우편(e-mail), 우편(DM), 유선 전화(TM)를 통해 서비스 정보를 제공할 수 있습니다. <br>
												(2) 단, event, 신상품소개 등 영리목적의 광고성 정보를 제공하기 위하여서는 회원의 동의를 요하며, 회원이 동의를 철회하는 경우에는 이를 즉시 중단합니다. <br>
												(3) 회사는 제1항 및 제2항의 문자, 전자우편(e-mail), 우편(DM) 발송 및 유선 연락 시 거부의사를 표시할 수 있는 방법을 안내해드립니다.<br><br><br>

												<strong>제 29조 약관 위배시의 책임/손해 배상 및 분쟁 조정</strong><br><br>

												(1) 회사와 회원은 이 약관을 위반함으로써 발생하는 모든 책임을 각자가 부담하고, 이로 인하여 상대방에게 손해를 입힌 경우에는 배상하여야 합니다.<br><br>

												(2) 회사는 회사가 개인정보처리자로서 의무를 다한 경우, 회원이 서비스를 이용하는데 있어서 회사에게 고의 또는 중과실이 있지 않는 한 회원에게 발생한 손해를 배상하지 않습니다.<br><br>

												(3) 이 약관에서 정하지 않은 사항과 이 약관의 해석 및 분쟁 조정에 관해서는 관련법령 또는 상 관례에 따릅니다.<br><br><br>

												<strong>제 30조 책임제한</strong><br><br>

												(1) 회사는 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면제됩니다.<br><br>

												(2) 회사는 이 약관 위반 등 회원의 귀책사유로 인한 서비스 이용의 장애에 대하여는 책임을 지지 않습니다.<br><br>

												(3) 회사는 회원이 서비스와 관련하여 게재한 정보, 자료, 사실의 신뢰도, 정확성 등의 내용에 관하여는 책임을 지지 않습니다.<br><br>

												(4) 회사는 회사와 관련 없이 회원 간 또는 회원과 제3자 상호간에 회사가 제공한 서비스와 관련된 거래를 한 경우, 회원 또는 제3자에게 손해가 발생시 회사의 귀책사유가 있는 경우를 제외하고는 회원 또는 제3자에 대하여 책임을 지지 않습니다.<br><br> 

												(5) 회사는 무료로 제공되는 서비스 이용과 관련하여 회원에게 손해가 발생하는 경우, 회사의 귀책사유 또는 관련법령에 규정이 없는 한 책임을 지지 않습니다.<br><br><br>

												<strong>제 31조 준거법 및 재판관할</strong><br><br>

												(1) 회사와 회원 간 제기된 소송은 대한민국법을 준거법으로 합니다.<br><br>

												(2) 회사와 회원간 발생한 분쟁에 관한 소송은 제소 당시의 회원의 주소에 의하고, 주소가 없는 경우 거소를 관할하는 지방법원의 전속관할로 합니다. 단, 제소 당시 회원의 주소 또는 거소가 명확하지 아니한 경우의 관할법원은 민사소송법에 따라 정합니다.<br><br><br>



												<strong>부칙</strong><br><br>

													(1) 이 약관은 2022년 9월 1일부터 시행합니다.<br><br>
													(2) 2021년 1월 11일부터 시행되던 통합회원이용약관은 이 약관으로 대체합니다.<br><br>

											</p>
											
										</div>
									</div>
									</div>

									

								</div>

								<div class="">
									
									<div>
										<p>
											<input type="checkbox" class="chk__style _basic_type" name="agree2" id="agree2" onclick="agrees2022();">
											<label for="agree2">개인정보의 수집 및 이용에 관한 동의<span class="red">(필수)</span></label>
										</p>
										<button type="button" class="more__btn">전문보기</button>
									<div class="cs-agree-con">
										<div class="head">
											<h2>개인 정보의 수집 및 이용에 관한 동의(필수)</h2>
											<button type="button" class="btn_close"><img src="/pc/resource/images/common/ico_x_bk_18x18.png" alt=""></button>
										</div>
										<div class="box _scroll">
											<p>
												개인정보 수집 및 활용에 관한 동의<br><br>
												회사는 회원가입, 원활한 고객상담 및 서비스의 제공을 위해 아래와 같은 개인정보를 수집하고 있습니다.<br><br>
												</p><table class="cs-tbl">
													<caption class="acc-hidden">개인정보 테이블</caption>
													<colgroup>
														<col style="width: 7%;">
														<col style="width: 34%;">
														<col style="width: 29%;">
														<col style="width: 30%;">
													</colgroup>
													<thead>
														<tr>								
															<th>구분</th>
															<th>개인정보 수집항목</th>
															<th>수집목적</th>
															<th>보유 및 이용기간</th>
														</tr>	
													</thead>
													<tbody>
														<tr>
															<td>필수항목</td>
															<td>아이디, 비밀번호, 성명, 휴대폰 번호, 내외국인, 본인인증정보(CI,DI)</td>
															<td>회원 가입 및 관리</td>
															<td>
																<strong class="agree-txt101">회원 탈퇴 시 까지 <br>
																단, 관계 법령에 
																정함이 있는 경우 
																해당 법률에서 
																정한 기간동안 
																이용 · 보유 가능</strong>
															</td>
														</tr>										
													</tbody>
												</table><br>
												회사는 회원가입을 위하여 필요한 최소한의 개인정보를 수집합니다.  개인정보 수집에 동의하지 않을 수 있으나 이 경우 회원가입이 제한될 수 있습니다.
												


												<br><br>
											<p></p>
										</div>
									</div>
									</div>

									
									
								</div>

								<div class="">								
									<div>
										<p>
											<input type="checkbox" class="chk__style _basic_type" name="agree3" id="agree3" onclick="agrees2022();">
											<label for="agree3">개인정보의 수집 및 이용에 관한 동의<span>(선택)</span></label>
										</p>
										<button type="button" class="more__btn">전문보기</button>
							<div class="cs-agree-con">
								<div class="head">
									<h2>개인 정보의 수집 및 이용에 관한 동의(선택)</h2>
									<button type="button" class="btn_close"><img src="/pc/resource/images/common/ico_x_bk_18x18.png" alt=""></button>
								</div>
								<div class="box _scroll">
									<p>
										개인정보 수집 및 활용에 관한 동의<br><br>
										회사는 회원가입, 원활한 고객상담 및 서비스의 제공을 위해 아래와 같은 개인정보를 수집하고 있습니다.<br><br>
										</p><table class="cs-tbl">
									<caption class="acc-hidden">개인정보 테이블</caption>
									<colgroup>
										<col style="width: 12%;">
										<col style="width: 34%;">
										<col style="width: 29%;">
										<col style="width: 30%;">
									</colgroup>
									<thead>
										<tr>								
											<th>구분</th>
											<th>개인정보 수집항목</th>
											<th>수집목적</th>
											<th>보유 및 이용기간</th>
										</tr>	
									</thead>
									<tbody>
										<tr>
											<td>선택항목</td>
											<td>
												생년월일, 성별, 이메일, 자녀명, 자녀 생년월일, 자녀성별 
											</td>
											<td>회원 가입 및 관리</td>
											<td>
												<strong class="agree-txt101">회원 탈퇴 시 까지 <br>
												단, 관계 법령에 
												정함이 있는 경우 
												해당 법률에서 
												정한 기간동안 
												이용 · 보유 가능</strong>
											</td>
										</tr>									
									</tbody>
								</table><br>
										
								회사는 고객 서비스 제공을 위하여 필수항목 이외 선택항목 정보를 수집하고 있습니다. 개인정보 수집에 동의하지 않을 수 있으며 , 미동의하는 경우 회원가입은 가능하나 
								선택항목과 관련된 서비스 이용에 제한을 받을 수 있습니다
							
										


										<br><br>
									<p></p>
								</div>
							</div>
									</div>



								<div>
									
									<div>
										<p>
											<input type="checkbox" class="chk__style _basic_type" name="agree4" id="agree4" onclick="agrees2022();">
											<label for="agree4">개인정보 국외 이전에 관한 동의<span class="red">(필수)</span></label>
										</p>
										<button type="button" class="more__btn">전문보기</button>
									<div class="cs-agree-con">
										<div class="head">
											<h2>개인정보 국외 이전에 관한 동의 (필수)</h2>
											<button type="button" class="btn_close"><img src="/pc/resource/images/common/ico_x_bk_18x18.png" alt=""></button>
										</div>
										<div class="box _scroll">
											<p>
	<!-- 
												회사는 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 개인정보 보호법 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.	<br><br>

												(1) 회원 가입 및 관리<br>														
												회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별ㆍ인증, 회원자격 유지<br>
												제한적 본인 확인제 시행에 따른 본인 확인, 서비스 부정 이용 방지,분쟁 조정을 위한 기록보존, 각종 고지ㆍ통지, 고충처리 등을 목적으로 개인정보를 처리합니다.<br><br>
																																	
												 (2) 재화 또는 서비스 제공	<br>													
												물품배송(상품, 경품), 서비스 제공, 계약서ㆍ청구서 발송, 마일리지 적립 및 사용, 쿠폰 발행 및 사용, 컨텐츠 제공, 맞춤서비스 제공, 본인인증, 연령인증, 주문처리, 구매 및 대금결제·정산, 수선 및 A/S처리, 채권추심 등을 목적으로 개인정보를 처리합니다.	<br><br>			

												 (3) 고충처리<br>												
												민원인의 신원 확인, 민원사항 확인, 사실조사를 위한 연락ㆍ통지, 처리결과 통보 등의 목적으로 개인정보를 처리합니다.<br><br>
																							
												(4) 마케팅 및 광고 활용<br>														
												마케팅 및 광고성 정보전달, 경품배송 및 행사안내, 고객 맞춤형 서비스 제공, 인구통계학적 특성에 따른 서비스 제공 및 광고 게재, 접속 빈도 파악, 서비스품질 향상을 위한 각종 설문조사, 서비스 이용 통계 관리 등의 목적으로 개인정보를 처리합니다. <br>
												마케팅 정보 제공 및 활용은 별도로 동의된 고객에 한하여 제공됩니다. <br><br>

												<strong>2. 수집하는 개인 정보 및 수집 방법</strong><br><br>
												
												(1)수집항목 <br>
												회사는 는 회원가입, 원활한 고객상담 및 서비스의 제공을 위해 아래와 같은 개인정보를 수집하고 있습니다. <br><br> -->

												개인정보 국외 이전에 관한 동의<br><br>
												회사는 주문관리, 고객서비스, 상품 및 서비스를 위한 분석 및 리서치, 마케팅 업무를 위하여 이용자의 정보를 아래와 같이 국외로 전송하거나, 국외에서 관리합니다. 회사의 개인정보 국외 이전 내역은 아래와 같습니다.<br><br>
												
													</p><table class="agree__table">
														<colgroup>
															<col style="width: 30%;">
															<col style="width: ;">
														</colgroup>
														<thead>
															<tr>
																<th>구분</th>
																<th>내역</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>이전 받는 자</td>
																<td>
																	Salesforce.com,lnc
																</td>
															</tr>
															<tr>
																<td>이전 국가</td>
																<td>
																	미국					
																</td>
															</tr>
															<tr>
																<td>정보관리책임자 연락처</td>
																<td>
																	Heim Patrick, Chief Trust Officer (privacy@salesforce.com)					
																</td>
															</tr>
															<tr>
																<td>이전 일시 및 방법</td>
																<td>
																	고객 주문 및 회원가입 시 네트워크를 통한 전송					
																</td>
															</tr>
															<tr>
																<td>이전되는 항목</td>
																<td>
																	회사가 수집, 보관하는 개인정보를 포함하는 고객 정보 및 고객 주문내역 일체					
																</td>
															</tr>
															<tr>
																<td>보유 및 이용기간</td>
																<td>
																	최종 구매일로부터 1년까지
																</td>
															</tr>
														</tbody>
													</table>
												
											<p></p>
										</div>
									</div>
									</div>

									
									
								</div>

									<!-- 2022-03-16 수정 -->
									<div class="detail">
										개인정보 수집 및  활용 에 관한 동의 <br><br>
										<table class="">
											<caption class="acc-hidden">개인정보 테이블</caption>
											<colgroup>
												<col style="width: 7%;">
												<col style="width: 34%;">
												<col style="width: 29%;">
												<col style="width: 30%;">
											</colgroup>
											<thead>
												<tr>								
													<th>구분</th>
													<th>개인정보 수집항목</th>
													<th>수집목적</th>
													<th>보유 및 이용기간</th>
												</tr>	
											</thead>
											<tbody>
												<tr>
													<td>선택항목</td>
													<td>
														생년월일, 성별, 이메일, 자녀명, 자녀 생년월일, 자녀성별  
													</td>
													<td>회원 가입 및 관리</td>
													<td>
														<strong>회원 탈퇴 시 까지 <br>
														단, 관계 법령에 
														정함이 있는 경우 
														해당 법률에서 
														정한 기간동안 
														이용 · 보유 가능</strong>
													</td>
												</tr>									
											</tbody>
										</table>
										<br>
										회사는 고객 서비스 제공을 위하여 필수항목 이외 선택항목 정보를 수집하고 있습니다. 개인정보 수집에 동의하지 않을 수 있으며 , 미동의하는 경우 회원가입은 가능하나 
										선택항목과 관련된 서비스 이용에 제한을 받을 수 있습니다


									</div>
									<!-- //2022-03-16 수정 -->
									<p class="desc mt12" style="left: 0; letter-spacing: -1.5px">정보 제공 동의하신 고객에 한하여 다양한 혜택 제공이 가능합니다. </p>
								</div>
								
							</div>



							<div class="terms__con mt20 agree_mkt">								
								<div class="terms__con--all _down ">
									<p class="wt__style1">
									<input type="checkbox" class="chk__style _basic_type" name="allcheck" id="allcheck" value="Y" onclick="receptionAll2();" checked="">
										<label for="allcheck" id="smsAgree">마케팅 정보 수신 동의 <!--span>(선택)</span--></label>
									</p>


									<!-- 2022-03-16 수정 -->
									<!-- <div class="detail">
										마케팅 활용 및 광고성 정보 수신동의 <br/><br/>
										<table class="">
											<caption class="acc-hidden">개인정보 테이블</caption>
											<colgroup>
												<col style="width: 7%;">
												<col style="width: 34%;">
												<col style="width: 29%;">
												<col style="width: 30%;">
											</colgroup>
											<thead>
												<tr>								
													<th>구분</th>
													<th>처리하는 개인정보 항목</th>
													<th>수집목적</th>
													<th>보유 및 이용기간</th>
												</tr>	
											</thead>
											<tbody>
												<tr>
													<td>선택항목</td>
													<td>휴대폰 번호, 생년월일, 성별, 이메일, 자녀명, 자녀 생년월일, 자녀성별</td>
													<td>회원 가입 및 관리</td>
													<td>
														<strong>회원 탈퇴 시 까지 <br />
														단, 관계 법령에 
														정함이 있는 경우 
														해당 법률에서 
														정한 기간동안 
														이용 · 보유 가능</strong>
													</td>
												</tr>									
											</tbody>
										</table>
										<br/>
										회사는 고객 서비스 제공을 위하여 필수항목 이외 선택항목 정보를 수집하고 있습니다. 개인정보 수집에 동의하지 않을 수 있으며 , 미동의하는 경우 회원가입은 가능하나 선택항목과 관련된 서비스 이용에 제한을 받을 수 있습니다
									
									
									</div> -->
									<!-- //2022-03-16 수정 -->


								</div>
								<div class="marketing show">									
									<div>
										<p>
											<input type="checkbox" class="chk__style _basic_type" name="MemberIsSMS" id="MemberIsSMS" value="N" onclick="agrees2022();" checked>
											<label for="MemberIsSMS">SMS 수신 동의 (선택)</label>
										</p>
									</div>				
									<!--
									<div>
										<p>
											<input type="checkbox" class="chk__style _basic_type" name="MemberIsDm" id="MemberIsDm" value="N" onclick="reception();" />
											<label for="MemberIsDm">DM 수신 동의 (선택)</label>
										</p>
									</div>	
									-->
									<div>
										<p>
											<input type="checkbox" class="chk__style _basic_type" name="MemberIsMaillinglist" id="MemberIsMaillinglist" value="N" onclick="agrees2022();" checked>
											<label for="MemberIsMaillinglist">E-MAILl 수신 동의 (선택)</label>
										</p>
									</div>								
									<!-- <div>
										<p>
											<input type="checkbox" class="chk__style _basic_type" name="MemberIsTM" id="MemberIsTM" value="N" onclick="reception();"/>
											<label for="MemberIsTM">TM 수신 동의 (선택)</label>
										</p>
									</div> -->
								<div class="pl0">				
									<p class="desc" style="left: 0; letter-spacing: -1.3px;">E-Mail, SMS(알림톡)을 통한 상품 및 이벤트 정보 수신에 동의합니다.</p>
									<p class="desc" style="left: 0; letter-spacing: -1.3px; margin-bottom: 10px;">회원가입 및 거래정보(주문, 반품, 교환)등의 메일은 
									마케팅 정보 수신과 무관하며, 개인정보보호법 제15조제1항에 의거 
									'정보주체와의 계약의 체결 및 이행을 위하여 불가피하게 
									필요한 경우'에 해당하므로 수신동의를 하지 않더라도 
									모든 회원에게 발송됩니다.</p>									
								</div>
								</div>	
							
							</div>
							<div class="terms__con mt15" style="border:none;">								
								<div class="terms__con--all last-terms" style="border: 1px solid rgb(213,220,228);">
									<p>
										개인정보 필수 위탁에 대한 안내
									</p>
									<button type="button" class="more__btn more__btn_after" style="left: 0;">
										<img src="/pc/resource/images/common/arr_right_bl_7x11.png" alt="">
									</button>
									
							<div class="cs-agree-con">
								<div class="head">
									<h2>개인정보 필수 위탁에 대한 안내</h2>
									<button type="button" class="btn_close"><img src="/pc/resource/images/common/ico_x_bk_18x18.png" alt=""></button>
								</div>
								<div class="box _scroll">
									<p>
										개인정보 필수 위탁에 대한 안내<br><br>
										① 회사는 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다<br><br>
									</p><table class="cs-tbl">
										<caption class="acc-hidden">개인정보 테이블</caption>
										<colgroup>
											<col style="width: 30%;">
											<col>
										</colgroup>
										<thead>
											<tr>								
												<th>위탁받는 자(수탁자)</th>
												<th>위탁 업무내용</th>
											</tr>	
										</thead>
										<tbody>
											<tr>
												<td>NICE평가정보</td>
												<td>
													실명확인 및 본인인증 서비스 중복가입확인정보<br>
													(멤버십 가입시, 휴대폰번호는 나이스평가정보에서<br>
													인증 받은 휴대폰 번호를 사용함)					
												</td>
												<!-- <td>성명, 생년월일, 성별, 내외국인정보, DI</td> -->
											</tr>
											<tr>
												<td>㈜스타일쉽</td>
												<td>
													온라인몰 전산 서비스구축  및 유지보수 <br>
													( 주문, 결제, 환불, 배송 등 기타 온라인 몰 운영에 관한 전산서비스를 포함)
												</td>
												<!-- <td>성명, 전화번호, 배송주소, <br>e-mail주소, 은행정보</td> -->
											</tr>
											<tr>
												<td>드림라인㈜, ㈜엠트웰브</td>
												<td>
													각종이벤트 및 프로모션 안내(SMS 발송)							
												</td>
												<!-- <td>전화번호</td> -->
											</tr>
											<tr>
												<td>㈜LG CNS<br>씨제이올리브네트웍스(주)</td>
												<td>
													카카오 알림톡/친구톡/SMS 발송서비스				
												</td>
												<!-- <td>전화번호</td> -->
											</tr>
											<tr>
												<td>Salesforce</td>
												<td>
													카카오 알림톡/친구톡/SMS 발송/E-mail발송			
												</td>
												<!-- <td>성명, 성별, 생년월일, 핸드폰번호, CI</td> -->
											</tr>
											<tr>
												<td>금강자수, 동일산업, 홍인어패럴, <br>정다운 수선, 대영비에스</td>
												<td>
													제품수선 AS업무			
												</td>
												<!-- <td>성명,전화번호,배송주소</td> -->
											</tr>
											<tr>
												<td>(주) 트랜스코스모스코리아</td>
												<td>
													고객 상담 업무
												</td>
												<!-- <td>생년월일, 성별, 은행정보, 성명, 전화번호, <br>배송주소, e-mail주소</td> -->
											</tr>
											<tr>
												<td>이니시스㈜ <br>엔에이치엔페이코㈜</td>
												<td>
													결제처리(무통장 입금, 계좌이체, 신용카드, 환불계좌 인증) 및<br>
													결제도용 방지
												</td>
												<!-- <td>성명, 카드정보, 은행정보</td> -->
											</tr>
											<tr>
												<td>(주) 네이버</td>
												<td>
													결제시스템 (네이버페이)
												</td>
												<!-- <td>성명, 카드정보, 은행정보</td> -->
											</tr>
											<tr>
												<td>(주)LG CNS</td>
												<td>
													결제시스템 (스마일페이)
												</td>
												<!-- <td>성명, 카드정보, 은행정보</td> -->
											</tr>
											<tr>
												<td>CJ대한통운(주), <br>선진로지스틱스㈜, <br>㈜원제로소프트</td>
												<td>
													 배송정보 수집 <br>
													온라인 쇼핑몰 택배 배송, <br>
													기타 상품 배송 업무
												</td>
												<!-- <td>성명, 전화번호, 배송주소, 이메일</td> -->
											</tr>
											<tr>
												<td>(주) 크리마</td>
												<td>
													게시판 시스템 및 포인트 시스템 구축/유지/보수,<br>상품 사이즈정보관리 및 사이즈 추천
												</td>
												<!-- <td>성명, 전화번호</td> -->
											</tr>
											<tr>
												<td>㈜메타넷</td>
												<td>
													ERP Infra 운영관리
												</td>
												<!-- <td></td> -->
											</tr>
											<tr>
												<td>㈜에스지유</td>
												<td>
													ERP 운영 업무
												</td>
												<!-- <td></td> -->
											</tr>
											<tr>
												<td>
													<a href="https://www.fila.co.kr/customer/store.asp" style="text-decoration: underline;color: rgb(102,102,102); width: 100%;">회사의 오프라인 매장 <br>
													(대리점주, 위탁점주) </a>
												</td>
												<td>
													판매 위탁 및 그에 부수한 업무
												</td>
												<!-- <td>성명, 전화 번호 </td> -->
											</tr>
										</tbody>
									</table>
									<br><br><p>
									②회사는 위탁계약 체결시 개인정보 보호법 제26조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적․관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리∙감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다. 	<br><br>

								 ③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.	<br><br>
									</p>
								</div>
							</div>
								</div>
								<div class="pl0">				
									<p class="desc red">필수항목에 동의하지 않으실 경우 회원가입이 불가합니다.</p>
									<p class="desc red">선택항목은 동의하지 않으셔도 서비스 이용이 가능합니다. </p>									
								</div>		
							</div>

							<!--통합회원가입 관련문구-->
							<div class=" join_membership chk">
								<img src="/mo/resource/images/sub/join_membership_logo_m.png" alt="">
								<div class="txt-box">
									
									<label for="totalMembership_01" class="join_label "><span style="color:rgb(0,84,166);">[통합멤버십 동의]</span> <span style="color:rgb(255,0,0);">(필수)</span></label>

									<p class="">
										케즈 온라인 스토어에서는 한번을 가입으로<br>
										FILA KOREA에서 운영하는 전 브랜드의 고객 혜택 사용이<br>
										가능한 통합 멤버십 서비스로 운영 중입니다.
									</p>
								</div>

								<div class="gender" id="bday3">		
									<span>
										<input type="radio" id="totalMembership01" name="totalMembership" value="0" checked="" class="rd__style2">
										<label for="totalMembership01" style="margin-right: 20px;">동의</label>
									</span>
									<span>
										<input type="radio" id="totalMembership02" name="totalMembership" value="1" class="rd__style2">
										<label for="totalMembership02">동의하지 않음</label>
									</span>
								</div>
	
								
								<!-- <div class="rd-box">
									<input type="radio" class=" chk__style  _basic_type" id="totalMembership01" name="totalMembership" value="">
									<label for="totalMembership01" class="join_label ">동의</label>
								
									<input type="radio" class=" chk__style  _basic_type" id="totalMembership02" name="totalMembership" value="">
									<label for="totalMembership02" class="join_label ">동의하지 않음</label>
								</div> -->
							</div>

							<!--//통합회원가입 관련문구-->
						</div>

						<div class="join__btn" id="loginButton">
							<a href="javascript:sendform_simple2022();void(0);" class=" btn__style1">동의하고 가입하기</a>
						</div>
						<div class="btn-box" id="loginButton2" style="display:none;">
							<img src='/images/waiting.gif'>
						</div>

					</form>
				</div>
			</section>
		</div>
		<!-- // end of :: contents -->
<script>
var LoginPop;
function loginPop(url){
	jQuery.ajax({
		type: "POST",
		url: "/member/verify_staff.asp",
		dataType : "JSON",
		success: function(data) {
			var formStr = "";
				formStr +='	<div class="main_popup member-login__popup">';
				formStr +='			<div class="member__info">';				
				formStr +='				안녕하세요? '+ data.data1 +'님<br/> ';
				formStr +='				'+ data.data2 +'<br/>';
				formStr +='				'+ data.data3 +'';
				formStr +='				<p>로그인 방식을 선택해 주세요</p>';
				formStr +='			</div>';
				formStr +='		<div class="close_area close_style2">';
				formStr +='			<a href=javascript:staffGo("'+ url +'"); class="btn_close fl">사원 로그인</a>';
				formStr +='			<a href="'+ url +'" class="btn_close">일반 로그인</a>';
				formStr +='		</div>'; 
				formStr +='	</div>';

				LoginPop = new CoverLayer(formStr, {
					bg_color : "white", 		// 백그라운드 색상 기본값:"#000"
					bg_opacity : 0.75, 		// 백그라운드 투명도. 기본값:0.75
					close_btn_id : "closeBtn1", 	// 레이어 닫기 버튼 DOM id, 기본값:"closeBtn"
					z_index : 999999, 			// 레이어의 z-index 값 기본값:99990
					cast_speed : 500,		// 레이어 생성 트위닝 속도
					close_click : false,		// 어느곳이나 클릭시 닫힘 여부, 활성화:true, 비활성화:false(기본값)
					scroll_fix : false
				});
		},
		error: function(e) {
			//alert("e");
		}
	});
}		
//'''2021-07-07 기증쿠폰관련
var loginSunsooPop
function loginSunsooPop(url){
	jQuery.ajax({
		type: "POST",
		url: "/member/verify_sunsoo.asp",
		dataType : "JSON",
		success: function(data) {
			var formStr = "";
				formStr +='	<div class="main_popup member-login__popup">';
				formStr +='			<div class="member__info">';				
				formStr +='				안녕하세요? '+ data.data1 +'님<br/> ';
				formStr +='				'+ data.data3 +'';
				formStr +='				<p>로그인 방식을 선택해 주세요</p>';
				formStr +='			</div>';
				formStr +='		<div class="close_area close_style2">';
				formStr +='			<a href=javascript:sunsooGo("'+ url +'"); class="btn_close fl">선수 로그인</a>';
				formStr +='			<a href="'+ url +'" class="btn_close">일반 로그인</a>';
				formStr +='		</div>'; 
				formStr +='	</div>';

				LoginPop = new CoverLayer(formStr, {
					bg_color : "white", 		// 백그라운드 색상 기본값:"#000"
					bg_opacity : 0.75, 		// 백그라운드 투명도. 기본값:0.75
					close_btn_id : "closeBtn1", 	// 레이어 닫기 버튼 DOM id, 기본값:"closeBtn"
					z_index : 999999, 			// 레이어의 z-index 값 기본값:99990
					cast_speed : 500,		// 레이어 생성 트위닝 속도
					close_click : false,		// 어느곳이나 클릭시 닫힘 여부, 활성화:true, 비활성화:false(기본값)
					scroll_fix : false
				});
		},
		error: function(e) {
			//alert("e");
		}
	});
}
function staffGo(url){
	jQuery.ajax({
		type: "POST",
		data: "mode=STAFF",
		url: "/member/verify_staff.asp",
		dataType : "JSON",
		success: function(data) {
			top.location.href = url;
		},
		error: function(e) {
			//alert("e");
		}
	});
}		
//'''2021-07-07 기증쿠폰관련
function sunsooGo(url){
	jQuery.ajax({
		type: "POST",
		data: "mode=SUNSOO",
		url: "/member/verify_sunsoo.asp",
		dataType : "JSON",
		success: function(data) {
			top.location.href = url;
		},
		error: function(e) {
			//alert("e");
		}
	});
}
</script>		
		<!-- #include virtual = "/mo/layout/doc_footer.asp" -->
	</div>
    <!-- // end of :: wrap -->    
</body>
</html>
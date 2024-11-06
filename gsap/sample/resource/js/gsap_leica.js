window.onload = function(){

/* smooth scrollbar */
function smoothScrollBar(){
	gsap.registerPlugin(ScrollTrigger); // 스크롤 플러그인 안정화?

	const Scrollbar = window.Scrollbar;
	const scroller = document.querySelector('#wrap');
 
	const scBar = Scrollbar.init(scroller, {
		damping: 0.1
	});

	ScrollTrigger.scrollerProxy('#wrap', {
		scrollTop(value){
			if(arguments.length){
				scBar.scrollTop = value;
			}
			return scBar.scrollTop;			
		}		
	});

	scBar.addListener(ScrollTrigger.update);

	ScrollTrigger.defaults({
		scroller: scroller
	});
};
/* //smooth scrollbar */

/* GSAP */

/* section 01 */
function sectionGsap01() {
	let tl = gsap.timeline({
		scrollTrigger: {
			trigger: '.sct01',
			start: '0% 0%', // start(시작) scroller-strat(시작 지점 선택)
			end: '+=' + (document.querySelectorAll('.sct01 .bg-box div').length * window.outerHeight), // end(종료) scroller-end(종료 지점 선택)
			pin: true, // 화면 고정
			scrub: 0.5, // true, false, 숫자
			markers: true // 가이드 라인
		}
	});

	tl.fromTo('.sct01 ._bg02', {
		opacity: 0	
	},
	{
		opacity: 1,
		duration: 3
	})
}
/* //section 01 */

/* section 02 */
function sectionGsap02() {
	let tl = gsap.timeline({
		scrollTrigger: {
			trigger: '.sct02',
			start: '0% 0%', // start(시작) scroller-strat(시작 지점 선택)
			end: '+=' + (window.outerHeight * 1), // end(종료) scroller-end(종료 지점 선택)
			pin: true, // 화면 고정
			scrub: 0.5, // true, false, 숫자
			markers: true // 가이드 라인
		}
	});

	tl.fromTo('.sct02 .txt1', {
		opacity: 0	
	},
	{
		opacity: 1,
		duration: 1
	})
	.fromTo('.sct02 .txt2', {
		opacity: 0	
	},
	{
		opacity: 1,
		duration: 1
	})
}
/* //section 02 */

/* section 03 */
function sectionGsap03() {
	let tl = gsap.timeline({
		scrollTrigger: {
			trigger: '.sct03',
			start: '0% 0%', // start(시작) scroller-strat(시작 지점 선택)
			end: '+=' + (window.outerHeight * 1), // end(종료) scroller-end(종료 지점 선택)
			pin: true, // 화면 고정
			scrub: 0.5, // true, false, 숫자
			markers: true // 가이드 라인
		}
	});

	tl.fromTo('.sct03 .txt1', {
		opacity: 0	
	},
	{
		opacity: 1,
		duration: 1
	})
	.fromTo('.sct03 .txt2', {
		opacity: 0	
	},
	{
		opacity: 1,
		duration: 1
	})
}
/* //section 03 */

/* section 04 */
function sectionGsap04() {
	let tl = gsap.timeline({
		scrollTrigger: {
			trigger: '.sct04',
			start: '0% 0%', // start(시작) scroller-strat(시작 지점 선택)
			end: '+=' + (window.outerHeight * 1), // end(종료) scroller-end(종료 지점 선택)
			pin: true, // 화면 고정
			scrub: 0.5, // true, false, 숫자
			markers: true // 가이드 라인
		}
	});

	tl.fromTo('.sct04 .txt1', {
		opacity: 0	
	},
	{
		opacity: 1,
		duration: 1
	})
	.fromTo('.sct04 .txt3', {
		opacity: 0	
	},
	{
		opacity: 1,
		duration: 1
	})
}
/* //section 04 */

/* section 05 */
function sectionGsap05() {
	let tl = gsap.timeline({
		scrollTrigger: {
			trigger: '.sct05',
			start: '0% 0%', // start(시작) scroller-strat(시작 지점 선택)
			end: '+=' + (window.outerHeight * 1), // end(종료) scroller-end(종료 지점 선택)
			pin: true, // 화면 고정
			scrub: 0.5, // true, false, 숫자
			markers: true // 가이드 라인
		}
	});

	tl.fromTo('.sct05 .txt1', {
		opacity: 0	
	},
	{
		opacity: 1,
		duration: 1
	})
	.fromTo('.sct05 .txt2', {
		opacity: 0	
	},
	{
		opacity: 1,
		duration: 1
	})
}
/* //section 05 */

/* section 06 */
function sectionGsap06() {
	let tl = gsap.timeline({
		scrollTrigger: {
			trigger: '.sct06',
			start: '0% 0%', // start(시작) scroller-strat(시작 지점 선택)
			end: '+=' + (document.querySelectorAll('.sct06 .bg-box div').length * window.outerHeight), // end(종료) scroller-end(종료 지점 선택)
			pin: true, // 화면 고정
			scrub: 0.5, // true, false, 숫자
			markers: true // 가이드 라인
		}
	});

	tl
	.addLabel('groupA')
	.fromTo('.sct06 ._bg02', {
		opacity: 0	
	},
	{
		opacity: 1,
		duration: 3
	}, 'groupA')
	.fromTo('.sct06 .txt1', {
		opacity: 0	
	},
	{
		opacity: 1,
		duration: 3
	}, 'groupA')
	
	.addLabel('groupB')
	.fromTo('.sct06 ._bg03', {
		opacity: 0	
	},
	{
		opacity: 1,
		duration: 3
	}, 'groupB')
	.fromTo('.sct06 .txt2', {
		opacity: 0	
	},
	{
		opacity: 1,
		duration: 3
	}, 'groupB')
	
	.addLabel('groupC')
	.fromTo('.sct06 ._bg04', {
		opacity: 0	
	},
	{
		opacity: 1,
		duration: 3
	}, 'groupC')
	.fromTo('.sct06 .txt3', {
		opacity: 0	
	},
	{
		opacity: 1,
		duration: 3
	}, 'groupC')
}
/* //section 06 */

/* section 07 */
function sectionGsap07() {
	let tl = gsap.timeline({
		scrollTrigger: {
			trigger: '.sct07',
			start: '0% 0%', // start(시작) scroller-strat(시작 지점 선택)
			end: '+=' + (document.querySelectorAll('.sct07 ul li').length * window.outerHeight), // end(종료) scroller-end(종료 지점 선택)
			pin: true, // 화면 고정
			scrub: 0.5, // true, false, 숫자
			markers: true // 가이드 라인
		}
	});

	tl.fromTo('.sct07 ul', {
		x: 0
	},
	{
		x: -((document.querySelectorAll('.sct07 ul li').length - 1) * window.outerWidth),
		duration: 1
	})
}
/* //section 07 */

/* //GSAP */

/* 실행 */
function init(){
	smoothScrollBar();	

	sectionGsap01();
	sectionGsap02();
	sectionGsap03();
	sectionGsap04();
	sectionGsap05();
	sectionGsap06();
	sectionGsap07();
}

init();
/* //실행 */

};
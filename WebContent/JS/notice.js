/**
 * 공지사항 롤링바 구현 javascript
 */
function fn_notice(containerID){
	/* .find()
	 * ---------------------------------------------------
	 * Get the descendants of each element 
	 * in the current set of matched elements, 
	 * filtered by a selector, jQuery object, or element.
	 */
	var $element = $('#'+containerID).find('.notice-list');
	var speed = 5000;
	var timer = null;
	/* .outerHeight()
	 * ----------------------------------------------------
	 * Get the current computed outer height 
	 * (including padding, border, and optionally margin) 
	 * for the first element in the set of matched elements 
	 * or set the outer height of every matched element.
	 */
	var move = $element.children().outerHeight();
	var first = false;
	var lastChild;

	lastChild = $element.children().eq(-1).clone(true);
	/* 삽입할 요소.prependTo(삽입될 컨테이너)
	 * ----------------------------------------------------
	 * Insert every element in the set of matched elements 
	 * to the beginning of the target.
	 * ====================================================
	 * 삽입할 요소.appendTo(삽입될 컨테이너)
	 * ----------------------------------------------------
	 * Insert every element in the set of matched elements 
	 * to the end of the target.
	 */
	lastChild.prependTo($element);
	$element.children().eq(-1).remove();

	/* 만약 공지사항이 하나뿐이면 위치를 고정시키고 아니라면 요소의 크기만큼 위로 스크롤*/
	if($element.children().length==1){$element.css('top','0px');}
	else{$element.css('top','-'+move+'px');}
	
	/* setInterval(function_name, milliseconds)
	 * ---------------------------------------------------
	 * 일정시간이 지날 때마다 지정된 함수를 실행시키는 명령어
	 */
	timer = setInterval(moveNextSlide, speed);
	
	/* jQuery 안에 이벤트 분기에 따른 익명함수 선택법
	 * ----------------------------------------------------
	 * 기본형
	 * $('poo').bind("click",function() {});
	 * 분기형
	 * $('poo').bind(
	 * 		{"mouseover":function() {}},
	 * 		{"mouseout"	:function() {}}
	 * 				);
	 * */
	$element.find('>li').bind({
		'mouseenter': function(){clearInterval(timer);},
		'mouseleave': function(){timer = setInterval(moveNextSlide, speed);}
	});

	function moveNextSlide(){
		$element.each(function(idx){
			/* 목록의 첫번째 공지를 복사하여 목록의 끝에 추가 후 첫번째 공지를 목록에서 제거
			 * 
			 * */
			var firstChild = $element.children().filter(':first-child').clone(true);
			
			firstChild.appendTo($element.eq(idx));
			$element.children().filter(':first-child').remove();
			$element.css('top','0px');

			$element.eq(idx).animate({'top':'-'+move+'px'},'normal');

		});
	}
}
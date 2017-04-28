/**
 * 
 */
function fn_issue(buttonID,containerID){
	var $element = $('#'+containerID).find('.book-list');
	var $prev = $('#'+buttonID).find('.prev');
	var $next = $('#'+buttonID).find('.next');
	
	var speed = 5000;
	var timer = null;
	var move = $element.children().outerWidth();
	var first = false;
	var lastChild;

	lastChild = $element.children().eq(-1).clone(true);
	lastChild.prependTo($element);
	$element.children().eq(-1).remove();

	if($element.children().length==1){$element.css('left','0px');}
	else{$element.css('left','-'+move+'px');}

	timer = setInterval(moveNextSlide, speed);
	
	$element.find('>li').bind({
		'mouseenter': function() {clearInterval(timer);},
		'mouseleave': function() {timer = setInterval(moveNextSlide, speed);}
	});
	
	function moveNextSlide(){
		$element.each(function(idx){
			/* 목록의 첫번째 공지를 복사하여 목록의 끝에 추가 후 첫번째 공지를 목록에서 제거
			 * 
			 * */
			var firstChild = $element.children().filter(':first-child').clone(true);
			
			firstChild.appendTo($element.eq(idx));
			$element.children().filter(':first-child').remove();
			$element.css('left','0px');

			$element.eq(idx).animate({'left':'-'+move+'px'},'slow');

		});
	}
	
	$prev.bind('click',function(){
		$element.each(function(idx){
			if(!first){
				$element.eq(idx).animate({'left': '0px'},'normal',function(){
					lastChild = $(this).children().eq(-1).clone(true);
					lastChild.prependTo($element.eq(idx));
					$(this).children().eq(-1).remove();
					$(this).css('left','-'+move+'px');
				});
				first = true;
				return false;
			}

			$element.eq(idx).animate({'left': '0px'},'normal',function(){
				lastChild = $(this).children().filter(':last-child').clone(true);
				lastChild.prependTo($element.eq(idx));
				$(this).children().filter(':last-child').remove();
				$(this).css('left','-'+move+'px');
			});
		});
		return false;
	});

	$next.bind('click',function(){
		$element.each(function(idx){

			var firstChild = $element.children().filter(':first-child').clone(true);
			firstChild.appendTo($element.eq(idx));
			$element.children().filter(':first-child').remove();
			$element.css('left','0px');

			$element.eq(idx).animate({'left':'-'+move+'px'},'normal');

		});
		return false;
	});
}
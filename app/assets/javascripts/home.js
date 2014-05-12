(function(c,q){var m="data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==";c.fn.imagesLoaded=function(f){function n(){var b=c(j),a=c(h);d&&(h.length?d.reject(e,b,a):d.resolve(e));c.isFunction(f)&&f.call(g,e,b,a)}function p(b){k(b.target,"error"===b.type)}function k(b,a){b.src===m||-1!==c.inArray(b,l)||(l.push(b),a?h.push(b):j.push(b),c.data(b,"imagesLoaded",{isBroken:a,src:b.src}),r&&d.notifyWith(c(b),[a,e,c(j),c(h)]),e.length===l.length&&(setTimeout(n),e.unbind(".imagesLoaded",
p)))}var g=this,d=c.isFunction(c.Deferred)?c.Deferred():0,r=c.isFunction(d.notify),e=g.find("img").add(g.filter("img")),l=[],j=[],h=[];c.isPlainObject(f)&&c.each(f,function(b,a){if("callback"===b)f=a;else if(d)d[b](a)});e.length?e.bind("load.imagesLoaded error.imagesLoaded",p).each(function(b,a){var d=a.src,e=c.data(a,"imagesLoaded");if(e&&e.src===d)k(a,e.isBroken);else if(a.complete&&a.naturalWidth!==q)k(a,0===a.naturalWidth||0===a.naturalHeight);else if(a.readyState||a.complete)a.src=m,a.src=d}):
n();return d?d.promise(g):g}})(jQuery);

jQuery(
	function($) {
		
		var $bg = $('#bg'),
			$bgs = $bg.find('img');
		
		var win = {}
		
		var cur = 0;
		
		$(document).ready( resize );
		$(window).resize( resize );
		$(window).scroll( resize );
		$(window).load( bg );
		$(window).resize( bg );
		
		function resize () {
			win = {
				w: $(window).width(),
				h: $(window).height(),
				t: $('body').scrollTop(),
				l: $('body').scrollLeft()
			}
		}
		
		function bg () {
			$bgs.each (
				function () {
					$(this).imagesLoaded( 
						function() {
							var dim = {
								w: $( this ).width(),
								h: $( this ).height(),
								r: $( this ).height() / $( this ).width()
							}
							if ( ( win.h / win.w ) > dim.r ){
							    $( this ).height( win.h );
							    $( this ).width( win.h / dim.r );
							} else {
							    $( this ).width( win.w );
							    $( this ).height( win.w * dim.r );
							}
						}
					)
				}
			)
		}
		
		setInterval(fader, 2500);
		
		function fader () {
			var current = $bgs.eq(cur),
				next = current.next();
			if ( !next.length ) {
				next = $bgs.eq(0);
			}
			current.animate ( { opacity: 0 }, { duration: 500, queue: false } );
			next.animate ( { opacity: 1 }, { duration: 500, queue: false } );
			cur = next.index();
		}
		
	}
)
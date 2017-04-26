
(function($) {
    /**
     * @name Dialog
     * @class 弹出框,可拖拽，设置宽和高，有无遮罩，
     */
    $.uedWidget('ued.Dialog', {
        options : /**@lends Dialog# */
        {
            /**
             *传入的标题
             * @type string
             * @default null
             * @example
             * $("#dialog").uedDialog({ title :"string"}})
             */
            title : null,
            /**
             *下端按钮，如果有数值，则添加，默认没有按钮
             * @type object
             * @default null
             * @example
             *  $("#dialog").uedDialog({buttons:["false":function(){
             *     alert(2)
             * },"true":function(){
             *     alert(3)
             * }]})
             */
            buttons : null,
            /**
             *是否有遮罩，添加在body下,默认有
             * @type boolean
             * @default true
             * @example
             *  $("#dialog").uedDialog({modal:false})
             */
            modal : false,
            /**
             *定位,如果没有传入默认居中,以百分比为单位
             * @type object
             * @default null
             * @example
             * $("#dialog").uedDialog({position:[50,10]})
             */
            position : null,
            /**
             *dialog的宽度
             * @type int
             * @default 300
             * @example
             *  $("#dialog").uedDialog({width:500})
             */
            width : 300,
            /**
             *dialog的高度
             * @type int
             * @default 200
             * @example
             * $("#dialog").uedDialog({height:500})
             */
            height : 200,
            /**
             *是否可以拖拽
             * @type boolean
             * @default true
             * @example
             *  $("#dialog").uedDialog({isDrag:false})
             */
            isDrag : true,
            /**
             *默认打开
             * @type boolean
             * @default false
             * @example
             *  $("#dialog").uedDialog({autoOpen:false})
             */
            autoOpen : false,
            /**
             *提示类型"success","error","confirm","warning"
             * @type string
             * @default null
             * @example
             * $("#dialog").uedDialog({type:"success"})
             */
            type : null,
            /**
             *提示信息
             * @type string
             * @default null
             * @example
             * $("#dialog").uedDialog({message:"tishixingxing"})
             */
            message : null,
			/*
			 * 弹窗关闭后的回调,默认为null
			 */
			closeCallback : null,
            /*
             * 弹窗的定位方式，默认为true  
             */
            fixed:true
        },
       
        _create : function() {
            var $el = this.element, options = this.options, self = this;
            var _define = this._define = {};
			//创建弹窗节点
			this._createDialogDom($el, options, _define);
			//设置弹窗属性
			this._calDialogAttr($el, options, _define);
			//绑定弹窗事件
			this._bindEvent($el, options, _define);
        },
       
	    _createDialogDom : function($el, options, _define){
			var $farther = _define.$farther = $el.parent(), buttons = options.buttons;
			var $dialog = _define.$dialog = $('<div class="ui-dialog-panel"><div class="ui-dialog"></div><div class="ui-dialog-leftYY"></div><div class="ui-dialog-rightYY"></div><div class="ui-dialog-bottomLeft"></div><div class="ui-dialog-bottomRight"></div><div class="ui-dialog-bottomCenter"></div></div>');
			//创建弹窗头部区域
			var $dialogHd = _define.$dialogHd = $('<div class="ui-dialog-hd"><h6></h6><a href="javascript:;" class="ui-dialog-close ue-state-default"><i></i></a></div>');
			//创建弹窗内容区域
			var $dialogContent = _define.$dialogContent = $el.addClass('ui-dialog-content');
			if(options.type){
				//创建提示型弹窗提示区域
				this._createMessageDom($el, $dialogContent, options);
			}else{
				//普通型弹窗内为iframe时，拖动卡顿
				if($el.children().is('iframe')){
					var $contentMask = _define.$contentMask = $('<div style="position:absolute;top:45px;left:0;right:0;bottom:0;display:none"></div>');
					$dialogContent.append($contentMask);
				}
			}
			$el.css('display','block');//显示$el内容
			
			$dialog.children('.ui-dialog').append($dialogHd).append($dialogContent);
			//创建弹窗底部区域
			var $dialogFt = _define.$dialogFt = $('<div class="ui-dialog-ft"></div>');
			if(buttons){
				var buttonArray = [];
				for(var i = 0, len = buttons.length; i < len; i++){
					var button = buttons[i], length = this._returnLetterLength(button.label);
					length = length < 3 ? 3 : length;
					if(button.recommend){
						buttonArray.push('<button type="button" class="ue-button-recommend ue-state-default long' + length + '">'+ button.label +'</button>');
					}else{
						buttonArray.push('<button type="button" class="ue-button ue-state-default long' + length + '">'+ button.label +'</button>');
					}
				}
				$dialogFt.append(buttonArray.join(''));
				$dialog.children().append($dialogFt);
			}
			
			//判断是否需要生成遮罩
			if(!options.modal){
				var $dragMask = _define.$dragMask = $('<div style="position: fixed;z-index:9999;top:0;left:0;right:0;bottom:0;display:none"></div>');
           		 $('body').append($dragMask);
			}
			
			//插入到$farther中去
			$farther.append($dialog.hide());
		},
		/*
		 * 创建提示型弹窗提示区域
		 */
		_createMessageDom : function($el, $dialogContent, options){
			var type = options.type, _define = this._define;
			
			_define.$dialog.addClass('ui-dialog-'+type);
			//创建节点
			$dialogContent.empty().append('<div class="ui-dialog-icon"></div><div class="ui-dialog-text"><span class="patch"></span><span class="dialog-text"></span></div>');
			var $dialogMessage = _define.$dialogMessage = $dialogContent.find('.dialog-text');
		},
		
		_calDialogAttr : function($el, options, _define){
			
			this.setTitle(options.title);
			if(!options.type){
				//普通弹窗
				this.setWidth(options.width);
				this.setHeight(options.height);
			}else{
				//提示型弹窗
				this.setWidth(355);
				this.setHeight(145);
				this.setMessage(options.message);
			}
			//设置弹窗的位置
			this.setPosition(options.position);
			
			if(options.autoOpen){
				this.open();
			}
		},
		
		_calLeft : function(_left, _define){
			if(_left == 'left'){
				_define.left = 0;
			}else{
				_define.left = ($(window).width() - _define.width) / 2;
				_define.left = _define.left < 0 ? 0 : _define.left;
			}
		},
		
		_calTop : function(_top, _define){
			if(_top == 'top'){
				_define.top = 0;
			}else{
				_define.top = ($(window).height() - _define.height) / 2;
				_define.top = _define.top < 0 ? 0 : _define.top;
			}
		},
		
		_bindEvent : function($el, options, _define){
			var self = this;
			//绑定关闭按钮事件
			_define.$dialogHd.children('.ui-dialog-close').click(function(){
				self.close();
			});
			
			//绑定弹窗拖拽事件
			if(options.isDrag){
				self._dialogDrag(self, _define);
			}
			//绑定按钮点击事件
			var buttons = options.buttons;
			if(buttons){
				_define.$dialogFt.bind('click',function(e){
					var $target = $(e.target), button = buttons[$target.index()];
					if($target.is('button')){
						if(!button.setFunc){
							button.callBack && button.callBack(self.element, $('#__mask',$('body')));
						}else{
							button.callBack && button.callBack(button.param);
							self.close();
						}
					}
				});
			}
		},
		/*
		 * 弹窗拖动函数
		 * @param {Object} self 弹窗对象
		 * @param {Object} _define组件内部自定义对象。用来存放临时值 
		 */
		_dialogDrag : function(self, _define){
			var $dragMask = _define.$dragMask, $contentMask = _define.$contentMask;
			var $dialogHd = _define.$dialogHd, $dialog = _define.$dialog, winWidth, winHeight;
			var left,top,dialogWidth = _define.width, dialogHeight = _define.height;
			var tempX, tempY;
			$dialogHd.css('cursor','move');
			$dialogHd.bind('mousedown',function(e){
				//e.preventDefault();
				//获取最新值
				left = _define.left, top = _define.top, tempX = e.clientX, tempY = e.clientY, winWidth = $(window).width(), winHeight = $(window).height();

				if(!self.options.fixed){//定位为absolute
					winHeight = $(document).outerHeight();
				}
				$contentMask && $contentMask.show();
				$dragMask && $dragMask.show();
				this.setCapture && this.setCapture();
				$(document).bind('mousemove',mouseMove).bind('mouseup',mouseUp);
			});	
			
			var mouseMove = function(e){
				_define.left = e.clientX - tempX + left;
				_define.top = e.clientY - tempY + top;
				_define.left = _define.left < 0 ? 0 : _define.left > (winWidth - dialogWidth) ? (winWidth - dialogWidth) : _define.left;
				_define.top = _define.top < 0 ? 0 : _define.top > (winHeight - dialogHeight) ? (winHeight - dialogHeight) : _define.top;
				$dialog.css({'left':_define.left,'top':_define.top});
			}
			var mouseUp = function(e){
				this.releaseCapture && this.releaseCapture();
				$contentMask && $contentMask.hide();
				$dragMask && $dragMask.hide();
				$(document).unbind('mousemove',mouseMove).unbind('mouseup',mouseUp);
			}
		},
		
		/*
		 * 给弹窗设置标题。
		 * @param {String or Object} _title 弹窗标题
		 */
		setTitle : function(_title){
			var _define = this._define, $dialogHd = _define.$dialogHd;
			if(_title){
				$dialogHd.find('h6').empty().append('<span class="dialog-hd-lc"></span>' + _title + '<span class="dialog-hd-rc"></span>');
			}
		},
		
		/*
		 * 给弹窗设置宽度
		 * @param {int} _width 弹窗宽度
		 */
		setWidth : function(_width){
			var _define = this._define, $dialogContent = _define.$dialogContent;
			$dialogContent.width(_width);
			//存储弹窗宽度，以便后期计算位置
			_define.width = $dialogContent.outerWidth() + 10;
		},
		
		/*
		 * 给弹窗设置高度
		 * @param {int} _height 弹窗高度
		 */
		setHeight : function(_height){
			var _define = this._define, $dialogContent = _define.$dialogContent;
			$dialogContent.height(_height);
			//存储弹窗高度，以便后期计算位置
			_define.height = $dialogContent.outerHeight() + 50;
		},
		/*
		 * 给提示型弹窗设置提示信息
		 * @param {String or Object} _message 提示弹窗的提示信息
		 */
		setMessage : function(_message){
			if(!_message) return;
			var _define = this._define, $dialogMessage = _define.$dialogMessage;
			$dialogMessage.empty().append(_message);
		}, 
		/*
		 * 设置弹窗的位置
		 */
		setPosition : function(_position){
			if(!_position){
				_position = ['center','center'];
			}
			var _define = this._define ,left = _position[0], top = _position[1], options = this.options;
			_define.left = left, _define.top = top;
			if(typeof left != 'number'){
				//计算弹窗的left值
				this._calLeft(left, _define);
			}
			
			if(typeof top != 'number'){
				//计算弹窗的left值
				this._calTop(top, _define);
			}
			
			//赋值给弹窗
			if(options.fixed){
				_define.$dialog.css({'position':'fixed','left':_define.left,'top':_define.top});
			}else{
				_define.$dialog.css({'position':'absolute','left':_define.left,'top':_define.top});	
			}
		},
		
		open : function(){
			var _define = this._define, $dialog = _define.$dialog , options = this.options, isMask = options.modal;	
			isMask &&　$.mask.open('ued-dialog');
			if(!options.fixed && options.position[1]=='center'){
				//如果弹窗不是fiexd定位，且top为center时，打开前需要+scrollTop
				_define.top += $(window).scrollTop();
				$dialog.css('top',_define.top);
			}
			$dialog.show();
		},
		
		close : function(){
			var  _define = this._define, $dialog = _define.$dialog, closeCallback = this.options.closeCallback, isMask = this.options.modal;	
			isMask &&　$.mask.close('ued-dialog');
			$dialog.hide();
			closeCallback &&　closeCallback.call(this.element,this.element,$('#__mask',$('body')));
		},
        _init : function() {
           // var self = this, options = this.options, $el = this.element;
        },
		_returnLetterLength : function(_str){
			return _str.replace(/[a-z0-9]{2}/ig,'a').length;	
		},
		remove : function(){
			this._define.$dialog.remove();	
			$.mask.close('ued-dialog');
			this._define = null;
		},
		/*
         * 用于修改第一个button的默认函数 addBy xzjiang,update rbai
         * @param {Object} _func 函数体
         * @param {string} _param
		 */
        setFunc : function(_func, _param) {

            var self = this, options = this.options, firstButton = options.buttons[0];
			firstButton.callBack = _func;
			firstButton.param = _param;
			firstButton.setFunc = true;
        }
    });
})(jQuery);

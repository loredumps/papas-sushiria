package sushiGame.models
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import package_2.class_6;
   import package_4.class_5;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.screens.TeaScreen;
   
   public class Ticket
   {
       
      
      public var gameObj:class_5;
      
      public var clip:MovieClip;
      
      public var container:MovieClip;
      
      public var specialCover:MovieClip = null;
      
      public var order:Array;
      
      public var orderData:CustomerOrder;
      
      public var customerType:Number;
      
      public var ticketNumber:Number = 1;
      
      public var targetX:Number = 0;
      
      public var targetY:Number = 0;
      
      public var targetScale:Number = 0;
      
      public var isDragging:Boolean = false;
      
      public var isMoving:Boolean = false;
      
      public var isDrawingOrder:Boolean = false;
      
      public var isOnTray:Boolean = false;
      
      public var hangerX:Number = 558;
      
      public var hangerY:Number = 58;
      
      public var hangerScale:Number = 1;
      
      public var lineStartX:Number = 56;
      
      public var lineEndX:Number = 433;
      
      public var lineY:Number = 20;
      
      public var lineScale:Number = 0.25;
      
      public var trayX:Number = 30;
      
      public var trayY:Number = 20;
      
      public var trayScale:Number = 0.34;
      
      public var minGrabScale:Number = 0.25;
      
      public var maxGrabScale:Number = 1;
      
      public var minGrabY:Number = 15;
      
      public var maxGrabY:Number = 180;
      
      public var maxGrabBoundsY:Number = 320;
      
      public var minGrabX:Number = 22;
      
      public var maxGrabX:Number = 544;
      
      public var minGrabZoomX:Number = 458;
      
      public var tweenSpeed:Number = 2;
      
      public var startingY:Number = -242;
      
      public var trayBoundsLeftX:Number = 490;
      
      public var trayBoundsRightX:Number = 640;
      
      public var trayBoundsTopY:Number = 300;
      
      private var panelHolder:MovieClip = null;
      
      private var panelParts:Vector.<MovieClip>;
      
      private var panelSubParts:Vector.<MovieClip>;
      
      private var panelSpecialBitmap:Bitmap = null;
      
      public var bmp:BitmapData;
      
      public var bitmap:Bitmap;
      
      public function Ticket(param1:class_5, param2:Number, param3:Number)
      {
         super();
         var _loc4_:Ticket;
         (_loc4_ = this).gameObj = param1;
         _loc4_.customerType = param2;
         _loc4_.ticketNumber = param3;
         _loc4_.setupTicket();
      }
      
      public function setupTicket() : void
      {
         var _loc1_:Ticket = this;
         _loc1_.clip = new ticketMC();
         _loc1_.clip.clipper.visible = false;
         var _loc2_:String = String(_loc1_.ticketNumber);
         if(_loc2_.length < 2)
         {
            _loc2_ = "0" + _loc2_;
         }
         _loc1_.clip.number_txt.text = _loc2_;
         _loc1_.orderData = _loc1_.gameObj.var_131.getCustomerOrderData(_loc1_.customerType);
         _loc1_.order = _loc1_.orderData.getOrderAsArray();
         _loc1_.container = _loc1_.gameObj.hud.clip.ticket_holder;
         _loc1_.container.addChild(_loc1_.clip);
         _loc1_.clip.scaleX = _loc1_.hangerScale;
         _loc1_.clip.scaleY = _loc1_.hangerScale;
         _loc1_.clip.x = _loc1_.hangerX;
         _loc1_.clip.y = _loc1_.startingY;
         _loc1_.clip.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickTicket);
         _loc1_.clip.buttonMode = true;
         _loc1_.clip.useHandCursor = true;
         _loc1_.clip.mouseChildren = false;
         _loc1_.isDrawingOrder = true;
         _loc1_.createOrderPanels();
         _loc1_.moveToHanger();
      }
      
      public function createOrderPanels() : void
      {
         var _loc2_:int = 0;
         var _loc7_:MovieClip = null;
         var _loc8_:MovieClip = null;
         var _loc9_:MovieClip = null;
         var _loc10_:MovieClip = null;
         var _loc11_:MovieClip = null;
         var _loc1_:Ticket = this;
         _loc1_.panelHolder = new MovieClip();
         _loc1_.panelParts = new Vector.<MovieClip>();
         0;
         if(_loc1_.orderData.isSpecial)
         {
            _loc1_.panelSpecialBitmap = new Bitmap(_loc1_.gameObj.var_133.specialBMP,"auto",true);
            _loc1_.panelSpecialBitmap.scaleX = 0.8;
            _loc1_.panelSpecialBitmap.scaleY = 0.8;
            (_loc7_ = new MovieClip()).addChild(_loc1_.panelSpecialBitmap);
            _loc7_.x = -61;
            _loc7_.y = 110;
            _loc1_.panelParts.push(_loc7_);
            _loc1_.panelHolder.addChild(_loc7_);
            _loc7_.visible = false;
            _loc1_.specialCover = new ticket_specialcover();
            _loc1_.specialCover.x = -4;
            _loc1_.specialCover.y = 1;
            _loc7_.addChildAt(_loc1_.specialCover,0);
         }
         else
         {
            (_loc8_ = new ticket_panel_paper()).gotoAndStop(_loc1_.orderData.paperType);
            (_loc9_ = new ticket_panel_rice()).gotoAndStop(_loc1_.orderData.riceType);
            if(_loc1_.orderData.isFlipped)
            {
               _loc9_.flipicon.visible = true;
               _loc8_.scaleX = -1;
               _loc8_.x = 69;
               _loc8_.y = 230;
               _loc9_.x = -66;
               _loc9_.y = 230;
               _loc1_.panelParts.push(_loc8_);
               _loc1_.panelHolder.addChild(_loc8_);
               _loc8_.visible = false;
               _loc1_.panelParts.push(_loc9_);
               _loc1_.panelHolder.addChild(_loc9_);
               _loc9_.visible = false;
            }
            else
            {
               _loc9_.flipicon.visible = false;
               _loc9_.scaleX = -1;
               _loc9_.x = 69;
               _loc9_.y = 230;
               _loc8_.x = -66;
               _loc8_.y = 230;
               _loc1_.panelParts.push(_loc8_);
               _loc1_.panelHolder.addChild(_loc8_);
               _loc8_.visible = false;
               _loc1_.panelParts.push(_loc9_);
               _loc1_.panelHolder.addChild(_loc9_);
               _loc9_.visible = false;
            }
            _loc2_ = 0;
            while(_loc2_ < _loc1_.orderData.fillings.length)
            {
               (_loc10_ = new ticket_panel_filling()).gotoAndStop(_loc1_.orderData.fillings[_loc2_]);
               _loc10_.x = 0;
               _loc10_.y = 207 - _loc2_ * 36;
               _loc1_.panelParts.push(_loc10_);
               _loc1_.panelHolder.addChild(_loc10_);
               _loc10_.visible = false;
               _loc2_++;
            }
            _loc2_ = 0;
            while(_loc2_ < _loc1_.orderData.toppings.length)
            {
               if(FoodData.isDrop(_loc1_.orderData.toppings[_loc2_]))
               {
                  _loc11_ = new ticket_panel_filling();
               }
               else if(FoodData.isSauce(_loc1_.orderData.toppings[_loc2_]))
               {
                  _loc11_ = new ticket_panel_sauce();
               }
               else
               {
                  _loc11_ = new ticket_panel_shaker();
               }
               _loc11_.gotoAndStop(_loc1_.orderData.toppings[_loc2_]);
               _loc11_.x = 0;
               _loc11_.y = 91 - _loc2_ * 34;
               _loc1_.panelParts.push(_loc11_);
               _loc1_.panelHolder.addChild(_loc11_);
               _loc11_.visible = false;
               _loc2_++;
            }
         }
         var _loc5_:MovieClip;
         (_loc5_ = new ticket_panel_tea()).gotoAndStop(_loc1_.orderData.teaType);
         _loc5_.x = -31;
         _loc5_.y = -10;
         _loc1_.panelParts.push(_loc5_);
         _loc1_.panelHolder.addChild(_loc5_);
         _loc5_.visible = false;
         var _loc6_:MovieClip;
         (_loc6_ = new ticket_panel_bubbles()).gotoAndStop(_loc1_.orderData.bubbleType);
         _loc6_.x = 37;
         _loc6_.y = -10;
         _loc1_.panelParts.push(_loc6_);
         _loc1_.panelHolder.addChild(_loc6_);
         _loc6_.visible = false;
         _loc1_.clip.addChild(_loc1_.panelHolder);
      }
      
      public function moveToHanger() : void
      {
         var _loc1_:Ticket = this;
         _loc1_.targetX = _loc1_.hangerX;
         _loc1_.targetY = _loc1_.hangerY;
         _loc1_.targetScale = _loc1_.hangerScale;
         _loc1_.isMoving = true;
         if(!_loc1_.clip.hasEventListener(Event.ENTER_FRAME))
         {
            _loc1_.clip.addEventListener(Event.ENTER_FRAME,_loc1_.updateTicketPosition);
         }
         if(_loc1_.gameObj.hud.currentStation == "build" && _loc1_.orderData.isSpecial && !_loc1_.gameObj.var_127.hasTrained("cheatsheet"))
         {
            _loc1_.gameObj.hud.showContextTraining("cheatsheet");
         }
         else
         {
            _loc1_.gameObj.method_121(true);
         }
      }
      
      public function moveToLine(param1:Number = -1) : void
      {
         var _loc2_:Ticket = this;
         if(param1 == -1)
         {
            _loc2_.targetX = _loc2_.lineEndX - Math.floor(Math.random() * 30);
         }
         else if(param1 > _loc2_.lineEndX)
         {
            _loc2_.targetX = _loc2_.lineEndX;
         }
         else if(param1 < _loc2_.lineStartX)
         {
            _loc2_.targetX = _loc2_.lineStartX;
         }
         else
         {
            _loc2_.targetX = param1;
         }
         _loc2_.targetY = _loc2_.lineY;
         _loc2_.targetScale = _loc2_.lineScale;
         _loc2_.isMoving = true;
         if(!_loc2_.clip.hasEventListener(Event.ENTER_FRAME))
         {
            _loc2_.clip.addEventListener(Event.ENTER_FRAME,_loc2_.updateTicketPosition);
         }
      }
      
      public function moveToTray() : void
      {
         var _loc1_:Ticket = this;
         if(_loc1_.gameObj.var_137.currentOrder != null && _loc1_.gameObj.var_137.currentOrder.ticketHolderClip != null)
         {
            _loc1_.container = _loc1_.gameObj.var_137.currentOrder.ticketHolderClip;
            _loc1_.container.addChild(_loc1_.clip);
            _loc1_.clip.x -= _loc1_.gameObj.var_137.currentOrder.ticketHolderClip.x;
            _loc1_.clip.y -= _loc1_.gameObj.var_137.currentOrder.ticketHolderClip.y;
            _loc1_.targetX = _loc1_.trayX;
            _loc1_.targetY = _loc1_.trayY;
            _loc1_.targetScale = _loc1_.trayScale;
            _loc1_.isMoving = true;
            _loc1_.isOnTray = true;
            _loc1_.gameObj.var_137.currentOrder.setNotClickable();
            _loc1_.gameObj.hud.disableStationButtons();
            if(!_loc1_.clip.hasEventListener(Event.ENTER_FRAME))
            {
               _loc1_.clip.addEventListener(Event.ENTER_FRAME,_loc1_.updateTicketPosition);
            }
            _loc1_.gameObj.method_104(34);
         }
      }
      
      public function clickTicket(param1:MouseEvent) : void
      {
         var _loc2_:Ticket = this;
         if(!_loc2_.gameObj.var_169 && !_loc2_.isDragging && !_loc2_.isMoving && !_loc2_.isDrawingOrder && !_loc2_.isOnTray && _loc2_.canClickInTraining(param1))
         {
            if(_loc2_.gameObj.var_152.hangerTicket == _loc2_)
            {
               _loc2_.gameObj.var_152.hangerTicket = null;
               _loc2_.gameObj.method_121(true);
            }
            _loc2_.isDragging = true;
            _loc2_.isMoving = false;
            _loc2_.clip.clipper.visible = false;
            _loc2_.clip.startDrag(true,new Rectangle(_loc2_.minGrabX,_loc2_.minGrabY,_loc2_.maxGrabX,_loc2_.maxGrabBoundsY));
            if(!_loc2_.clip.hasEventListener(Event.ENTER_FRAME))
            {
               _loc2_.clip.addEventListener(Event.ENTER_FRAME,_loc2_.updateTicketPosition);
            }
            _loc2_.container.setChildIndex(_loc2_.clip,_loc2_.container.numChildren - 1);
            _loc2_.gameObj.addEventListener(MouseEvent.MOUSE_UP,_loc2_.releaseTicket);
            _loc2_.gameObj.var_128.playSound("grabticket.wav");
            if(_loc2_.gameObj.hud.whichContextTraining == "ticket")
            {
               _loc2_.gameObj.hud.removeContextTraining();
            }
         }
      }
      
      public function releaseTicket(param1:MouseEvent = null) : void
      {
         var _loc2_:Ticket = this;
         var _loc3_:TeaScreen = _loc2_.gameObj.var_137;
         _loc2_.isDragging = false;
         _loc2_.isMoving = false;
         _loc2_.clip.stopDrag();
         _loc2_.gameObj.var_128.playSound("dropticket.wav");
         try
         {
            _loc2_.gameObj.removeEventListener(MouseEvent.MOUSE_UP,_loc2_.releaseTicket);
         }
         catch(err:Error)
         {
         }
         if(_loc2_.clip.x > _loc2_.hangerX - 90 && _loc2_.clip.x < _loc2_.hangerX + 70 && _loc2_.clip.y < _loc2_.hangerY + 227)
         {
            if(!_loc2_.gameObj.var_152.hangerTicket || _loc2_.gameObj.var_152.hangerTicket.isDrawingOrder == false)
            {
               if(_loc2_.gameObj.var_152.hangerTicket)
               {
                  _loc2_.gameObj.var_152.hangerTicket.moveToLine();
               }
               _loc2_.gameObj.var_152.hangerTicket = _loc2_;
               _loc2_.moveToHanger();
            }
            else
            {
               _loc2_.moveToLine();
            }
         }
         else if(_loc2_.gameObj.hud.currentStation == "tea" && _loc2_.gameObj.var_137.currentOrder != null && _loc2_.gameObj.var_137.currentOrder.ticketHolderClip && _loc2_.gameObj.var_137.currentOrder.attachedTicket == null && !_loc2_.gameObj.var_137.currentOrder.isLeavingTea && !_loc2_.gameObj.var_137.currentOrder.isDraggingOnTea && _loc2_.gameObj.var_137.currentOrder.attachedTea != null && _loc2_.gameObj.var_137.currentOrder.attachedTea.isDragging == false && _loc2_.clip.x >= _loc2_.trayBoundsLeftX && _loc2_.clip.x <= _loc2_.trayBoundsRightX && _loc2_.clip.y >= _loc2_.trayBoundsTopY)
         {
            _loc2_.moveToTray();
         }
         else
         {
            _loc2_.moveToLine(_loc2_.clip.x);
            if(_loc2_.gameObj.var_152.hangerTicket == _loc2_)
            {
               _loc2_.gameObj.var_152.hangerTicket = null;
            }
         }
      }
      
      public function updateTicketPosition(param1:Event) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:SushiRoll = null;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc2_:Ticket = this;
         if(_loc2_.isDragging)
         {
            _loc3_ = _loc2_.maxGrabScale - _loc2_.minGrabScale;
            if((_loc4_ = (_loc2_.clip.y - _loc2_.minGrabY) / (_loc2_.maxGrabY - _loc2_.minGrabY)) < 0)
            {
               _loc4_ = 0;
            }
            else if(_loc4_ > 1)
            {
               _loc4_ = 1;
            }
            _loc5_ = _loc2_.minGrabScale + _loc4_ * _loc3_;
            if((_loc6_ = (_loc2_.clip.x - _loc2_.minGrabZoomX) / (_loc2_.hangerX - _loc2_.minGrabZoomX)) < 0)
            {
               _loc6_ = 0;
            }
            else if(_loc6_ > 1)
            {
               _loc6_ = 1;
            }
            if((_loc7_ = _loc2_.minGrabScale + _loc6_ * _loc3_) > _loc5_)
            {
               _loc5_ = _loc7_;
            }
            if((_loc8_ = _loc2_.gameObj.var_137.currentOrder) && _loc8_.attachedTicket == null && _loc2_.gameObj.hud.currentStation == "tea" && _loc8_.ticketHolderClip && !_loc8_.isLeavingTea && _loc8_.attachedTea != null && _loc8_.attachedTea.isDragging == false)
            {
               _loc9_ = _loc8_.ticketHolderClip.x + _loc2_.trayX;
               _loc10_ = _loc8_.ticketHolderClip.y + _loc2_.trayY;
               _loc11_ = _loc9_ - _loc2_.clip.x;
               _loc12_ = _loc10_ - _loc2_.clip.y;
               _loc13_ = Math.sqrt(_loc11_ * _loc11_ + _loc12_ * _loc12_);
               _loc14_ = 150;
               if(_loc13_ < _loc14_)
               {
                  if((_loc15_ = _loc2_.minGrabScale + _loc13_ / _loc14_ * _loc3_) < _loc2_.trayScale)
                  {
                     _loc15_ = _loc2_.trayScale;
                  }
                  if(_loc15_ < _loc5_)
                  {
                     _loc5_ = _loc15_;
                  }
               }
            }
            _loc2_.clip.scaleX = _loc5_;
            _loc2_.clip.scaleY = _loc5_;
         }
         else if(_loc2_.isMoving)
         {
            _loc16_ = _loc2_.targetX - _loc2_.clip.x;
            _loc17_ = _loc2_.targetY - _loc2_.clip.y;
            _loc18_ = _loc2_.targetScale - _loc2_.clip.scaleX;
            _loc2_.clip.x += _loc16_ / _loc2_.tweenSpeed;
            _loc2_.clip.y += _loc17_ / _loc2_.tweenSpeed;
            _loc2_.clip.scaleX += _loc18_ / _loc2_.tweenSpeed;
            _loc2_.clip.scaleY += _loc18_ / _loc2_.tweenSpeed;
            if(Math.abs(_loc16_) < 1)
            {
               _loc2_.clip.x = _loc2_.targetX;
            }
            if(Math.abs(_loc17_) < 1)
            {
               _loc2_.clip.y = _loc2_.targetY;
            }
            if(Math.abs(_loc18_) < 0.05)
            {
               _loc2_.clip.scaleX = _loc2_.targetScale;
               _loc2_.clip.scaleY = _loc2_.targetScale;
            }
            if(_loc2_.clip.x == _loc2_.targetX && _loc2_.clip.y == _loc2_.targetY)
            {
               _loc2_.clip.scaleX = _loc2_.targetScale;
               _loc2_.clip.scaleY = _loc2_.targetScale;
               _loc2_.isMoving = false;
               if(_loc2_.targetScale == _loc2_.lineScale && !_loc2_.isOnTray)
               {
                  _loc2_.clip.clipper.visible = true;
               }
               _loc2_.clip.removeEventListener(Event.ENTER_FRAME,_loc2_.updateTicketPosition);
               if(_loc2_.isOnTray)
               {
                  _loc2_.gameObj.var_137.currentOrder.attachTicket(_loc2_);
                  _loc2_.gameObj.var_137.currentOrder.leaveTeaStation();
               }
            }
         }
         if(_loc2_.isDragging && (_loc2_.gameObj.mouseX < 0 || _loc2_.gameObj.mouseX > 640 || _loc2_.gameObj.mouseY < 0 || _loc2_.gameObj.mouseY > 480))
         {
            _loc2_.releaseTicket();
         }
      }
      
      public function drawTicketDetails(param1:Number, param2:Number = -1) : void
      {
         var _loc3_:Ticket = this;
         _loc3_.panelParts[param1].visible = true;
      }
      
      public function finishDrawingTicket() : void
      {
         var _loc5_:int = 0;
         var _loc1_:Ticket = this;
         _loc1_.isDrawingOrder = false;
         _loc1_.clip.number_txt.visible = false;
         _loc1_.bmp = new BitmapData(Math.ceil(_loc1_.clip.width),Math.ceil(_loc1_.clip.height),true,16777215);
         var _loc2_:Rectangle = _loc1_.clip.getBounds(_loc1_.clip);
         var _loc3_:Matrix = new Matrix(1,0,0,1,0 - _loc2_.x,0 - _loc2_.y);
         _loc1_.bmp.draw(_loc1_.clip,_loc3_,null,null,null,true);
         _loc1_.bitmap = new Bitmap(_loc1_.bmp);
         _loc1_.bitmap.smoothing = true;
         _loc1_.clip.addChild(_loc1_.bitmap);
         _loc1_.bitmap.x = _loc2_.x;
         _loc1_.bitmap.y = _loc2_.y;
         if(_loc1_.panelSpecialBitmap)
         {
            _loc1_.panelSpecialBitmap.bitmapData = null;
            if(_loc1_.panelSpecialBitmap.parent)
            {
               _loc1_.panelSpecialBitmap.parent.removeChild(_loc1_.panelSpecialBitmap);
            }
            _loc1_.panelSpecialBitmap = null;
         }
         _loc1_.clip.removeChild(_loc1_.panelHolder);
         if(Boolean(_loc1_.panelSubParts) && _loc1_.panelSubParts.length > 0)
         {
            _loc5_ = 0;
            while(_loc5_ < _loc1_.panelSubParts.length)
            {
               if(_loc1_.panelSubParts[_loc5_].parent)
               {
                  _loc1_.panelSubParts[_loc5_].parent.removeChild(_loc1_.panelSubParts[_loc5_]);
               }
               _loc1_.panelSubParts[_loc5_] = null;
               _loc5_++;
            }
         }
         var _loc4_:int = 0;
         while(_loc4_ < _loc1_.panelParts.length)
         {
            if(_loc1_.panelParts[_loc4_].parent)
            {
               _loc1_.panelParts[_loc4_].parent.removeChild(_loc1_.panelParts[_loc4_]);
            }
            _loc1_.panelParts[_loc4_] = null;
            _loc4_++;
         }
         if(_loc1_.specialCover)
         {
            if(_loc1_.specialCover.parent)
            {
               _loc1_.specialCover.parent.removeChild(_loc1_.specialCover);
            }
            _loc1_.specialCover = null;
         }
         _loc1_.panelParts = null;
         _loc1_.panelHolder = null;
         _loc1_.panelSubParts = null;
         _loc1_.clip.number_txt.visible = true;
         _loc1_.clip.setChildIndex(_loc1_.clip.number_txt,_loc1_.clip.numChildren - 1);
      }
      
      public function destroy() : void
      {
         var ob:Ticket = this;
         if(Boolean(ob.bitmap) && ob.clip.contains(ob.bitmap))
         {
            ob.clip.removeChild(ob.bitmap);
         }
         ob.bitmap = null;
         if(ob.bmp != null)
         {
            ob.bmp.dispose();
            ob.bmp = null;
         }
         if(ob.specialCover != null)
         {
            if(ob.specialCover.parent)
            {
               ob.specialCover.parent.removeChild(ob.specialCover);
            }
            ob.specialCover = null;
         }
         if(ob.panelSpecialBitmap)
         {
            ob.panelSpecialBitmap.bitmapData = null;
            if(ob.panelSpecialBitmap.parent)
            {
               ob.panelSpecialBitmap.parent.removeChild(ob.panelSpecialBitmap);
            }
            ob.panelSpecialBitmap = null;
         }
         ob.orderData = null;
         ob.order = null;
         ob.clip.removeEventListener(MouseEvent.MOUSE_DOWN,ob.clickTicket);
         try
         {
            if(ob.clip.parent.contains(ob.clip))
            {
               ob.clip.parent.removeChild(ob.clip);
            }
         }
         catch(err:Error)
         {
            class_6.error("Error removing ticket from parent");
         }
         ob.clip = null;
      }
      
      public function canClickInTraining(param1:Event) : Boolean
      {
         var _loc2_:Ticket = this;
         var _loc3_:class_5 = _loc2_.gameObj;
         var _loc4_:Boolean = false;
         if(_loc3_.training)
         {
            if(_loc3_.method_105(34))
            {
               _loc4_ = true;
            }
         }
         else
         {
            _loc4_ = true;
         }
         return _loc4_;
      }
   }
}

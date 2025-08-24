package sushiGame.screens
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.events.*;
   import flash.geom.Rectangle;
   import package_2.class_6;
   import package_4.class_5;
   import sushiGame.data.CustomerData;
   import sushiGame.data.GameData;
   import sushiGame.data.UserData;
   import sushiGame.models.CustomerPage;
   
   public class CustomerScreen
   {
       
      
      public var gameObj:class_5;
      
      public var container:MovieClip = null;
      
      public var params:Object = null;
      
      public var inMenu:Boolean = false;
      
      private var currentCustomer:Number = -1;
      
      private var thumbIndex:Number = -1;
      
      private var customerScrollStart:Number = 125;
      
      private var customerScrollRange:Number = 191;
      
      private var customerScrollDir:Number = 0;
      
      private var cookbookMode:String = "recipe";
      
      private var customerSortMode:String = "abc";
      
      private var customerThumbClips:Vector.<MovieClip> = null;
      
      private var customerThumbBitmaps:Vector.<Bitmap> = null;
      
      private var customerThumbBMPs:Vector.<BitmapData> = null;
      
      private var customerThumbCustomerIndexes:Vector.<Number> = null;
      
      private var customerScrollAreaStart:Number = 91;
      
      private var customerScrollAreaHeight:Number = 260;
      
      private var customerPage:CustomerPage = null;
      
      private var lastCustomerPage:CustomerPage = null;
      
      public var clip:MovieClip;
      
      public var isClosing:Boolean = false;
      
      public var anyChanges:Boolean = false;
      
      public var lastClickedValue:* = null;
      
      public var trainingClip:MovieClip = null;
      
      public var whichContextTraining:String = "none";
      
      public var didAdjustIcons:Boolean = false;
      
      public var anyGiftBoxes:Boolean = false;
      
      public function CustomerScreen(param1:class_5, param2:MovieClip, param3:Object = null)
      {
         super();
         var _loc4_:CustomerScreen;
         (_loc4_ = this).gameObj = param1;
         _loc4_.container = param2;
         _loc4_.params = param3;
         if(param3 != null)
         {
            class_6.method_1("Customer Screen in Menu");
            if(param3.hasOwnProperty("inMenu"))
            {
               _loc4_.inMenu = param3.inMenu;
            }
         }
         _loc4_.setupScreen();
      }
      
      public function setupScreen() : void
      {
         var _loc1_:CustomerScreen = this;
         _loc1_.clip = new customerScreenMC();
         _loc1_.container.addChild(_loc1_.clip);
         _loc1_.clip.addEventListener(Event.ENTER_FRAME,_loc1_.updateScreen);
         var _loc3_:Number = _loc1_.populateCustomerThumbs(true,true);
         _loc1_.clip.up_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickCustomerArrow);
         _loc1_.clip.down_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickCustomerArrow);
         _loc1_.clip.drag_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickCustomerDragger);
         _loc1_.clip.drag_btn.addEventListener(MouseEvent.ROLL_OVER,_loc1_.rolloverCustomerDragger);
         _loc1_.clip.drag_btn.addEventListener(MouseEvent.ROLL_OUT,_loc1_.rolloutCustomerDragger);
         _loc1_.clip.drag_btn.buttonMode = true;
         _loc1_.clip.drag_btn.useHandCursor = true;
         _loc1_.clip.drag_btn.gotoAndStop(1);
         _loc1_.clip.left_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickThumbPrevious);
         _loc1_.clip.right_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickThumbNext);
         _loc1_.clip.sort_abc.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickCustomerSortMode);
         _loc1_.clip.sort_new.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickCustomerSortMode);
         _loc1_.clip.sort_stickers.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickCustomerSortMode);
         _loc1_.clip.sort_stars.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickCustomerSortMode);
         _loc1_.clip.sort_abc.gotoAndStop(1);
         _loc1_.clip.sort_new.gotoAndStop(2);
         _loc1_.clip.sort_stickers.gotoAndStop(2);
         _loc1_.clip.sort_stars.gotoAndStop(2);
         _loc1_.clip.pageturn.gotoAndStop(1);
         _loc1_.clip.pageturnmask.gotoAndStop(1);
         _loc1_.clip.flipholder.mask = _loc1_.clip.pageturnmask;
         if(_loc3_ == 0)
         {
            _loc1_.showCustomerDetails(-1);
         }
         else
         {
            _loc1_.showCustomerDetails(_loc1_.customerThumbClips[0].customerIndex);
            _loc1_.lastClickedValue = _loc1_.customerThumbClips[0].customerIndex;
            _loc1_.thumbIndex = 0;
         }
         _loc1_.container.addEventListener("clickContinue",_loc1_.clickContinue);
         if(_loc1_.inMenu)
         {
            _loc1_.clip.fader.stop();
            _loc1_.clip.fader.visible = false;
         }
         else
         {
            _loc1_.gameObj.var_128.switchMusic("order");
         }
         _loc1_.gameObj.var_130.api.addEventListener("earnedSticker",_loc1_.onEarnedSticker);
      }
      
      public function addToContainer() : void
      {
         var screen:CustomerScreen = this;
         try
         {
            if(Boolean(screen.container) && Boolean(screen.clip) && !screen.container.contains(screen.clip))
            {
               screen.container.addChild(screen.clip);
            }
         }
         catch(err:Error)
         {
            class_6.error("Error adding subscreen to container: " + err.message);
         }
         if(screen.anyGiftBoxes && screen.gameObj.var_127.hasTrained("stickersort") == false && screen.whichContextTraining != "stickergivegift")
         {
            screen.showContextTraining("stickersort");
         }
         else if(screen.gameObj.var_127.hasTrained("givecoupon") == false && screen.gameObj.var_127.numCoupons > 0 && screen.gameObj.var_131.isCloser(Number(screen.lastClickedValue)) == false)
         {
            screen.showContextTraining("givecoupon");
            screen.gameObj.var_127.setTrained("givecoupon");
         }
      }
      
      public function removeFromContainer() : void
      {
         var screen:CustomerScreen = this;
         try
         {
            if(Boolean(screen.container) && Boolean(screen.clip) && screen.container.contains(screen.clip))
            {
               screen.container.removeChild(screen.clip);
            }
         }
         catch(err:Error)
         {
            class_6.error("Error adding subscreen to container: " + err.message);
         }
      }
      
      public function destroy() : void
      {
         var _loc1_:CustomerScreen = this;
         class_6.method_1("(Destroy Customer Menu)");
         _loc1_.clip.removeEventListener(Event.ENTER_FRAME,_loc1_.updateScreen);
         _loc1_.removeContextTraining();
         _loc1_.removeCustomerThumbs();
         _loc1_.customerThumbClips = null;
         _loc1_.gameObj.var_130.api.removeEventListener("earnedSticker",_loc1_.onEarnedSticker);
         _loc1_.clip.up_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickCustomerArrow);
         _loc1_.clip.down_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickCustomerArrow);
         _loc1_.clip.drag_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickCustomerDragger);
         _loc1_.clip.drag_btn.removeEventListener(MouseEvent.ROLL_OVER,_loc1_.rolloverCustomerDragger);
         _loc1_.clip.drag_btn.removeEventListener(MouseEvent.ROLL_OUT,_loc1_.rolloutCustomerDragger);
         _loc1_.clip.left_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickThumbPrevious);
         _loc1_.clip.right_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickThumbNext);
         _loc1_.clip.sort_abc.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickCustomerSortMode);
         _loc1_.clip.sort_new.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickCustomerSortMode);
         _loc1_.clip.sort_stickers.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickCustomerSortMode);
         _loc1_.clip.sort_stars.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickCustomerSortMode);
         if(_loc1_.customerPage)
         {
            _loc1_.customerPage.destroy();
            _loc1_.customerPage = null;
         }
         if(_loc1_.lastCustomerPage)
         {
            _loc1_.lastCustomerPage.destroy();
            _loc1_.lastCustomerPage = null;
         }
         _loc1_.container.removeEventListener("clickContinue",_loc1_.clickContinue);
         if(_loc1_.clip)
         {
            if(_loc1_.clip.parent)
            {
               _loc1_.clip.parent.removeChild(_loc1_.clip);
            }
         }
         _loc1_.container = null;
         _loc1_.clip = null;
      }
      
      public function clickCustomerSortMode(param1:MouseEvent, param2:String = null) : void
      {
         var _loc4_:Number = NaN;
         var _loc3_:CustomerScreen = this;
         _loc3_.gameObj.var_128.playSound("buttonclick.wav");
         if(param2 != null)
         {
            _loc3_.customerSortMode = param2;
         }
         else if(param1.currentTarget == _loc3_.clip.sort_abc)
         {
            _loc3_.customerSortMode = "abc";
         }
         else if(param1.currentTarget == _loc3_.clip.sort_new)
         {
            _loc3_.customerSortMode = "new";
         }
         else if(param1.currentTarget == _loc3_.clip.sort_stickers)
         {
            _loc3_.customerSortMode = "stickers";
         }
         else if(param1.currentTarget == _loc3_.clip.sort_stars)
         {
            _loc3_.customerSortMode = "stars";
         }
         _loc3_.clip.sort_abc.gotoAndStop(2);
         _loc3_.clip.sort_new.gotoAndStop(2);
         _loc3_.clip.sort_stickers.gotoAndStop(2);
         _loc3_.clip.sort_stars.gotoAndStop(2);
         _loc3_.clip["sort_" + _loc3_.customerSortMode].gotoAndStop(1);
         _loc3_.populateCustomerThumbs(true);
         try
         {
            if((_loc4_ = _loc3_.customerThumbCustomerIndexes.indexOf(_loc3_.currentCustomer)) > -1)
            {
               _loc3_.thumbIndex = _loc4_;
            }
         }
         catch(err:Error)
         {
         }
      }
      
      public function clickCustomerArrow(param1:MouseEvent) : void
      {
         var _loc2_:CustomerScreen = this;
         var _loc3_:String = String(param1.currentTarget.name);
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         if(_loc3_ == "up_btn")
         {
            _loc2_.customerScrollDir = -1;
         }
         else if(_loc3_ == "down_btn")
         {
            _loc2_.customerScrollDir = 1;
         }
         _loc2_.clip.scrollarea.addEventListener(Event.ENTER_FRAME,_loc2_.holdCustomerArrow);
         _loc2_.gameObj.stage.addEventListener(MouseEvent.MOUSE_UP,_loc2_.releaseCustomerArrow);
      }
      
      public function releaseCustomerArrow(param1:MouseEvent) : void
      {
         var _loc2_:CustomerScreen = this;
         _loc2_.customerScrollDir = 0;
         _loc2_.clip.scrollarea.removeEventListener(Event.ENTER_FRAME,_loc2_.holdCustomerArrow);
         _loc2_.gameObj.stage.removeEventListener(MouseEvent.MOUSE_UP,_loc2_.releaseCustomerArrow);
      }
      
      public function holdCustomerArrow(param1:Event) : void
      {
         var _loc2_:CustomerScreen = this;
         var _loc3_:Number = _loc2_.customerScrollAreaStart;
         var _loc4_:Number = _loc3_ - (_loc2_.clip.scrollarea.height - _loc2_.customerScrollAreaHeight);
         if(_loc2_.customerScrollDir == 1)
         {
            _loc2_.clip.scrollarea.y -= 8;
         }
         else if(_loc2_.customerScrollDir == -1)
         {
            _loc2_.clip.scrollarea.y += 8;
         }
         if(_loc2_.clip.scrollarea.y < _loc4_)
         {
            _loc2_.clip.scrollarea.y = _loc4_;
            _loc2_.customerScrollDir = 0;
         }
         else if(_loc2_.clip.scrollarea.y > _loc3_)
         {
            _loc2_.clip.scrollarea.y = _loc3_;
            _loc2_.customerScrollDir = 0;
         }
         var _loc5_:Number = Math.abs((_loc2_.clip.scrollarea.y - _loc3_) / (_loc4_ - _loc3_));
         _loc2_.clip.drag_btn.y = _loc2_.customerScrollStart + _loc5_ * _loc2_.customerScrollRange;
      }
      
      public function showCustomerDetails(param1:Number, param2:Boolean = false) : void
      {
         var _loc3_:CustomerScreen = this;
         if(_loc3_.whichContextTraining == "customeroutfit" || _loc3_.whichContextTraining == "visittoday" || _loc3_.whichContextTraining == "visittomorrow" || _loc3_.whichContextTraining == "givecoupon")
         {
            _loc3_.removeContextTraining();
         }
         if(_loc3_.lastCustomerPage)
         {
            _loc3_.lastCustomerPage.destroy();
            _loc3_.lastCustomerPage = null;
         }
         if(_loc3_.customerPage)
         {
            _loc3_.lastCustomerPage = _loc3_.customerPage;
            _loc3_.lastCustomerPage.setContainer(_loc3_.clip.flipholder);
         }
         if(_loc3_.customerPage != null)
         {
            _loc3_.clip.pageturn.gotoAndPlay(2);
            _loc3_.clip.pageturnmask.gotoAndPlay(2);
         }
         _loc3_.customerPage = new CustomerPage(_loc3_.gameObj,_loc3_,_loc3_.clip.pageholder,param1);
         _loc3_.currentCustomer = param1;
         if(param2 && _loc3_.gameObj.var_127.hasTrained("givecoupon") == false && _loc3_.gameObj.var_127.numCoupons > 0 && _loc3_.gameObj.var_131.isCloser(_loc3_.currentCustomer) == false)
         {
            _loc3_.showContextTraining("givecoupon");
            _loc3_.gameObj.var_127.setTrained("givecoupon");
         }
      }
      
      public function rolloverCustomerDragger(param1:MouseEvent) : void
      {
         var _loc2_:CustomerScreen = this;
         _loc2_.clip.drag_btn.gotoAndStop(2);
      }
      
      public function rolloutCustomerDragger(param1:MouseEvent) : void
      {
         var _loc2_:CustomerScreen = this;
         _loc2_.clip.drag_btn.gotoAndStop(1);
      }
      
      public function clickCustomerDragger(param1:MouseEvent) : void
      {
         var _loc2_:CustomerScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.clip.drag_btn.startDrag(false,new Rectangle(_loc2_.clip.drag_btn.x,_loc2_.customerScrollStart,0,_loc2_.customerScrollRange));
         _loc2_.clip.drag_btn.addEventListener(Event.ENTER_FRAME,_loc2_.dragCustomerDragger);
         _loc2_.gameObj.stage.addEventListener(MouseEvent.MOUSE_UP,_loc2_.releaseCustomerDragger);
      }
      
      public function dragCustomerDragger(param1:Event) : void
      {
         var _loc2_:CustomerScreen = this;
         var _loc3_:Number = (_loc2_.clip.drag_btn.y - _loc2_.customerScrollStart) / _loc2_.customerScrollRange;
         _loc2_.clip.scrollarea.y = Math.round(_loc2_.customerScrollAreaStart - (_loc2_.clip.scrollarea.height - _loc2_.customerScrollAreaHeight) * _loc3_);
      }
      
      public function releaseCustomerDragger(param1:MouseEvent) : void
      {
         var _loc2_:CustomerScreen = this;
         _loc2_.gameObj.stage.removeEventListener(MouseEvent.MOUSE_UP,_loc2_.releaseCustomerDragger);
         _loc2_.clip.drag_btn.removeEventListener(Event.ENTER_FRAME,_loc2_.dragCustomerDragger);
         _loc2_.clip.drag_btn.stopDrag();
      }
      
      public function populateCustomerThumbs(param1:Boolean = false, param2:Boolean = false) : Number
      {
         var _loc7_:int = 0;
         var _loc15_:Number = NaN;
         var _loc16_:String = null;
         null;
         var _loc18_:Boolean = false;
         var _loc19_:BitmapData = null;
         var _loc20_:Bitmap = null;
         var _loc21_:MovieClip = null;
         var _loc22_:Number = NaN;
         var _loc23_:String = null;
         var _loc24_:Number = NaN;
         var _loc25_:Number = NaN;
         var _loc26_:Number = NaN;
         var _loc27_:Number = NaN;
         var _loc28_:Number = NaN;
         var _loc29_:MovieClip = null;
         var _loc3_:CustomerScreen = this;
         var _loc4_:GameData = _loc3_.gameObj.var_132;
         var _loc5_:UserData = _loc3_.gameObj.var_127;
         var _loc6_:CustomerData = _loc3_.gameObj.var_131;
         var _loc8_:Number = 0;
         var _loc9_:Number = 0;
         0;
         _loc3_.removeCustomerThumbs();
         _loc3_.customerThumbClips = new Vector.<MovieClip>();
         _loc3_.customerThumbBitmaps = new Vector.<Bitmap>();
         _loc3_.customerThumbBMPs = new Vector.<BitmapData>();
         _loc3_.customerThumbCustomerIndexes = new Vector.<Number>();
         4;
         52;
         52;
         var _loc14_:Array;
         _loc9_ = (_loc14_ = _loc6_.getCustomersForMenu(_loc3_.customerSortMode)).length;
         class_6.method_1("Setup Customer Thumbs: " + _loc9_ + " items.");
         _loc3_.anyGiftBoxes = false;
         _loc7_ = 0;
         while(_loc7_ < _loc9_)
         {
            _loc15_ = Number(_loc14_[_loc7_].idx);
            _loc16_ = _loc6_.getCustomerClipName(_loc15_);
            _loc18_ = true;
            if(_loc5_.customersUnlocked[_loc15_] == 1 && (_loc5_.customerFirstVisit[_loc15_] > 1 || _loc5_.customerVisits[_loc15_] > 0))
            {
               _loc18_ = true;
            }
            else
            {
               _loc18_ = false;
            }
            _loc19_ = _loc3_.gameObj.var_131.getCustomerBitmap(_loc15_,!_loc18_);
            _loc20_ = new Bitmap(_loc19_,"auto",true);
            (_loc21_ = new menu_customer_thumb()).inside.addChild(_loc20_);
            _loc21_.customerIndex = _loc15_;
            _loc21_.thumbIndex = _loc7_;
            if((_loc22_ = Number(_loc14_[_loc7_].stars)) >= 15)
            {
               _loc21_.star.gotoAndStop(4);
            }
            else if(_loc22_ >= 10)
            {
               _loc21_.star.gotoAndStop(3);
            }
            else if(_loc22_ >= 5)
            {
               _loc21_.star.gotoAndStop(2);
            }
            else
            {
               _loc21_.star.stop();
               _loc21_.star.visible = false;
            }
            if(_loc14_[_loc7_].stickers >= 3 && _loc18_)
            {
               _loc21_.sticker.visible = true;
            }
            else
            {
               _loc21_.sticker.visible = false;
            }
            if(_loc14_[_loc7_].alt === false && _loc14_[_loc7_].stickers >= 3)
            {
               if(_loc18_ == false)
               {
                  class_6.method_1("***!!!*** Locked customer with giftbox: " + _loc16_);
                  _loc21_.sticker.gotoAndStop(1);
               }
               else
               {
                  _loc21_.sticker.gotoAndStop(2);
                  _loc3_.anyGiftBoxes = true;
               }
            }
            else
            {
               _loc21_.sticker.gotoAndStop(1);
            }
            _loc21_.btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc3_.clickCustomerLink);
            if(!_loc18_)
            {
               _loc21_.btn.visible = false;
            }
            else
            {
               _loc8_++;
            }
            _loc23_ = _loc6_.getCustomerColor(_loc15_);
            if(!_loc18_)
            {
               _loc23_ = "disabled";
            }
            _loc21_.bg.gotoAndStop(_loc23_);
            _loc21_.edge.gotoAndStop(_loc23_);
            _loc3_.customerThumbClips.push(_loc21_);
            _loc3_.customerThumbBitmaps.push(_loc20_);
            _loc3_.customerThumbBMPs.push(_loc19_);
            if(_loc18_)
            {
               _loc3_.customerThumbCustomerIndexes.push(_loc15_);
            }
            _loc24_ = 3 + Math.floor(_loc7_ / 4) * 52;
            _loc25_ = _loc7_ % 4 * 52;
            _loc21_.x = _loc25_;
            _loc21_.y = _loc24_;
            _loc3_.clip.scrollarea.addChild(_loc21_);
            _loc7_++;
         }
         _loc14_ = null;
         _loc3_.clip.tally_txt.text = _loc8_ + "/" + _loc9_;
         _loc3_.clip.percent_txt.text = Math.floor(_loc8_ / _loc9_ * 100) + "%";
         if(param1)
         {
            _loc3_.clip.scrollarea.y = _loc3_.customerScrollAreaStart;
            _loc3_.clip.drag_btn.y = _loc3_.customerScrollStart;
         }
         if(_loc9_ % 4 != 0)
         {
            _loc26_ = 4 - _loc9_ % 4;
            _loc27_ = 3 + Math.floor((_loc9_ - 1) / 4) * 52;
            _loc28_ = ((_loc9_ - 1) % 4 + 1) * 52;
            _loc7_ = 0;
            while(_loc7_ < 4 - _loc9_ % 4)
            {
               _loc29_ = new menu_customer_thumb_blankslot();
               _loc3_.customerThumbClips.push(_loc29_);
               _loc29_.x = _loc28_ + _loc7_ * 52;
               _loc29_.y = _loc27_;
               _loc3_.clip.scrollarea.addChild(_loc29_);
               _loc7_++;
            }
         }
         return _loc8_;
      }
      
      public function removeCustomerThumbs() : void
      {
         var _loc2_:int = 0;
         var _loc1_:CustomerScreen = this;
         if(_loc1_.customerThumbBitmaps != null && _loc1_.customerThumbBitmaps.length > 0)
         {
            _loc2_ = int(_loc1_.customerThumbBitmaps.length - 1);
            while(_loc2_ >= 0)
            {
               if(_loc1_.customerThumbBitmaps[_loc2_].parent)
               {
                  _loc1_.customerThumbBitmaps[_loc2_].parent.removeChild(_loc1_.customerThumbBitmaps[_loc2_]);
               }
               _loc1_.customerThumbBitmaps[_loc2_] = null;
               _loc1_.customerThumbBitmaps.splice(_loc2_,1);
               _loc2_--;
            }
         }
         _loc1_.customerThumbBitmaps = null;
         if(_loc1_.customerThumbBMPs != null && _loc1_.customerThumbBMPs.length > 0)
         {
            _loc2_ = int(_loc1_.customerThumbBMPs.length - 1);
            while(_loc2_ >= 0)
            {
               if(_loc1_.customerThumbBMPs[_loc2_] != null)
               {
                  _loc1_.customerThumbBMPs[_loc2_].dispose();
               }
               _loc1_.customerThumbBMPs[_loc2_] = null;
               _loc1_.customerThumbBMPs.splice(_loc2_,1);
               _loc2_--;
            }
         }
         _loc1_.customerThumbBMPs = null;
         if(_loc1_.customerThumbClips != null && _loc1_.customerThumbClips.length > 0)
         {
            _loc2_ = int(_loc1_.customerThumbClips.length - 1);
            while(_loc2_ >= 0)
            {
               if(_loc1_.customerThumbClips[_loc2_].parent)
               {
                  _loc1_.customerThumbClips[_loc2_].parent.removeChild(_loc1_.customerThumbClips[_loc2_]);
                  _loc1_.customerThumbClips[_loc2_].removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickCustomerLink);
                  _loc1_.customerThumbClips[_loc2_] = null;
                  _loc1_.customerThumbClips.splice(_loc2_,1);
               }
               _loc2_--;
            }
         }
         _loc1_.customerThumbClips = null;
         _loc1_.customerThumbCustomerIndexes = null;
      }
      
      public function clickThumbNext(param1:MouseEvent) : void
      {
         var _loc3_:Number = NaN;
         var _loc2_:CustomerScreen = this;
         if(_loc2_.thumbIndex != -1)
         {
            _loc3_ = _loc2_.thumbIndex + 1;
            if(_loc2_.customerThumbCustomerIndexes.length > _loc3_)
            {
               _loc2_.showCustomerDetails(_loc2_.customerThumbCustomerIndexes[_loc3_],true);
               _loc2_.thumbIndex = _loc3_;
            }
            else
            {
               _loc2_.showCustomerDetails(_loc2_.customerThumbCustomerIndexes[0],true);
               _loc2_.thumbIndex = 0;
            }
            _loc2_.lastClickedValue = _loc2_.customerThumbCustomerIndexes[_loc2_.thumbIndex];
            _loc2_.gameObj.var_128.playSound("dropticket.wav");
            _loc2_.centerScrollArea();
         }
         else
         {
            _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         }
      }
      
      public function clickThumbPrevious(param1:MouseEvent) : void
      {
         var _loc3_:Number = NaN;
         var _loc2_:CustomerScreen = this;
         if(_loc2_.thumbIndex != -1)
         {
            _loc3_ = _loc2_.thumbIndex - 1;
            if(_loc3_ > 0)
            {
               _loc2_.showCustomerDetails(_loc2_.customerThumbCustomerIndexes[_loc3_],true);
               _loc2_.thumbIndex = _loc3_;
            }
            else
            {
               _loc2_.showCustomerDetails(_loc2_.customerThumbCustomerIndexes[_loc2_.customerThumbCustomerIndexes.length - 1],true);
               _loc2_.thumbIndex = _loc2_.customerThumbCustomerIndexes.length - 1;
            }
            _loc2_.lastClickedValue = _loc2_.customerThumbCustomerIndexes[_loc2_.thumbIndex];
            _loc2_.gameObj.var_128.playSound("dropticket.wav");
            _loc2_.centerScrollArea();
         }
         else
         {
            _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         }
      }
      
      public function centerScrollArea() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc1_:CustomerScreen = this;
         if(_loc1_.thumbIndex != -1)
         {
            _loc2_ = 52;
            _loc3_ = Math.floor(_loc1_.thumbIndex / 4) * _loc2_;
            _loc5_ = (_loc4_ = _loc1_.customerScrollAreaStart) - (_loc1_.clip.scrollarea.height - _loc1_.customerScrollAreaHeight);
            if(_loc3_ + _loc2_ >= _loc1_.customerScrollAreaStart - _loc1_.clip.scrollarea.y + _loc1_.customerScrollAreaHeight)
            {
               class_6.method_1("Off the bottom edge");
               _loc1_.clip.scrollarea.y = 0 - _loc3_ + _loc1_.customerScrollAreaStart + _loc1_.customerScrollAreaHeight - _loc2_;
               if(_loc1_.clip.scrollarea.y < _loc5_)
               {
                  _loc1_.clip.scrollarea.y = _loc5_;
               }
               else if(_loc1_.clip.scrollarea.y > _loc4_)
               {
                  _loc1_.clip.scrollarea.y = _loc4_;
               }
               _loc6_ = Math.abs((_loc1_.clip.scrollarea.y - _loc4_) / (_loc5_ - _loc4_));
               _loc1_.clip.drag_btn.y = _loc1_.customerScrollStart + _loc6_ * _loc1_.customerScrollRange;
            }
            else if(_loc3_ < 0 - _loc1_.clip.scrollarea.y + _loc1_.customerScrollAreaStart)
            {
               class_6.method_1("Off the top edge");
               _loc1_.clip.scrollarea.y = 0 - _loc3_ + _loc1_.customerScrollAreaStart;
               if(_loc1_.clip.scrollarea.y < _loc5_)
               {
                  _loc1_.clip.scrollarea.y = _loc5_;
               }
               else if(_loc1_.clip.scrollarea.y > _loc4_)
               {
                  _loc1_.clip.scrollarea.y = _loc4_;
               }
               _loc6_ = Math.abs((_loc1_.clip.scrollarea.y - _loc4_) / (_loc5_ - _loc4_));
               _loc1_.clip.drag_btn.y = _loc1_.customerScrollStart + _loc6_ * _loc1_.customerScrollRange;
            }
         }
      }
      
      public function clickCustomerLink(param1:MouseEvent) : void
      {
         var _loc2_:CustomerScreen = this;
         var _loc3_:Number = Number(MovieClip(param1.currentTarget.parent).customerIndex);
         var _loc4_:Number = Number(MovieClip(param1.currentTarget.parent).thumbIndex);
         class_6.method_1("Click link for " + _loc3_);
         if(_loc2_.lastClickedValue != _loc3_)
         {
            _loc2_.showCustomerDetails(_loc3_,true);
            _loc2_.lastClickedValue = _loc3_;
            _loc2_.thumbIndex = _loc4_;
            _loc2_.gameObj.var_128.playSound("dropticket.wav");
         }
      }
      
      public function clickContinue(param1:Event) : void
      {
         var _loc2_:CustomerScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.clip.fader.gotoAndPlay("quickfadeout");
         _loc2_.isClosing = true;
      }
      
      public function updateScreen(param1:Event) : void
      {
         var _loc2_:CustomerScreen = this;
         if(_loc2_.isClosing)
         {
            if(_loc2_.clip.fader.currentFrame == _loc2_.clip.fader.totalFrames)
            {
               _loc2_.gameObj.method_118();
               _loc2_.gameObj.method_272();
            }
         }
         else if(!_loc2_.didAdjustIcons)
         {
            _loc2_.adjustIcons();
            _loc2_.didAdjustIcons = true;
         }
      }
      
      public function adjustIcons() : void
      {
         var _loc1_:CustomerScreen = this;
         if(_loc1_.anyGiftBoxes)
         {
            _loc1_.gameObj.var_130.api.setButtonIcon("all","(Customers)","menuicon_giftbox");
            _loc1_.gameObj.var_130.api.setButtonIcon("all","CUSTOMERS","menuicon_giftbox");
         }
         else
         {
            _loc1_.gameObj.var_130.api.setButtonIcon("all","(Customers)","menuicon_customers");
            _loc1_.gameObj.var_130.api.setButtonIcon("all","CUSTOMERS","menuicon_customers");
         }
      }
      
      public function showContextTraining(param1:String) : void
      {
         var _loc2_:CustomerScreen = this;
         if(!_loc2_.trainingClip)
         {
            _loc2_.trainingClip = new trainingMC();
            _loc2_.clip.addChild(_loc2_.trainingClip);
            _loc2_.trainingClip.mouseEnabled = false;
            _loc2_.trainingClip.mouseChildren = false;
         }
         _loc2_.whichContextTraining = param1;
         _loc2_.trainingClip.gotoAndStop(param1);
      }
      
      public function removeContextTraining() : void
      {
         var _loc1_:CustomerScreen = this;
         if(_loc1_.trainingClip)
         {
            _loc1_.clip.removeChild(_loc1_.trainingClip);
            _loc1_.trainingClip = null;
         }
         _loc1_.whichContextTraining = "none";
      }
      
      public function onEarnedSticker(param1:Event) : void
      {
         var _loc2_:CustomerScreen = this;
         _loc2_.populateCustomerThumbs();
         _loc2_.showCustomerDetails(_loc2_.lastClickedValue);
         _loc2_.adjustIcons();
      }
   }
}

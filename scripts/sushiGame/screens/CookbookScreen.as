package sushiGame.screens
{
   import flash.display.MovieClip;
   import flash.events.*;
   import flash.geom.Rectangle;
   import package_2.class_12;
   import package_2.class_6;
   import package_4.class_5;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   import sushiGame.data.SpecialItem;
   import sushiGame.data.UserData;
   import sushiGame.models.CookbookPage;
   
   public class CookbookScreen
   {
       
      
      public var gameObj:class_5;
      
      public var container:MovieClip = null;
      
      public var params:Object = null;
      
      public var inMenu:Boolean = false;
      
      private var cookbookIndex:Number = -1;
      
      private var cookbookScrollStart:Number = 125;
      
      private var cookbookScrollRange:Number = 191;
      
      private var cookbookScrollDir:Number = 0;
      
      private var cookbookMode:String = "recipe";
      
      private var cookbookSortMode:String = "abc";
      
      private var cookbookLinks:Vector.<MovieClip> = null;
      
      private var cookbookScrollAreaStart:Number = 91;
      
      private var cookbookScrollAreaHeight:Number = 260;
      
      private var cookbookPage:CookbookPage = null;
      
      private var lastCookbookPage:CookbookPage = null;
      
      public var clip:MovieClip;
      
      public var isClosing:Boolean = false;
      
      public var anyChanges:Boolean = false;
      
      public var lastClickedValue:* = null;
      
      public var trainingClip:MovieClip = null;
      
      public var whichContextTraining:String = "none";
      
      public function CookbookScreen(param1:class_5, param2:MovieClip, param3:Object = null)
      {
         super();
         var _loc4_:CookbookScreen;
         (_loc4_ = this).gameObj = param1;
         _loc4_.container = param2;
         _loc4_.params = param3;
         if(param3 != null)
         {
            class_6.method_1("Cookbook in Menu");
            if(param3.hasOwnProperty("inMenu"))
            {
               _loc4_.inMenu = param3.inMenu;
            }
         }
         _loc4_.setupScreen();
      }
      
      public function setupScreen() : void
      {
         var i:int = 0;
         var screen:CookbookScreen = this;
         screen.clip = new cookbookScreenMC();
         screen.container.addChild(screen.clip);
         screen.clip.addEventListener(Event.ENTER_FRAME,screen.updateScreen);
         screen.cookbookLinks = new Vector.<MovieClip>();
         screen.populateCookbookLinks(true,true);
         screen.clip.up_btn.addEventListener(MouseEvent.MOUSE_DOWN,screen.clickCookbookArrow);
         screen.clip.down_btn.addEventListener(MouseEvent.MOUSE_DOWN,screen.clickCookbookArrow);
         screen.clip.drag_btn.addEventListener(MouseEvent.MOUSE_DOWN,screen.clickCookbookDragger);
         screen.clip.drag_btn.addEventListener(MouseEvent.ROLL_OVER,screen.rolloverCookbookDragger);
         screen.clip.drag_btn.addEventListener(MouseEvent.ROLL_OUT,screen.rolloutCookbookDragger);
         screen.clip.drag_btn.buttonMode = true;
         screen.clip.drag_btn.useHandCursor = true;
         screen.clip.drag_btn.gotoAndStop(1);
         screen.clip.recipe_btn.addEventListener(MouseEvent.MOUSE_DOWN,screen.clickCookbookRecipes);
         screen.clip.ingredient_btn.addEventListener(MouseEvent.MOUSE_DOWN,screen.clickCookbookIngredients);
         screen.clip.recipe_btn.gotoAndStop(2);
         screen.clip.ingredient_btn.gotoAndStop(1);
         screen.clip.sort_abc.addEventListener(MouseEvent.MOUSE_DOWN,screen.clickCookbookSortMode);
         screen.clip.sort_new.addEventListener(MouseEvent.MOUSE_DOWN,screen.clickCookbookSortMode);
         screen.clip.sort_holiday.addEventListener(MouseEvent.MOUSE_DOWN,screen.clickCookbookSortMode);
         screen.clip.sort_abc.gotoAndStop(1);
         screen.clip.sort_new.gotoAndStop(2);
         screen.clip.sort_holiday.gotoAndStop(2);
         screen.clip.pageturn.gotoAndStop(1);
         screen.clip.pageturnmask.gotoAndStop(1);
         screen.clip.flipholder.mask = screen.clip.pageturnmask;
         try
         {
            if(screen.gameObj.var_127.currentSpecial > -1)
            {
               screen.showCookbookSpecial(screen.gameObj.var_127.currentSpecial);
            }
            else
            {
               screen.showCookbookSpecial(-1);
            }
         }
         catch(err:Error)
         {
            class_6.error("Error showing the initial special: " + err.message);
         }
         screen.container.addEventListener("clickContinue",screen.clickContinue);
         if(screen.inMenu)
         {
            screen.clip.fader.stop();
            screen.clip.fader.visible = false;
            screen.clip.options.visible = false;
         }
         else
         {
            screen.gameObj.var_128.switchMusic("order");
            if(screen.gameObj.var_127.hasBonus("specialsign"))
            {
               screen.clip.options.visible = true;
               screen.clip.options.yes_btn.addEventListener(MouseEvent.MOUSE_DOWN,screen.clickShowSignYes);
               screen.clip.options.no_btn.addEventListener(MouseEvent.MOUSE_DOWN,screen.clickShowSignNo);
               if(screen.gameObj.var_127.showSpecialSign === 1)
               {
                  screen.clip.options.yes_btn.gotoAndStop(1);
                  screen.clip.options.no_btn.gotoAndStop(2);
               }
               else
               {
                  screen.clip.options.yes_btn.gotoAndStop(2);
                  screen.clip.options.no_btn.gotoAndStop(1);
               }
            }
            else
            {
               screen.clip.options.visible = false;
            }
         }
         if(!screen.inMenu && screen.gameObj.var_127.hasTrained("listspecial") == false && screen.gameObj.var_127.currentSpecial == -1 && screen.gameObj.var_127.hasAnySpecials() == true)
         {
            screen.showContextTraining("listspecial");
         }
      }
      
      public function addToContainer() : void
      {
         var screen:CookbookScreen = this;
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
         screen.gameObj.var_130.api.method_132("updateSpecial");
      }
      
      public function removeFromContainer() : void
      {
         var screen:CookbookScreen = this;
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
         if(screen.whichContextTraining == "bonusspecial")
         {
            screen.removeContextTraining();
         }
      }
      
      public function clickShowSignYes(param1:MouseEvent) : void
      {
         var _loc2_:CookbookScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.gameObj.var_127.showSpecialSign = 1;
         _loc2_.clip.options.yes_btn.gotoAndStop(1);
         _loc2_.clip.options.no_btn.gotoAndStop(2);
         _loc2_.anyChanges = true;
      }
      
      public function clickShowSignNo(param1:MouseEvent) : void
      {
         var _loc2_:CookbookScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.gameObj.var_127.showSpecialSign = 0;
         _loc2_.clip.options.yes_btn.gotoAndStop(2);
         _loc2_.clip.options.no_btn.gotoAndStop(1);
         _loc2_.anyChanges = true;
      }
      
      public function destroy() : void
      {
         var _loc1_:CookbookScreen = this;
         class_6.method_1("(Destroy Cookbook)");
         if(this.anyChanges == true && _loc1_.inMenu === false)
         {
            class_6.info("SAVE SPECIAL DATA");
            _loc1_.gameObj.var_127.saveSpecialData();
         }
         _loc1_.clip.removeEventListener(Event.ENTER_FRAME,_loc1_.updateScreen);
         _loc1_.removeContextTraining();
         _loc1_.removeCookbookLinks();
         _loc1_.cookbookLinks = null;
         _loc1_.clip.options.yes_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickShowSignYes);
         _loc1_.clip.options.no_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickShowSignNo);
         _loc1_.clip.up_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickCookbookArrow);
         _loc1_.clip.down_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickCookbookArrow);
         _loc1_.clip.drag_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickCookbookDragger);
         _loc1_.clip.drag_btn.removeEventListener(MouseEvent.ROLL_OVER,_loc1_.rolloverCookbookDragger);
         _loc1_.clip.drag_btn.removeEventListener(MouseEvent.ROLL_OUT,_loc1_.rolloutCookbookDragger);
         _loc1_.clip.recipe_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickCookbookRecipes);
         _loc1_.clip.ingredient_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickCookbookIngredients);
         _loc1_.clip.sort_abc.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickCookbookSortMode);
         _loc1_.clip.sort_new.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickCookbookSortMode);
         _loc1_.clip.sort_holiday.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickCookbookSortMode);
         if(_loc1_.cookbookPage)
         {
            _loc1_.cookbookPage.destroy();
            _loc1_.cookbookPage = null;
         }
         if(_loc1_.lastCookbookPage)
         {
            _loc1_.lastCookbookPage.destroy();
            _loc1_.lastCookbookPage = null;
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
      
      public function clickCookbookSortMode(param1:MouseEvent, param2:String = null) : void
      {
         var _loc3_:CookbookScreen = this;
         _loc3_.gameObj.var_128.playSound("buttonclick.wav");
         if(param2 != null)
         {
            _loc3_.cookbookSortMode = param2;
         }
         else if(param1.currentTarget == _loc3_.clip.sort_abc)
         {
            _loc3_.cookbookSortMode = "abc";
         }
         else if(param1.currentTarget == _loc3_.clip.sort_new)
         {
            _loc3_.cookbookSortMode = "new";
         }
         else if(param1.currentTarget == _loc3_.clip.sort_holiday)
         {
            _loc3_.cookbookSortMode = "holiday";
         }
         _loc3_.clip.sort_abc.gotoAndStop(2);
         _loc3_.clip.sort_new.gotoAndStop(2);
         _loc3_.clip.sort_holiday.gotoAndStop(2);
         _loc3_.clip["sort_" + _loc3_.cookbookSortMode].gotoAndStop(1);
         _loc3_.populateCookbookLinks(true);
      }
      
      public function clickCookbookRecipes(param1:MouseEvent) : void
      {
         var _loc2_:CookbookScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         if(_loc2_.cookbookMode != "recipe")
         {
            _loc2_.cookbookMode = "recipe";
            _loc2_.populateCookbookLinks(true);
            _loc2_.clip.recipe_btn.gotoAndStop(2);
            _loc2_.clip.ingredient_btn.gotoAndStop(1);
         }
      }
      
      public function clickCookbookIngredients(param1:MouseEvent) : void
      {
         var _loc2_:CookbookScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         if(_loc2_.cookbookMode != "ingredient")
         {
            _loc2_.cookbookMode = "ingredient";
            _loc2_.populateCookbookLinks(true);
            _loc2_.clip.recipe_btn.gotoAndStop(1);
            _loc2_.clip.ingredient_btn.gotoAndStop(2);
         }
         if(_loc2_.whichContextTraining == "bonusspecial")
         {
            _loc2_.removeContextTraining();
         }
      }
      
      public function clickCookbookArrow(param1:MouseEvent) : void
      {
         var _loc2_:CookbookScreen = this;
         var _loc3_:String = String(param1.currentTarget.name);
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         if(_loc3_ == "up_btn")
         {
            _loc2_.cookbookScrollDir = -1;
         }
         else if(_loc3_ == "down_btn")
         {
            _loc2_.cookbookScrollDir = 1;
         }
         _loc2_.clip.scrollarea.addEventListener(Event.ENTER_FRAME,_loc2_.holdCookbookArrow);
         _loc2_.gameObj.stage.addEventListener(MouseEvent.MOUSE_UP,_loc2_.releaseCookbookArrow);
      }
      
      public function releaseCookbookArrow(param1:MouseEvent) : void
      {
         var _loc2_:CookbookScreen = this;
         _loc2_.cookbookScrollDir = 0;
         _loc2_.clip.scrollarea.removeEventListener(Event.ENTER_FRAME,_loc2_.holdCookbookArrow);
         _loc2_.gameObj.stage.removeEventListener(MouseEvent.MOUSE_UP,_loc2_.releaseCookbookArrow);
      }
      
      public function holdCookbookArrow(param1:Event) : void
      {
         var _loc2_:CookbookScreen = this;
         var _loc3_:Number = _loc2_.cookbookScrollAreaStart;
         var _loc4_:Number = _loc3_ - (_loc2_.clip.scrollarea.height - _loc2_.cookbookScrollAreaHeight);
         if(_loc2_.cookbookScrollDir == 1)
         {
            _loc2_.clip.scrollarea.y -= 8;
         }
         else if(_loc2_.cookbookScrollDir == -1)
         {
            _loc2_.clip.scrollarea.y += 8;
         }
         if(_loc2_.clip.scrollarea.y < _loc4_)
         {
            _loc2_.clip.scrollarea.y = _loc4_;
            _loc2_.cookbookScrollDir = 0;
         }
         else if(_loc2_.clip.scrollarea.y > _loc3_)
         {
            _loc2_.clip.scrollarea.y = _loc3_;
            _loc2_.cookbookScrollDir = 0;
         }
         var _loc5_:Number = Math.abs((_loc2_.clip.scrollarea.y - _loc3_) / (_loc4_ - _loc3_));
         _loc2_.clip.drag_btn.y = _loc2_.cookbookScrollStart + _loc5_ * _loc2_.cookbookScrollRange;
      }
      
      public function showCookbookSpecial(param1:Number) : void
      {
         var _loc2_:CookbookScreen = this;
         if(_loc2_.lastCookbookPage)
         {
            _loc2_.lastCookbookPage.destroy();
            _loc2_.lastCookbookPage = null;
         }
         if(_loc2_.cookbookPage)
         {
            _loc2_.lastCookbookPage = _loc2_.cookbookPage;
            _loc2_.lastCookbookPage.setContainer(_loc2_.clip.flipholder);
         }
         if(_loc2_.cookbookPage != null)
         {
            _loc2_.clip.pageturn.gotoAndPlay(2);
            _loc2_.clip.pageturnmask.gotoAndPlay(2);
         }
         _loc2_.cookbookPage = new CookbookPage(_loc2_.gameObj,_loc2_,_loc2_.clip.pageholder,param1);
      }
      
      public function showCookbookIngredient(param1:String) : void
      {
         var _loc2_:CookbookScreen = this;
         if(_loc2_.lastCookbookPage)
         {
            _loc2_.lastCookbookPage.destroy();
            _loc2_.lastCookbookPage = null;
         }
         if(_loc2_.cookbookPage)
         {
            _loc2_.lastCookbookPage = _loc2_.cookbookPage;
            _loc2_.lastCookbookPage.setContainer(_loc2_.clip.flipholder);
         }
         _loc2_.clip.pageturn.gotoAndPlay(2);
         _loc2_.clip.pageturnmask.gotoAndPlay(2);
         _loc2_.cookbookPage = new CookbookPage(_loc2_.gameObj,_loc2_,_loc2_.clip.pageholder,-1,param1);
      }
      
      public function rolloverCookbookDragger(param1:MouseEvent) : void
      {
         var _loc2_:CookbookScreen = this;
         _loc2_.clip.drag_btn.gotoAndStop(2);
      }
      
      public function rolloutCookbookDragger(param1:MouseEvent) : void
      {
         var _loc2_:CookbookScreen = this;
         _loc2_.clip.drag_btn.gotoAndStop(1);
      }
      
      public function clickCookbookDragger(param1:MouseEvent) : void
      {
         var _loc2_:CookbookScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.clip.drag_btn.startDrag(false,new Rectangle(_loc2_.clip.drag_btn.x,_loc2_.cookbookScrollStart,0,_loc2_.cookbookScrollRange));
         _loc2_.clip.drag_btn.addEventListener(Event.ENTER_FRAME,_loc2_.dragCookbookDragger);
         _loc2_.gameObj.stage.addEventListener(MouseEvent.MOUSE_UP,_loc2_.releaseCookbookDragger);
      }
      
      public function dragCookbookDragger(param1:Event) : void
      {
         var _loc2_:CookbookScreen = this;
         var _loc3_:Number = (_loc2_.clip.drag_btn.y - _loc2_.cookbookScrollStart) / _loc2_.cookbookScrollRange;
         _loc2_.clip.scrollarea.y = Math.round(_loc2_.cookbookScrollAreaStart - (_loc2_.clip.scrollarea.height - _loc2_.cookbookScrollAreaHeight) * _loc3_);
      }
      
      public function releaseCookbookDragger(param1:MouseEvent) : void
      {
         var _loc2_:CookbookScreen = this;
         _loc2_.gameObj.stage.removeEventListener(MouseEvent.MOUSE_UP,_loc2_.releaseCookbookDragger);
         _loc2_.clip.drag_btn.removeEventListener(Event.ENTER_FRAME,_loc2_.dragCookbookDragger);
         _loc2_.clip.drag_btn.stopDrag();
      }
      
      public function populateCookbookLinks(param1:Boolean = false, param2:Boolean = false) : void
      {
         var _loc6_:int = 0;
         var _loc10_:Array = null;
         var _loc11_:SpecialItem = null;
         var _loc12_:Number = NaN;
         var _loc13_:MovieClip = null;
         var _loc14_:Array = null;
         var _loc15_:Object = null;
         var _loc16_:MovieClip = null;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc3_:CookbookScreen = this;
         var _loc4_:GameData = _loc3_.gameObj.var_132;
         var _loc5_:UserData = _loc3_.gameObj.var_127;
         var _loc7_:Number = 0;
         var _loc8_:Number = 0;
         var _loc9_:Number = 0;
         _loc3_.removeCookbookLinks();
         if(_loc3_.cookbookMode == "recipe")
         {
            _loc8_ = (_loc10_ = _loc4_.getSpecials(_loc3_.cookbookSortMode)).length;
            _loc6_ = 0;
            while(_loc6_ < _loc10_.length)
            {
               _loc12_ = (_loc11_ = _loc10_[_loc6_]).index;
               (_loc13_ = new menu_cookbook_link()).bg.gotoAndStop(_loc6_ % 2 + 1);
               if(_loc5_.hasSpecial(_loc12_))
               {
                  _loc13_.name_txt.text = _loc11_.title;
                  if(_loc5_.isSpecialViewed(_loc12_))
                  {
                     _loc13_.newlabel.visible = false;
                  }
                  else
                  {
                     _loc13_.newlabel.visible = true;
                     _loc13_.name_txt.textColor = 11101455;
                  }
                  if(_loc5_.getSpecialStars(_loc12_) >= _loc5_.starsToMasterSpecial)
                  {
                     _loc13_.bullet.gotoAndStop(2);
                  }
                  else
                  {
                     _loc13_.bullet.gotoAndStop(1);
                  }
                  if(_loc5_.currentSpecial == _loc12_)
                  {
                     _loc13_.checkmark.visible = true;
                     _loc13_.newlabel.visible = false;
                     _loc13_.name_txt.textColor = 2008576;
                     _loc9_ = _loc6_ * _loc13_.height;
                  }
                  else
                  {
                     _loc13_.checkmark.visible = false;
                  }
                  _loc13_.holiday.stop();
                  _loc13_.holiday.visible = false;
                  _loc13_.buttonMode = true;
                  _loc13_.useHandCursor = true;
                  _loc13_.mouseEnabled = true;
                  _loc13_.specialIndex = _loc12_;
                  _loc13_.addEventListener(MouseEvent.MOUSE_DOWN,_loc3_.clickCookbookLink);
                  _loc13_.x = 0;
                  _loc13_.y = _loc6_ * _loc13_.height;
                  _loc3_.clip.scrollarea.addChild(_loc13_);
                  _loc13_.btn.visible = true;
                  class_12.method_158(_loc13_.name_txt,_loc11_.title);
                  _loc7_++;
               }
               else
               {
                  _loc13_.name_txt.text = "???";
                  _loc13_.checkmark.visible = false;
                  _loc13_.newlabel.visible = false;
                  _loc13_.bullet.gotoAndStop(1);
                  _loc13_.holiday.stop();
                  _loc13_.holiday.visible = false;
                  _loc13_.btn.visible = false;
                  _loc13_.x = 0;
                  _loc13_.y = _loc6_ * _loc13_.height;
                  _loc3_.clip.scrollarea.addChild(_loc13_);
               }
               _loc3_.cookbookLinks.push(_loc13_);
               _loc6_++;
            }
            _loc10_ = null;
         }
         else if(_loc3_.cookbookMode == "ingredient")
         {
            _loc8_ = (_loc14_ = _loc4_.getIngredients(_loc3_.cookbookSortMode)).length;
            _loc6_ = 0;
            while(_loc6_ < _loc14_.length)
            {
               _loc15_ = _loc14_[_loc6_];
               (_loc16_ = new menu_cookbook_link()).bg.gotoAndStop(_loc6_ % 2 + 1);
               if(_loc5_.hasTopping(_loc15_.tag))
               {
                  _loc16_.name_txt.text = _loc15_.title;
                  _loc16_.newlabel.visible = false;
                  _loc16_.bullet.gotoAndStop(1);
                  _loc16_.checkmark.visible = false;
                  if((_loc17_ = FoodData.getHolidayForItem(_loc15_.tag)) > 0 && _loc17_ < 13)
                  {
                     _loc16_.holiday.gotoAndStop(_loc17_);
                  }
                  else
                  {
                     _loc16_.holiday.stop();
                     _loc16_.holiday.visible = false;
                  }
                  _loc16_.buttonMode = true;
                  _loc16_.useHandCursor = true;
                  _loc16_.mouseEnabled = true;
                  _loc16_.tag = _loc15_.tag;
                  _loc16_.addEventListener(MouseEvent.MOUSE_DOWN,_loc3_.clickCookbookLink);
                  _loc16_.x = 0;
                  _loc16_.y = _loc6_ * _loc16_.height;
                  _loc3_.clip.scrollarea.addChild(_loc16_);
                  _loc16_.btn.visible = true;
                  class_12.method_158(_loc16_.name_txt,_loc15_.title);
                  _loc7_++;
               }
               else
               {
                  _loc16_.name_txt.text = "???";
                  _loc16_.checkmark.visible = false;
                  _loc16_.newlabel.visible = false;
                  _loc16_.bullet.gotoAndStop(1);
                  _loc16_.holiday.stop();
                  _loc16_.holiday.visible = false;
                  _loc16_.btn.visible = false;
                  _loc16_.x = 0;
                  _loc16_.y = _loc6_ * _loc16_.height;
                  _loc3_.clip.scrollarea.addChild(_loc16_);
               }
               _loc3_.cookbookLinks.push(_loc16_);
               _loc6_++;
            }
            _loc14_ = null;
         }
         _loc3_.clip.tally_txt.text = _loc7_ + "/" + _loc8_;
         _loc3_.clip.percent_txt.text = Math.floor(_loc7_ / _loc8_ * 100) + "%";
         if(param1)
         {
            _loc3_.clip.scrollarea.y = _loc3_.cookbookScrollAreaStart;
            _loc3_.clip.drag_btn.y = _loc3_.cookbookScrollStart;
         }
         if(param2 && _loc3_.cookbookMode == "recipe" && _loc5_.currentSpecial > -1)
         {
            if(_loc9_ > _loc3_.cookbookScrollAreaHeight - 40)
            {
               _loc19_ = (_loc18_ = _loc3_.cookbookScrollAreaStart) - (_loc3_.clip.scrollarea.height - _loc3_.cookbookScrollAreaHeight);
               _loc3_.clip.scrollarea.y = _loc3_.cookbookScrollAreaStart - _loc9_ + 80;
               if(_loc3_.clip.scrollarea.y < _loc19_)
               {
                  _loc3_.clip.scrollarea.y = _loc19_;
               }
               else if(_loc3_.clip.scrollarea.y > _loc18_)
               {
                  _loc3_.clip.scrollarea.y = _loc18_;
               }
               _loc20_ = Math.abs((_loc3_.clip.scrollarea.y - _loc18_) / (_loc19_ - _loc18_));
               _loc3_.clip.drag_btn.y = _loc3_.cookbookScrollStart + _loc20_ * _loc3_.cookbookScrollRange;
            }
         }
      }
      
      public function removeCookbookLinks() : void
      {
         var _loc2_:int = 0;
         var _loc1_:CookbookScreen = this;
         if(_loc1_.cookbookLinks != null && _loc1_.cookbookLinks.length > 0)
         {
            _loc2_ = int(_loc1_.cookbookLinks.length - 1);
            while(_loc2_ >= 0)
            {
               if(_loc1_.cookbookLinks[_loc2_].parent)
               {
                  _loc1_.cookbookLinks[_loc2_].parent.removeChild(_loc1_.cookbookLinks[_loc2_]);
                  _loc1_.cookbookLinks[_loc2_].removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickCookbookLink);
                  _loc1_.cookbookLinks[_loc2_] = null;
                  _loc1_.cookbookLinks.splice(_loc2_,1);
               }
               _loc2_--;
            }
         }
      }
      
      public function clickCookbookLink(param1:MouseEvent) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:String = null;
         var _loc2_:CookbookScreen = this;
         if(_loc2_.cookbookMode == "recipe")
         {
            _loc3_ = Number(MovieClip(param1.currentTarget).specialIndex);
            class_6.method_1("Click link for " + _loc3_);
            if(_loc2_.lastClickedValue != _loc3_)
            {
               _loc2_.showCookbookSpecial(_loc3_);
               if(_loc2_.gameObj.var_127.isSpecialViewed(_loc3_) == false)
               {
                  _loc2_.gameObj.var_127.setSpecialViewed(_loc3_);
                  MovieClip(param1.currentTarget).newlabel.visible = false;
                  MovieClip(param1.currentTarget).name_txt.textColor = 6710886;
                  _loc2_.anyChanges = true;
               }
               _loc2_.lastClickedValue = _loc3_;
               _loc2_.gameObj.var_128.playSound("dropticket.wav");
               if(_loc2_.whichContextTraining == "listspecial")
               {
                  _loc2_.gameObj.var_127.setTrained("listspecial");
                  _loc2_.removeContextTraining();
               }
               if(!_loc2_.inMenu && _loc2_.gameObj.var_127.hasTrained("setspecial") == false)
               {
                  _loc2_.showContextTraining("setspecial");
               }
            }
         }
         else if(_loc2_.cookbookMode == "ingredient")
         {
            _loc4_ = String(MovieClip(param1.currentTarget).tag);
            class_6.method_1("Click link for " + _loc4_);
            if(_loc2_.lastClickedValue != _loc4_)
            {
               _loc2_.showCookbookIngredient(_loc4_);
               _loc2_.lastClickedValue = _loc4_;
               _loc2_.gameObj.var_128.playSound("dropticket.wav");
            }
         }
         if(_loc2_.whichContextTraining == "bonusspecial")
         {
            _loc2_.removeContextTraining();
         }
      }
      
      public function clickContinue(param1:Event) : void
      {
         var _loc2_:CookbookScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.clip.fader.gotoAndPlay("quickfadeout");
         _loc2_.isClosing = true;
      }
      
      public function updateScreen(param1:Event) : void
      {
         var _loc2_:CookbookScreen = this;
         if(_loc2_.isClosing)
         {
            if(_loc2_.clip.fader.currentFrame == _loc2_.clip.fader.totalFrames)
            {
               _loc2_.gameObj.method_118();
               _loc2_.gameObj.method_239();
            }
         }
      }
      
      public function showContextTraining(param1:String) : void
      {
         var _loc2_:CookbookScreen = this;
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
         var _loc1_:CookbookScreen = this;
         if(_loc1_.trainingClip)
         {
            _loc1_.clip.removeChild(_loc1_.trainingClip);
            _loc1_.trainingClip = null;
         }
         _loc1_.whichContextTraining = "none";
      }
   }
}

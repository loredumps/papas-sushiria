package sushiGame.models
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import package_2.class_6;
   import package_4.class_5;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   import sushiGame.data.SpecialItem;
   import sushiGame.data.UserData;
   import sushiGame.screens.CookbookScreen;
   
   public class CookbookPage
   {
       
      
      public var gameObj:class_5;
      
      public var screen:CookbookScreen;
      
      public var container:MovieClip;
      
      public var specialIndex:Number = -1;
      
      public var ingredientTag:String = null;
      
      public var isSpecial:Boolean = false;
      
      public var clip:MovieClip;
      
      public var logoClip:MovieClip = null;
      
      public var logoBitmap:Bitmap = null;
      
      public var logoBMP:BitmapData = null;
      
      public var panelHolder:MovieClip = null;
      
      public var panelParts:Vector.<MovieClip> = null;
      
      public var orderData:CustomerOrder = null;
      
      public var kernFormat:TextFormat = null;
      
      public function CookbookPage(param1:class_5, param2:CookbookScreen, param3:MovieClip, param4:Number = -1, param5:String = null)
      {
         super();
         this.gameObj = param1;
         this.screen = param2;
         this.kernFormat = new TextFormat();
         this.kernFormat.kerning = true;
         if(param5 != null)
         {
            this.isSpecial = false;
            this.ingredientTag = param5;
            this.setupIngredientPage(param3);
         }
         else
         {
            this.isSpecial = true;
            this.specialIndex = param4;
            this.setupSpecialPage(param3);
         }
      }
      
      public function setContainer(param1:MovieClip) : void
      {
         var _loc2_:CookbookPage = this;
         if(_loc2_.clip != null && param1 != null && param1.contains(_loc2_.clip) == false)
         {
            param1.addChild(_loc2_.clip);
         }
      }
      
      public function setupSpecialPage(param1:MovieClip) : void
      {
         var _loc5_:SpecialItem = null;
         var _loc6_:Number = NaN;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc2_:CookbookPage = this;
         var _loc3_:UserData = _loc2_.gameObj.var_127;
         var _loc4_:GameData = _loc2_.gameObj.var_132;
         if(_loc2_.specialIndex == -1)
         {
            if(_loc3_.hasAnySpecials())
            {
               _loc2_.clip = new menu_cookbook_recipe_blankpage();
            }
            else
            {
               _loc2_.clip = new menu_cookbook_recipe_nopage();
            }
         }
         else
         {
            _loc2_.clip = new menu_cookbook_recipe_page();
            if((_loc5_ = _loc4_.getSpecial(this.specialIndex)) != null)
            {
               _loc2_.clip.title_txt.text = _loc5_.title;
               _loc2_.clip.bonus_txt.text = _loc5_.getBonusString();
               _loc2_.clip.from_txt.text = _loc3_.getSpecialCustomerName(this.specialIndex);
               _loc2_.clip.served_txt.text = _loc3_.getSpecialsServed(this.specialIndex);
               _loc2_.clip.title_txt.setTextFormat(_loc2_.kernFormat);
               _loc2_.clip.bonus_txt.setTextFormat(_loc2_.kernFormat);
               _loc2_.clip.from_txt.setTextFormat(_loc2_.kernFormat);
               _loc2_.clip.served_txt.setTextFormat(_loc2_.kernFormat);
               _loc6_ = _loc3_.getSpecialStars(this.specialIndex);
               _loc7_ = 1;
               while(_loc7_ <= 5)
               {
                  if(_loc6_ >= _loc7_)
                  {
                     _loc2_.clip["star" + _loc7_].visible = true;
                  }
                  else
                  {
                     _loc2_.clip["star" + _loc7_].visible = false;
                  }
                  _loc7_++;
               }
               _loc2_.logoBMP = _loc4_.getSpecialLogo(this.specialIndex);
               _loc2_.logoBitmap = new Bitmap(_loc2_.logoBMP);
               _loc2_.logoBitmap.x = 21;
               _loc2_.logoBitmap.y = 94;
               _loc2_.clip.addChild(_loc2_.logoBitmap);
               _loc2_.orderData = new CustomerOrder();
               _loc2_.orderData.setPaper(_loc5_.ingredients[0]);
               _loc2_.orderData.setRice(_loc5_.ingredients[1],_loc5_.ingredients[2]);
               _loc8_ = 3;
               while(_loc8_ < _loc5_.ingredients.length)
               {
                  if(_loc5_.ingredients[_loc8_] is Array && _loc5_.ingredients[_loc8_].length == 2)
                  {
                     _loc2_.orderData.addFillings(_loc5_.ingredients[_loc8_][0]);
                  }
                  else if(_loc5_.ingredients[_loc8_] is String)
                  {
                     _loc2_.orderData.addToppings(_loc5_.ingredients[_loc8_]);
                  }
                  _loc8_++;
               }
               _loc2_.createOrderPanels();
               _loc9_ = 0;
               while(_loc9_ < _loc2_.panelParts.length)
               {
                  _loc2_.panelParts[_loc9_].visible = true;
                  _loc9_++;
               }
               _loc2_.panelHolder.cacheAsBitmap = true;
               if(_loc3_.currentSpecial == this.specialIndex)
               {
                  _loc2_.clip.special_btn.gotoAndStop(1);
               }
               else if(this.screen == null || this.screen.inMenu)
               {
                  _loc2_.clip.special_btn.stop();
                  _loc2_.clip.special_btn.visible = false;
               }
               else
               {
                  _loc2_.clip.special_btn.gotoAndStop(2);
                  _loc2_.clip.special_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickSetSpecial);
               }
            }
            else
            {
               class_6.error("ERROR: Bad special: " + this.specialIndex);
               _loc2_.clip.visible = false;
            }
         }
         param1.addChild(_loc2_.clip);
      }
      
      public function createOrderPanels() : void
      {
         var _loc2_:int = 0;
         var _loc7_:MovieClip = null;
         var _loc8_:MovieClip = null;
         var _loc1_:CookbookPage = this;
         _loc1_.panelHolder = new MovieClip();
         _loc1_.panelParts = new Vector.<MovieClip>();
         0;
         var _loc5_:MovieClip;
         (_loc5_ = new ticket_panel_paper()).gotoAndStop(_loc1_.orderData.paperType);
         var _loc6_:MovieClip;
         (_loc6_ = new ticket_panel_rice()).gotoAndStop(_loc1_.orderData.riceType);
         if(_loc1_.orderData.isFlipped)
         {
            _loc6_.flipicon.visible = true;
            _loc5_.scaleX = -1;
            _loc5_.x = 69;
            _loc5_.y = 230;
            _loc6_.x = -66;
            _loc6_.y = 230;
            _loc1_.panelParts.push(_loc5_);
            _loc1_.panelHolder.addChild(_loc5_);
            _loc5_.visible = false;
            _loc1_.panelParts.push(_loc6_);
            _loc1_.panelHolder.addChild(_loc6_);
            _loc6_.visible = false;
         }
         else
         {
            _loc6_.flipicon.visible = false;
            _loc6_.scaleX = -1;
            _loc6_.x = 69;
            _loc6_.y = 230;
            _loc5_.x = -66;
            _loc5_.y = 230;
            _loc1_.panelParts.push(_loc5_);
            _loc1_.panelHolder.addChild(_loc5_);
            _loc5_.visible = false;
            _loc1_.panelParts.push(_loc6_);
            _loc1_.panelHolder.addChild(_loc6_);
            _loc6_.visible = false;
         }
         _loc2_ = 0;
         while(_loc2_ < _loc1_.orderData.fillings.length)
         {
            (_loc7_ = new ticket_panel_filling()).gotoAndStop(_loc1_.orderData.fillings[_loc2_]);
            _loc7_.x = 0;
            _loc7_.y = 207 - _loc2_ * 36;
            _loc1_.panelParts.push(_loc7_);
            _loc1_.panelHolder.addChild(_loc7_);
            _loc7_.visible = false;
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < _loc1_.orderData.toppings.length)
         {
            if(FoodData.isDrop(_loc1_.orderData.toppings[_loc2_]))
            {
               _loc8_ = new ticket_panel_filling();
            }
            else if(FoodData.isSauce(_loc1_.orderData.toppings[_loc2_]))
            {
               _loc8_ = new ticket_panel_sauce();
            }
            else
            {
               _loc8_ = new ticket_panel_shaker();
            }
            _loc8_.gotoAndStop(_loc1_.orderData.toppings[_loc2_]);
            _loc8_.x = 0;
            _loc8_.y = 91 - _loc2_ * 34;
            _loc1_.panelParts.push(_loc8_);
            _loc1_.panelHolder.addChild(_loc8_);
            _loc8_.visible = false;
            _loc2_++;
         }
         _loc1_.clip.addChild(_loc1_.panelHolder);
         _loc1_.panelHolder.x = 267;
         _loc1_.panelHolder.y = 30;
      }
      
      public function setupIngredientPage(param1:MovieClip) : void
      {
         var index:Number;
         var useHoliday:Number;
         var typeName:String;
         var ob:CookbookPage = null;
         var container:MovieClip = param1;
         ob = this;
         var user:UserData = ob.gameObj.var_127;
         ob.clip = new menu_cookbook_ingredient_page();
         index = user.toppingIndexes.indexOf(ob.ingredientTag);
         if(index > -1)
         {
            ob.clip.title_txt.text = user.toppingNames[index];
         }
         else
         {
            ob.clip.title_txt.text = "???";
         }
         ob.clip.title_txt.setTextFormat(ob.kernFormat);
         useHoliday = FoodData.getHolidayForItem(ob.ingredientTag);
         if(useHoliday == 0 || useHoliday == 13)
         {
            ob.clip.holiday.stop();
            ob.clip.holiday.visible = false;
         }
         else
         {
            ob.clip.holiday.gotoAndStop(useHoliday);
         }
         ob.logoClip = new newtopping_topping();
         try
         {
            ob.logoClip.gotoAndStop(ob.ingredientTag);
         }
         catch(err:Error)
         {
            class_6.error("No clip frame for " + ob.ingredientTag);
            ob.logoClip.gotoAndStop(1);
         }
         ob.logoClip.scaleX = 0.6;
         ob.logoClip.scaleY = 0.6;
         ob.logoClip.x = 168;
         ob.logoClip.y = 120;
         ob.clip.addChild(ob.logoClip);
         ob.logoClip.cacheAsBitmap = true;
         ob.logoClip.mouseEnabled = false;
         ob.logoClip.mouseChildren = false;
         typeName = "???";
         if(FoodData.isPaper(ob.ingredientTag))
         {
            if(ob.ingredientTag == FoodData.PAPER_NORI)
            {
               typeName = "Seaweed Wrap";
            }
            else if(ob.ingredientTag == FoodData.PAPER_TORTILLA)
            {
               typeName = "Wrap";
            }
            else
            {
               typeName = "Soy Paper";
            }
         }
         else if(FoodData.isRice(ob.ingredientTag))
         {
            typeName = "Rice";
         }
         else if(FoodData.isShaker(ob.ingredientTag))
         {
            typeName = "Topping";
         }
         else if(FoodData.isSauce(ob.ingredientTag))
         {
            typeName = "Sauce";
         }
         else if(FoodData.isFilling(ob.ingredientTag) && !FoodData.isDrop(ob.ingredientTag))
         {
            typeName = "Filling";
         }
         else if(FoodData.isFilling(ob.ingredientTag) && FoodData.isDrop(ob.ingredientTag))
         {
            typeName = "Filling / Topping";
         }
         else if(FoodData.isDrop(ob.ingredientTag))
         {
            typeName = "Topping";
         }
         else if(FoodData.isTea(ob.ingredientTag))
         {
            typeName = "Flavored Tea";
         }
         else if(FoodData.isBubble(ob.ingredientTag))
         {
            typeName = "Bubble";
         }
         else if(ob.ingredientTag == FoodData.SUSHI_VINEGAR)
         {
            typeName = "Vinegar";
         }
         else
         {
            typeName = "Topping";
         }
         ob.clip.type_txt.htmlText = "<font color=\"#676767\">Type: </font>";
         ob.clip.type_txt.htmlText += "<font color=\"#BD5D5D\">" + typeName + "</font>";
         ob.clip.type_txt.setTextFormat(ob.kernFormat);
         container.addChild(ob.clip);
      }
      
      public function clickSetSpecial(param1:MouseEvent) : void
      {
         var _loc2_:CookbookPage = this;
         _loc2_.gameObj.var_128.playSound("waiter_bell.wav");
         _loc2_.gameObj.var_127.currentSpecial = _loc2_.specialIndex;
         if(_loc2_.screen)
         {
            _loc2_.screen.anyChanges = true;
         }
         _loc2_.clip.special_btn.gotoAndStop(1);
         _loc2_.clip.special_btn.mouseEnabled = false;
         _loc2_.clip.special_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickSetSpecial);
         if(_loc2_.screen)
         {
            _loc2_.screen.populateCookbookLinks(false);
            if(_loc2_.screen.whichContextTraining == "setspecial")
            {
               _loc2_.gameObj.var_127.setTrained("setspecial");
               _loc2_.screen.removeContextTraining();
            }
            if(!_loc2_.screen.inMenu && _loc2_.gameObj.var_127.hasTrained("bonusspecial") == false)
            {
               _loc2_.screen.showContextTraining("bonusspecial");
               _loc2_.gameObj.var_127.setTrained("bonusspecial");
            }
         }
      }
      
      public function destroy() : void
      {
         var _loc2_:int = 0;
         var _loc1_:CookbookPage = this;
         _loc1_.kernFormat = null;
         if(_loc1_.isSpecial)
         {
            if(_loc1_.logoBitmap)
            {
               if(_loc1_.logoBitmap.parent)
               {
                  _loc1_.logoBitmap.parent.removeChild(_loc1_.logoBitmap);
               }
               _loc1_.logoBitmap.bitmapData = null;
               _loc1_.logoBitmap = null;
            }
            if(_loc1_.logoBMP)
            {
               _loc1_.logoBMP.dispose();
               _loc1_.logoBMP = null;
            }
            if(Boolean(_loc1_.panelParts) && _loc1_.panelParts.length > 0)
            {
               _loc2_ = 0;
               while(_loc2_ < _loc1_.panelParts.length)
               {
                  if(_loc1_.panelParts[_loc2_].parent)
                  {
                     _loc1_.panelParts[_loc2_].parent.removeChild(_loc1_.panelParts[_loc2_]);
                  }
                  _loc1_.panelParts[_loc2_] = null;
                  _loc2_++;
               }
            }
            _loc1_.panelParts = null;
            if(Boolean(_loc1_.panelHolder) && Boolean(_loc1_.panelHolder.parent))
            {
               _loc1_.panelHolder.parent.removeChild(_loc1_.panelHolder);
            }
            _loc1_.panelHolder = null;
            _loc1_.orderData = null;
            if(_loc1_.clip.special_btn)
            {
               _loc1_.clip.special_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickSetSpecial);
            }
         }
         else if(_loc1_.logoClip)
         {
            if(_loc1_.logoClip.parent)
            {
               _loc1_.logoClip.parent.removeChild(_loc1_.logoClip);
            }
            _loc1_.logoClip = null;
         }
         if(Boolean(_loc1_.clip) && Boolean(_loc1_.clip.parent))
         {
            _loc1_.clip.parent.removeChild(_loc1_.clip);
         }
         _loc1_.clip = null;
      }
   }
}

package sushiGame.screens
{
   import flash.display.MovieClip;
   import flash.events.*;
   import flash.geom.ColorTransform;
   import flash.geom.Rectangle;
   import flash.text.TextFormat;
   import flash.utils.getDefinitionByName;
   import package_2.class_12;
   import package_2.class_6;
   import package_4.class_5;
   import sushiGame.data.ClothingItem;
   import sushiGame.data.FurniData;
   import sushiGame.data.GameData;
   import sushiGame.data.Upgrade;
   import sushiGame.data.UserData;
   import sushiGame.data.WorkerData;
   
   public class ShopScreen
   {
       
      
      public var gameObj:class_5;
      
      public var clip:MovieClip;
      
      public var container:MovieClip;
      
      public var whichSet:Number = 1;
      
      public var panelsPerSet:Number = 6;
      
      public var workingArray:Array;
      
      public var shouldShowNext:Boolean = false;
      
      public var shouldShowPrev:Boolean = false;
      
      public var purchasedToday:Array;
      
      public var lastPurchaseTag:String = "none";
      
      public var mode:String = "upgrades";
      
      public var filterThemeMonth:Number = -1;
      
      public var filterShowType:String = "all";
      
      public var filterShowTypes:Array;
      
      public var filterShowTypeLabels:Array;
      
      public var dropdownClip:MovieClip;
      
      public var dropdownClipType:String = "none";
      
      public var isShowingDropdown:Boolean = false;
      
      public var dropdownParts:Array;
      
      public var mannequinColor:uint = 14540253;
      
      public var previewGender:String;
      
      public var tipsPanel:MovieClip = null;
      
      public var colorPalette:MovieClip = null;
      
      public var colorSwatches:Vector.<MovieClip>;
      
      public var colorPaletteData:Array;
      
      public var colorPaletteOffscreenLeft:Number = -335;
      
      public var colorPaletteTargetLeft:Number = -12;
      
      public var colorPaletteOffscreenRight:Number = 642;
      
      public var colorPaletteTargetRight:Number = 320;
      
      public var colorPaletteType:String = null;
      
      public var featureSwatches:Vector.<MovieClip>;
      
      public var featureColorPaletteData:Array;
      
      public var colorPalettePanel:Number = 0;
      
      public var colorPaletteColor:Number = 0;
      
      public var tintGroupsSelectedTag:Array;
      
      public var tintGroupsColor1:Array;
      
      public var tintGroupsColor2:Array;
      
      public var tintGroupsColor3:Array;
      
      public var tintGroupsColor4:Array;
      
      public var kernFormat:TextFormat = null;
      
      public function ShopScreen(param1:class_5, param2:MovieClip, param3:Object = null)
      {
         this.workingArray = [];
         this.purchasedToday = [];
         this.filterShowTypes = ["all","owned","notowned",ClothingItem.TYPE_SHIRT,ClothingItem.TYPE_JACKET,ClothingItem.TYPE_SHOES,ClothingItem.TYPE_PANTS,ClothingItem.TYPE_HAT,ClothingItem.TYPE_ACC_ARMS,ClothingItem.TYPE_ACC_BELT,ClothingItem.TYPE_ACC_BODY,ClothingItem.TYPE_ACC_FACE];
         this.filterShowTypeLabels = ["All","Already Owned","Not Owned","Shirts","Jackets","Shoes","Pants","Hats","Arm Extras","Belts","Accessories","Glasses"];
         this.dropdownParts = [];
         this.colorPaletteData = [];
         this.featureColorPaletteData = [];
         this.tintGroupsSelectedTag = [];
         this.tintGroupsColor1 = [];
         this.tintGroupsColor2 = [];
         this.tintGroupsColor3 = [];
         this.tintGroupsColor4 = [];
         super();
         var _loc4_:ShopScreen;
         (_loc4_ = this).gameObj = param1;
         _loc4_.container = param2;
         _loc4_.kernFormat = new TextFormat();
         _loc4_.kernFormat.kerning = true;
         if(_loc4_.gameObj.var_127.hasVisitedUpgradeShop == false)
         {
            _loc4_.gameObj.var_127.hasVisitedUpgradeShop = true;
         }
         _loc4_.setupScreen();
      }
      
      public function setupScreen() : void
      {
         var _loc2_:int = 0;
         var _loc1_:ShopScreen = this;
         class_6.method_1("Setup Shop Screen!");
         _loc1_.clip = new shopScreenMC();
         _loc1_.container.addChild(_loc1_.clip);
         _loc1_.previewGender = _loc1_.gameObj.workerData.gender;
         if(_loc1_.gameObj.workerData.gender == WorkerData.GENDER_MALE)
         {
            _loc1_.clip.gender.male_btn.gotoAndStop(1);
            _loc1_.clip.gender.female_btn.gotoAndStop(2);
         }
         else
         {
            _loc1_.clip.gender.male_btn.gotoAndStop(2);
            _loc1_.clip.gender.female_btn.gotoAndStop(1);
         }
         _loc1_.clip.gender.male_btn.buttonMode = true;
         _loc1_.clip.gender.male_btn.useHandCursor = true;
         _loc1_.clip.gender.male_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickGender);
         _loc1_.clip.gender.male_btn.addEventListener(MouseEvent.MOUSE_OVER,_loc1_.rolloverGender);
         _loc1_.clip.gender.male_btn.addEventListener(MouseEvent.MOUSE_OUT,_loc1_.rolloutGender);
         _loc1_.clip.gender.female_btn.buttonMode = true;
         _loc1_.clip.gender.female_btn.useHandCursor = true;
         _loc1_.clip.gender.female_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickGender);
         _loc1_.clip.gender.female_btn.addEventListener(MouseEvent.MOUSE_OVER,_loc1_.rolloverGender);
         _loc1_.clip.gender.female_btn.addEventListener(MouseEvent.MOUSE_OUT,_loc1_.rolloutGender);
         _loc1_.clip.gender.visible = false;
         _loc1_.tipsPanel = _loc1_.clip.tipspanel;
         _loc1_.gameObj.addChild(_loc1_.tipsPanel);
         _loc1_.tipsPanel.tips_txt.text = _loc1_.gameObj.var_127.getTipsTotal(true);
         _loc1_.tipsPanel.tips_txt.setTextFormat(_loc1_.kernFormat);
         _loc1_.clip.noitems.visible = false;
         _loc1_.clip.next_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickNext);
         _loc1_.clip.prev_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickPrevious);
         _loc1_.clip.upgrades_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickChangeMode);
         _loc1_.clip.furniture_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickChangeMode);
         _loc1_.clip.poster_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickChangeMode);
         _loc1_.clip.wallfloor_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickChangeMode);
         _loc1_.clip.clothing_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickChangeMode);
         var _loc3_:int = 1;
         while(_loc3_ <= 6)
         {
            _loc1_.clip.panels["panel" + _loc3_].purchase_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickPurchase);
            _loc1_.clip.panels["panel" + _loc3_].confirm.yes_btn.addEventListener(MouseEvent.CLICK,_loc1_.confirmPurchase);
            _loc1_.clip.panels["panel" + _loc3_].confirm.no_btn.addEventListener(MouseEvent.CLICK,_loc1_.cancelPurchase);
            _loc2_ = 1;
            while(_loc2_ <= 4)
            {
               _loc1_.clip.panels["panel" + _loc3_].pickswatch["color" + _loc2_].color_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickChooseColor);
               _loc1_.clip.panels["panel" + _loc3_].pickswatch["color" + _loc2_].owned.visible = false;
               _loc1_.clip.panels["panel" + _loc3_].pickswatch["color" + _loc2_].owned.mouseEnabled = false;
               _loc1_.clip.panels["panel" + _loc3_].pickswatch["color" + _loc2_].owned.mouseChildren = false;
               _loc2_++;
            }
            _loc3_++;
         }
         _loc1_.clip.next_btn.visible = false;
         _loc1_.clip.prev_btn.visible = false;
         _loc1_.clip.page_txt.text = "";
         _loc1_.clip.page_txt.setTextFormat(_loc1_.kernFormat);
         _loc1_.container.addEventListener("clickBackToGame",_loc1_.clickBackToGame);
         _loc1_.container.addEventListener("clickQuit",_loc1_.clickQuit);
         _loc1_.clip.addEventListener(Event.ENTER_FRAME,_loc1_.updateScreen);
         _loc1_.gameObj.var_128.switchMusic("bake");
         _loc1_.clip.show_dropdown.btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickOpenShowDropdown);
         _loc1_.clip.theme_dropdown.btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickOpenThemeDropdown);
         _loc1_.selectMode("upgrades",true);
      }
      
      public function clickChangeMode(param1:MouseEvent) : void
      {
         var _loc2_:ShopScreen = this;
         var _loc3_:Array = String(param1.currentTarget.name).split("_");
         var _loc4_:String = String(_loc3_[0]);
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         if(_loc2_.mode != _loc4_)
         {
            _loc2_.selectMode(_loc4_);
         }
      }
      
      public function selectMode(param1:String, param2:Boolean = false, param3:Boolean = true) : void
      {
         var _loc5_:int = 0;
         var _loc4_:ShopScreen;
         (_loc4_ = this).mode = param1;
         _loc4_.clip.tabbg.gotoAndStop(_loc4_.mode);
         _loc4_.clip.noitems.gotoAndStop(1);
         _loc4_.clip.noitems.visible = false;
         if(param3)
         {
            _loc4_.filterShowType = "all";
            if(param1 == "wallfloor")
            {
               _loc4_.filterShowType = "notowned";
            }
         }
         _loc4_.workingArray = _loc4_.gameObj.var_132.getStoreTags(_loc4_.mode,_loc4_.filterShowType,_loc4_.filterThemeMonth);
         _loc4_.purchasedToday = [];
         if(_loc4_.workingArray.length > 0)
         {
            _loc5_ = 0;
            while(_loc5_ < _loc4_.workingArray.length)
            {
               _loc4_.purchasedToday.push(0);
               _loc5_++;
            }
         }
         if(param2 && _loc4_.mode == "upgrades" && _loc4_.workingArray.length == 0)
         {
            _loc4_.selectMode("furniture",true);
            return;
         }
         class_6.method_1("MODE: " + _loc4_.mode);
         class_6.method_1("Working Array: " + _loc4_.workingArray);
         _loc4_.removeColorPalette();
         _loc4_.whichSet = 1;
         if(!param2)
         {
            _loc4_.clip.panels.gotoAndPlay("nextset");
            _loc4_.clip.next_btn.visible = false;
            _loc4_.clip.prev_btn.visible = false;
         }
         else
         {
            _loc4_.populatePanels();
            _loc4_.clip.panels.gotoAndPlay(1);
            _loc4_.clip.next_btn.visible = false;
            _loc4_.clip.prev_btn.visible = false;
         }
         _loc4_.updateDropdowns();
         if(_loc4_.mode == "clothing")
         {
            _loc4_.clip.gender.visible = true;
         }
         else
         {
            _loc4_.clip.gender.visible = false;
         }
      }
      
      public function updateScreen(param1:Event) : void
      {
         var _loc2_:ShopScreen = this;
         var _loc3_:UserData = _loc2_.gameObj.var_127;
         if(_loc2_.clip.panels.currentFrame == 6 || _loc2_.clip.panels.currentFrame == 17)
         {
            _loc2_.clip.panels.stop();
            if(_loc2_.shouldShowNext)
            {
               _loc2_.clip.next_btn.visible = true;
            }
            else
            {
               _loc2_.clip.next_btn.visible = false;
            }
            if(_loc2_.shouldShowPrev)
            {
               _loc2_.clip.prev_btn.visible = true;
            }
            else
            {
               _loc2_.clip.prev_btn.visible = false;
            }
         }
         else
         {
            _loc2_.clip.next_btn.visible = false;
            _loc2_.clip.prev_btn.visible = false;
         }
         if(_loc2_.clip.panels.currentFrame == 11)
         {
            _loc2_.populatePanels();
            _loc2_.clip.panels.gotoAndPlay(1);
         }
         else if(_loc2_.clip.panels.currentFrame == 22)
         {
            _loc2_.populatePanels();
            _loc2_.clip.panels.gotoAndPlay(12);
         }
         if(Boolean(_loc2_.colorPalette) && _loc2_.colorPalette.visible)
         {
            if(_loc2_.colorPaletteType == "left" && _loc2_.colorPalette.x < _loc2_.colorPaletteTargetLeft)
            {
               _loc2_.colorPalette.x += (_loc2_.colorPaletteTargetLeft - _loc2_.colorPalette.x) / 2;
               if(Math.abs(_loc2_.colorPaletteTargetLeft - _loc2_.colorPalette.x) <= 1)
               {
                  _loc2_.colorPalette.x = _loc2_.colorPaletteTargetLeft;
               }
            }
            else if(_loc2_.colorPaletteType == "right" && _loc2_.colorPalette.x > _loc2_.colorPaletteTargetRight)
            {
               _loc2_.colorPalette.x += (_loc2_.colorPaletteTargetRight - _loc2_.colorPalette.x) / 2;
               if(Math.abs(_loc2_.colorPaletteTargetRight - _loc2_.colorPalette.x) <= 1)
               {
                  _loc2_.colorPalette.x = _loc2_.colorPaletteTargetRight;
               }
            }
         }
      }
      
      public function getClothingMonth() : Number
      {
         var _loc1_:ShopScreen = this;
         var _loc2_:Number = _loc1_.filterThemeMonth;
         if(_loc2_ == -1 || _loc2_ == 0)
         {
            _loc2_ = _loc1_.gameObj.var_127.getHolidayMonth();
            if(_loc2_ == 0)
            {
               _loc2_ = GameData.STARTER_MONTH + 1;
               if(_loc2_ > 12)
               {
                  _loc2_ -= 12;
               }
            }
         }
         return _loc2_;
      }
      
      public function getElementFromColorArray(param1:Array, param2:Number) : Number
      {
         var _loc3_:Number = param2 % param1.length;
         if(_loc3_ < param1.length)
         {
            return param1[_loc3_];
         }
         return param1[0];
      }
      
      public function populatePanels(param1:Boolean = false) : void
      {
         var holidayColors:Array;
         var i:int;
         var totalPages:Number;
         var index:Number = NaN;
         var mypanel:MovieClip = null;
         var whichTag:String = null;
         var alreadyPurchased:Number = NaN;
         var furniData:FurniData = null;
         var upgrade:Upgrade = null;
         var upgradeThumb:MovieClip = null;
         var tintClothing:ClothingItem = null;
         var color1:Number = NaN;
         var color2:Number = NaN;
         var color3:Number = NaN;
         var decalColor:Number = NaN;
         var tintCodes:String = null;
         var clothing:ClothingItem = null;
         var justPurchased:Boolean = param1;
         var screen:ShopScreen = this;
         var data:UserData = screen.gameObj.var_127;
         var gamedata:GameData = screen.gameObj.var_132;
         var offset:Number = screen.panelsPerSet * (screen.whichSet - 1);
         screen.removeColorPalette();
         holidayColors = screen.gameObj.var_134.getHolidayPalette(screen.getClothingMonth());
         i = 0;
         while(i < screen.panelsPerSet)
         {
            index = i + offset;
            mypanel = screen.clip.panels["panel" + (i + 1)];
            if(justPurchased == false)
            {
               screen.tintGroupsColor1[i] = -1;
               screen.tintGroupsColor2[i] = -1;
               screen.tintGroupsColor3[i] = -1;
               screen.tintGroupsColor4[i] = -1;
            }
            if(index < screen.workingArray.length)
            {
               whichTag = String(screen.workingArray[index]);
               alreadyPurchased = Number(screen.purchasedToday[index]);
               if(screen.mode == "furniture" || screen.mode == "poster" || screen.mode == "wallfloor")
               {
                  furniData = gamedata.getFurniFromTag(whichTag);
                  mypanel.visible = true;
                  mypanel.title_txt.text = "  " + furniData.title;
                  mypanel.info_txt.text = "";
                  mypanel.title_txt.setTextFormat(screen.kernFormat);
                  mypanel.infopanel.visible = false;
                  mypanel.pointpanel.visible = true;
                  mypanel.pointpanel.effect_txt.text = furniData.effect + " Bonus";
                  if(mypanel.pointpanel.effect_txt.textWidth > mypanel.pointpanel.effect_txt.width)
                  {
                     mypanel.pointpanel.effect_txt.text = furniData.effect;
                  }
                  mypanel.pointpanel.points_txt.text = furniData.getMaxPoints() + " Points";
                  mypanel.pointpanel.effect_txt.setTextFormat(screen.kernFormat);
                  mypanel.pointpanel.points_txt.setTextFormat(screen.kernFormat);
                  mypanel.pointpanel.theme.gotoAndStop(furniData.theme);
                  mypanel.own_txt.text = String(data.getFurniAmount(whichTag,true));
                  mypanel.own_txt.setTextFormat(screen.kernFormat);
                  mypanel.own_txt.visible = true;
                  mypanel.own_label.visible = true;
                  if(data.getFurniAmount(whichTag,true) == 0)
                  {
                     mypanel.purchasedbg.visible = false;
                  }
                  else
                  {
                     mypanel.purchasedbg.visible = true;
                  }
                  mypanel.price_txt.text = class_12.method_141(furniData.price);
                  mypanel.price_txt.setTextFormat(screen.kernFormat);
                  if(furniData.price <= data.getTipsTotal())
                  {
                     mypanel.purchase_btn.visible = true;
                     mypanel.needmoretips_btn.visible = false;
                  }
                  else
                  {
                     mypanel.purchase_btn.visible = false;
                     mypanel.needmoretips_btn.visible = true;
                  }
                  try
                  {
                     if(mypanel.thumb.numChildren > 0)
                     {
                        mypanel.thumb.removeChildAt(0);
                     }
                  }
                  catch(err:Error)
                  {
                     class_6.error("Error removing thumb.");
                  }
                  mypanel.thumb.addChild(screen.createFurniThumbnail(furniData));
                  if(screen.lastPurchaseTag == furniData.tag)
                  {
                     mypanel.fireworks.gotoAndPlay(2);
                     screen.lastPurchaseTag = "none";
                  }
                  if(data.getFurniAmount(whichTag,true) > 0 && (furniData.type == FurniData.TYPE_WALLPAPER || furniData.type == FurniData.TYPE_FLOORING))
                  {
                     mypanel.purchase_btn.visible = false;
                     mypanel.needmoretips_btn.visible = false;
                  }
                  mypanel.confirm.visible = false;
                  mypanel.cover.visible = false;
                  mypanel.alreadyown.visible = false;
                  if(screen.mode == "wallfloor" && Boolean(alreadyPurchased))
                  {
                     mypanel.cover.visible = true;
                  }
                  mypanel.pickswatch.visible = false;
               }
               else if(screen.mode == "upgrades")
               {
                  upgrade = gamedata.getUpgradeFromTag(whichTag);
                  mypanel.visible = true;
                  mypanel.title_txt.text = upgrade.title;
                  mypanel.title_txt.setTextFormat(screen.kernFormat);
                  mypanel.info_txt.text = "";
                  mypanel.pointpanel.visible = false;
                  mypanel.infopanel.visible = true;
                  mypanel.infopanel.info_txt.text = upgrade.description;
                  mypanel.infopanel.info_txt.setTextFormat(screen.kernFormat);
                  if(whichTag == "coupon")
                  {
                     mypanel.own_txt.text = String(data.numCoupons);
                     mypanel.own_txt.visible = true;
                     mypanel.own_label.visible = true;
                     if(data.numCoupons > 0)
                     {
                        mypanel.purchasedbg.visible = true;
                     }
                     else
                     {
                        mypanel.purchasedbg.visible = false;
                     }
                  }
                  else
                  {
                     mypanel.own_txt.visible = false;
                     mypanel.own_label.visible = false;
                     mypanel.purchasedbg.visible = false;
                  }
                  if(screen.lastPurchaseTag == whichTag && whichTag == "coupon")
                  {
                     mypanel.fireworks.gotoAndPlay(2);
                     screen.lastPurchaseTag = "none";
                  }
                  mypanel.price_txt.text = class_12.method_141(upgrade.price);
                  mypanel.price_txt.setTextFormat(screen.kernFormat);
                  if(whichTag != "vatguide2" || data.hasBonus("vatguide1"))
                  {
                     if(upgrade.price <= data.getTipsTotal())
                     {
                        mypanel.purchase_btn.visible = true;
                        mypanel.needmoretips_btn.visible = false;
                     }
                     else
                     {
                        mypanel.purchase_btn.visible = false;
                        mypanel.needmoretips_btn.visible = true;
                     }
                  }
                  else
                  {
                     mypanel.purchase_btn.visible = false;
                     mypanel.needmoretips_btn.visible = false;
                  }
                  try
                  {
                     if(mypanel.thumb.numChildren > 0)
                     {
                        mypanel.thumb.removeChildAt(0);
                     }
                  }
                  catch(err:Error)
                  {
                     class_6.error("Error removing thumb.");
                  }
                  upgradeThumb = new shop_panel_thumb();
                  upgradeThumb.gotoAndStop(upgrade.tag);
                  mypanel.thumb.addChild(upgradeThumb);
                  mypanel.confirm.visible = false;
                  mypanel.cover.visible = false;
                  if(Boolean(alreadyPurchased) && whichTag != "coupon")
                  {
                     mypanel.cover.visible = true;
                  }
                  mypanel.pickswatch.visible = false;
                  mypanel.alreadyown.visible = false;
               }
               else if(screen.mode == "clothing" && screen.gameObj.var_134.clothingIsTinting(whichTag))
               {
                  tintClothing = screen.gameObj.var_134.getItemFromSKU(whichTag);
                  color1 = screen.getElementFromColorArray(holidayColors,i);
                  color2 = screen.getElementFromColorArray(holidayColors,i + 1);
                  color3 = screen.getElementFromColorArray(holidayColors,i + 2);
                  decalColor = screen.getElementFromColorArray(holidayColors,i + 3);
                  if(tintClothing.limitColor1 != null && tintClothing.limitColor1.indexOf(color1) == -1)
                  {
                     color1 = screen.getElementFromColorArray(tintClothing.limitColor1,0);
                  }
                  if(tintClothing.limitColor2 != null && tintClothing.limitColor2.indexOf(color2) == -1)
                  {
                     color2 = screen.getElementFromColorArray(tintClothing.limitColor2,1);
                  }
                  if(tintClothing.limitColor3 != null && tintClothing.limitColor3.indexOf(color3) == -1)
                  {
                     color3 = screen.getElementFromColorArray(tintClothing.limitColor3,2);
                  }
                  if(tintClothing.limitDecalColor != null && tintClothing.limitDecalColor.indexOf(decalColor) == -1)
                  {
                     decalColor = screen.getElementFromColorArray(tintClothing.limitDecalColor,3);
                  }
                  if(tintClothing.decalMatchColor == 1)
                  {
                     decalColor = color1;
                  }
                  else if(tintClothing.decalMatchColor == 2)
                  {
                     decalColor = color2;
                  }
                  else if(tintClothing.decalMatchColor == 3)
                  {
                     decalColor = color3;
                  }
                  if(tintClothing.isForcingColor(2))
                  {
                     color2 = tintClothing.getForceColor(2,color1,color2,color3);
                  }
                  if(tintClothing.isForcingColor(3))
                  {
                     color3 = tintClothing.getForceColor(3,color1,color2,color3);
                  }
                  if(tintClothing.isForcingColor(4))
                  {
                     decalColor = tintClothing.getForceColor(4,color1,color2,color3);
                  }
                  if(justPurchased)
                  {
                     color1 = Math.max(0,screen.tintGroupsColor1[i]);
                     color2 = Math.max(0,screen.tintGroupsColor2[i]);
                     color3 = Math.max(0,screen.tintGroupsColor3[i]);
                     decalColor = Math.max(0,screen.tintGroupsColor4[i]);
                  }
                  else
                  {
                     if(tintClothing.tintColor1)
                     {
                        screen.tintGroupsColor1[i] = color1;
                     }
                     else
                     {
                        screen.tintGroupsColor1[i] = -1;
                     }
                     if(tintClothing.tintColor2)
                     {
                        screen.tintGroupsColor2[i] = color2;
                     }
                     else
                     {
                        screen.tintGroupsColor2[i] = -1;
                     }
                     if(tintClothing.tintColor3)
                     {
                        screen.tintGroupsColor3[i] = color3;
                     }
                     else
                     {
                        screen.tintGroupsColor3[i] = -1;
                     }
                     if(tintClothing.tintDecalColor)
                     {
                        screen.tintGroupsColor4[i] = decalColor;
                     }
                     else
                     {
                        screen.tintGroupsColor4[i] = -1;
                     }
                  }
                  tintCodes = screen.getTintCode(tintClothing,color1,color2,color3,decalColor);
                  screen.updatePanelSwatches(mypanel,tintClothing,color1,color2,color3,decalColor);
                  mypanel.visible = true;
                  mypanel.title_txt.text = "  " + tintClothing.title;
                  mypanel.info_txt.text = "";
                  mypanel.title_txt.setTextFormat(screen.kernFormat);
                  mypanel.infopanel.visible = false;
                  mypanel.pointpanel.visible = true;
                  mypanel.pointpanel.points_txt.text = "";
                  mypanel.pointpanel.theme.gotoAndStop(screen.gameObj.var_134.getClothingThemeFrame(tintClothing.tag + tintCodes,screen.getClothingMonth()));
                  mypanel.pointpanel.effect_txt.text = "";
                  mypanel.own_txt.visible = false;
                  mypanel.own_label.visible = false;
                  mypanel.purchasedbg.visible = false;
                  mypanel.price_txt.text = class_12.method_141(tintClothing.price);
                  mypanel.price_txt.setTextFormat(screen.kernFormat);
                  if(tintClothing.price <= data.getTipsTotal())
                  {
                     mypanel.purchase_btn.visible = true;
                     mypanel.needmoretips_btn.visible = false;
                  }
                  else
                  {
                     mypanel.purchase_btn.visible = false;
                     mypanel.needmoretips_btn.visible = true;
                  }
                  if(screen.gameObj.var_127.alreadyOwnsClothing(tintClothing.tag + tintCodes))
                  {
                     mypanel.purchase_btn.visible = false;
                     mypanel.needmoretips_btn.visible = false;
                     mypanel.purchasedbg.visible = true;
                     mypanel.alreadyown.visible = true;
                  }
                  else
                  {
                     mypanel.purchasedbg.visible = false;
                     mypanel.alreadyown.visible = false;
                  }
                  if(screen.gameObj.var_134.getBaseSKU(screen.lastPurchaseTag) == tintClothing.tag)
                  {
                     mypanel.fireworks.gotoAndPlay(2);
                     screen.lastPurchaseTag = "none";
                  }
                  try
                  {
                     if(mypanel.thumb.numChildren > 0)
                     {
                        mypanel.thumb.removeChildAt(0);
                     }
                  }
                  catch(err:Error)
                  {
                     class_6.error("Error removing thumb.");
                  }
                  mypanel.thumb.addChild(screen.gameObj.var_134.generateClothingThumb(tintClothing.tag + tintCodes,screen.previewGender));
                  mypanel.confirm.visible = false;
                  mypanel.cover.visible = false;
                  mypanel.pickswatch.visible = true;
               }
               else if(screen.mode == "clothing")
               {
                  clothing = screen.gameObj.var_134.getItemFromSKU(whichTag);
                  mypanel.visible = true;
                  mypanel.title_txt.text = "  " + clothing.title;
                  mypanel.info_txt.text = "";
                  mypanel.title_txt.setTextFormat(screen.kernFormat);
                  mypanel.infopanel.visible = false;
                  mypanel.pointpanel.visible = true;
                  mypanel.pointpanel.points_txt.text = "";
                  mypanel.pointpanel.theme.gotoAndStop(screen.gameObj.var_134.getClothingThemeFrame(whichTag));
                  mypanel.pointpanel.effect_txt.text = "";
                  mypanel.pointpanel.effect_txt.setTextFormat(screen.kernFormat);
                  mypanel.own_txt.visible = false;
                  mypanel.own_label.visible = false;
                  mypanel.purchasedbg.visible = false;
                  mypanel.price_txt.text = class_12.method_141(clothing.price);
                  mypanel.price_txt.setTextFormat(screen.kernFormat);
                  if(clothing.price <= data.getTipsTotal())
                  {
                     mypanel.purchase_btn.visible = true;
                     mypanel.needmoretips_btn.visible = false;
                  }
                  else
                  {
                     mypanel.purchase_btn.visible = false;
                     mypanel.needmoretips_btn.visible = true;
                  }
                  try
                  {
                     if(mypanel.thumb.numChildren > 0)
                     {
                        mypanel.thumb.removeChildAt(0);
                     }
                  }
                  catch(err:Error)
                  {
                     class_6.error("Error removing thumb.");
                  }
                  mypanel.thumb.addChild(screen.gameObj.var_134.generateClothingThumb(clothing.tag,this.previewGender));
                  mypanel.confirm.visible = false;
                  mypanel.cover.visible = false;
                  if(alreadyPurchased)
                  {
                     mypanel.cover.visible = true;
                  }
                  mypanel.pickswatch.visible = false;
                  mypanel.alreadyown.visible = false;
               }
            }
            else
            {
               mypanel.visible = false;
            }
            i++;
         }
         if(screen.workingArray.length > offset + screen.panelsPerSet)
         {
            screen.shouldShowNext = true;
         }
         else
         {
            screen.shouldShowNext = false;
         }
         if(screen.whichSet > 1)
         {
            screen.shouldShowPrev = true;
         }
         else
         {
            screen.shouldShowPrev = false;
         }
         totalPages = Math.ceil(screen.workingArray.length / screen.panelsPerSet);
         screen.clip.page_txt.text = "Page " + this.whichSet + " of " + Math.max(1,totalPages);
         screen.clip.page_txt.setTextFormat(screen.kernFormat);
         if(totalPages == 0)
         {
            screen.clip.noitems.visible = true;
            screen.clip.noitems.gotoAndPlay(1);
         }
      }
      
      public function getTintCode(param1:ClothingItem, param2:Number, param3:Number, param4:Number, param5:Number) : String
      {
         this;
         return this.gameObj.var_134.generateTintCode(param1,param2,param3,param4,param5);
      }
      
      public function updatePanelSwatches(param1:MovieClip, param2:ClothingItem, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
         var _loc7_:ShopScreen = this;
         var _loc8_:Number = 0;
         37;
         param1.pickswatch.color1.x = 0;
         param1.pickswatch.color2.x = 37;
         param1.pickswatch.color3.x = 37 * 2;
         param1.pickswatch.color4.x = 37 * 3;
         if(param2.tintColor1)
         {
            param1.pickswatch.color1.color_swatch.transform.colorTransform = _loc7_.createColorTransform(param3);
            param1.pickswatch.color1.visible = true;
            _loc8_++;
         }
         else
         {
            param1.pickswatch.color1.visible = false;
         }
         if(param2.tintColor2 && param2.isForcingColor(2) == false)
         {
            param1.pickswatch.color2.color_swatch.transform.colorTransform = _loc7_.createColorTransform(param4);
            param1.pickswatch.color2.visible = true;
            _loc8_++;
         }
         else
         {
            param1.pickswatch.color2.visible = false;
         }
         if(param2.tintColor3 && param2.isForcingColor(3) == false)
         {
            param1.pickswatch.color3.color_swatch.transform.colorTransform = _loc7_.createColorTransform(param5);
            param1.pickswatch.color3.visible = true;
            _loc8_++;
         }
         else
         {
            param1.pickswatch.color3.visible = false;
         }
         if(param2.tintDecalColor && param2.isForcingColor(4) == false)
         {
            param1.pickswatch.color4.color_swatch.transform.colorTransform = _loc7_.createColorTransform(param6);
            param1.pickswatch.color4.visible = true;
            _loc8_++;
         }
         else
         {
            param1.pickswatch.color4.visible = false;
         }
         if(param1.pickswatch.color1.visible == false)
         {
            param1.pickswatch.color2.x -= 37;
            param1.pickswatch.color3.x -= 37;
            param1.pickswatch.color4.x -= 37;
         }
         if(param1.pickswatch.color2.visible == false)
         {
            param1.pickswatch.color3.x -= 37;
            param1.pickswatch.color4.x -= 37;
         }
         if(param1.pickswatch.color3.visible == false)
         {
            param1.pickswatch.color4.x -= 37;
         }
         param1.pickswatch.x = 154 + (4 - _loc8_) * 37;
      }
      
      private function createColorTransform(param1:Number) : ColorTransform
      {
         var _loc2_:ColorTransform = new ColorTransform();
         _loc2_.redMultiplier = ((param1 & 16711680) >>> 16) / 255;
         _loc2_.greenMultiplier = ((param1 & 65280) >>> 8) / 255;
         _loc2_.blueMultiplier = (param1 & 255) / 255;
         return _loc2_;
      }
      
      public function createFurniThumbnail(param1:FurniData) : MovieClip
      {
         var _loc6_:Number = NaN;
         var _loc7_:MovieClip = null;
         var _loc8_:MovieClip = null;
         var _loc9_:Number = NaN;
         var _loc10_:MovieClip = null;
         var _loc11_:MovieClip = null;
         var _loc12_:MovieClip = null;
         var _loc13_:MovieClip = null;
         var _loc14_:Class = null;
         var _loc15_:MovieClip = null;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Rectangle = null;
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         this;
         var _loc3_:MovieClip = null;
         64;
         64;
         if(param1.type == FurniData.TYPE_FLOORING)
         {
            _loc6_ = Number(String(param1.tag).split("floor")[1]);
            _loc3_ = new MovieClip();
            (_loc7_ = new flooring_chunk()).gotoAndStop(_loc6_);
            (_loc8_ = new flooring_chunk()).gotoAndStop(_loc6_);
            _loc8_.x = _loc7_.width;
            _loc3_.addChild(_loc7_);
            _loc3_.addChild(_loc8_);
            _loc3_.scaleX = 0.285;
            _loc3_.scaleY = 0.285;
         }
         else if(param1.type == FurniData.TYPE_WALLPAPER)
         {
            _loc9_ = Number(String(param1.tag).split("wall")[1]);
            _loc3_ = new MovieClip();
            (_loc10_ = new wallpaper_holder()).gotoAndStop(_loc9_);
            (_loc11_ = new wallpaper_holder()).gotoAndStop(_loc9_);
            _loc11_.x = _loc10_.width;
            _loc3_.addChild(_loc10_);
            _loc3_.addChild(_loc11_);
            (_loc12_ = new MovieClip()).graphics.beginFill(0,1);
            _loc12_.graphics.drawRect(0,0,_loc10_.width,245);
            _loc12_.graphics.endFill();
            _loc3_.addChild(_loc12_);
            (_loc13_ = new MovieClip()).graphics.beginFill(0,1);
            _loc13_.graphics.drawRect(0,0,_loc11_.width,245);
            _loc13_.graphics.endFill();
            _loc13_.x = _loc11_.x;
            _loc3_.addChild(_loc13_);
            _loc10_.mask = _loc12_;
            _loc11_.mask = _loc13_;
            _loc3_.scaleX = 0.26;
            _loc3_.scaleY = 0.26;
         }
         else
         {
            if((_loc15_ = new (_loc14_ = getDefinitionByName(param1.tag) as Class)()).totalFrames > 1)
            {
               _loc15_.gotoAndStop(2);
            }
            _loc16_ = _loc15_.height;
            _loc17_ = _loc15_.height / _loc15_.width;
            _loc18_ = _loc15_.width / _loc15_.height;
            if(_loc15_.height > 64 || _loc15_.width > 64)
            {
               if(_loc15_.height > _loc15_.width)
               {
                  _loc15_.height = 64;
                  _loc15_.width = _loc15_.height * _loc18_;
               }
               else
               {
                  _loc15_.width = 64;
                  _loc15_.height = _loc15_.width * _loc17_;
               }
            }
            _loc19_ = (64 - _loc15_.width) / 2;
            _loc20_ = (64 - _loc15_.height) / 2;
            _loc23_ = (_loc22_ = (_loc21_ = _loc15_.getBounds(_loc15_)).y + _loc21_.height) * (_loc15_.height / _loc16_);
            if(param1.type == FurniData.TYPE_FURNI)
            {
               _loc15_.x = _loc19_;
               _loc15_.y = 64 - _loc20_;
               _loc15_.y -= _loc23_;
            }
            else if(param1.type == FurniData.TYPE_POSTER)
            {
               _loc15_.x = _loc19_;
               _loc15_.y = _loc20_;
            }
            _loc3_ = _loc15_;
         }
         return _loc3_;
      }
      
      public function clickBackToGame(param1:Event) : void
      {
         var _loc2_:ShopScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.gameObj.method_118();
         _loc2_.gameObj.method_204();
      }
      
      public function clickQuit(param1:Event) : void
      {
         var _loc2_:ShopScreen = this;
         _loc2_.gameObj.quitToTitle();
      }
      
      public function clickPrevious(param1:MouseEvent) : void
      {
         var _loc2_:ShopScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.clip.noitems.visible = false;
         --_loc2_.whichSet;
         _loc2_.clip.panels.gotoAndPlay("prevset");
         _loc2_.clip.next_btn.visible = false;
         _loc2_.clip.prev_btn.visible = false;
         _loc2_.removeColorPalette();
      }
      
      public function clickNext(param1:MouseEvent) : void
      {
         var _loc2_:ShopScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.clip.noitems.visible = false;
         ++_loc2_.whichSet;
         _loc2_.clip.panels.gotoAndPlay("nextset");
         _loc2_.clip.next_btn.visible = false;
         _loc2_.clip.prev_btn.visible = false;
         _loc2_.removeColorPalette();
      }
      
      public function destroy() : void
      {
         var _loc2_:int = 0;
         var _loc1_:ShopScreen = this;
         _loc1_.kernFormat = null;
         _loc1_.clip.gender.male_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickGender);
         _loc1_.clip.gender.male_btn.removeEventListener(MouseEvent.MOUSE_OVER,_loc1_.rolloverGender);
         _loc1_.clip.gender.male_btn.removeEventListener(MouseEvent.MOUSE_OUT,_loc1_.rolloutGender);
         _loc1_.clip.gender.female_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickGender);
         _loc1_.clip.gender.female_btn.removeEventListener(MouseEvent.MOUSE_OVER,_loc1_.rolloverGender);
         _loc1_.clip.gender.female_btn.removeEventListener(MouseEvent.MOUSE_OUT,_loc1_.rolloutGender);
         _loc1_.clip.show_dropdown.btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickOpenShowDropdown);
         _loc1_.clip.theme_dropdown.btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickOpenThemeDropdown);
         _loc1_.removeColorPalette();
         try
         {
            _loc1_.clip.removeEventListener(Event.ENTER_FRAME,_loc1_.updateScreen);
         }
         catch(err:Error)
         {
         }
         var _loc3_:int = 1;
         while(_loc3_ <= 6)
         {
            _loc1_.clip.panels["panel" + _loc3_].purchase_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickPurchase);
            _loc1_.clip.panels["panel" + _loc3_].confirm.yes_btn.removeEventListener(MouseEvent.CLICK,_loc1_.confirmPurchase);
            _loc1_.clip.panels["panel" + _loc3_].confirm.no_btn.removeEventListener(MouseEvent.CLICK,_loc1_.cancelPurchase);
            _loc2_ = 1;
            while(_loc2_ <= 4)
            {
               _loc1_.clip.panels["panel" + _loc3_].pickswatch["color" + _loc2_].color_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickChooseColor);
               _loc2_++;
            }
            _loc3_++;
         }
         try
         {
            if(Boolean(_loc1_.tipsPanel) && Boolean(_loc1_.tipsPanel.parent))
            {
               _loc1_.tipsPanel.parent.removeChild(_loc1_.tipsPanel);
               _loc1_.tipsPanel = null;
            }
         }
         catch(err:Error)
         {
         }
         _loc1_.clip.upgrades_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickChangeMode);
         _loc1_.clip.furniture_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickChangeMode);
         _loc1_.clip.poster_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickChangeMode);
         _loc1_.clip.wallfloor_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickChangeMode);
         _loc1_.clip.clothing_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickChangeMode);
         _loc1_.clip.next_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickNext);
         _loc1_.clip.prev_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickPrevious);
         _loc1_.container.removeEventListener("clickBackToGame",_loc1_.clickBackToGame);
         _loc1_.container.removeEventListener("clickQuit",_loc1_.clickQuit);
         _loc1_.container.removeChild(_loc1_.clip);
         _loc1_.clip = null;
      }
      
      public function cancelPurchase(param1:MouseEvent) : void
      {
         var _loc2_:ShopScreen = this;
         var _loc3_:Number = -1;
         if(param1.currentTarget == _loc2_.clip.panels.panel1.confirm.no_btn)
         {
            _loc3_ = 1;
         }
         else if(param1.currentTarget == _loc2_.clip.panels.panel2.confirm.no_btn)
         {
            _loc3_ = 2;
         }
         else if(param1.currentTarget == _loc2_.clip.panels.panel3.confirm.no_btn)
         {
            _loc3_ = 3;
         }
         else if(param1.currentTarget == _loc2_.clip.panels.panel4.confirm.no_btn)
         {
            _loc3_ = 4;
         }
         else if(param1.currentTarget == _loc2_.clip.panels.panel5.confirm.no_btn)
         {
            _loc3_ = 5;
         }
         else if(param1.currentTarget == _loc2_.clip.panels.panel6.confirm.no_btn)
         {
            _loc3_ = 6;
         }
         if(_loc3_ > -1)
         {
            _loc2_.clip.panels["panel" + _loc3_].confirm.visible = false;
         }
      }
      
      public function clickPurchase(param1:MouseEvent) : void
      {
         var _loc2_:ShopScreen = this;
         var _loc3_:Number = -1;
         if(param1.currentTarget == _loc2_.clip.panels.panel1.purchase_btn)
         {
            _loc3_ = 1;
         }
         else if(param1.currentTarget == _loc2_.clip.panels.panel2.purchase_btn)
         {
            _loc3_ = 2;
         }
         else if(param1.currentTarget == _loc2_.clip.panels.panel3.purchase_btn)
         {
            _loc3_ = 3;
         }
         else if(param1.currentTarget == _loc2_.clip.panels.panel4.purchase_btn)
         {
            _loc3_ = 4;
         }
         else if(param1.currentTarget == _loc2_.clip.panels.panel5.purchase_btn)
         {
            _loc3_ = 5;
         }
         else if(param1.currentTarget == _loc2_.clip.panels.panel6.purchase_btn)
         {
            _loc3_ = 6;
         }
         if(_loc3_ > -1)
         {
            _loc2_.clip.panels["panel" + _loc3_].confirm.visible = true;
            _loc2_.removeColorPalette();
         }
      }
      
      public function confirmPurchase(param1:MouseEvent) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Boolean = false;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:ClothingItem = null;
         var _loc13_:String = null;
         var _loc2_:ShopScreen = this;
         var _loc3_:String = null;
         var _loc4_:Number = -1;
         if(param1.currentTarget == _loc2_.clip.panels.panel1.confirm.yes_btn)
         {
            _loc4_ = 1;
         }
         else if(param1.currentTarget == _loc2_.clip.panels.panel2.confirm.yes_btn)
         {
            _loc4_ = 2;
         }
         else if(param1.currentTarget == _loc2_.clip.panels.panel3.confirm.yes_btn)
         {
            _loc4_ = 3;
         }
         else if(param1.currentTarget == _loc2_.clip.panels.panel4.confirm.yes_btn)
         {
            _loc4_ = 4;
         }
         else if(param1.currentTarget == _loc2_.clip.panels.panel5.confirm.yes_btn)
         {
            _loc4_ = 5;
         }
         else if(param1.currentTarget == _loc2_.clip.panels.panel6.confirm.yes_btn)
         {
            _loc4_ = 6;
         }
         if(_loc4_ > -1)
         {
            _loc5_ = _loc2_.panelsPerSet * (_loc2_.whichSet - 1);
            _loc6_ = _loc4_ - 1 + _loc5_;
            _loc3_ = String(_loc2_.workingArray[_loc6_]);
            if(_loc2_.gameObj.var_134.clothingIsTinting(_loc3_))
            {
               _loc8_ = Number(_loc2_.tintGroupsColor1[_loc4_ - 1]);
               _loc9_ = Number(_loc2_.tintGroupsColor2[_loc4_ - 1]);
               _loc10_ = Number(_loc2_.tintGroupsColor3[_loc4_ - 1]);
               _loc11_ = Number(_loc2_.tintGroupsColor4[_loc4_ - 1]);
               _loc12_ = _loc2_.gameObj.var_134.getItemFromSKU(_loc3_);
               _loc13_ = _loc2_.getTintCode(_loc12_,_loc8_,_loc9_,_loc10_,_loc11_);
               _loc3_ += _loc13_;
            }
            _loc7_ = false;
            if(_loc2_.mode == "clothing")
            {
               _loc7_ = _loc2_.gameObj.var_127.purchaseClothing(_loc3_);
            }
            else if(_loc2_.mode == "upgrades")
            {
               _loc7_ = _loc2_.gameObj.var_127.purchaseBonus(_loc3_);
            }
            else
            {
               _loc7_ = _loc2_.gameObj.var_127.purchaseFurniture(_loc3_);
            }
            if(_loc7_)
            {
               _loc2_.lastPurchaseTag = _loc3_;
               _loc2_.gameObj.var_128.playSound("multicoin.wav");
               _loc2_.purchasedToday[_loc6_] = 1;
               _loc2_.tipsPanel.tips_txt.text = _loc2_.gameObj.var_127.getTipsTotal(true);
               _loc2_.tipsPanel.tips_txt.setTextFormat(_loc2_.kernFormat);
               _loc2_.populatePanels(true);
            }
            else
            {
               class_6.error("(Error Purchasing)");
            }
         }
      }
      
      public function clickChooseColor(param1:MouseEvent) : void
      {
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc2_:ShopScreen = this;
         if(Boolean(_loc2_.colorPalette) && _loc2_.colorPalette.visible)
         {
            class_6.method_1("HIDE PALETTE");
            _loc2_.colorPalette.visible = false;
            _loc2_.clip.coverup.visible = false;
            return;
         }
         var _loc3_:String = null;
         var _loc4_:Number = -1;
         var _loc5_:Number = -1;
         if(param1.currentTarget.parent.parent == _loc2_.clip.panels.panel1.pickswatch)
         {
            _loc5_ = 1;
         }
         else if(param1.currentTarget.parent.parent == _loc2_.clip.panels.panel2.pickswatch)
         {
            _loc5_ = 2;
         }
         else if(param1.currentTarget.parent.parent == _loc2_.clip.panels.panel3.pickswatch)
         {
            _loc5_ = 3;
         }
         else if(param1.currentTarget.parent.parent == _loc2_.clip.panels.panel4.pickswatch)
         {
            _loc5_ = 4;
         }
         else if(param1.currentTarget.parent.parent == _loc2_.clip.panels.panel5.pickswatch)
         {
            _loc5_ = 5;
         }
         else if(param1.currentTarget.parent.parent == _loc2_.clip.panels.panel6.pickswatch)
         {
            _loc5_ = 6;
         }
         if(param1.currentTarget.parent.name == "color1")
         {
            _loc4_ = 1;
         }
         else if(param1.currentTarget.parent.name == "color2")
         {
            _loc4_ = 2;
         }
         else if(param1.currentTarget.parent.name == "color3")
         {
            _loc4_ = 3;
         }
         else if(param1.currentTarget.parent.name == "color4")
         {
            _loc4_ = 4;
         }
         if(_loc5_ > -1 && _loc4_ > -1)
         {
            _loc6_ = _loc2_.panelsPerSet * (_loc2_.whichSet - 1);
            _loc7_ = _loc5_ - 1 + _loc6_;
            _loc3_ = String(_loc2_.workingArray[_loc7_]);
            _loc2_.showColorPalette(_loc5_,_loc4_,_loc3_);
         }
      }
      
      public function showColorPalette(param1:Number, param2:Number, param3:String) : void
      {
         var _loc5_:int = 0;
         var _loc18_:MovieClip = null;
         var _loc19_:Number = NaN;
         var _loc20_:int = 0;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc24_:Number = NaN;
         var _loc25_:Number = NaN;
         var _loc26_:int = 0;
         var _loc27_:MovieClip = null;
         var _loc28_:MovieClip = null;
         var _loc4_:ShopScreen;
         (_loc4_ = this).removeColorPalette();
         if(_loc4_.colorPalette == null)
         {
            _loc4_.colorPalette = new shop_palette();
         }
         _loc4_.colorPalette.visible = true;
         _loc4_.clip.addChild(_loc4_.colorPalette);
         _loc4_.colorPalette.y = 77;
         if(param1 == 2 || param1 == 4 || param1 == 6)
         {
            _loc4_.colorPaletteType = "left";
            _loc4_.colorPalette.x = _loc4_.colorPaletteOffscreenLeft;
         }
         else
         {
            _loc4_.colorPaletteType = "right";
            _loc4_.colorPalette.x = _loc4_.colorPaletteOffscreenRight;
         }
         _loc4_.clip.coverup.visible = true;
         _loc4_.clip.coverup.gotoAndStop(param1);
         _loc4_.colorPalettePanel = param1;
         _loc4_.colorPaletteColor = param2;
         _loc4_.colorPaletteData = _loc4_.gameObj.var_134.getMainPalette(param3,param2);
         if(_loc4_.colorSwatches == null)
         {
            _loc4_.colorSwatches = new Vector.<MovieClip>();
         }
         else if(_loc4_.colorSwatches.length > 0)
         {
            class_6.error("There\'s already " + _loc4_.colorSwatches.length + " items in the color swatch vector???");
         }
         _loc5_ = 0;
         while(_loc5_ < _loc4_.colorPaletteData.length)
         {
            (_loc18_ = new shop_colorswatch()).bg.transform.colorTransform = _loc4_.createColorTransform(_loc4_.colorPaletteData[_loc5_]);
            _loc18_.addEventListener(MouseEvent.MOUSE_DOWN,_loc4_.clickColorPaletteSwatch);
            _loc18_.addEventListener(MouseEvent.ROLL_OVER,_loc4_.rolloverColorPaletteSwatch);
            _loc18_.addEventListener(MouseEvent.ROLL_OUT,_loc4_.rolloutColorPaletteSwatch);
            _loc18_.mouseEnabled = true;
            _loc18_.buttonMode = true;
            _loc18_.useHandCursor = true;
            _loc18_.gotoAndStop(1);
            _loc18_.owned.mouseEnabled = false;
            _loc18_.owned.mouseChildren = false;
            _loc18_.unavailable.mouseEnabled = false;
            _loc18_.unavailable.mouseChildren = false;
            _loc4_.colorSwatches.push(_loc18_);
            if(param2 == 1 && _loc4_.tintGroupsColor1[param1 - 1] == _loc4_.colorPaletteData[_loc5_])
            {
               _loc18_.owned.visible = true;
            }
            else if(param2 == 2 && _loc4_.tintGroupsColor2[param1 - 1] == _loc4_.colorPaletteData[_loc5_])
            {
               _loc18_.owned.visible = true;
            }
            else if(param2 == 3 && _loc4_.tintGroupsColor3[param1 - 1] == _loc4_.colorPaletteData[_loc5_])
            {
               _loc18_.owned.visible = true;
            }
            else if(param2 == 4 && _loc4_.tintGroupsColor4[param1 - 1] == _loc4_.colorPaletteData[_loc5_])
            {
               _loc18_.owned.visible = true;
            }
            else
            {
               _loc18_.owned.visible = false;
            }
            _loc18_.unavailable.visible = false;
            _loc5_++;
         }
         19;
         84;
         50;
         29;
         6;
         var _loc12_:Number = _loc4_.colorSwatches.length;
         var _loc13_:Number = 0;
         var _loc14_:Array = [];
         _loc13_ = Math.ceil(_loc12_ / 6);
         var _loc15_:Number;
         if((_loc15_ = _loc12_ % 6) == 0)
         {
            _loc15_ = 6;
         }
         _loc5_ = 0;
         while(_loc5_ < _loc13_)
         {
            if(_loc5_ == _loc13_ - 1)
            {
               _loc14_[_loc5_] = _loc15_;
            }
            else if(_loc5_ == 0 && _loc12_ < 6)
            {
               _loc14_[_loc5_] = _loc12_;
            }
            else
            {
               _loc14_[_loc5_] = 6;
            }
            _loc5_++;
         }
         _loc5_ = 0;
         while(_loc5_ < _loc13_)
         {
            _loc19_ = Number(_loc14_[_loc5_]);
            _loc20_ = 0;
            while(_loc20_ < _loc19_)
            {
               _loc21_ = (6 * 50 - _loc19_ * 50) / 2;
               _loc22_ = 0;
               _loc23_ = 19 + _loc21_ + _loc20_ * 50;
               _loc24_ = 84 + _loc22_ + _loc5_ * 29;
               _loc25_ = 0;
               _loc26_ = 0;
               while(_loc26_ < _loc13_)
               {
                  if(_loc5_ > _loc26_)
                  {
                     _loc25_ += _loc14_[_loc26_];
                  }
                  else if(_loc5_ == _loc26_)
                  {
                     _loc25_ += _loc20_;
                  }
                  _loc26_++;
               }
               if(_loc4_.colorSwatches.length > _loc25_)
               {
                  (_loc27_ = _loc4_.colorSwatches[_loc25_]).x = _loc23_;
                  _loc27_.y = _loc24_;
                  _loc4_.colorPalette.addChild(_loc27_);
               }
               else
               {
                  class_6.error("Tried to place swatch " + _loc25_ + ", only " + _loc4_.colorSwatches.length + " exist!");
               }
               _loc20_++;
            }
            _loc5_++;
         }
         _loc4_.featureColorPaletteData = _loc4_.gameObj.var_134.getHolidayPalette(_loc4_.getClothingMonth());
         if(_loc4_.featureSwatches == null)
         {
            _loc4_.featureSwatches = new Vector.<MovieClip>();
         }
         else if(_loc4_.featureSwatches.length > 0)
         {
            class_6.error("There\'s already " + _loc4_.featureSwatches.length + " items in the feature swatch vector???");
         }
         _loc5_ = 0;
         while(_loc5_ < _loc4_.featureColorPaletteData.length)
         {
            (_loc28_ = new shop_colorswatch()).bg.transform.colorTransform = _loc4_.createColorTransform(_loc4_.featureColorPaletteData[_loc5_]);
            _loc28_.addEventListener(MouseEvent.MOUSE_DOWN,_loc4_.clickColorPaletteSwatch);
            _loc28_.addEventListener(MouseEvent.ROLL_OVER,_loc4_.rolloverColorPaletteSwatch);
            _loc28_.addEventListener(MouseEvent.ROLL_OUT,_loc4_.rolloutColorPaletteSwatch);
            _loc28_.mouseEnabled = true;
            _loc28_.buttonMode = true;
            _loc28_.useHandCursor = true;
            _loc28_.gotoAndStop(1);
            _loc28_.owned.mouseEnabled = false;
            _loc28_.owned.mouseChildren = false;
            _loc28_.unavailable.mouseEnabled = false;
            _loc28_.unavailable.mouseChildren = false;
            _loc4_.featureSwatches.push(_loc28_);
            if(_loc4_.colorPaletteData.indexOf(_loc4_.featureColorPaletteData[_loc5_]) > -1)
            {
               _loc28_.unavailable.visible = false;
               if(param2 == 1 && _loc4_.tintGroupsColor1[param1 - 1] == _loc4_.featureColorPaletteData[_loc5_])
               {
                  _loc28_.owned.visible = true;
               }
               else if(param2 == 2 && _loc4_.tintGroupsColor2[param1 - 1] == _loc4_.featureColorPaletteData[_loc5_])
               {
                  _loc28_.owned.visible = true;
               }
               else if(param2 == 3 && _loc4_.tintGroupsColor3[param1 - 1] == _loc4_.featureColorPaletteData[_loc5_])
               {
                  _loc28_.owned.visible = true;
               }
               else if(param2 == 4 && _loc4_.tintGroupsColor4[param1 - 1] == _loc4_.featureColorPaletteData[_loc5_])
               {
                  _loc28_.owned.visible = true;
               }
               else
               {
                  _loc28_.owned.visible = false;
               }
            }
            else
            {
               _loc28_.unavailable.visible = true;
               _loc28_.owned.visible = false;
               _loc28_.mouseEnabled = false;
               _loc28_.mouseChildren = false;
            }
            _loc5_++;
         }
         var _loc16_:Number = 48;
         48;
         if(_loc4_.featureSwatches.length < 5)
         {
            _loc16_ += (5 - _loc4_.featureSwatches.length) * (48 / 2);
         }
         _loc5_ = 0;
         while(_loc5_ < _loc4_.featureSwatches.length)
         {
            _loc4_.featureSwatches[_loc5_].x = _loc16_ + _loc5_ * 48;
            _loc4_.featureSwatches[_loc5_].y = 42;
            _loc4_.colorPalette.addChild(_loc4_.featureSwatches[_loc5_]);
            _loc5_++;
         }
         _loc4_.colorPalette.title_txt.text = _loc4_.gameObj.var_132.getHolidayName(_loc4_.getClothingMonth()).toUpperCase() + " COLORS";
         _loc4_.colorPalette.theme_icon.gotoAndStop(_loc4_.getClothingMonth());
         if(_loc4_.colorPalette.title_txt.textWidth > 200)
         {
            _loc4_.colorPalette.theme_icon.x = _loc4_.colorPalette.title_txt.x + _loc4_.colorPalette.title_txt.width / 2 - _loc4_.colorPalette.title_txt.textWidth / 2 - 30;
            if(_loc4_.colorPalette.theme_icon.x < 0)
            {
               _loc4_.colorPalette.theme_icon.x = 0;
            }
         }
         else
         {
            _loc4_.colorPalette.theme_icon.x = 46;
         }
         _loc4_.colorPalette.left_btn.visible = false;
         _loc4_.colorPalette.left_btn.mouseEnabled = false;
         _loc4_.colorPalette.right_btn.visible = false;
         _loc4_.colorPalette.right_btn.mouseEnabled = false;
      }
      
      public function removeColorPalette() : void
      {
         var screen:ShopScreen = null;
         var i:int = 0;
         screen = this;
         screen.clip.coverup.stop();
         screen.clip.coverup.visible = false;
         if(screen.colorPalette != null)
         {
            screen.colorPalette.visible = false;
            if(screen.colorSwatches != null && screen.colorSwatches.length > 0)
            {
               i = int(screen.colorSwatches.length - 1);
               while(i >= 0)
               {
                  screen.colorSwatches[i].removeEventListener(MouseEvent.MOUSE_DOWN,screen.clickColorPaletteSwatch);
                  screen.colorSwatches[i].removeEventListener(MouseEvent.ROLL_OVER,screen.rolloverColorPaletteSwatch);
                  screen.colorSwatches[i].removeEventListener(MouseEvent.ROLL_OUT,screen.rolloutColorPaletteSwatch);
                  try
                  {
                     if(screen.colorSwatches[i].parent)
                     {
                        screen.colorSwatches[i].parent.removeChild(screen.colorSwatches[i]);
                     }
                  }
                  catch(err:Error)
                  {
                     class_6.error(" ------ ERROR REMOVING A COLOR SWATCH: " + i + " --- " + err.message + " Clip: " + screen.colorSwatches[i]);
                     if(screen.colorSwatches[i] != null)
                     {
                        class_6.error(" ---- >> Parent? :" + screen.colorSwatches[i].parent);
                     }
                  }
                  screen.colorSwatches[i] = null;
                  screen.colorSwatches.splice(i,1);
                  i--;
               }
            }
            if(screen.featureSwatches != null && screen.featureSwatches.length > 0)
            {
               i = int(screen.featureSwatches.length - 1);
               while(i >= 0)
               {
                  screen.featureSwatches[i].removeEventListener(MouseEvent.MOUSE_DOWN,screen.clickColorPaletteSwatch);
                  screen.featureSwatches[i].removeEventListener(MouseEvent.ROLL_OVER,screen.rolloverColorPaletteSwatch);
                  screen.featureSwatches[i].removeEventListener(MouseEvent.ROLL_OUT,screen.rolloutColorPaletteSwatch);
                  try
                  {
                     if(screen.featureSwatches[i].parent)
                     {
                        screen.featureSwatches[i].parent.removeChild(screen.featureSwatches[i]);
                     }
                  }
                  catch(err:Error)
                  {
                     class_6.error(" ------ ERROR REMOVING A FEATURED SWATCH: " + i + " --- " + err.message + " Clip: " + screen.featureSwatches[i]);
                     if(screen.featureSwatches[i] != null)
                     {
                        class_6.error(" ---- >> Parent? :" + screen.featureSwatches[i].parent);
                     }
                  }
                  screen.featureSwatches[i] = null;
                  screen.featureSwatches.splice(i,1);
                  i--;
               }
            }
            if(screen.colorPalette.parent)
            {
               screen.colorPalette.parent.removeChild(screen.colorPalette);
            }
         }
      }
      
      public function clickColorPaletteSwatch(param1:MouseEvent) : void
      {
         var mypanel:MovieClip = null;
         var itemIndex:Number = NaN;
         var whichTag:String = null;
         var tintClothing:ClothingItem = null;
         var color1:Number = NaN;
         var color2:Number = NaN;
         var color3:Number = NaN;
         var decalColor:Number = NaN;
         var tintCodes:String = null;
         var e:MouseEvent = param1;
         var screen:ShopScreen = this;
         var user:UserData = screen.gameObj.var_127;
         var idx:Number = screen.colorSwatches.indexOf(MovieClip(e.currentTarget));
         var useColor:Number = -1;
         if(idx > -1 && idx < screen.colorPaletteData.length)
         {
            useColor = Number(screen.colorPaletteData[idx]);
         }
         else if(idx == -1)
         {
            idx = screen.featureSwatches.indexOf(MovieClip(e.currentTarget));
            if(idx > -1 && idx < screen.featureColorPaletteData.length)
            {
               useColor = Number(screen.featureColorPaletteData[idx]);
            }
         }
         if(useColor != -1)
         {
            if(screen.colorPaletteColor == 1)
            {
               screen.tintGroupsColor1[screen.colorPalettePanel - 1] = useColor;
            }
            else if(screen.colorPaletteColor == 2)
            {
               screen.tintGroupsColor2[screen.colorPalettePanel - 1] = useColor;
            }
            else if(screen.colorPaletteColor == 3)
            {
               screen.tintGroupsColor3[screen.colorPalettePanel - 1] = useColor;
            }
            else if(screen.colorPaletteColor == 4)
            {
               screen.tintGroupsColor4[screen.colorPalettePanel - 1] = useColor;
            }
            mypanel = screen.clip.panels["panel" + screen.colorPalettePanel];
            itemIndex = screen.panelsPerSet * (screen.whichSet - 1) + (screen.colorPalettePanel - 1);
            whichTag = String(screen.workingArray[itemIndex]);
            tintClothing = screen.gameObj.var_134.getItemFromSKU(whichTag);
            if(tintClothing.isForcingColor(2) && screen.colorPaletteColor != 2)
            {
               screen.tintGroupsColor2[screen.colorPalettePanel - 1] = tintClothing.getForceColor(2,screen.tintGroupsColor1[screen.colorPalettePanel - 1],screen.tintGroupsColor2[screen.colorPalettePanel - 1],screen.tintGroupsColor3[screen.colorPalettePanel - 1]);
            }
            if(tintClothing.isForcingColor(3) && screen.colorPaletteColor != 3)
            {
               screen.tintGroupsColor3[screen.colorPalettePanel - 1] = tintClothing.getForceColor(3,screen.tintGroupsColor1[screen.colorPalettePanel - 1],screen.tintGroupsColor2[screen.colorPalettePanel - 1],screen.tintGroupsColor3[screen.colorPalettePanel - 1]);
            }
            if(tintClothing.isForcingColor(4) && screen.colorPaletteColor != 4)
            {
               screen.tintGroupsColor4[screen.colorPalettePanel - 1] = tintClothing.getForceColor(4,screen.tintGroupsColor1[screen.colorPalettePanel - 1],screen.tintGroupsColor2[screen.colorPalettePanel - 1],screen.tintGroupsColor3[screen.colorPalettePanel - 1]);
            }
            color1 = Number(screen.tintGroupsColor1[screen.colorPalettePanel - 1]);
            color2 = Number(screen.tintGroupsColor2[screen.colorPalettePanel - 1]);
            color3 = Number(screen.tintGroupsColor3[screen.colorPalettePanel - 1]);
            decalColor = Number(screen.tintGroupsColor4[screen.colorPalettePanel - 1]);
            screen.updatePanelSwatches(mypanel,tintClothing,color1,color2,color3,decalColor);
            tintCodes = screen.getTintCode(tintClothing,color1,color2,color3,decalColor);
            try
            {
               if(mypanel.thumb.numChildren > 0)
               {
                  mypanel.thumb.removeChildAt(0);
               }
            }
            catch(err:Error)
            {
               class_6.error("Error removing thumb.");
            }
            mypanel.thumb.addChild(screen.gameObj.var_134.generateClothingThumb(tintClothing.tag + tintCodes,screen.previewGender));
            mypanel.pointpanel.theme.gotoAndStop(screen.gameObj.var_134.getClothingThemeFrame(tintClothing.tag + tintCodes,screen.getClothingMonth()));
            if(tintClothing.price <= user.getTipsTotal())
            {
               mypanel.purchase_btn.visible = true;
               mypanel.needmoretips_btn.visible = false;
            }
            else
            {
               mypanel.purchase_btn.visible = false;
               mypanel.needmoretips_btn.visible = true;
            }
            if(screen.gameObj.var_127.alreadyOwnsClothing(tintClothing.tag + tintCodes))
            {
               mypanel.purchase_btn.visible = false;
               mypanel.needmoretips_btn.visible = false;
               mypanel.purchasedbg.visible = true;
               mypanel.alreadyown.visible = true;
            }
            else
            {
               mypanel.purchasedbg.visible = false;
               mypanel.alreadyown.visible = false;
            }
         }
         screen.colorPalette.visible = false;
         screen.clip.coverup.visible = false;
      }
      
      public function rolloverColorPaletteSwatch(param1:MouseEvent) : void
      {
         this;
         MovieClip(param1.currentTarget).gotoAndStop(2);
      }
      
      public function rolloutColorPaletteSwatch(param1:MouseEvent) : void
      {
         this;
         MovieClip(param1.currentTarget).gotoAndStop(1);
      }
      
      public function updateDropdowns() : void
      {
         var _loc1_:ShopScreen = this;
         if(_loc1_.mode == "upgrades")
         {
            _loc1_.clip.dropdownlabels.visible = false;
            _loc1_.clip.show_dropdown.visible = false;
            _loc1_.clip.theme_dropdown.visible = false;
         }
         else
         {
            _loc1_.clip.dropdownlabels.visible = true;
            _loc1_.clip.show_dropdown.visible = true;
            _loc1_.clip.theme_dropdown.visible = true;
            _loc1_.clip.show_dropdown.theme.visible = false;
            _loc1_.clip.show_dropdown.label_txt.text = _loc1_.getDropdownLabel(_loc1_.filterShowType);
            _loc1_.clip.show_dropdown.label_txt.setTextFormat(_loc1_.kernFormat);
            _loc1_.clip.theme_dropdown.theme.visible = true;
            _loc1_.clip.theme_dropdown.label_txt.text = _loc1_.getDropdownLabel(_loc1_.filterThemeMonth);
            _loc1_.clip.theme_dropdown.label_txt.setTextFormat(_loc1_.kernFormat);
            if(_loc1_.filterThemeMonth == 0 || _loc1_.filterThemeMonth == -1)
            {
               _loc1_.clip.theme_dropdown.theme.gotoAndStop(13);
            }
            else
            {
               _loc1_.clip.theme_dropdown.theme.gotoAndStop(_loc1_.filterThemeMonth);
               _loc1_.clip.theme_dropdown.label_txt.text = "   " + _loc1_.clip.theme_dropdown.label_txt.text;
               _loc1_.clip.theme_dropdown.label_txt.setTextFormat(_loc1_.kernFormat);
            }
         }
      }
      
      public function getDropdownLabel(param1:*) : String
      {
         var _loc4_:Number = NaN;
         var _loc2_:ShopScreen = this;
         var _loc3_:String = "???";
         if(param1 === -1)
         {
            _loc3_ = "Any Theme";
         }
         else if(param1 === 0)
         {
            _loc3_ = "No Theme";
         }
         else if(param1 === 1 || param1 === 2 || param1 === 3 || param1 === 4 || param1 === 5 || param1 === 6 || param1 === 7 || param1 === 8 || param1 === 9 || param1 === 10 || param1 === 11 || param1 === 12)
         {
            _loc3_ = _loc2_.gameObj.var_132.getHolidayName(param1);
         }
         else if((_loc4_ = _loc2_.filterShowTypes.indexOf(param1)) > -1)
         {
            _loc3_ = String(_loc2_.filterShowTypeLabels[_loc4_]);
         }
         return _loc3_;
      }
      
      public function showDropdown(param1:String) : void
      {
         var _loc5_:MovieClip = null;
         var _loc2_:ShopScreen = this;
         _loc2_.removeDropdown();
         _loc2_.dropdownClip = new shop_dropdown_popup();
         if(param1 == "show")
         {
            _loc2_.dropdownClip.label_txt.text = _loc2_.getDropdownLabel(_loc2_.filterShowType);
            _loc2_.dropdownClip.label_txt.setTextFormat(_loc2_.kernFormat);
            _loc2_.dropdownClip.theme.visible = false;
         }
         else if(param1 == "theme")
         {
            _loc2_.dropdownClip.label_txt.text = _loc2_.getDropdownLabel(_loc2_.filterThemeMonth);
            _loc2_.dropdownClip.label_txt.setTextFormat(_loc2_.kernFormat);
            if(_loc2_.filterThemeMonth == 0 || _loc2_.filterThemeMonth == -1)
            {
               _loc2_.dropdownClip.theme.gotoAndStop(13);
            }
            else
            {
               _loc2_.dropdownClip.theme.gotoAndStop(_loc2_.filterThemeMonth);
               _loc2_.dropdownClip.label_txt.text = "   " + _loc2_.dropdownClip.label_txt.text;
               _loc2_.dropdownClip.label_txt.setTextFormat(_loc2_.kernFormat);
            }
         }
         var _loc3_:Array = null;
         if(param1 == "theme")
         {
            _loc3_ = [-1,1,2,3,4,5,6,7,8,9,10,11,12,0];
         }
         else if(param1 == "show")
         {
            if(_loc2_.mode == "clothing")
            {
               _loc3_ = ["all",ClothingItem.TYPE_SHIRT,ClothingItem.TYPE_PANTS,ClothingItem.TYPE_JACKET,ClothingItem.TYPE_SHOES,ClothingItem.TYPE_HAT,ClothingItem.TYPE_ACC_BODY,ClothingItem.TYPE_ACC_BELT,ClothingItem.TYPE_ACC_ARMS,ClothingItem.TYPE_ACC_FACE];
            }
            else if(_loc2_.mode == "wallfloor")
            {
               _loc3_ = ["notowned"];
            }
            else
            {
               _loc3_ = ["all","notowned","owned"];
            }
         }
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            (_loc5_ = new shop_dropdown_panel()).buttonMode = true;
            _loc5_.mouseEnabled = true;
            _loc5_.mouseChildren = false;
            if(_loc4_ % 2 == 0)
            {
               _loc5_.gotoAndStop(2);
            }
            else
            {
               _loc5_.gotoAndStop(1);
            }
            _loc5_.y = 27.5 + _loc4_ * 25;
            if(param1 == "show")
            {
               _loc5_.label_txt.text = _loc2_.getDropdownLabel(_loc3_[_loc4_]);
               _loc5_.label_txt.setTextFormat(_loc2_.kernFormat);
               _loc5_.theme.visible = false;
            }
            else if(param1 == "theme")
            {
               _loc5_.label_txt.text = _loc2_.getDropdownLabel(_loc3_[_loc4_]);
               _loc5_.label_txt.setTextFormat(_loc2_.kernFormat);
               if(_loc3_[_loc4_] == 0 || _loc3_[_loc4_] == -1)
               {
                  _loc5_.theme.gotoAndStop(13);
               }
               else
               {
                  _loc5_.theme.gotoAndStop(_loc3_[_loc4_]);
                  _loc5_.label_txt.text = "   " + _loc5_.label_txt.text;
                  _loc5_.label_txt.setTextFormat(_loc2_.kernFormat);
               }
            }
            _loc5_.whichType = _loc3_[_loc4_];
            if(param1 == "show" && _loc3_[_loc4_] == _loc2_.filterShowType)
            {
               _loc5_.arrow.visible = true;
            }
            else if(param1 == "theme" && _loc3_[_loc4_] == _loc2_.filterThemeMonth)
            {
               _loc5_.arrow.visible = true;
            }
            else
            {
               _loc5_.arrow.visible = false;
            }
            _loc5_.hiliter.visible = false;
            _loc5_.hiliter.gotoAndStop(1);
            _loc5_.addEventListener(MouseEvent.MOUSE_UP,_loc2_.chooseDropdownOption);
            _loc5_.addEventListener(MouseEvent.ROLL_OVER,_loc2_.rolloverDropdownOption);
            _loc5_.addEventListener(MouseEvent.ROLL_OUT,_loc2_.rolloutDropdownOption);
            _loc2_.dropdownClip.addChild(_loc5_);
            _loc2_.dropdownParts.push(_loc5_);
            _loc4_++;
         }
         _loc2_.dropdownClip.bottomcap.y = _loc2_.dropdownParts[_loc2_.dropdownParts.length - 1].y + _loc2_.dropdownParts[_loc2_.dropdownParts.length - 1].height;
         if(_loc3_.length % 2 == 0)
         {
            _loc2_.dropdownClip.bottomcap.gotoAndStop(1);
         }
         else
         {
            _loc2_.dropdownClip.bottomcap.gotoAndStop(2);
         }
         if(param1 == "show")
         {
            _loc2_.dropdownClip.x = _loc2_.clip.show_dropdown.x;
            _loc2_.dropdownClip.y = _loc2_.clip.show_dropdown.y;
         }
         else
         {
            _loc2_.dropdownClip.x = _loc2_.clip.theme_dropdown.x;
            _loc2_.dropdownClip.y = _loc2_.clip.theme_dropdown.y;
         }
         _loc2_.gameObj.addChild(_loc2_.dropdownClip);
         _loc2_.dropdownClip.cover.x = 0 - _loc2_.dropdownClip.x;
         _loc2_.dropdownClip.cover.y = 0 - _loc2_.dropdownClip.y;
         _loc2_.dropdownClip.cover.addEventListener(MouseEvent.MOUSE_UP,_loc2_.removeDropdown);
         _loc2_.dropdownClip.covertop.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.removeDropdown);
         _loc2_.isShowingDropdown = true;
         _loc2_.dropdownClipType = param1;
      }
      
      public function removeDropdown(param1:Event = null) : void
      {
         var _loc3_:int = 0;
         var _loc2_:ShopScreen = this;
         _loc2_.isShowingDropdown = false;
         _loc2_.dropdownClipType = "none";
         if(_loc2_.dropdownClip)
         {
            _loc2_.dropdownClip.cover.removeEventListener(MouseEvent.MOUSE_UP,_loc2_.removeDropdown);
            _loc2_.dropdownClip.covertop.removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.removeDropdown);
            if(_loc2_.dropdownClip.parent)
            {
               _loc2_.dropdownClip.parent.removeChild(_loc2_.dropdownClip);
            }
         }
         if(Boolean(_loc2_.dropdownParts) && _loc2_.dropdownParts.length > 0)
         {
            _loc3_ = int(_loc2_.dropdownParts.length - 1);
            while(_loc3_ >= 0)
            {
               _loc2_.dropdownParts[_loc3_].removeEventListener(MouseEvent.MOUSE_UP,_loc2_.chooseDropdownOption);
               _loc2_.dropdownParts[_loc3_].removeEventListener(MouseEvent.ROLL_OVER,_loc2_.rolloverDropdownOption);
               _loc2_.dropdownParts[_loc3_].removeEventListener(MouseEvent.ROLL_OUT,_loc2_.rolloutDropdownOption);
               if(_loc2_.dropdownParts[_loc3_].parent)
               {
                  _loc2_.dropdownParts[_loc3_].parent.removeChild(_loc2_.dropdownParts[_loc3_]);
               }
               _loc2_.dropdownParts[_loc3_] = null;
               _loc2_.dropdownParts.splice(_loc3_,1);
               _loc3_--;
            }
            _loc2_.dropdownParts = null;
            _loc2_.dropdownParts = [];
         }
         _loc2_.dropdownClip = null;
      }
      
      public function chooseDropdownOption(param1:MouseEvent) : void
      {
         var _loc2_:ShopScreen = this;
         var _loc3_:Boolean = false;
         var _loc4_:MovieClip;
         var _loc5_:* = (_loc4_ = MovieClip(param1.currentTarget)).whichType;
         if(_loc2_.dropdownClipType == "show")
         {
            if(_loc2_.filterShowType != _loc5_)
            {
               _loc3_ = true;
            }
            _loc2_.filterShowType = _loc5_;
         }
         else if(_loc2_.dropdownClipType == "theme")
         {
            if(_loc2_.filterThemeMonth != _loc5_)
            {
               _loc3_ = true;
            }
            _loc2_.filterThemeMonth = _loc5_;
         }
         if(_loc3_)
         {
            _loc2_.selectMode(_loc2_.mode,false,false);
         }
         _loc2_.removeDropdown();
      }
      
      public function rolloverDropdownOption(param1:MouseEvent) : void
      {
         var _loc2_:ShopScreen = this;
         var _loc3_:String = String(MovieClip(param1.currentTarget).whichType);
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.dropdownParts.length)
         {
            if(_loc2_.dropdownParts[_loc4_].whichType == _loc3_)
            {
               _loc2_.dropdownParts[_loc4_].hiliter.visible = true;
               _loc2_.dropdownParts[_loc4_].hiliter.gotoAndPlay(1);
            }
            else
            {
               _loc2_.dropdownParts[_loc4_].hiliter.visible = false;
               _loc2_.dropdownParts[_loc4_].hiliter.gotoAndStop(1);
            }
            _loc4_++;
         }
      }
      
      public function rolloutDropdownOption(param1:MouseEvent) : void
      {
         this;
         MovieClip(param1.currentTarget).hiliter.visible = false;
         MovieClip(param1.currentTarget).hiliter.gotoAndStop(1);
      }
      
      public function clickOpenShowDropdown(param1:MouseEvent) : void
      {
         var _loc2_:ShopScreen = this;
         if(!_loc2_.isShowingDropdown || _loc2_.dropdownClipType != "show")
         {
            _loc2_.showDropdown("show");
            _loc2_.removeColorPalette();
         }
      }
      
      public function clickOpenThemeDropdown(param1:MouseEvent) : void
      {
         var _loc2_:ShopScreen = this;
         if(!_loc2_.isShowingDropdown || _loc2_.dropdownClipType != "theme")
         {
            _loc2_.showDropdown("theme");
            _loc2_.removeColorPalette();
         }
      }
      
      public function rolloverGender(param1:MouseEvent) : void
      {
         var _loc2_:ShopScreen = this;
         if(param1.currentTarget == _loc2_.clip.gender.male_btn && _loc2_.previewGender != WorkerData.GENDER_MALE)
         {
            _loc2_.clip.gender.male_btn.gotoAndStop(3);
         }
         else if(param1.currentTarget == _loc2_.clip.gender.female_btn && _loc2_.previewGender != WorkerData.GENDER_FEMALE)
         {
            _loc2_.clip.gender.female_btn.gotoAndStop(3);
         }
      }
      
      public function rolloutGender(param1:MouseEvent) : void
      {
         var _loc2_:ShopScreen = this;
         if(param1.currentTarget == _loc2_.clip.gender.male_btn && _loc2_.previewGender != WorkerData.GENDER_MALE)
         {
            _loc2_.clip.gender.male_btn.gotoAndStop(2);
         }
         else if(param1.currentTarget == _loc2_.clip.gender.female_btn && _loc2_.previewGender != WorkerData.GENDER_FEMALE)
         {
            _loc2_.clip.gender.female_btn.gotoAndStop(2);
         }
      }
      
      public function clickGender(param1:MouseEvent) : void
      {
         var _loc2_:ShopScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         if(param1.currentTarget == _loc2_.clip.gender.male_btn && _loc2_.previewGender != WorkerData.GENDER_MALE)
         {
            _loc2_.previewGender = WorkerData.GENDER_MALE;
            _loc2_.populatePanels(true);
         }
         else if(param1.currentTarget == _loc2_.clip.gender.female_btn && _loc2_.previewGender != WorkerData.GENDER_FEMALE)
         {
            _loc2_.previewGender = WorkerData.GENDER_FEMALE;
            _loc2_.populatePanels(true);
         }
         if(_loc2_.previewGender == WorkerData.GENDER_MALE)
         {
            _loc2_.clip.gender.male_btn.gotoAndStop(1);
            _loc2_.clip.gender.female_btn.gotoAndStop(2);
         }
         else
         {
            _loc2_.clip.gender.male_btn.gotoAndStop(2);
            _loc2_.clip.gender.female_btn.gotoAndStop(1);
         }
      }
   }
}

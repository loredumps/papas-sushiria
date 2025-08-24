package sushiGame.models
{
   import flash.display.*;
   import flash.events.*;
   import flash.geom.ColorTransform;
   import flash.geom.Point;
   import flash.utils.getDefinitionByName;
   import package_2.class_6;
   import package_4.class_5;
   import sushiGame.data.FurniData;
   import sushiGame.screens.LobbyEditorScreen;
   
   public class FurnitureItem
   {
       
      
      public var gameObj:class_5;
      
      public var clip:MovieClip;
      
      public var container:MovieClip;
      
      public var data:FurniData;
      
      public var xtile:Number;
      
      public var ytile:Number;
      
      public var isDragging:Boolean = true;
      
      public var posterOffsetX:Number = -16;
      
      public var posterOffsetY:Number = -16;
      
      public var furniOffsetX:Number = -16;
      
      public var furniOffsetY:Number = 16;
      
      public var wallX:Number = 117;
      
      public var wallY:Number = 13;
      
      public var floorX:Array;
      
      public var floorY:Array;
      
      public var tileWidth:Number = 32;
      
      public var isLobby:Boolean = false;
      
      public var isOccupied:Boolean = false;
      
      public var hasBeenPlacedOnce:Boolean = false;
      
      public function FurnitureItem(param1:class_5, param2:MovieClip, param3:FurniData, param4:Number = 0, param5:Number = 0, param6:Boolean = true, param7:Boolean = false)
      {
         this.floorX = [140,121,102];
         this.floorY = [290,358,425];
         super();
         var _loc8_:FurnitureItem;
         (_loc8_ = this).gameObj = param1;
         _loc8_.container = param2;
         _loc8_.data = param3;
         _loc8_.xtile = param4;
         _loc8_.ytile = param5;
         _loc8_.isDragging = param6;
         _loc8_.isLobby = param7;
         _loc8_.setupFurni();
      }
      
      public function setupFurni() : void
      {
         var _loc1_:FurnitureItem = this;
         var _loc2_:LobbyEditorScreen = _loc1_.gameObj.var_178;
         var _loc3_:Class = getDefinitionByName(_loc1_.data.tag) as Class;
         _loc1_.clip = new _loc3_();
         _loc1_.container.addChild(_loc1_.clip);
         if(_loc1_.data.tag.indexOf("arcade") == -1)
         {
            _loc1_.clip.cacheAsBitmap = true;
         }
         if(!_loc1_.isDragging)
         {
            if(this.data.type == FurniData.TYPE_POSTER)
            {
               _loc1_.clip.x = _loc1_.wallX + _loc1_.xtile * _loc1_.tileWidth;
               _loc1_.clip.y = _loc1_.wallY + _loc1_.ytile * _loc1_.tileWidth;
            }
            else if(this.data.type == FurniData.TYPE_FURNI)
            {
               _loc1_.clip.x = _loc1_.floorX[_loc1_.ytile] + _loc1_.xtile * _loc1_.tileWidth;
               _loc1_.clip.y = _loc1_.floorY[_loc1_.ytile];
            }
            _loc1_.hasBeenPlacedOnce = true;
         }
         else
         {
            _loc1_.clip.x = _loc2_.clip.mouseX;
            _loc1_.clip.y = _loc2_.clip.mouseY;
            _loc1_.clip.addEventListener(Event.ENTER_FRAME,_loc1_.updateFurni);
         }
         if(!_loc1_.isLobby)
         {
            _loc1_.clip.mouseEnabled = true;
            _loc1_.clip.buttonMode = true;
            _loc1_.clip.useHandCursor = true;
            _loc1_.clip.addEventListener(MouseEvent.MOUSE_UP,_loc1_.selectFurni);
            _loc1_.clip.addEventListener(MouseEvent.ROLL_OVER,_loc1_.rolloverFurni);
            _loc1_.clip.addEventListener(MouseEvent.ROLL_OUT,_loc1_.rolloutFurni);
         }
         else if(_loc1_.data.tag == _loc1_.gameObj.var_132.jukeboxTag || _loc1_.data.tag == _loc1_.gameObj.var_132.boomboxTag || _loc1_.data.tag == _loc1_.gameObj.var_132.phonographTag)
         {
            _loc1_.clip.mouseEnabled = true;
            _loc1_.clip.buttonMode = true;
            _loc1_.clip.useHandCursor = true;
            _loc1_.clip.addEventListener(MouseEvent.MOUSE_UP,_loc1_.toggleMusicVolume);
         }
         if(_loc1_.data.tag == "poster_window" || _loc1_.data.tag == "poster_window2" || _loc1_.data.tag == "poster_window3" || _loc1_.data.tag == "poster_window4")
         {
            if(!_loc1_.isLobby)
            {
               _loc1_.clip.graphics.beginFill(13494015,1);
               _loc1_.clip.graphics.drawRect(0,0,_loc1_.data.width * _loc1_.tileWidth,_loc1_.data.depth * _loc1_.tileWidth);
               _loc1_.clip.graphics.endFill();
            }
            try
            {
               _loc1_.clip.trim.transform.colorTransform = _loc1_.createColorTransform(_loc1_.gameObj.var_127.lobbyTrim);
            }
            catch(err:Error)
            {
            }
         }
      }
      
      public function updateWindowTint() : void
      {
         var _loc1_:FurnitureItem = this;
         if(_loc1_.data.tag == "poster_window" || _loc1_.data.tag == "poster_window2" || _loc1_.data.tag == "poster_window3" || _loc1_.data.tag == "poster_window4")
         {
            try
            {
               _loc1_.clip.trim.transform.colorTransform = _loc1_.createColorTransform(_loc1_.gameObj.var_127.lobbyTrim);
            }
            catch(err:Error)
            {
            }
         }
      }
      
      public function updateFurni(param1:Event = null) : void
      {
         var _loc4_:Point = null;
         var _loc2_:FurnitureItem = this;
         var _loc3_:LobbyEditorScreen = _loc2_.gameObj.var_178;
         if(_loc2_.isDragging)
         {
            if((_loc4_ = _loc2_.getGridTile()) != null)
            {
               if(_loc2_.data.type == FurniData.TYPE_POSTER)
               {
                  if(_loc3_.isWallGridFree(_loc4_.x,_loc4_.y,this.data.width,this.data.depth))
                  {
                     _loc2_.clip.alpha = 0.9;
                     _loc2_.clip.x = _loc2_.wallX + _loc4_.x * _loc2_.tileWidth;
                     _loc2_.clip.y = _loc2_.wallY + _loc4_.y * _loc2_.tileWidth;
                  }
                  else
                  {
                     _loc2_.clip.alpha = 0.5;
                     _loc2_.clip.x = _loc3_.clip.mouseX + _loc2_.posterOffsetX;
                     _loc2_.clip.y = _loc3_.clip.mouseY + _loc2_.posterOffsetX;
                  }
                  _loc2_.setContainer(_loc3_.clip.wall_layer);
               }
               else if(_loc2_.data.type == FurniData.TYPE_FURNI)
               {
                  if(_loc3_.isFloorGridFree(_loc4_.x,_loc4_.y,this.data.width,this.data.depth))
                  {
                     _loc2_.clip.alpha = 0.9;
                     _loc2_.clip.x = _loc2_.floorX[_loc4_.y] + _loc4_.x * _loc2_.tileWidth;
                     _loc2_.clip.y = _loc2_.floorY[_loc4_.y];
                  }
                  else
                  {
                     _loc2_.clip.alpha = 0.5;
                     _loc2_.clip.x = _loc3_.clip.mouseX + _loc2_.furniOffsetX;
                     _loc2_.clip.y = _loc3_.clip.mouseY + _loc2_.furniOffsetY;
                  }
                  _loc2_.setContainer(_loc3_.clip["floor" + _loc4_.y + "_layer"]);
               }
            }
            else
            {
               _loc2_.clip.alpha = 0.5;
               _loc2_.clip.x = _loc3_.clip.mouseX;
               _loc2_.clip.y = _loc3_.clip.mouseY;
               if(_loc2_.data.type == FurniData.TYPE_POSTER)
               {
                  _loc2_.clip.x += _loc2_.posterOffsetX;
                  _loc2_.clip.y += _loc2_.posterOffsetY;
               }
               else
               {
                  _loc2_.clip.x += _loc2_.furniOffsetX;
                  _loc2_.clip.y += _loc2_.furniOffsetY;
               }
               _loc2_.setContainer(_loc3_.clip.moving_layer);
            }
         }
      }
      
      public function getGridTile() : Point
      {
         var _loc1_:FurnitureItem = this;
         var _loc2_:LobbyEditorScreen = _loc1_.gameObj.var_178;
         var _loc3_:Point = null;
         var _loc4_:Number = _loc2_.clip.mouseX;
         var _loc5_:Number = _loc2_.clip.mouseY;
         var _loc6_:Number = -1;
         var _loc7_:Number = -1;
         if(_loc1_.data.type == FurniData.TYPE_POSTER)
         {
            _loc6_ = Math.floor((_loc4_ - _loc1_.wallX) / _loc1_.tileWidth);
            _loc7_ = Math.floor((_loc5_ - _loc1_.wallY) / _loc1_.tileWidth);
            if(_loc6_ >= 0 && _loc6_ < _loc2_.wallGridWidth && _loc7_ >= 0 && _loc7_ < _loc2_.wallGridHeight)
            {
               _loc3_ = new Point(_loc6_,_loc7_);
            }
         }
         else if(_loc1_.data.type == FurniData.TYPE_FURNI)
         {
            if(_loc5_ >= _loc1_.floorY[0] - _loc1_.tileWidth && _loc5_ <= _loc1_.floorY[0])
            {
               _loc7_ = 0;
            }
            else if(_loc5_ >= _loc1_.floorY[1] - _loc1_.tileWidth && _loc5_ <= _loc1_.floorY[1])
            {
               _loc7_ = 1;
            }
            else if(_loc5_ >= _loc1_.floorY[2] - _loc1_.tileWidth && _loc5_ <= _loc1_.floorY[2])
            {
               _loc7_ = 2;
            }
            if(_loc7_ > -1)
            {
               if((_loc6_ = Math.floor((_loc4_ - _loc1_.floorX[_loc7_]) / _loc1_.tileWidth)) >= 0 && _loc6_ < _loc2_.floorGridWidth && _loc7_ >= 0 && _loc7_ < _loc2_.floorGridHeight)
               {
                  _loc3_ = new Point(_loc6_,_loc7_);
               }
            }
         }
         return _loc3_;
      }
      
      public function setContainer(param1:MovieClip) : void
      {
         var _loc2_:FurnitureItem = this;
         if(_loc2_.container != param1)
         {
            _loc2_.container = param1;
            if(!_loc2_.container.contains(_loc2_.clip))
            {
               _loc2_.container.addChild(_loc2_.clip);
            }
            else
            {
               _loc2_.container.setChildIndex(_loc2_.clip,_loc2_.container.numChildren - 1);
            }
         }
         else
         {
            _loc2_.container.setChildIndex(_loc2_.clip,_loc2_.container.numChildren - 1);
         }
      }
      
      public function selectFurni(param1:MouseEvent) : void
      {
         var _loc2_:FurnitureItem = this;
         var _loc3_:LobbyEditorScreen = _loc2_.gameObj.var_178;
         if(!_loc2_.isDragging && _loc3_.activeFurni == null)
         {
            _loc2_.gameObj.var_128.playSound("grabtopping.wav");
            _loc2_.isDragging = true;
            _loc3_.pickupFurni(_loc2_.data,_loc2_.xtile,_loc2_.ytile);
            _loc3_.setActiveFurni(_loc2_);
            if(!_loc2_.clip.hasEventListener(Event.ENTER_FRAME))
            {
               _loc2_.clip.addEventListener(Event.ENTER_FRAME,_loc2_.updateFurni);
            }
            _loc3_.shouldShowPutAway = true;
            _loc3_.showTrimPopup = false;
            _loc3_.showTopPopup = false;
            _loc3_.hideFurniHUD(null,true);
            param1.stopImmediatePropagation();
         }
      }
      
      public function rolloverFurni(param1:MouseEvent) : void
      {
         var _loc2_:FurnitureItem = this;
         var _loc3_:LobbyEditorScreen = _loc2_.gameObj.var_178;
         if(!_loc2_.isDragging && !_loc2_.isLobby && _loc3_.activeFurni == null)
         {
            _loc3_.showFurniHUD(_loc2_);
         }
      }
      
      public function rolloutFurni(param1:MouseEvent) : void
      {
         var _loc2_:FurnitureItem = this;
         var _loc3_:LobbyEditorScreen = _loc2_.gameObj.var_178;
         if(!_loc2_.isDragging && !_loc2_.isLobby)
         {
            _loc3_.hideFurniHUD(_loc2_);
         }
      }
      
      public function clickFurni(param1:MouseEvent) : void
      {
         var _loc4_:Point = null;
         var _loc2_:FurnitureItem = this;
         var _loc3_:LobbyEditorScreen = _loc2_.gameObj.var_178;
         if(_loc2_.isDragging)
         {
            if((_loc4_ = _loc2_.getGridTile()) != null)
            {
               if(_loc2_.data.type == FurniData.TYPE_POSTER)
               {
                  if(_loc3_.isWallGridFree(_loc4_.x,_loc4_.y,this.data.width,this.data.depth))
                  {
                     _loc2_.clip.alpha = 1;
                     _loc2_.clip.x = _loc2_.wallX + _loc4_.x * _loc2_.tileWidth;
                     _loc2_.clip.y = _loc2_.wallY + _loc4_.y * _loc2_.tileWidth;
                     _loc3_.placeFurni(_loc2_.data,_loc4_.x,_loc4_.y);
                     if(!_loc2_.hasBeenPlacedOnce)
                     {
                        _loc3_.gradeLayout(_loc2_.data,_loc2_.clip.x + _loc2_.clip.width / 2,_loc2_.clip.y + _loc2_.clip.height);
                        _loc2_.hasBeenPlacedOnce = true;
                     }
                     else
                     {
                        _loc3_.gradeLayout();
                     }
                     _loc2_.xtile = _loc4_.x;
                     _loc2_.ytile = _loc4_.y;
                     if(_loc3_.activeFurni == _loc2_)
                     {
                        _loc3_.activeFurni = null;
                     }
                     _loc2_.setContainer(_loc3_.clip.wall_layer);
                     _loc2_.clip.removeEventListener(Event.ENTER_FRAME,_loc2_.updateFurni);
                     _loc2_.isDragging = false;
                     _loc3_.shouldShowPutAway = false;
                     _loc3_.showTrimPopup = false;
                     _loc3_.showTopPopup = false;
                     if(!_loc2_.gameObj.var_127.hasPlacedFurniture)
                     {
                        _loc2_.gameObj.var_127.hasPlacedFurniture = true;
                     }
                     _loc2_.gameObj.var_128.playSound("droptopping.wav");
                  }
               }
               else if(_loc2_.data.type == FurniData.TYPE_FURNI)
               {
                  if(_loc3_.isFloorGridFree(_loc4_.x,_loc4_.y,this.data.width,this.data.depth))
                  {
                     _loc2_.clip.alpha = 1;
                     _loc2_.clip.x = _loc2_.floorX[_loc4_.y] + _loc4_.x * _loc2_.tileWidth;
                     _loc2_.clip.y = _loc2_.floorY[_loc4_.y];
                     _loc3_.placeFurni(_loc2_.data,_loc4_.x,_loc4_.y);
                     if(!_loc2_.hasBeenPlacedOnce)
                     {
                        _loc3_.gradeLayout(_loc2_.data,_loc2_.clip.x + _loc2_.clip.width / 2,_loc2_.clip.y - _loc2_.clip.height);
                        _loc2_.hasBeenPlacedOnce = true;
                     }
                     else
                     {
                        _loc3_.gradeLayout();
                     }
                     _loc2_.xtile = _loc4_.x;
                     _loc2_.ytile = _loc4_.y;
                     if(_loc3_.activeFurni == _loc2_)
                     {
                        _loc3_.activeFurni = null;
                     }
                     _loc2_.setContainer(_loc3_.clip["floor" + _loc2_.ytile + "_layer"]);
                     _loc2_.clip.removeEventListener(Event.ENTER_FRAME,_loc2_.updateFurni);
                     _loc2_.isDragging = false;
                     _loc3_.shouldShowPutAway = false;
                     _loc3_.showTrimPopup = false;
                     _loc3_.showTopPopup = false;
                     if(!_loc2_.gameObj.var_127.hasPlacedFurniture)
                     {
                        _loc2_.gameObj.var_127.hasPlacedFurniture = true;
                     }
                     _loc2_.gameObj.var_128.playSound("droptopping.wav");
                  }
               }
            }
         }
      }
      
      public function destroy() : void
      {
         var _loc1_:FurnitureItem = this;
         if(!_loc1_.isLobby)
         {
            _loc1_.clip.removeEventListener(MouseEvent.MOUSE_UP,_loc1_.selectFurni);
            _loc1_.clip.removeEventListener(MouseEvent.ROLL_OVER,_loc1_.rolloverFurni);
            _loc1_.clip.removeEventListener(MouseEvent.ROLL_OUT,_loc1_.rolloutFurni);
         }
         else if(_loc1_.data.tag == _loc1_.gameObj.var_132.jukeboxTag || _loc1_.data.tag == _loc1_.gameObj.var_132.boomboxTag || _loc1_.data.tag == _loc1_.gameObj.var_132.phonographTag)
         {
            _loc1_.clip.removeEventListener(MouseEvent.MOUSE_UP,_loc1_.toggleMusicVolume);
         }
         if(_loc1_.clip.hasEventListener(Event.ENTER_FRAME))
         {
            _loc1_.clip.removeEventListener(Event.ENTER_FRAME,_loc1_.updateFurni);
         }
         if(Boolean(_loc1_.container) && _loc1_.container.contains(_loc1_.clip))
         {
            _loc1_.container.removeChild(_loc1_.clip);
         }
         _loc1_.container = null;
         _loc1_.clip = null;
      }
      
      public function toggleMusicVolume(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         var ob:FurnitureItem = this;
         try
         {
            ob.gameObj.var_145.toggleMusicMute(ob.data.tag);
         }
         catch(err:Error)
         {
            class_6.method_1("Error with toggling volume on furni.");
         }
      }
      
      private function createColorTransform(param1:Number) : ColorTransform
      {
         var _loc2_:ColorTransform = new ColorTransform();
         _loc2_.redMultiplier = ((param1 & 16711680) >>> 16) / 255;
         _loc2_.greenMultiplier = ((param1 & 65280) >>> 8) / 255;
         _loc2_.blueMultiplier = (param1 & 255) / 255;
         return _loc2_;
      }
   }
}

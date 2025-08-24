package sushiGame.screens
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.*;
   import package_4.class_5;
   import sushiGame.data.GameData;
   import sushiGame.data.UserData;
   import sushiGame.models.Worker;
   
   public class FinishDayScreen
   {
       
      
      public var gameObj:class_5;
      
      public var clip:MovieClip;
      
      public var worker:Worker;
      
      public var isWaitingForTalkerResponse:Number = 0;
      
      public var backdropBitmap:Bitmap = null;
      
      public var waterTileWidth:Number = 46;
      
      public var waterFrames:Number = 28;
      
      public var waterTileHeight:Number = 100;
      
      public var waterTilesNeeded:Number = 11;
      
      public var waterSheet:BitmapData;
      
      public var waterTiles:Vector.<Bitmap>;
      
      public var waterTilesBMP:Vector.<BitmapData>;
      
      public var waterTileFrames:Vector.<int>;
      
      public function FinishDayScreen(param1:class_5)
      {
         super();
         var _loc2_:FinishDayScreen = this;
         _loc2_.gameObj = param1;
         _loc2_.setupScreen();
      }
      
      public function setupScreen() : void
      {
         var _loc1_:FinishDayScreen = this;
         var _loc2_:UserData = _loc1_.gameObj.var_127;
         _loc1_.clip = new finishDayMC();
         _loc1_.gameObj.var_150.addChild(_loc1_.clip);
         _loc1_.clip.play();
         _loc1_.clip.addEventListener(Event.ENTER_FRAME,this.updateScreen);
         _loc1_.gameObj.var_128.switchMusic("none");
         _loc1_.gameObj.var_128.playMusicClip("endofday.wav");
         _loc1_.worker = new Worker(_loc1_.gameObj,_loc1_.clip.workerholder,_loc1_.gameObj.workerData,0,0,0.22);
         _loc1_.worker.playAnimation("startday");
         _loc1_.setupWater();
         _loc1_.initBackdrop();
         _loc1_.gameObj.stage.frameRate = 30;
      }
      
      public function updateScreen(param1:Event) : void
      {
         var _loc2_:FinishDayScreen = this;
         _loc2_.worker.animateModel();
         _loc2_.updateWater();
         if(_loc2_.clip.currentFrame == _loc2_.clip.totalFrames)
         {
            _loc2_.clip.removeEventListener(Event.ENTER_FRAME,this.updateScreen);
            _loc2_.gameObj.var_202 = true;
            _loc2_.gameObj.method_250();
            _loc2_.gameObj.method_232();
         }
         else if(_loc2_.clip.currentFrame == 52)
         {
            _loc2_.worker.playAnimation("score_ok");
         }
      }
      
      public function destroy() : void
      {
         var _loc1_:FinishDayScreen = this;
         _loc1_.setupWater(false);
         _loc1_.worker.destroy();
         _loc1_.worker = null;
         if(_loc1_.backdropBitmap != null)
         {
            _loc1_.backdropBitmap.bitmapData.dispose();
            _loc1_.backdropBitmap.bitmapData = null;
            if(_loc1_.backdropBitmap.parent)
            {
               _loc1_.backdropBitmap.parent.removeChild(_loc1_.backdropBitmap);
            }
            _loc1_.backdropBitmap = null;
         }
         _loc1_.gameObj.var_150.removeChild(_loc1_.clip);
         _loc1_.clip = null;
      }
      
      private function createLobbyBackdropBitmap() : Bitmap
      {
         var _loc4_:Number = NaN;
         var _loc1_:FinishDayScreen = this;
         var _loc2_:UserData = _loc1_.gameObj.var_127;
         var _loc3_:Bitmap = null;
         var _loc5_:MovieClip = new startdayBackdropMC();
         _loc4_ = 1;
         while(_loc4_ <= 9)
         {
            _loc5_.holder.wallparts["wall" + _loc4_].gotoAndStop(_loc2_.lobbyWallpaper);
            _loc4_++;
         }
         _loc4_ = 1;
         while(_loc4_ <= 9)
         {
            _loc5_.holder.floorparts["floor" + _loc4_].gotoAndStop(_loc2_.lobbyFlooring);
            _loc4_++;
         }
         _loc5_.holder.trim.transform.colorTransform = _loc1_.createColorTransform(_loc2_.lobbyTrim);
         _loc5_.holder.wallparts.mask = _loc5_.holder.wallmask;
         _loc5_.holder.floorparts.mask = _loc5_.holder.floormask;
         var _loc6_:BitmapData;
         (_loc6_ = new BitmapData(150,172,true,0)).draw(_loc5_,null,null,null,new Rectangle(0,0,150,172));
         _loc3_ = new Bitmap(_loc6_);
         _loc5_ = null;
         return _loc3_;
      }
      
      private function createColorTransform(param1:Number) : ColorTransform
      {
         var _loc2_:ColorTransform = new ColorTransform();
         _loc2_.redMultiplier = ((param1 & 16711680) >>> 16) / 255;
         _loc2_.greenMultiplier = ((param1 & 65280) >>> 8) / 255;
         _loc2_.blueMultiplier = (param1 & 255) / 255;
         return _loc2_;
      }
      
      public function updateWater() : void
      {
         this;
      }
      
      public function setupWater(param1:Boolean = true) : void
      {
         this;
      }
      
      public function initBackdrop() : void
      {
         var _loc1_:FinishDayScreen = this;
         var _loc2_:Number = _loc1_.gameObj.var_127.getMonth();
         var _loc3_:Number = _loc1_.gameObj.var_127.getMonth() * 2 - 0;
         if(_loc1_.gameObj.var_127.getMonth() == GameData.STARTER_MONTH && _loc1_.gameObj.var_127.isNewYear() == false)
         {
            _loc3_ = 26;
         }
         var _loc4_:Array = ["bg3","bg2","bg1","mg","fg"];
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc1_.clip[_loc4_[_loc5_]].gotoAndStop(_loc3_);
            _loc1_.clip[_loc4_[_loc5_]].cacheAsBitmap = true;
            _loc1_.clip[_loc4_[_loc5_]].mouseEnabled = false;
            _loc1_.clip[_loc4_[_loc5_]].mouseChildren = false;
            _loc5_++;
         }
         _loc1_.clip.bg3.opaqueBackground = 16777215;
         if(_loc1_.gameObj.var_127.getRank() < 65)
         {
            _loc1_.clip.luckycat.stop();
            _loc1_.clip.removeChild(_loc1_.clip.luckycat);
         }
      }
   }
}

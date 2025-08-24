package sushiGame.managers
{
   import flash.events.*;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   import flash.utils.Timer;
   import flash.utils.getDefinitionByName;
   import package_2.class_6;
   import package_4.*;
   import sushiGame.screens.*;
   
   public class SoundManager extends EventDispatcher
   {
       
      
      public var gameObj:class_5;
      
      public var track_boombox:SoundChannel;
      
      public var track_jukebox:SoundChannel;
      
      public var track_phonograph:SoundChannel;
      
      public var track_order:SoundChannel;
      
      public var track_bake:SoundChannel;
      
      public var track_build:SoundChannel;
      
      public var track_topping:SoundChannel;
      
      public var track_title:SoundChannel;
      
      public var track_other:SoundChannel;
      
      public var track_none:SoundChannel;
      
      public var playingWhichTrack:String = "none";
      
      public var fadingWhichTrack:String = "none";
      
      public var isMute:Boolean = false;
      
      public var isMusicMute:Boolean = false;
      
      private var fadeTimer:Timer;
      
      private var fadeSpeed:Number = 100;
      
      private var fadeAmount:Number = 0.1;
      
      private var maxVolume:Number = 1;
      
      public var trackLength:Number = 1;
      
      public var enabled:Boolean = true;
      
      public function SoundManager(param1:class_5)
      {
         super();
         var _loc2_:SoundManager = this;
         _loc2_.gameObj = param1;
         _loc2_.setupEngine();
      }
      
      public function setupEngine() : void
      {
         var _loc2_:Sound = null;
         var _loc3_:Sound = null;
         var _loc4_:Sound = null;
         var _loc5_:Sound = null;
         var _loc6_:Sound = null;
         var _loc7_:Sound = null;
         var _loc8_:Sound = null;
         var _loc9_:Sound = null;
         var _loc10_:SoundTransform = null;
         var _loc1_:SoundManager = this;
         if(this.enabled)
         {
            _loc1_.track_none = new SoundChannel();
            _loc2_ = new boombox_music();
            _loc3_ = new jukebox_music();
            _loc4_ = new phonograph_music();
            _loc5_ = new orderscreen_music();
            _loc6_ = new grillscreen_music();
            _loc7_ = new buildscreen_music();
            _loc8_ = new other_music();
            _loc9_ = new title_music();
            _loc1_.trackLength = _loc5_.length;
            _loc10_ = new SoundTransform(0,0);
            _loc1_.track_boombox = _loc2_.play(0,int.MAX_VALUE,_loc10_);
            _loc1_.track_jukebox = _loc3_.play(0,int.MAX_VALUE,_loc10_);
            _loc1_.track_phonograph = _loc4_.play(0,int.MAX_VALUE,_loc10_);
            _loc1_.track_order = _loc5_.play(0,int.MAX_VALUE,_loc10_);
            _loc1_.track_bake = _loc6_.play(0,int.MAX_VALUE,_loc10_);
            _loc1_.track_build = _loc7_.play(0,int.MAX_VALUE,_loc10_);
            _loc1_.track_other = _loc8_.play(0,int.MAX_VALUE,_loc10_);
            _loc1_.track_title = _loc9_.play(0,int.MAX_VALUE,_loc10_);
            _loc1_.gameObj.var_130.api.addEventListener("muteSound",_loc1_.apiMutedSound);
            _loc1_.gameObj.var_130.api.addEventListener("unmuteSound",_loc1_.apiUnmutedSound);
            _loc1_.gameObj.var_130.api.addEventListener("muteMusic",_loc1_.apiMutedMusic);
            _loc1_.gameObj.var_130.api.addEventListener("unmuteMusic",_loc1_.apiUnmutedMusic);
         }
      }
      
      public function restoreSoundAfterAd() : void
      {
         var boomboxMusic:Sound = null;
         var jukeboxMusic:Sound = null;
         var phonographMusic:Sound = null;
         var orderMusic:Sound = null;
         var bakeMusic:Sound = null;
         var buildMusic:Sound = null;
         var otherMusic:Sound = null;
         var titleMusic:Sound = null;
         var trans:SoundTransform = null;
         var manager:SoundManager = this;
         if(this.enabled)
         {
            try
            {
               if(manager.track_boombox)
               {
                  manager.track_boombox.stop();
               }
               if(manager.track_jukebox)
               {
                  manager.track_jukebox.stop();
               }
               if(manager.track_phonograph)
               {
                  manager.track_phonograph.stop();
               }
               if(manager.track_order)
               {
                  manager.track_order.stop();
               }
               if(manager.track_build)
               {
                  manager.track_build.stop();
               }
               if(manager.track_bake)
               {
                  manager.track_bake.stop();
               }
               if(manager.track_title)
               {
                  manager.track_title.stop();
               }
               if(manager.track_other)
               {
                  manager.track_other.stop();
               }
            }
            catch(err:Error)
            {
               class_6.error("Error clearing music tracks after ad");
            }
            manager.track_boombox = null;
            manager.track_jukebox = null;
            manager.track_phonograph = null;
            manager.track_order = null;
            manager.track_build = null;
            manager.track_bake = null;
            manager.track_title = null;
            manager.track_other = null;
            boomboxMusic = new boombox_music();
            jukeboxMusic = new jukebox_music();
            phonographMusic = new phonograph_music();
            orderMusic = new orderscreen_music();
            bakeMusic = new grillscreen_music();
            buildMusic = new buildscreen_music();
            otherMusic = new other_music();
            titleMusic = new title_music();
            manager.trackLength = orderMusic.length;
            trans = new SoundTransform(0,0);
            manager.track_boombox = boomboxMusic.play(0,int.MAX_VALUE,trans);
            manager.track_jukebox = jukeboxMusic.play(0,int.MAX_VALUE,trans);
            manager.track_phonograph = phonographMusic.play(0,int.MAX_VALUE,trans);
            manager.track_order = orderMusic.play(0,int.MAX_VALUE,trans);
            manager.track_bake = bakeMusic.play(0,int.MAX_VALUE,trans);
            manager.track_build = buildMusic.play(0,int.MAX_VALUE,trans);
            manager.track_other = otherMusic.play(0,int.MAX_VALUE,trans);
            manager.track_title = titleMusic.play(0,int.MAX_VALUE,trans);
            try
            {
               if(manager.gameObj.var_129)
               {
                  manager.gameObj.var_129.restoreSoundAfterAd();
               }
               else
               {
                  class_6.error("No Build Screen to restore its sounds");
               }
            }
            catch(err2:Error)
            {
               class_6.error("Error restoring Build sounds after ad: " + err2.message);
            }
            try
            {
               if(manager.gameObj.var_135)
               {
                  manager.gameObj.var_135.restoreSoundAfterAd();
               }
               else
               {
                  class_6.error("No Cook Screen to restore its sounds");
               }
            }
            catch(err3:Error)
            {
               class_6.error("Error restoring Bake sounds after ad: " + err3.message);
            }
            try
            {
               if(manager.gameObj.var_137)
               {
                  manager.gameObj.var_137.restoreSoundAfterAd();
               }
               else
               {
                  class_6.error("No Tea Screen to restore its sounds");
               }
            }
            catch(err4:Error)
            {
               class_6.error("Error restoring Tea sounds after ad: " + err4.message);
            }
         }
      }
      
      public function switchMusic(param1:String) : void
      {
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:SoundChannel = null;
         var _loc6_:SoundChannel = null;
         var _loc7_:SoundChannel = null;
         var _loc8_:SoundChannel = null;
         var _loc2_:SoundManager = this;
         if(this.enabled)
         {
            _loc3_ = _loc2_.playingWhichTrack;
            _loc4_ = param1;
            if(!_loc2_.isMusicMute)
            {
               if(_loc4_ != _loc3_ && _loc2_.fadingWhichTrack == "none" || _loc4_ != _loc2_.fadingWhichTrack)
               {
                  if(_loc2_.fadingWhichTrack != "none")
                  {
                     if(_loc2_.fadeTimer)
                     {
                        _loc2_.fadeTimer.stop();
                        _loc2_.fadeTimer.removeEventListener(TimerEvent.TIMER,this.fadeMusic);
                        _loc2_.fadeTimer = null;
                     }
                     _loc5_ = _loc2_.getSoundTrack(_loc2_.playingWhichTrack);
                     _loc6_ = _loc2_.getSoundTrack(_loc2_.fadingWhichTrack);
                     if(_loc5_)
                     {
                        _loc5_.soundTransform = new SoundTransform(0);
                     }
                     if(_loc6_)
                     {
                        _loc6_.soundTransform = new SoundTransform(_loc2_.maxVolume);
                     }
                     _loc2_.playingWhichTrack = _loc2_.fadingWhichTrack;
                     _loc2_.fadingWhichTrack = "none";
                  }
                  _loc2_.fadingWhichTrack = _loc4_;
                  if(!_loc2_.fadeTimer)
                  {
                     _loc2_.fadeTimer = new Timer(_loc2_.fadeSpeed,0);
                     _loc2_.fadeTimer.addEventListener(TimerEvent.TIMER,this.fadeMusic);
                     _loc2_.fadeTimer.start();
                  }
               }
            }
            else
            {
               if(_loc7_ = _loc2_.getSoundTrack(_loc2_.playingWhichTrack))
               {
                  _loc7_.soundTransform = new SoundTransform(0);
               }
               _loc2_.playingWhichTrack = param1;
               if(_loc8_ = _loc2_.getSoundTrack(_loc2_.playingWhichTrack))
               {
                  _loc8_.soundTransform = new SoundTransform(0);
               }
            }
         }
      }
      
      public function muteSound() : void
      {
         var _loc1_:SoundManager = this;
         if(this.enabled)
         {
            _loc1_.isMute = true;
            dispatchEvent(new Event("soundIsMuted",true));
         }
      }
      
      public function unmuteSound() : void
      {
         var _loc1_:SoundManager = this;
         if(this.enabled)
         {
            _loc1_.isMute = false;
            dispatchEvent(new Event("soundIsNotMuted",true));
         }
      }
      
      public function apiMutedSound(param1:Event = null) : void
      {
         var _loc2_:SoundManager = this;
         if(this.enabled)
         {
            _loc2_.muteSound();
            try
            {
               if(_loc2_.gameObj.hudObj)
               {
                  _loc2_.gameObj.hudObj.updateMuteButton();
               }
            }
            catch(err:Error)
            {
            }
         }
      }
      
      public function apiUnmutedSound(param1:Event = null) : void
      {
         var _loc2_:SoundManager = this;
         if(this.enabled)
         {
            _loc2_.unmuteSound();
            try
            {
               if(_loc2_.gameObj.hudObj)
               {
                  _loc2_.gameObj.hudObj.updateMuteButton();
               }
            }
            catch(err:Error)
            {
            }
         }
      }
      
      public function muteMusic() : void
      {
         var _loc2_:SoundTransform = null;
         var _loc1_:SoundManager = this;
         if(this.enabled)
         {
            _loc1_.isMusicMute = true;
            if(_loc1_.fadingWhichTrack != "none")
            {
               _loc1_.playingWhichTrack = _loc1_.fadingWhichTrack;
               _loc1_.fadingWhichTrack = "none";
            }
            _loc2_ = new SoundTransform(0);
            _loc1_.track_boombox.soundTransform = _loc2_;
            _loc1_.track_jukebox.soundTransform = _loc2_;
            _loc1_.track_phonograph.soundTransform = _loc2_;
            _loc1_.track_order.soundTransform = _loc2_;
            _loc1_.track_bake.soundTransform = _loc2_;
            _loc1_.track_build.soundTransform = _loc2_;
            _loc1_.track_other.soundTransform = _loc2_;
            _loc1_.track_title.soundTransform = _loc2_;
            dispatchEvent(new Event("musicIsMuted",true));
         }
      }
      
      public function unmuteMusic() : void
      {
         var _loc2_:SoundChannel = null;
         var _loc3_:SoundTransform = null;
         var _loc1_:SoundManager = this;
         if(this.enabled)
         {
            _loc1_.isMusicMute = false;
            if(_loc1_.playingWhichTrack != "none")
            {
               _loc2_ = _loc1_.getSoundTrack(_loc1_.playingWhichTrack);
               if(_loc2_)
               {
                  _loc3_ = new SoundTransform(1);
                  _loc2_.soundTransform = _loc3_;
               }
            }
            dispatchEvent(new Event("musicIsNotMuted",true));
         }
      }
      
      public function apiMutedMusic(param1:Event = null) : void
      {
         var _loc2_:SoundManager = this;
         if(this.enabled)
         {
            _loc2_.muteMusic();
            try
            {
               if(_loc2_.gameObj.hudObj)
               {
                  _loc2_.gameObj.hudObj.updateMuteButton();
               }
            }
            catch(err:Error)
            {
            }
         }
      }
      
      public function apiUnmutedMusic(param1:Event = null) : void
      {
         var _loc2_:SoundManager = this;
         if(this.enabled)
         {
            _loc2_.unmuteMusic();
            try
            {
               if(_loc2_.gameObj.hudObj)
               {
                  _loc2_.gameObj.hudObj.updateMuteButton();
               }
            }
            catch(err:Error)
            {
            }
         }
      }
      
      public function fadeMusic(param1:TimerEvent) : void
      {
         var _loc3_:SoundTransform = null;
         var _loc4_:SoundTransform = null;
         var _loc5_:SoundChannel = null;
         var _loc6_:SoundChannel = null;
         var _loc7_:Boolean = false;
         var _loc2_:SoundManager = this;
         if(this.enabled)
         {
            _loc3_ = new SoundTransform();
            _loc4_ = new SoundTransform();
            _loc5_ = _loc2_.getSoundTrack(_loc2_.playingWhichTrack);
            if(_loc6_ = _loc2_.getSoundTrack(_loc2_.fadingWhichTrack))
            {
               _loc3_.volume = _loc6_.soundTransform.volume + _loc2_.fadeAmount;
            }
            if(_loc5_)
            {
               _loc4_.volume = _loc5_.soundTransform.volume - _loc2_.fadeAmount;
            }
            _loc7_ = false;
            if(_loc3_.volume >= _loc2_.maxVolume)
            {
               _loc3_.volume = _loc2_.maxVolume;
               _loc4_.volume = 0;
               _loc7_ = true;
            }
            if(_loc6_)
            {
               _loc6_.soundTransform = _loc3_;
            }
            if(Boolean(_loc5_) && _loc5_ != _loc6_)
            {
               _loc5_.soundTransform = _loc4_;
            }
            if(_loc7_)
            {
               if(_loc2_.fadeTimer)
               {
                  _loc2_.fadeTimer.stop();
                  _loc2_.fadeTimer.removeEventListener(TimerEvent.TIMER,this.fadeMusic);
                  _loc2_.fadeTimer = null;
               }
               _loc2_.playingWhichTrack = _loc2_.fadingWhichTrack;
               _loc2_.fadingWhichTrack = "none";
            }
         }
      }
      
      public function getSoundTrack(param1:String) : SoundChannel
      {
         var _loc2_:SoundManager = this;
         if(this.enabled)
         {
            if(param1 == "order")
            {
               return _loc2_.track_order;
            }
            if(param1 == "bake" || param1 == "cook")
            {
               return _loc2_.track_bake;
            }
            if(param1 == "build")
            {
               return _loc2_.track_build;
            }
            if(param1 == "topping" || param1 == "tea")
            {
               return _loc2_.track_other;
            }
            if(param1 == "title")
            {
               return _loc2_.track_title;
            }
            if(param1 == "other")
            {
               return _loc2_.track_other;
            }
            return _loc2_.track_none;
         }
         return null;
      }
      
      public function playMusicClip(param1:String, param2:Boolean = false, param3:Number = -1, param4:Number = 0, param5:Number = 0) : SoundChannel
      {
         var _loc6_:SoundManager = this;
         if(this.enabled)
         {
            if(_loc6_.isMusicMute)
            {
               param3 = 0;
            }
            return _loc6_.playSound(param1,param2,param3,param4,param5,true);
         }
         return null;
      }
      
      public function playSound(param1:String, param2:Boolean = false, param3:Number = -1, param4:Number = 0, param5:Number = 0, param6:Boolean = false) : SoundChannel
      {
         var soundObject:Sound = null;
         var soundChannel:SoundChannel = null;
         var SoundReference:Class = null;
         var transform:SoundTransform = null;
         var loopNumber:Number = NaN;
         var which:String = param1;
         var loop:Boolean = param2;
         var targetVolume:Number = param3;
         var targetPan:Number = param4;
         var targetPosition:Number = param5;
         var isMusicClip:Boolean = param6;
         var engine:SoundManager = this;
         if(this.enabled)
         {
            soundObject = null;
            soundChannel = null;
            try
            {
               SoundReference = getDefinitionByName(which) as Class;
               soundObject = new SoundReference();
               transform = new SoundTransform();
               transform.pan = targetPan;
               if(engine.isMute && !isMusicClip)
               {
                  transform.volume = 0;
               }
               else if(targetVolume == -1)
               {
                  transform.volume = engine.maxVolume;
               }
               else
               {
                  transform.volume = targetVolume;
               }
               loopNumber = 0;
               if(loop)
               {
                  loopNumber = int.MAX_VALUE;
               }
               soundChannel = soundObject.play(targetPosition,loopNumber,transform);
            }
            catch(e:Error)
            {
               class_6.error("Error Playing Sound: " + which + ". " + e.message);
            }
            return soundChannel;
         }
         return null;
      }
   }
}

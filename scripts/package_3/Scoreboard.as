package package_3
{
   import fl.controls.TextInput;
   import flash.display.*;
   import flash.events.*;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import flipline.api.class_18;
   import package_2.*;
   
   public class Scoreboard
   {
       
      
      private var api:class_18;
      
      private var clip:MovieClip;
      
      private var largeScoreboardY:Number = 47;
      
      private var smallScoreboardY:Number = 75;
      
      private var scoresPerPage:Number = 10;
      
      private var submittingScore:Boolean = false;
      
      private var showPlace:Boolean = false;
      
      private var requireName:Boolean = true;
      
      private var playerScore:Number = 0;
      
      private var playerName:String = "Anonymous";
      
      private var playerCustomData:Object = null;
      
      private var scoreboardClassName:String = "flipline_highscoresMC";
      
      private var enterNameText:TextInput;
      
      private var enterNameButton:class_17;
      
      private var closeCallback:Function;
      
      private var scoreTableName:String;
      
      private var todayScores:Array;
      
      private var weeklyScores:Array;
      
      private var monthlyScores:Array;
      
      private var alltimeScores:Array;
      
      private var todayTotal:Number;
      
      private var weeklyTotal:Number;
      
      private var monthlyTotal:Number;
      
      private var alltimeTotal:Number;
      
      private var todayPage:Number = 1;
      
      private var weeklyPage:Number = 1;
      
      private var monthlyPage:Number = 1;
      
      private var alltimePage:Number = 1;
      
      private var scoreData:Object;
      
      private var timestamp:Number = 0;
      
      public var viewingMode:String = "today";
      
      public var scoreSuffix:String = " Pts.";
      
      public var scorePrefix:String = "";
      
      public var showDate:Boolean = true;
      
      public function Scoreboard(param1:class_18, param2:String, param3:Function = null, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:String = "Anonymous", param8:Number = 0, param9:Object = null)
      {
         var ob:Scoreboard;
         var api:class_18 = param1;
         var scoreTableName:String = param2;
         var closeCallback:Function = param3;
         var submitScore:Boolean = param4;
         var requireName:Boolean = param5;
         var showPlace:Boolean = param6;
         var playerName:String = param7;
         var playerScore:Number = param8;
         var playerCustomData:Object = param9;
         super();
         ob = this;
         ob.api = api;
         ob.scoreTableName = scoreTableName;
         ob.submittingScore = submitScore;
         ob.requireName = requireName;
         ob.showPlace = showPlace;
         ob.playerName = playerName;
         ob.playerScore = playerScore;
         ob.playerCustomData = playerCustomData;
         if(closeCallback == null)
         {
            ob.closeCallback = function():void
            {
            };
         }
         else
         {
            ob.closeCallback = closeCallback;
         }
         ob.setupScoreboard();
      }
      
      private function setupScoreboard() : void
      {
         var _loc1_:Scoreboard = this;
         _loc1_.clip = _loc1_.api.var_153.method_103(_loc1_.scoreboardClassName);
         _loc1_.clip.x = (_loc1_.api.var_161 - _loc1_.clip.width) / 2;
         if(_loc1_.showPlace)
         {
            _loc1_.clip.y = _loc1_.largeScoreboardY;
         }
         else
         {
            _loc1_.clip.y = _loc1_.smallScoreboardY;
         }
         _loc1_.clip.close_btn.addEventListener(MouseEvent.CLICK,_loc1_.closeScoreboard);
         _loc1_.enterNameText = new TextInput();
         _loc1_.enterNameText.width = 294;
         _loc1_.enterNameText.height = 39;
         _loc1_.clip.entername.addChild(_loc1_.enterNameText);
         var _loc2_:TextFormat = new TextFormat();
         _loc2_.font = "Arial";
         _loc2_.size = 24;
         _loc2_.bold = true;
         _loc2_.align = TextFormatAlign.CENTER;
         _loc1_.enterNameText.setStyle("textFormat",_loc2_);
         _loc1_.enterNameText.maxChars = 16;
         _loc1_.enterNameText.restrict = "0-9A-Za-z \'\\-";
         _loc1_.enterNameButton = new class_17(null,"SUBMIT SCORE","small","button","clickNameOK",null,false,false,false,null,false,180);
         _loc1_.enterNameButton.x = 57;
         _loc1_.enterNameButton.y = 46;
         _loc1_.clip.entername.addChild(_loc1_.enterNameButton);
         _loc1_.enterNameButton.addEventListener("clickNameOK",_loc1_.clickEnterNameOK);
         _loc1_.enterNameText.text = _loc1_.playerName;
         _loc1_.clip.content.today_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickMode);
         _loc1_.clip.content.weekly_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickMode);
         _loc1_.clip.content.monthly_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickMode);
         _loc1_.clip.content.alltime_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickMode);
         _loc1_.clip.content.today_btn.addEventListener(MouseEvent.ROLL_OVER,_loc1_.rolloverMode);
         _loc1_.clip.content.weekly_btn.addEventListener(MouseEvent.ROLL_OVER,_loc1_.rolloverMode);
         _loc1_.clip.content.monthly_btn.addEventListener(MouseEvent.ROLL_OVER,_loc1_.rolloverMode);
         _loc1_.clip.content.alltime_btn.addEventListener(MouseEvent.ROLL_OVER,_loc1_.rolloverMode);
         _loc1_.clip.content.today_btn.addEventListener(MouseEvent.ROLL_OUT,_loc1_.rolloutMode);
         _loc1_.clip.content.weekly_btn.addEventListener(MouseEvent.ROLL_OUT,_loc1_.rolloutMode);
         _loc1_.clip.content.monthly_btn.addEventListener(MouseEvent.ROLL_OUT,_loc1_.rolloutMode);
         _loc1_.clip.content.alltime_btn.addEventListener(MouseEvent.ROLL_OUT,_loc1_.rolloutMode);
         _loc1_.clip.content.today_btn.buttonMode = true;
         _loc1_.clip.content.weekly_btn.buttonMode = true;
         _loc1_.clip.content.monthly_btn.buttonMode = true;
         _loc1_.clip.content.alltime_btn.buttonMode = true;
         _loc1_.clip.content.today_btn.useHandCursor = true;
         _loc1_.clip.content.weekly_btn.useHandCursor = true;
         _loc1_.clip.content.monthly_btn.useHandCursor = true;
         _loc1_.clip.content.alltime_btn.useHandCursor = true;
         _loc1_.clip.content.today_btn.mouseChildren = false;
         _loc1_.clip.content.weekly_btn.mouseChildren = false;
         _loc1_.clip.content.monthly_btn.mouseChildren = false;
         _loc1_.clip.content.alltime_btn.mouseChildren = false;
         _loc1_.clip.content.next_btn.visible = false;
         _loc1_.clip.content.prev_btn.visible = false;
         _loc1_.api.container.addChild(_loc1_.clip);
         if(_loc1_.showPlace)
         {
            _loc1_.clip.bg.gotoAndStop("large");
         }
         else
         {
            _loc1_.clip.bg.gotoAndStop("small");
         }
         if(_loc1_.submittingScore && _loc1_.requireName)
         {
            _loc1_.showEnterName();
         }
         else if(_loc1_.submittingScore && !_loc1_.requireName)
         {
            _loc1_.submitScore();
         }
         else if(!_loc1_.submittingScore)
         {
            _loc1_.loadScores();
         }
      }
      
      public function clickEnterNameOK(param1:Event = null) : void
      {
         var _loc2_:Scoreboard = this;
         _loc2_.playerName = _loc2_.enterNameText.text;
         _loc2_.submitScore();
      }
      
      private function showMessage(param1:String, param2:Boolean = false) : void
      {
         var _loc3_:Scoreboard = this;
         if(_loc3_.clip)
         {
            _loc3_.clip.content.visible = false;
            _loc3_.clip.entername.visible = false;
            _loc3_.clip.message.visible = true;
            _loc3_.clip.message.message_txt.text = String(param1);
            _loc3_.clip.message.spinner.visible = param2;
         }
      }
      
      private function showEnterName() : void
      {
         var _loc1_:Scoreboard = this;
         _loc1_.clip.content.visible = false;
         _loc1_.clip.message.visible = false;
         _loc1_.clip.entername.visible = true;
         _loc1_.enterNameText.text = _loc1_.playerName;
         _loc1_.enterNameText.setFocus();
      }
      
      private function submitScore() : void
      {
         var _loc1_:Scoreboard = this;
         _loc1_.showMessage("Sorry, Leaderboards are not available for this game.");
      }
      
      public function loadScores() : void
      {
         var _loc1_:Scoreboard = this;
         _loc1_.showMessage("Sorry, Leaderboards are not available for this game.");
      }
      
      public function showScores(param1:String = "today") : void
      {
         null;
         var _loc6_:MovieClip = null;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc2_:Scoreboard = this;
         _loc2_.viewingMode = param1;
         _loc2_.clip.content.today_btn.tab.alpha = 0;
         _loc2_.clip.content.weekly_btn.tab.alpha = 0;
         _loc2_.clip.content.monthly_btn.tab.alpha = 0;
         _loc2_.clip.content.alltime_btn.tab.alpha = 0;
         _loc2_.clip.content[_loc2_.viewingMode + "_btn"].tab.alpha = 1;
         _loc2_.clip.message.visible = false;
         _loc2_.clip.entername.visible = false;
         _loc2_.clip.content.visible = true;
         var _loc3_:Array = _loc2_[_loc2_.viewingMode + "Scores"];
         class_6.method_1("Show scores: " + _loc3_.length + " total");
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_.scoresPerPage)
         {
            _loc6_ = _loc2_.clip.content["panel" + _loc5_];
            if(_loc3_.length > _loc5_)
            {
               _loc6_.visible = true;
               _loc6_.place_txt.htmlText = "<B>" + (_loc5_ + 1) + ".</B>";
               _loc6_.name_txt.htmlText = "<B>" + _loc3_[_loc5_].name + "</B>";
               _loc6_.score_txt.htmlText = "<B>" + _loc2_.scorePrefix + class_12.method_114(_loc3_[_loc5_].score) + _loc2_.scoreSuffix + "</B>";
               if(_loc2_.showDate)
               {
                  if(_loc2_.viewingMode == "today")
                  {
                     _loc7_ = _loc2_.timestamp - _loc3_[_loc5_].timestamp;
                     _loc8_ = Math.floor(_loc7_ / 86400000);
                     _loc9_ = Math.floor(_loc7_ / 3600000);
                     _loc10_ = Math.floor(_loc7_ / 60000);
                     _loc11_ = Math.floor(_loc7_ / 1000);
                     if(_loc8_ > 1)
                     {
                        _loc6_.date_txt.htmlText = "<B>" + _loc8_ + " days ago</B>";
                     }
                     else if(_loc8_ == 1)
                     {
                        _loc6_.date_txt.htmlText = "<B>" + _loc8_ + " day ago</B>";
                     }
                     else if(_loc9_ > 1)
                     {
                        _loc6_.date_txt.htmlText = "<B>" + _loc9_ + " hours ago</B>";
                     }
                     else if(_loc9_ == 1)
                     {
                        _loc6_.date_txt.htmlText = "<B>" + _loc9_ + " hour ago</B>";
                     }
                     else if(_loc10_ > 1)
                     {
                        _loc6_.date_txt.htmlText = "<B>" + _loc10_ + " mins ago</B>";
                     }
                     else if(_loc10_ == 1)
                     {
                        _loc6_.date_txt.htmlText = "<B>" + _loc10_ + " min ago</B>";
                     }
                     else if(_loc11_ == 1)
                     {
                        _loc6_.date_txt.htmlText = "<B>" + _loc11_ + " sec ago</B>";
                     }
                     else if(_loc11_ == 0)
                     {
                        _loc6_.date_txt.htmlText = "<B>just now</B>";
                     }
                     else
                     {
                        _loc6_.date_txt.htmlText = "<B>" + _loc11_ + " secs ago</B>";
                     }
                  }
                  else if(_loc2_.viewingMode == "alltime")
                  {
                     _loc6_.date_txt.htmlText = "<B>" + class_12.method_194(_loc3_[_loc5_].timestamp,"mm/dd/YY",true) + "</B>";
                  }
                  else
                  {
                     _loc6_.date_txt.htmlText = "<B>" + class_12.method_194(_loc3_[_loc5_].timestamp,"m dd",true) + "</B>";
                  }
               }
               else
               {
                  _loc6_.date_txt.htmlText = "";
               }
            }
            else
            {
               _loc6_.visible = false;
            }
            _loc5_++;
         }
         if(_loc2_.showPlace)
         {
            _loc2_.clip.content.yourscore.visible = true;
            _loc2_.clip.content.yourscore.panel.place_txt.htmlText = "";
            _loc2_.clip.content.yourscore.panel.name_txt.htmlText = "<B>" + _loc2_.playerName + "</B>";
            _loc2_.clip.content.yourscore.panel.date_txt.htmlText = "";
            _loc2_.clip.content.yourscore.panel.score_txt.htmlText = "<B>" + class_12.method_114(_loc2_.playerScore) + "</B>";
         }
         else
         {
            _loc2_.clip.content.yourscore.visible = false;
         }
      }
      
      public function clickMode(param1:MouseEvent) : void
      {
         var _loc2_:Scoreboard = this;
         var _loc3_:String = String(param1.currentTarget.name.split("_")[0]);
         if(_loc3_ != _loc2_.viewingMode)
         {
            _loc2_.showScores(_loc3_);
         }
      }
      
      public function rolloverMode(param1:MouseEvent) : void
      {
         var _loc2_:Scoreboard = this;
         var _loc3_:String = String(param1.currentTarget.name.split("_")[0]);
         if(_loc3_ != _loc2_.viewingMode)
         {
            _loc2_.clip.content[_loc3_ + "_btn"].tab.alpha = 0.4;
         }
      }
      
      public function rolloutMode(param1:MouseEvent) : void
      {
         var _loc2_:Scoreboard = this;
         var _loc3_:String = String(param1.currentTarget.name.split("_")[0]);
         if(_loc3_ != _loc2_.viewingMode)
         {
            _loc2_.clip.content[_loc3_ + "_btn"].tab.alpha = 0;
         }
      }
      
      public function closeScoreboard(param1:Event = null) : void
      {
         var _loc2_:Scoreboard = this;
         _loc2_.api.method_142();
      }
      
      public function destroy() : void
      {
         var ob:Scoreboard = this;
         ob.clip.close_btn.removeEventListener(MouseEvent.CLICK,ob.closeScoreboard);
         ob.clip.content.today_btn.removeEventListener(MouseEvent.CLICK,ob.clickMode);
         ob.clip.content.weekly_btn.removeEventListener(MouseEvent.CLICK,ob.clickMode);
         ob.clip.content.monthly_btn.removeEventListener(MouseEvent.CLICK,ob.clickMode);
         ob.clip.content.alltime_btn.removeEventListener(MouseEvent.CLICK,ob.clickMode);
         ob.clip.content.today_btn.removeEventListener(MouseEvent.ROLL_OVER,ob.rolloverMode);
         ob.clip.content.weekly_btn.removeEventListener(MouseEvent.ROLL_OVER,ob.rolloverMode);
         ob.clip.content.monthly_btn.removeEventListener(MouseEvent.ROLL_OVER,ob.rolloverMode);
         ob.clip.content.alltime_btn.removeEventListener(MouseEvent.ROLL_OVER,ob.rolloverMode);
         ob.clip.content.today_btn.removeEventListener(MouseEvent.ROLL_OUT,ob.rolloutMode);
         ob.clip.content.weekly_btn.removeEventListener(MouseEvent.ROLL_OUT,ob.rolloutMode);
         ob.clip.content.monthly_btn.removeEventListener(MouseEvent.ROLL_OUT,ob.rolloutMode);
         ob.clip.content.alltime_btn.removeEventListener(MouseEvent.ROLL_OUT,ob.rolloutMode);
         if(ob.enterNameText)
         {
            ob.clip.entername.removeChild(ob.enterNameText);
            ob.enterNameText = null;
         }
         if(ob.enterNameButton)
         {
            ob.enterNameButton.removeEventListener("clickNameOK",ob.clickEnterNameOK);
            ob.clip.entername.removeChild(ob.enterNameButton);
            ob.enterNameButton.destroy();
            ob.enterNameButton = null;
         }
         if(ob.api.container.contains(ob.clip))
         {
            ob.api.container.removeChild(ob.clip);
         }
         ob.clip = null;
         try
         {
            if(ob.closeCallback != null)
            {
               ob.closeCallback();
            }
         }
         catch(err:Error)
         {
            class_6.error("Error with close callback.");
         }
      }
      
      public function loadScoresCallback(param1:Object) : void
      {
         var ob:Scoreboard = null;
         var i:String = null;
         var args:Object = param1;
         ob = this;
         try
         {
            class_6.method_1("-- Start Callback");
            if(args != null && args.scores != null)
            {
               ob.scoreData = {};
               if(args.scores.now)
               {
                  ob.timestamp = args.scores.now;
               }
               else
               {
                  ob.timestamp = 0;
               }
               if(Boolean(ob.scoreData.daily) && ob.scoreData.daily.length > 0)
               {
                  ob.todayScores = ob.scoreData.daily;
                  ob.todayTotal = ob.scoreData.daily.length;
               }
               if(Boolean(ob.scoreData.weekly) && ob.scoreData.weekly.length > 0)
               {
                  ob.weeklyScores = ob.scoreData.weekly;
                  ob.weeklyTotal = ob.scoreData.weekly.length;
               }
               if(Boolean(ob.scoreData.monthly) && ob.scoreData.monthly.length > 0)
               {
                  ob.monthlyScores = ob.scoreData.monthly;
                  ob.monthlyTotal = ob.scoreData.monthly.length;
               }
               if(Boolean(ob.scoreData.alltime) && ob.scoreData.alltime.length > 0)
               {
                  ob.alltimeScores = ob.scoreData.alltime;
                  ob.alltimeTotal = ob.scoreData.alltime.length;
               }
               ob.showScores();
            }
            else
            {
               if(args.error)
               {
                  class_6.error("Load Scores Error: " + args.errorCode);
               }
               ob.showMessage("There was a problem loading the high scores.  Please try again later.");
            }
         }
         catch(err:Error)
         {
            ob.showMessage("There was a problem displaying the high scores.  Please try again later.");
            class_6.error("Load Scores Callback Error: " + err.message);
         }
      }
   }
}

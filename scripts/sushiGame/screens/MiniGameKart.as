package sushiGame.screens
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.events.*;
   import flash.geom.*;
   import flash.media.SoundChannel;
   import flash.utils.getTimer;
   import package_2.class_6;
   import sushiGame.models.GoKart;
   import sushiGame.models.KartObject;
   
   public class MiniGameKart extends MiniGame
   {
       
      
      public var whichDifficulty:Number = 1;
      
      public var isIntro:Boolean = true;
      
      public var introTimer:Number = 0;
      
      public var introTimerMax:Number = 60;
      
      public var targetAmount:Number = 0;
      
      public var frontParts:Vector.<Bitmap>;
      
      public var midParts:Vector.<Bitmap>;
      
      public var backParts:Vector.<Bitmap>;
      
      public var backdrop:Bitmap;
      
      public var backStartX:Number = 0;
      
      public var backStartY:Number = 4;
      
      public var midStartX:Number = 0;
      
      public var midStartY:Number = 0;
      
      public var frontStartX:Number = 0;
      
      public var frontStartY:Number = 0;
      
      public var kartAccel:Number = 0.15;
      
      public var startingSpeed:Number = 6;
      
      public var maxSpeed:Number = 12;
      
      public var useSpeed:Number = 0;
      
      public var useFrame:Number = 0;
      
      public var raceOffset:Number = 0;
      
      public var lastScreenX:Number = 0;
      
      public var finishDecaySpeed:Number = 2147483647;
      
      public var kart:GoKart;
      
      public var isHit:Boolean = false;
      
      public var isFinishing:Boolean = false;
      
      public var finishRank:Number = -1;
      
      public var spaceIsDown:Boolean = false;
      
      public var whichFireworks:Number = 1;
      
      public var showingBanner:Boolean = false;
      
      public var bannerTargetY:Number = 48;
      
      public var bannerTimer:Number = 0;
      
      public var bannerDuration:Number = 45;
      
      public var layerHolders:Array;
      
      public var layersY:Array;
      
      public var kartLane:Number = 0;
      
      public var kartStartX:Number = 180;
      
      public var kartMinY:Number = 225;
      
      public var kartMaxY:Number = 369;
      
      public var canRandomizeCustomers:Boolean = false;
      
      public var objects:Vector.<KartObject>;
      
      public var karts:Vector.<GoKart>;
      
      public var movementTimer:Number = 0;
      
      public var didSlot:Number = -1;
      
      public var lastTime:Number = 0;
      
      public var currFrame:Number = 0;
      
      public var coinsCollected:Number = 0;
      
      public var didTriggerEnd:Boolean = false;
      
      public var allCustomers:Array;
      
      public var kartData:Array;
      
      public var targetAmounts:Array;
      
      public var layouts:Array;
      
      public var levelData:Array;
      
      public var idleSound:SoundChannel = null;
      
      public function MiniGameKart(param1:MiniGameScreen, param2:MovieClip, param3:String)
      {
         this.layerHolders = [];
         this.layersY = [225,261,297,333,369];
         this.allCustomers = ["Wally","Akari","SargeFan","Marty","Boomer","Radlynn","Rico","Willow","Hank","ProfessorFitz","Xandra","Foodini","Ember","Johnny","Sasha","Nick"];
         this.kartData = [[{
            "customer":"Sasha",
            "maxSpeed":12.1,
            "startingSpeed":7,
            "accel":0.1,
            "avoid":0.2,
            "collect":0.02
         },{
            "customer":"SargeFan",
            "maxSpeed":12.1,
            "startingSpeed":6,
            "accel":0.08,
            "avoid":0.4,
            "collect":0.02
         }],[{
            "customer":"Hank",
            "maxSpeed":12.2,
            "startingSpeed":7,
            "accel":0.1,
            "avoid":1,
            "collect":0.06
         },{
            "customer":"Sasha",
            "maxSpeed":12.3,
            "startingSpeed":6,
            "accel":0.08,
            "avoid":0.7,
            "collect":0.06
         }],[{
            "customer":"Ember",
            "maxSpeed":12.2,
            "startingSpeed":7,
            "accel":0.1,
            "avoid":0.3,
            "collect":0.07
         },{
            "customer":"Hank",
            "maxSpeed":12.2,
            "startingSpeed":6,
            "accel":0.2,
            "avoid":0.8,
            "collect":0.07
         }],[{
            "customer":"Rico",
            "maxSpeed":13,
            "startingSpeed":7,
            "accel":0.05,
            "avoid":0.7,
            "collect":0.6
         },{
            "customer":"Ember",
            "maxSpeed":12.2,
            "startingSpeed":6,
            "accel":0.08,
            "avoid":0.3,
            "collect":0.02
         }],[{
            "customer":"Akari",
            "maxSpeed":12.6,
            "startingSpeed":7,
            "accel":0.05,
            "avoid":0.7,
            "collect":0.3
         },{
            "customer":"Rico",
            "maxSpeed":12.4,
            "startingSpeed":6,
            "accel":0.07,
            "avoid":0.5,
            "collect":0.8
         }],[{
            "customer":"Marty",
            "maxSpeed":13,
            "startingSpeed":6,
            "accel":0.08,
            "avoid":0.6,
            "collect":0.7
         },{
            "customer":"Johnny",
            "maxSpeed":13.2,
            "startingSpeed":6,
            "accel":0.07,
            "avoid":0.8,
            "collect":0.3
         }],[{
            "customer":"Johnny",
            "maxSpeed":12.6,
            "startingSpeed":7,
            "accel":0.07,
            "avoid":0.5,
            "collect":0.3
         },{
            "customer":"ProfessorFitz",
            "maxSpeed":11.6,
            "startingSpeed":5,
            "accel":0.12,
            "avoid":0.6,
            "collect":0.4
         }],[{
            "customer":"Boomer",
            "maxSpeed":12.4,
            "startingSpeed":4,
            "accel":0.18,
            "avoid":0.8,
            "collect":0.08
         },{
            "customer":"Nick",
            "maxSpeed":12.6,
            "startingSpeed":4.5,
            "accel":0.17,
            "avoid":0.7,
            "collect":0.7
         }],[{
            "customer":"Nick",
            "maxSpeed":12.6,
            "startingSpeed":5,
            "accel":0.1,
            "avoid":0.8,
            "collect":0.7
         },{
            "customer":"Wally",
            "maxSpeed":12.5,
            "startingSpeed":4.5,
            "accel":0.17,
            "avoid":0.7,
            "collect":0.8
         }],[{
            "customer":"Wally",
            "maxSpeed":12.6,
            "startingSpeed":4.5,
            "accel":0.1,
            "avoid":0.4,
            "collect":0.7
         },{
            "customer":"Willow",
            "maxSpeed":12.6,
            "startingSpeed":5.5,
            "accel":0.1,
            "avoid":0.8,
            "collect":0.2
         }],[{
            "customer":"Willow",
            "maxSpeed":12.4,
            "startingSpeed":4.6,
            "accel":0.11,
            "avoid":0.7,
            "collect":0.7
         },{
            "customer":"Boomer",
            "maxSpeed":12.6,
            "startingSpeed":5,
            "accel":0.12,
            "avoid":0.7,
            "collect":0.7
         }],[{
            "customer":"Radlynn",
            "maxSpeed":12.6,
            "startingSpeed":4.5,
            "accel":0.1,
            "avoid":0.7,
            "collect":0.7
         },{
            "customer":"Foodini",
            "maxSpeed":12.5,
            "startingSpeed":5.5,
            "accel":0.16,
            "avoid":0.7,
            "collect":0.7
         }],[{
            "customer":"Xandra",
            "maxSpeed":12.3,
            "startingSpeed":4.5,
            "accel":0.12,
            "avoid":0.8,
            "collect":0.8
         },{
            "customer":"ProfessorFitz",
            "maxSpeed":12.4,
            "startingSpeed":5.5,
            "accel":0.16,
            "avoid":0.8,
            "collect":0.8
         }],[{
            "customer":"Foodini",
            "maxSpeed":14,
            "startingSpeed":4.5,
            "accel":0.06,
            "avoid":0.9,
            "collect":0.9
         },{
            "customer":"Xandra",
            "maxSpeed":12.4,
            "startingSpeed":6,
            "accel":0.19,
            "avoid":0.9,
            "collect":0.9
         }]];
         this.targetAmounts = [14,21,26,32,35,35,36,38,31,30,28,36,30,29];
         this.layouts = [[[undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined],[undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,8,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined],[0,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined],[undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,8,0,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,0,undefined,0,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,0,undefined],[0,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,8,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,0,undefined,undefined,undefined]],[[undefined,0,undefined,undefined,undefined,undefined,0,undefined,undefined,0,undefined,undefined,1,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined],[undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,0,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,8,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined],[0,undefined,undefined,0,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,0,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,8,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined],[undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined],[0,0,undefined,undefined,undefined,0,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,1,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined]],[[5,undefined,undefined,0,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,0,0,0,0,0,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined],[undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,1,undefined,0,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,0,undefined,undefined,1,undefined,undefined,0,undefined,undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined],[5,0,undefined,undefined,undefined,0,undefined,undefined,0,0,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,0,undefined,8,undefined,undefined,undefined,undefined,5,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,0,1],[undefined,undefined,undefined,undefined,0,undefined,0,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined],[5,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,0,undefined,undefined,8,undefined,undefined,undefined,undefined,undefined,0,0,0,0,0,1,undefined,undefined,undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined]],[[undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,5,undefined,undefined,undefined,undefined,8,undefined,0,0,undefined,0,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,0,0,0],[0,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1],[0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,8,undefined,0,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined],[0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,0,undefined,undefined,8,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,1,undefined,undefined,undefined,5,undefined,undefined,undefined,undefined,0,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,0],[undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined]],[[undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,0,undefined,undefined,0,0,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,5,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined],[0,undefined,undefined,undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,0,undefined,undefined,undefined,undefined],[undefined,undefined,0,undefined,undefined,undefined,undefined,0,undefined,undefined,0,undefined,undefined,5,undefined,undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,8,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined],[0,undefined,undefined,8,undefined,undefined,undefined,undefined,1,undefined,undefined,0,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,0,0,undefined,undefined,0,0,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,8,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,0,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,0,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined],[0,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,0,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,0,undefined,undefined]],[[undefined,undefined,0,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,5,undefined,undefined,undefined,0,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined],[undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,undefined,5,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined],[1,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,5,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,5,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined],[undefined,undefined,0,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,8,undefined,undefined,undefined,0,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,5,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,8,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined],[undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,8,undefined,undefined,5,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined]],[[0,undefined,undefined,undefined,undefined,1,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined],[0,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,0,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,5,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,8,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined],[0,undefined,undefined,0,undefined,undefined,8,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,0,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined],[0,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,8,undefined,undefined,undefined,0,undefined,undefined,undefined],[0,undefined,undefined,undefined,undefined,1,0,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,5,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined]],[[undefined,0,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,0,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,0,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined],[8,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined],[undefined,0,undefined,undefined,0,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,0,undefined,8,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,0,undefined,undefined,undefined,undefined,1,1,undefined,undefined,0,undefined,undefined,undefined,undefined,1,undefined,undefined,1,undefined],[0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,5,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,0,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,5,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined],[8,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,0,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,0,undefined,1,undefined]],[[1,undefined,0,undefined,undefined,8,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,0,undefined,undefined,1,undefined,undefined,undefined,0,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,0,undefined,undefined,undefined,undefined],[undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,0,0,1,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,5,undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1],[1,undefined,0,0,undefined,undefined,8,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,5,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,0,0,undefined,undefined,undefined,1,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,0,undefined,undefined],[undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,undefined,5,undefined,undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined],[undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined]],[[undefined,undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined],[8,undefined,0,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,8,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,0,undefined,undefined,0,8,undefined,undefined,undefined,undefined,8,undefined],[undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,8,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,5,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,0,undefined,0,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined],[undefined,undefined,undefined,0,undefined,8,undefined,undefined,undefined,undefined,undefined,undefined,undefined,8,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,5,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,8,undefined,undefined,undefined,0],[undefined,8,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,8,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined]],[[undefined,0,5,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,0,undefined,0,0,0,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined],[undefined,undefined,8,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined],[5,undefined,undefined,0,0,0,undefined,undefined,8,undefined,undefined,0,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,8,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,1,1,1,undefined,undefined,undefined],[undefined,undefined,8,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,8,undefined,8,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined],[undefined,0,5,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,1,undefined,0,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined]],[[1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,0,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,0,0,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined],[undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,0,0,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,undefined,undefined,8,undefined,undefined,undefined,undefined],[undefined,1,undefined,undefined,undefined,0,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,5,undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined],[undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,0,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,8,undefined,undefined,undefined,0,0,undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,undefined,undefined],[undefined,undefined,8,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,5,undefined,undefined,undefined,undefined,undefined,1,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,8,undefined]],[[undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,5,undefined,undefined,undefined,0,0,0,undefined,undefined,undefined],[0,undefined,8,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,8,undefined,undefined,0,undefined,undefined,undefined,5,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined],[undefined,undefined,undefined,undefined,0,8,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined],[undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,5,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined],[undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined]],[[1,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined],[undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined],[undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,5,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,8,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,0,undefined,undefined,undefined,undefined,0,undefined,1,undefined],[undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,1,1,undefined,undefined,0,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,8,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined],[undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,8,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,1,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,0]]];
         super(param1,param2,param3);
      }
      
      override public function setupScreen() : void
      {
         var _loc3_:MovieClip = null;
         var _loc1_:MiniGameKart = this;
         _loc1_.clip = new minigameKartMC();
         _loc1_.container.addChild(_loc1_.clip);
         var _loc2_:int = 0;
         while(_loc2_ < 5)
         {
            _loc3_ = new MovieClip();
            _loc1_.clip.holder.addChild(_loc3_);
            _loc1_.layerHolders.push(_loc3_);
            _loc2_++;
         }
         _loc1_.objects = new Vector.<KartObject>();
         _loc1_.screen.setTitle("Papa\'s Raceway");
         _loc1_.setupPrizes(_loc1_.type);
         _loc1_.screen.updateStars();
         _loc1_.reset();
         _loc1_.clip.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickScreen);
      }
      
      public function reset(param1:MouseEvent = null) : void
      {
         var _loc2_:MiniGameKart = this;
         _loc2_.decideDifficulty();
         _loc2_.showBanner();
         _loc2_.coinsCollected = 0;
         _loc2_.raceOffset = 0;
         _loc2_.lastScreenX = 0;
         _loc2_.didSlot = -1;
         _loc2_.movementTimer = 0;
         _loc2_.setupBackdrop(false);
         _loc2_.clearObjects();
         _loc2_.setupBackdrop();
         _loc2_.setupKarts(false);
         _loc2_.setupKarts(true);
         _loc2_.isFinishing = false;
         _loc2_.isIntro = true;
         _loc2_.introTimer = 0;
         _loc2_.isHit = false;
         var _loc4_:KartObject = new KartObject(_loc2_,_loc2_.clip.holder,KartObject.TYPE_STARTLINE,0,75,0);
         _loc2_.objects.push(_loc4_);
         _loc2_.updateAllKarts();
         _loc2_.depthSort();
         if(_loc2_.idleSound == null)
         {
            _loc2_.idleSound = _loc2_.screen.gameObj.var_128.playSound("minigame_kart_idling.wav",true,0.1);
         }
      }
      
      public function decideDifficulty() : void
      {
         var _loc1_:MiniGameKart = this;
         var _loc2_:Number = _loc1_.getStartingLevel();
         if(_loc2_ < 14)
         {
            _loc1_.whichDifficulty = _loc2_ + 1;
            _loc1_.canRandomizeCustomers = false;
         }
         else
         {
            _loc1_.whichDifficulty = 5 + Math.ceil(Math.random() * 9);
            _loc1_.canRandomizeCustomers = true;
         }
         _loc1_.levelData = _loc1_.layouts[_loc1_.whichDifficulty - 1];
         _loc1_.targetAmount = _loc1_.targetAmounts[_loc1_.whichDifficulty - 1];
      }
      
      override public function updateScreen() : void
      {
         var _loc1_:MiniGameKart = this;
         ++_loc1_.currFrame;
         if(_loc1_.showingBanner)
         {
            if(_loc1_.clip.banner.y < _loc1_.bannerTargetY)
            {
               _loc1_.clip.banner.y += (_loc1_.bannerTargetY - _loc1_.clip.banner.y) / 4;
               if(Math.abs(_loc1_.bannerTargetY - _loc1_.clip.banner.y) < 1)
               {
                  _loc1_.clip.banner.y = _loc1_.bannerTargetY;
               }
            }
            else
            {
               ++_loc1_.bannerTimer;
               if(_loc1_.bannerTimer >= _loc1_.bannerDuration)
               {
                  _loc1_.showingBanner = false;
               }
            }
         }
         else if(_loc1_.clip.banner.y > -70)
         {
            _loc1_.clip.banner.y += (-70 - _loc1_.clip.banner.y) / 10;
            if(Math.abs(-70 - _loc1_.clip.banner.y) < 1)
            {
               _loc1_.clip.banner.y = -70;
            }
         }
         if(_loc1_.kart != null)
         {
            _loc1_.useSpeed = _loc1_.kart.speed;
         }
         if(_loc1_.isIntro)
         {
            ++_loc1_.introTimer;
            if(_loc1_.introTimer >= _loc1_.introTimerMax)
            {
               _loc1_.isIntro = false;
               _loc1_.startMoving();
            }
            else if(_loc1_.introTimer >= _loc1_.introTimerMax / 2)
            {
            }
         }
         else
         {
            _loc1_.updateAllKarts();
            _loc1_.animateScrolling();
            _loc1_.updateObjects();
            _loc1_.depthSort();
            if(_loc1_.isFinishing && _loc1_.kart && _loc1_.kart.clip.x > 1200)
            {
               if(!_loc1_.didTriggerEnd)
               {
                  trace("DONE");
                  _loc1_.screen.finishMiniGame(_loc1_.skuToWin,_loc1_.amountToWin,_loc1_.skuIsClothing,_loc1_.skuClothingMode);
                  _loc1_.didTriggerEnd = true;
               }
            }
         }
         var _loc3_:Number = getTimer();
         var _loc4_:Number = Math.round(1000 / (_loc3_ - this.lastTime));
         if(_loc3_ == this.lastTime)
         {
            _loc4_ = 0;
         }
         _loc1_.clip.fps_txt.text = _loc4_ + " fps";
         _loc1_.lastTime = _loc3_;
      }
      
      public function startMoving() : void
      {
         trace("START!");
         var _loc1_:MiniGameKart = this;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.karts.length)
         {
            if(_loc2_ == 0)
            {
               _loc1_.karts[_loc2_].startDrivingSound(true);
            }
            else
            {
               _loc1_.karts[_loc2_].startDrivingSound(false);
            }
            _loc2_++;
         }
         if(_loc1_.idleSound)
         {
            _loc1_.idleSound.stop();
            _loc1_.idleSound = null;
         }
         _loc1_.screen.gameObj.var_128.playSound("minigame_kart_start.wav",false,0.5);
      }
      
      public function setupBackdrop(param1:Boolean = true) : void
      {
         var _loc3_:int = 0;
         var _loc5_:MovieClip = null;
         var _loc6_:BitmapData = null;
         var _loc7_:MovieClip = null;
         var _loc8_:BitmapData = null;
         var _loc9_:Bitmap = null;
         var _loc10_:Bitmap = null;
         var _loc11_:MovieClip = null;
         var _loc12_:BitmapData = null;
         var _loc13_:Bitmap = null;
         var _loc14_:Bitmap = null;
         var _loc15_:MovieClip = null;
         var _loc16_:BitmapData = null;
         var _loc17_:Bitmap = null;
         var _loc18_:Bitmap = null;
         var _loc2_:MiniGameKart = this;
         var _loc4_:Number;
         if((_loc4_ = _loc2_.screen.gameObj.var_127.getHolidayMonth()) == 0)
         {
            _loc4_ = 13;
         }
         _loc2_.useFrame = 2 * _loc4_ - 1;
         if(param1)
         {
            _loc2_.frontParts = new Vector.<Bitmap>();
            _loc2_.midParts = new Vector.<Bitmap>();
            _loc2_.backParts = new Vector.<Bitmap>();
            (_loc5_ = new outside_minigamekart_backdrop()).gotoAndStop(this.useFrame);
            (_loc6_ = new BitmapData(640,320,true,0)).draw(_loc5_);
            _loc2_.backdrop = new Bitmap(_loc6_);
            _loc2_.backdrop.x = 0;
            _loc2_.backdrop.y = 3;
            _loc2_.clip.bgholder.addChild(_loc2_.backdrop);
            (_loc7_ = new outside_minigamekart_backplane()).gotoAndStop(this.useFrame);
            (_loc8_ = new BitmapData(640,320,true,0)).draw(_loc7_);
            (_loc9_ = new Bitmap(_loc8_)).x = 0;
            _loc9_.y = 4;
            _loc2_.backParts.push(_loc9_);
            _loc2_.clip.bgholder.addChild(_loc9_);
            (_loc10_ = new Bitmap(_loc8_)).x = 640;
            _loc10_.y = 4;
            _loc2_.backParts.push(_loc10_);
            _loc2_.clip.bgholder.addChild(_loc10_);
            (_loc11_ = new outside_minigamekart_midplane()).gotoAndStop(this.useFrame);
            (_loc12_ = new BitmapData(640,320,true,0)).draw(_loc11_);
            (_loc13_ = new Bitmap(_loc12_)).x = 0;
            _loc13_.y = 0;
            _loc2_.midParts.push(_loc13_);
            _loc2_.clip.bgholder.addChild(_loc13_);
            (_loc14_ = new Bitmap(_loc12_)).x = 640;
            _loc14_.y = 0;
            _loc2_.midParts.push(_loc14_);
            _loc2_.clip.bgholder.addChild(_loc14_);
            (_loc15_ = new outside_minigamekart_mainplane()).gotoAndStop(this.useFrame);
            (_loc16_ = new BitmapData(640,480,true,0)).draw(_loc15_);
            (_loc17_ = new Bitmap(_loc16_)).x = 0;
            _loc17_.y = 0;
            _loc2_.frontParts.push(_loc17_);
            _loc2_.clip.bgholder.addChild(_loc17_);
            (_loc18_ = new Bitmap(_loc16_)).x = 640;
            _loc18_.y = 0;
            _loc2_.frontParts.push(_loc18_);
            _loc2_.clip.bgholder.addChild(_loc18_);
            _loc15_ = null;
            _loc11_ = null;
            _loc7_ = null;
         }
         else if(Boolean(_loc2_.frontParts) && _loc2_.frontParts.length > 0)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc2_.frontParts.length)
            {
               _loc2_.clip.bgholder.removeChild(_loc2_.frontParts[_loc3_]);
               try
               {
                  _loc2_.frontParts[_loc3_].bitmapData.dispose();
                  _loc2_.frontParts[_loc3_].bitmapData = null;
               }
               catch(err:Error)
               {
               }
               _loc2_.frontParts[_loc3_] = null;
               _loc3_++;
            }
            _loc2_.frontParts = null;
            _loc3_ = 0;
            while(_loc3_ < _loc2_.midParts.length)
            {
               _loc2_.clip.bgholder.removeChild(_loc2_.midParts[_loc3_]);
               try
               {
                  _loc2_.midParts[_loc3_].bitmapData.dispose();
                  _loc2_.midParts[_loc3_].bitmapData = null;
               }
               catch(err:Error)
               {
               }
               _loc2_.midParts[_loc3_] = null;
               _loc3_++;
            }
            _loc2_.midParts = null;
            _loc3_ = 0;
            while(_loc3_ < _loc2_.backParts.length)
            {
               _loc2_.clip.bgholder.removeChild(_loc2_.backParts[_loc3_]);
               try
               {
                  _loc2_.backParts[_loc3_].bitmapData.dispose();
                  _loc2_.backParts[_loc3_].bitmapData = null;
               }
               catch(err:Error)
               {
               }
               _loc2_.backParts[_loc3_] = null;
               _loc3_++;
            }
            _loc2_.backParts = null;
            if(_loc2_.backdrop)
            {
               if(_loc2_.backdrop.bitmapData)
               {
                  _loc2_.backdrop.bitmapData.dispose();
                  _loc2_.backdrop.bitmapData = null;
               }
               _loc2_.backdrop.parent.removeChild(_loc2_.backdrop);
               _loc2_.backdrop = null;
            }
         }
      }
      
      public function animateScrolling() : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc1_:MiniGameKart = this;
         if(!_loc1_.isHit)
         {
            _loc3_ = 0;
            if(_loc1_.kart != null)
            {
               _loc3_ = _loc1_.kart.x;
            }
            _loc4_ = _loc3_ - _loc1_.lastScreenX;
            if(_loc1_.isFinishing && _loc1_.finishDecaySpeed < int.MAX_VALUE)
            {
               _loc3_ = _loc1_.lastScreenX + _loc1_.finishDecaySpeed;
               _loc4_ = _loc3_ - _loc1_.lastScreenX;
               --_loc1_.finishDecaySpeed;
               if(_loc1_.finishDecaySpeed < 0)
               {
                  _loc1_.finishDecaySpeed = 0;
               }
            }
            _loc2_ = 0;
            while(_loc2_ < _loc1_.backParts.length)
            {
               _loc1_.backParts[_loc2_].x -= Math.round(_loc4_ * 0.3);
               if(_loc1_.backParts[_loc2_].x + _loc1_.backParts[_loc2_].width < _loc1_.backStartX)
               {
                  _loc1_.backParts[_loc2_].x += 1280;
               }
               _loc2_++;
            }
            _loc2_ = 0;
            while(_loc2_ < _loc1_.midParts.length)
            {
               _loc1_.midParts[_loc2_].x -= Math.round(_loc4_ * 0.6);
               if(_loc1_.midParts[_loc2_].x + _loc1_.midParts[_loc2_].width < _loc1_.midStartX)
               {
                  _loc1_.midParts[_loc2_].x += 1280;
               }
               _loc2_++;
            }
            _loc2_ = 0;
            while(_loc2_ < _loc1_.frontParts.length)
            {
               _loc1_.frontParts[_loc2_].x -= Math.round(_loc4_);
               if(_loc1_.frontParts[_loc2_].x + _loc1_.frontParts[_loc2_].width < _loc1_.frontStartX)
               {
                  _loc1_.frontParts[_loc2_].x += 1280;
               }
               _loc2_++;
            }
            _loc1_.raceOffset = _loc3_;
            _loc1_.lastScreenX = _loc3_;
         }
      }
      
      public function clearObjects() : void
      {
         var _loc2_:int = 0;
         var _loc1_:MiniGameKart = this;
         if(_loc1_.objects)
         {
            _loc2_ = int(_loc1_.objects.length - 1);
            while(_loc2_ >= 0)
            {
               if(_loc1_.objects[_loc2_] != null)
               {
                  _loc1_.objects[_loc2_].destroy();
                  _loc1_.objects[_loc2_] = null;
                  _loc1_.objects.splice(_loc2_,1);
               }
               _loc2_--;
            }
         }
      }
      
      public function updateObjects() : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:KartObject = null;
         var _loc10_:KartObject = null;
         var _loc11_:KartObject = null;
         var _loc12_:KartObject = null;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:KartObject = null;
         var _loc16_:KartObject = null;
         var _loc1_:MiniGameKart = this;
         if(_loc1_.objects)
         {
            _loc2_ = int(_loc1_.objects.length - 1);
            while(_loc2_ >= 0)
            {
               if(_loc1_.objects[_loc2_] != null)
               {
                  _loc1_.objects[_loc2_].updateObject();
               }
               _loc2_--;
            }
            _loc3_ = 640;
            _loc4_ = Math.floor((_loc1_.kart.x - _loc1_.kartStartX) / 128);
            if(_loc1_.didSlot < _loc4_)
            {
               _loc5_ = 0;
               while(_loc5_ < _loc1_.levelData.length)
               {
                  _loc6_ = Math.round(_loc1_.kart.x + _loc3_);
                  _loc7_ = _loc1_.layersY[_loc5_] + 10;
                  _loc8_ = _loc1_.currFrame * 10 + _loc5_;
                  if(_loc4_ < _loc1_.levelData[_loc5_].length)
                  {
                     if(_loc1_.levelData[_loc5_][_loc4_] == 8)
                     {
                        _loc9_ = new KartObject(_loc1_,_loc1_.clip.holder,KartObject.TYPE_OILSLICK,_loc8_,_loc6_,_loc7_);
                        _loc1_.objects.push(_loc9_);
                     }
                     else if(_loc1_.levelData[_loc5_][_loc4_] == 5)
                     {
                        _loc10_ = new KartObject(_loc1_,_loc1_.clip.holder,KartObject.TYPE_BOOSTPAD,_loc8_,_loc6_,_loc7_);
                        _loc1_.objects.push(_loc10_);
                     }
                     else if(_loc1_.levelData[_loc5_][_loc4_] == 1)
                     {
                        _loc11_ = new KartObject(_loc1_,_loc1_.clip.kartholder,KartObject.TYPE_CONE,_loc8_,_loc6_,_loc7_);
                        _loc1_.objects.push(_loc11_);
                     }
                     else if(_loc1_.levelData[_loc5_][_loc4_] == 0)
                     {
                        _loc12_ = new KartObject(_loc1_,_loc1_.clip.kartholder,KartObject.TYPE_COIN,_loc8_,_loc6_,_loc7_);
                        _loc1_.objects.push(_loc12_);
                     }
                  }
                  else if(_loc4_ == _loc1_.levelData[_loc5_].length && _loc5_ == 0)
                  {
                     trace("----------- OUT OF SLOTS --------------");
                  }
                  _loc5_++;
               }
               if(_loc4_ == _loc1_.levelData[0].length + 2)
               {
                  trace("ADD FINISH STUFF");
                  _loc13_ = _loc1_.kart.x + _loc3_;
                  _loc14_ = _loc1_.currFrame * 10;
                  _loc15_ = new KartObject(_loc1_,_loc1_.clip.holder,KartObject.TYPE_FINISHLINE,_loc14_,_loc13_,0);
                  _loc1_.objects.push(_loc15_);
                  _loc16_ = new KartObject(_loc1_,_loc1_.clip.kartholder,KartObject.TYPE_FINISHBANNER,_loc14_,_loc13_,640);
                  _loc1_.objects.push(_loc16_);
               }
               _loc1_.didSlot = _loc4_;
            }
         }
      }
      
      public function removeObject(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc2_:MiniGameKart = this;
         if(_loc2_.objects)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc2_.objects.length)
            {
               if(_loc2_.objects[_loc3_] != null && _loc2_.objects[_loc3_].id == param1)
               {
                  _loc2_.objects[_loc3_].destroy();
                  _loc2_.objects[_loc3_] = null;
                  _loc2_.objects.splice(_loc3_,1);
                  break;
               }
               _loc3_++;
            }
         }
      }
      
      public function clickScreen(param1:MouseEvent) : void
      {
         var _loc2_:MiniGameKart = this;
         _loc2_.screen.gameObj.var_128.playSound("minigame_kart_horn.wav",false,0.4);
      }
      
      override public function destroy() : void
      {
         var _loc1_:MiniGameKart = this;
         _loc1_.setupBackdrop(false);
         _loc1_.clearObjects();
         _loc1_.setupKarts(false);
         _loc1_.objects = null;
         _loc1_.karts = null;
         _loc1_.kart = null;
         _loc1_.clip.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickScreen);
         _loc1_.container.removeChild(_loc1_.clip);
         _loc1_.clip = null;
      }
      
      public function updateAllKarts() : void
      {
         var _loc2_:int = 0;
         var _loc1_:MiniGameKart = this;
         if(!_loc1_.isIntro)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc1_.karts.length)
            {
               _loc1_.karts[_loc2_].setNextCoordinates();
               _loc2_++;
            }
            _loc2_ = 0;
            while(_loc2_ < _loc1_.karts.length)
            {
               _loc1_.karts[_loc2_].updateCoordsForCollisions();
               _loc2_++;
            }
            _loc2_ = 0;
            while(_loc2_ < _loc1_.karts.length)
            {
               _loc1_.karts[_loc2_].updateCoordsForCollisions(true);
               _loc2_++;
            }
            _loc2_ = 0;
            while(_loc2_ < _loc1_.karts.length)
            {
               _loc1_.karts[_loc2_].updateKart();
               _loc2_++;
            }
         }
      }
      
      public function depthSort() : void
      {
         var _loc2_:int = 0;
         var _loc1_:MiniGameKart = this;
         var _loc3_:Array = [];
         _loc2_ = 0;
         while(_loc2_ < _loc1_.karts.length)
         {
            _loc3_.push(_loc1_.karts[_loc2_]);
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < _loc1_.objects.length)
         {
            if(_loc1_.objects[_loc2_].isFlat == false && _loc1_.objects[_loc2_].clip.x > -50 && _loc1_.objects[_loc2_].clip.x < 700)
            {
               _loc3_.push(_loc1_.objects[_loc2_]);
            }
            _loc2_++;
         }
         _loc3_.sort(this.sortFunction);
         _loc2_ = 0;
         while(_loc2_ < _loc3_.length)
         {
            _loc1_.clip.kartholder.setChildIndex(_loc3_[_loc2_].clip,_loc2_);
            _loc2_++;
         }
         _loc3_ = null;
      }
      
      public function setupKarts(param1:Boolean = true) : void
      {
         var _loc3_:int = 0;
         var _loc8_:Object = null;
         var _loc9_:String = null;
         var _loc10_:GoKart = null;
         var _loc11_:Number = NaN;
         var _loc2_:MiniGameKart = this;
         var _loc4_:Number = _loc2_.whichDifficulty - 1;
         var _loc5_:Array = [225,369,261,333];
         297;
         var _loc7_:Array = _loc2_.allCustomers.concat();
         if(param1)
         {
            _loc2_.karts = new Vector.<GoKart>();
            _loc3_ = 0;
            while(_loc3_ < _loc2_.kartData[_loc4_].length)
            {
               _loc9_ = String((_loc8_ = _loc2_.kartData[_loc4_][_loc3_]).customer);
               if(_loc2_.canRandomizeCustomers)
               {
                  class_6.method_1("(Random Customer)");
                  _loc11_ = Math.floor(Math.random() * _loc7_.length);
                  _loc9_ = String(_loc7_[_loc11_]);
                  _loc7_.splice(_loc11_,1);
               }
               _loc10_ = new GoKart(_loc2_,_loc2_.clip.kartholder,0,_loc5_[_loc3_],_loc9_,_loc8_.startingSpeed,_loc8_.accel,_loc8_.maxSpeed,false,_loc8_.avoid,_loc8_.collect);
               _loc2_.karts.push(_loc10_);
               _loc3_++;
            }
            _loc2_.kart = new GoKart(_loc2_,_loc2_.clip.kartholder,0,297,"player",_loc2_.startingSpeed,_loc2_.kartAccel,_loc2_.maxSpeed,true);
            _loc2_.karts.push(_loc2_.kart);
         }
         else
         {
            if(Boolean(_loc2_.karts) && _loc2_.karts.length > 0)
            {
               _loc3_ = int(_loc2_.karts.length - 1);
               while(_loc3_ >= 0)
               {
                  if(_loc2_.karts[_loc3_] != null)
                  {
                     _loc2_.karts[_loc3_].destroy();
                     _loc2_.karts[_loc3_] = null;
                  }
                  _loc2_.karts.splice(_loc3_,1);
                  _loc3_--;
               }
            }
            _loc2_.karts = null;
            _loc2_.kart = null;
         }
      }
      
      public function sortFunction(param1:Object, param2:Object) : Number
      {
         if(param1.y < param2.y)
         {
            return -1;
         }
         if(param1.y > param2.y)
         {
            return 1;
         }
         return 0;
      }
      
      public function showBanner(param1:Number = -1) : void
      {
         var _loc2_:MiniGameKart = this;
         if(param1 == -1)
         {
            _loc2_.clip.banner.gotoAndStop(1);
         }
         else
         {
            _loc2_.clip.banner.gotoAndStop(param1 + 1);
         }
         _loc2_.bannerTimer = 0;
         _loc2_.showingBanner = true;
      }
      
      public function checkSuccess() : void
      {
         var _loc1_:MiniGameKart = this;
         if(_loc1_.finishRank == 1)
         {
            _loc1_.decidePrize();
            class_6.method_1("Play Happy");
            _loc1_.screen.gameObj.var_128.playMusicClip("customer_happy.wav");
         }
         else
         {
            _loc1_.skuToWin = "tips";
            _loc1_.amountToWin = 10 * _loc1_.coinsCollected;
            if(_loc1_.amountToWin == 0)
            {
               _loc1_.amountToWin = 10;
            }
            if(_loc1_.finishRank == 2)
            {
               _loc1_.amountToWin *= 2;
            }
            _loc1_.skuIsClothing = false;
            _loc1_.skuClothingMode = "";
            class_6.method_1("Play Decent");
            _loc1_.screen.gameObj.var_128.playMusicClip("customer_decent.wav");
         }
      }
   }
}

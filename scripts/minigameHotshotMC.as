package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="minigameHotshotMC")]
   public dynamic class minigameHotshotMC extends MovieClip
   {
       
      
      public var bgenemyholder:MovieClip;
      
      public var bgsplatholder:MovieClip;
      
      public var counter:MovieClip;
      
      public var enemyholder:MovieClip;
      
      public var ground:MovieClip;
      
      public var gun:MovieClip;
      
      public var hits_txt:TextField;
      
      public var jet:MovieClip;
      
      public var need_txt:TextField;
      
      public var particles:MovieClip;
      
      public var reticule:MovieClip;
      
      public function minigameHotshotMC()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

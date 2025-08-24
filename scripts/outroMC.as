package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="outroMC")]
   public dynamic class outroMC extends MovieClip
   {
       
      
      public var frame0:MovieClip;
      
      public var frame1:MovieClip;
      
      public var frame2:MovieClip;
      
      public var frame3:MovieClip;
      
      public var frame4:MovieClip;
      
      public var frame5:MovieClip;
      
      public var frame6:MovieClip;
      
      public function outroMC()
      {
         super();
         addFrameScript(546,this.frame547);
      }
      
      internal function frame547() : *
      {
         stop();
      }
   }
}

package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="trainingMC")]
   public dynamic class trainingMC extends MovieClip
   {
       
      
      public var warningMC:MovieClip;
      
      public function trainingMC()
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

package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="putt_fence1")]
   public dynamic class putt_fence1 extends MovieClip
   {
       
      
      public function putt_fence1()
      {
         super();
         addFrameScript(0,this.frame1,9,this.frame10);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame10() : *
      {
         gotoAndStop(1);
      }
   }
}

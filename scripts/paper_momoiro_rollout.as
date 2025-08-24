package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="paper_momoiro_rollout")]
   public dynamic class paper_momoiro_rollout extends MovieClip
   {
       
      
      public function paper_momoiro_rollout()
      {
         super();
         addFrameScript(9,this.frame10);
      }
      
      internal function frame10() : *
      {
         stop();
      }
   }
}

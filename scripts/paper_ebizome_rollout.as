package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="paper_ebizome_rollout")]
   public dynamic class paper_ebizome_rollout extends MovieClip
   {
       
      
      public function paper_ebizome_rollout()
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

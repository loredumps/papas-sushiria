package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="knife_sushi_topguide")]
   public dynamic class knife_sushi_topguide extends MovieClip
   {
       
      
      public function knife_sushi_topguide()
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

package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="sushi_knife_shadow")]
   public dynamic class sushi_knife_shadow extends MovieClip
   {
       
      
      public function sushi_knife_shadow()
      {
         super();
         addFrameScript(0,this.frame1,10,this.frame11);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame11() : *
      {
         gotoAndStop(1);
      }
   }
}

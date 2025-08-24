package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="customer_game_thumb")]
   public dynamic class customer_game_thumb extends MovieClip
   {
       
      
      public function customer_game_thumb()
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

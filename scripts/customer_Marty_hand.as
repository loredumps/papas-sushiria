package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="customer_Marty_hand")]
   public dynamic class customer_Marty_hand extends MovieClip
   {
       
      
      public function customer_Marty_hand()
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

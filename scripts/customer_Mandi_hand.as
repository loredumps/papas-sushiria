package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="customer_Mandi_hand")]
   public dynamic class customer_Mandi_hand extends MovieClip
   {
       
      
      public function customer_Mandi_hand()
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

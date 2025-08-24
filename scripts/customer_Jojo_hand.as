package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="customer_Jojo_hand")]
   public dynamic class customer_Jojo_hand extends MovieClip
   {
       
      
      public function customer_Jojo_hand()
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

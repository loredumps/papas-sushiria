package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="customer_Wally_neck")]
   public dynamic class customer_Wally_neck extends MovieClip
   {
       
      
      public function customer_Wally_neck()
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

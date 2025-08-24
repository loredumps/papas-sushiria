package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="customer_Gremmie_neck")]
   public dynamic class customer_Gremmie_neck extends MovieClip
   {
       
      
      public function customer_Gremmie_neck()
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

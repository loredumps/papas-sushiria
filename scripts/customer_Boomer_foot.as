package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="customer_Boomer_foot")]
   public dynamic class customer_Boomer_foot extends MovieClip
   {
       
      
      public function customer_Boomer_foot()
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

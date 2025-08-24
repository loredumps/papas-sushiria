package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="customer_Julep_hair")]
   public dynamic class customer_Julep_hair extends MovieClip
   {
       
      
      public function customer_Julep_hair()
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

package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="customer_ProfessorFitz_body")]
   public dynamic class customer_ProfessorFitz_body extends MovieClip
   {
       
      
      public function customer_ProfessorFitz_body()
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

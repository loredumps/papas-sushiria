package sushiria_gameassets_fla_fla
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   
   [Embed(source="/_assets/assets.swf", symbol="sushiria_gameassets_fla_fla.orderscreen_takeorder_bubble_384")]
   public dynamic class orderscreen_takeorder_bubble_384 extends MovieClip
   {
       
      
      public var takeorder_btn:SimpleButton;
      
      public var takeorder_closer_btn:SimpleButton;
      
      public function orderscreen_takeorder_bubble_384()
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

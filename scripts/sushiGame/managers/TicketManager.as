package sushiGame.managers
{
   import package_4.*;
   import sushiGame.models.Ticket;
   import sushiGame.screens.*;
   
   public class TicketManager
   {
       
      
      public var gameObj:class_5;
      
      public var tickets:Array;
      
      public var hangerTicket:Ticket;
      
      public var ticketNumber:Number = 0;
      
      public function TicketManager(param1:class_5)
      {
         this.tickets = [];
         super();
         var _loc2_:TicketManager = this;
         _loc2_.gameObj = param1;
         _loc2_.setupManager();
      }
      
      public function setupManager() : void
      {
         var _loc1_:TicketManager = this;
         _loc1_.tickets = [];
         _loc1_.hangerTicket = null;
      }
      
      public function addTicket(param1:Number) : Ticket
      {
         var _loc2_:TicketManager = this;
         if(_loc2_.hangerTicket)
         {
            _loc2_.hangerTicket.moveToLine();
         }
         var _loc3_:Ticket = new Ticket(_loc2_.gameObj,param1,_loc2_.ticketNumber + 1);
         _loc2_.tickets.push(_loc3_);
         ++_loc2_.ticketNumber;
         _loc2_.hangerTicket = _loc3_;
         return _loc3_;
      }
      
      public function removeTicket(param1:Ticket) : void
      {
         var _loc3_:int = 0;
         var _loc2_:TicketManager = this;
         if(_loc2_.hangerTicket == param1)
         {
            _loc2_.hangerTicket = null;
         }
         if(_loc2_.tickets != null)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc2_.tickets.length)
            {
               if(_loc2_.tickets[_loc3_] == param1)
               {
                  _loc2_.tickets[_loc3_].destroy();
                  _loc2_.tickets[_loc3_] = null;
                  _loc2_.tickets.splice(_loc3_,1);
                  break;
               }
               _loc3_++;
            }
         }
      }
      
      public function outOfTickets() : Boolean
      {
         var _loc1_:TicketManager = this;
         if(_loc1_.tickets.length == 0)
         {
            return true;
         }
         return false;
      }
      
      public function destroy() : void
      {
         var _loc1_:TicketManager = this;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.tickets.length)
         {
            _loc1_.tickets[_loc2_].destroy();
            _loc1_.tickets[_loc2_] = null;
            _loc2_++;
         }
         _loc1_.tickets = null;
      }
   }
}

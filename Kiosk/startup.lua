-- Licensed under the MIT license
rednet.open("top")

require("lib.termLib")

cs()

print("=-=[ WELCOME TO NANDOS ]=-=")

function takeOrder()
 term.write("ORDER ===> ")
 
 order = read()
 
 if order then
  rednet.send(1, order)
 end
 
 id, num = rednet.receive()
 
 if num then
  print("Your order number is: " .. num)
  
  local receipt = ("---[ NANDOS ]---")
  local rl2 = ("================")
  local rl3 = ("Order: " .. order)
  local rl4 = ("Order Number: " .. num)
  local rl5 = ("================")
  
  local printer = peripheral.find("printer")
  
  if printer then
   printer.newPage()
   printer.write(receipt)
   printer.setCursorPos(1,2)
   printer.write(rl2)
   printer.setCursorPos(1,3)
   printer.write(rl3)
   printer.setCursorPos(1,4)
   printer.write(rl4)
   printer.setCursorPos(1,5)
   printer.write(rl5)
   printer.setCursorPos(1,6)
   printer.endPage()
   print("Your receipt has been printed. Please check under the Kiosk.")
  else
   print("Your receipt has failed to print. Please write down your order and contact staff.")
  end  
 end
 
 takeOrder()
end

takeOrder()

rednet.open("left")

term.clear()
term.setCursorPos(1,1)
print("=-=[ ORDERS ]=-=")

orderNum = 0001

while true do
 id, order = rednet.receive()
 print(orderNum .. " " .. order)
 rednet.send(id, orderNum)
 
 orderNum = orderNum + 1
end

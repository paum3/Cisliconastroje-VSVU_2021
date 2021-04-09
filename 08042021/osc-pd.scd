

s.quit

OSCFunc.trace( false)

OSCdef(\pd, {|m| m.postln }, '/foo') // z pd

//do pd
NetAddr.new("localhost",5000).sendMsg('/bar',64.rand)

~p = NetAddr.new("localhost",5000)


~p.sendMsg('/bar',64.rand)


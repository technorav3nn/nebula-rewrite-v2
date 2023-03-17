--[[
-- Hello! This is an example project that bundles the Roblox-TS source into a
-- single file and uploads it to a GitHub release.
--
-- This script was generated by ci/bundle.lua, and should not be modified by hand.
-- To regenerate the code, run 'pnpm bundle' in the root directory.
--
-- Author: 0866
-- Source: https://github.com/richie0866/rbxts-bundle-example
--]]

local a,b,c={},{},{}local d=function(d,e)c[e]=d local f,g=d,0 while f do g=g+1 f=c[f]if f==d then local h=f.Name for i=1,g do f=c[f]h=h..'  \u{21d2} '..f.Name end error("Failed to load '"..d.Name.."'; Detected a circular dependency chain: "..h,2)end end local h=b[d]local i=h.callback()if c[e]==d then c[e]=nil end return i end local e,f=function(e,f)local g=b[e]if g.loaded then return g.result else g.result=d(e,f)g.loaded=true return g.result end end,function(e,f,g,h)local i=Instance.new(f)i.Name=e i.Parent=a[h]a[g]=i return i end local g,h,i=function(g,h,i,j,k)local l=f(g,h,i,j)b[l]={callback=k,result=nil,loaded=false,globals={script=l,require=function(m)if b[m]then return e(m,l)else return require(m)end end}}end,function(g)return b[a[g]].globals end,function()for g,h in pairs(b)do if g.ClassName=='LocalScript'and not g.Disabled then task.spawn(h.callback)end end end f('rbxts-bundle-example','Folder','rbxts-bundle-example',nil)f('game','Folder','rbxts-bundle-example.game','rbxts-bundle-example')f('src','Folder','rbxts-bundle-example.game.src','rbxts-bundle-example.game')g('main','ModuleScript','rbxts-bundle-example.game.src.main','rbxts-bundle-example.game.src',function()local j=h'rbxts-bundle-example.game.src.main'local k,l=j.script,j.require local m=l(k.Parent.Parent.Parent.include.RuntimeLib)local n=m.import(k,k.Parent.Parent.Parent,'shared','src','module').makeHello n'retard'print'game'return nil end)f('shared','Folder','rbxts-bundle-example.shared','rbxts-bundle-example')f('src','Folder','rbxts-bundle-example.shared.src','rbxts-bundle-example.shared')g('module','ModuleScript','rbxts-bundle-example.shared.src.module','rbxts-bundle-example.shared.src',function()local j=h'rbxts-bundle-example.shared.src.module'local k,l,m=j.script,j.require,function(k)return'Hello '..(k..'!')end return{makeHello=m}end)f('include','Folder','rbxts-bundle-example.include','rbxts-bundle-example')g('Promise','ModuleScript','rbxts-bundle-example.include.Promise','rbxts-bundle-example.include',function()local j=h'rbxts-bundle-example.include.Promise'local k,l,m,n,o,p,q,r,s=j.script,j.require,'Non-promise value passed into %s at index %s','Please pass a list of promises to %s','Please pass a handler function to %s!',{__mode='k'},function(k)if type(k)=='function'then return true end if type(k)=='table'then local l=getmetatable(k)if l and type(rawget(l,'__call'))=='function'then return true end end return false end,function(k,l)local m={}for n,o in ipairs(l)do m[o]=o end return setmetatable(m,{__index=function(p,q)error(string.format('%s is not in %s!',q,k),2)end,__newindex=function()error(string.format('Creating new members in %s is not allowed!',k),2)end})end do s={Kind=r('Promise.Error.Kind',{'ExecutionError','AlreadyCancelled','NotResolvedInTime','TimedOut'})}s.__index=s function s.new(t,u)t=t or{}return setmetatable({error=tostring(t.error)or'[This error has no error text.]',trace=t.trace,context=t.context,kind=t.kind,parent=u,createdTick=os.clock(),createdTrace=debug.traceback()},s)end function s.is(t)if type(t)=='table'then local u=getmetatable(t)if type(u)=='table'then return rawget(t,'error')~=nil and type(rawget(u,'extend'))=='function'end end return false end function s.isKind(t,u)assert(u~=nil,'Argument #2 to Promise.Error.isKind must not be nil')return s.is(t)and t.kind==u end function s.extend(t,u)u=u or{}u.kind=u.kind or t.kind return s.new(u,t)end function s.getErrorChain(t)local u={t}while u[#u].parent do table.insert(u,u[#u].parent)end return u end function s.__tostring(t)local u={string.format('-- Promise.Error(%s) --',t.kind or'?')}for v,w in ipairs(t:getErrorChain())do table.insert(u,table.concat({w.trace or w.error,w.context},'\n'))end return table.concat(u,'\n')end end local t,u,v=function(...)return select('#',...),{...}end,function(t,...)return t,select('#',...),{...}end,function(t)assert(t~=nil,'traceback is nil')return function(u)if type(u)=='table'then return u end return s.new{error=u,kind=s.Kind.ExecutionError,trace=debug.traceback(tostring(u),2),context='Promise created at:\n\n'..t}end end local w=function(w,x,...)return u(xpcall(x,v(w),...))end local x,y,z=function(x,y,z,A)return function(...)local B,C,D=w(x,y,...)if B then z(unpack(D,1,C))else A(D[1])end end end,function(x)return next(x)==nil end,{Error=s,Status=r('Promise.Status',{'Started','Resolved','Rejected','Cancelled'}),_getTime=os.clock,_timeEvent=game:GetService'RunService'.Heartbeat,_unhandledRejectionCallbacks={}}z.prototype={}z.__index=z.prototype function z._new(A,B,C)if C~=nil and not z.is(C)then error('Argument #2 to Promise.new must be a promise or nil',2)end local D={_source=A,_status=z.Status.Started,_values=nil,_valuesLength=-1,_unhandledRejection=true,_queuedResolve={},_queuedReject={},_queuedFinally={},_cancellationHook=nil,_parent=C,_consumers=setmetatable({},p)}if C and C._status==z.Status.Started then C._consumers[D]=true end setmetatable(D,z)local E,F,G=function(...)D:_resolve(...)end,function(...)D:_reject(...)end,function(E)if E then if D._status==z.Status.Cancelled then E()else D._cancellationHook=E end end return D._status==z.Status.Cancelled end coroutine.wrap(function()local H,I,J=w(D._source,B,E,F,G)if not H then F(J[1])end end)()return D end function z.new(A)return z._new(debug.traceback(nil,2),A)end function z.__tostring(A)return string.format('Promise(%s)',A._status)end function z.defer(A)local B,C=debug.traceback(nil,2)C=z._new(B,function(D,E,F)local G G=z._timeEvent:Connect(function()G:Disconnect()local H,I,J=w(B,A,D,E,F)if not H then E(J[1])end end)end)return C end z.async=z.defer function z.resolve(...)local A,B=t(...)return z._new(debug.traceback(nil,2),function(C)C(unpack(B,1,A))end)end function z.reject(...)local A,B=t(...)return z._new(debug.traceback(nil,2),function(C,D)D(unpack(B,1,A))end)end function z._try(A,B,...)local C,D=t(...)return z._new(A,function(E)E(B(unpack(D,1,C)))end)end function z.try(A,...)return z._try(debug.traceback(nil,2),A,...)end function z._all(A,B,C)if type(B)~='table'then error(string.format(n,'Promise.all'),3)end for D,E in pairs(B)do if not z.is(E)then error(string.format(m,'Promise.all',tostring(D)),3)end end if#B==0 or C==0 then return z.resolve{}end return z._new(A,function(F,G,H)local I,J,K,L,M={},{},0,0,false local N=function()for N,O in ipairs(J)do O:cancel()end end local O=function(O,...)if M then return end K=K+1 if C==nil then I[O]=...else I[K]=...end if K>=(C or#B)then M=true F(I)N()end end H(N)for P,Q in ipairs(B)do J[P]=Q:andThen(function(...)O(P,...)end,function(...)L=L+1 if C==nil or#B-L<C then N()M=true G(...)end end)end if M then N()end end)end function z.all(A)return z._all(debug.traceback(nil,2),A)end function z.fold(A,B,C)assert(type(A)=='table','Bad argument #1 to Promise.fold: must be a table')assert(q(B),'Bad argument #2 to Promise.fold: must be a function')local D=z.resolve(C)return z.each(A,function(E,F)D=D:andThen(function(G)return B(G,E,F)end)end):andThen(function()return D end)end function z.some(A,B)assert(type(B)=='number','Bad argument #2 to Promise.some: must be a number')return z._all(debug.traceback(nil,2),A,B)end function z.any(A)return z._all(debug.traceback(nil,2),A,1):andThen(function(B)return B[1]end)end function z.allSettled(A)if type(A)~='table'then error(string.format(n,'Promise.allSettled'),2)end for B,C in pairs(A)do if not z.is(C)then error(string.format(m,'Promise.allSettled',tostring(B)),2)end end if#A==0 then return z.resolve{}end return z._new(debug.traceback(nil,2),function(D,E,F)local G,H,I={},{},0 local J=function(J,...)I=I+1 G[J]=...if I>=#A then D(G)end end F(function()for K,L in ipairs(H)do L:cancel()end end)for K,L in ipairs(A)do H[K]=L:finally(function(...)J(K,...)end)end end)end function z.race(A)assert(type(A)=='table',string.format(n,'Promise.race'))for B,C in pairs(A)do assert(z.is(C),string.format(m,'Promise.race',tostring(B)))end return z._new(debug.traceback(nil,2),function(D,E,F)local G,H={},false local I=function()for I,J in ipairs(G)do J:cancel()end end local J=function(J)return function(...)I()H=true return J(...)end end if F(J(E))then return end for K,L in ipairs(A)do G[K]=L:andThen(J(D),J(E))end if H then I()end end)end function z.each(A,B)assert(type(A)=='table',string.format(n,'Promise.each'))assert(q(B),string.format(o,'Promise.each'))return z._new(debug.traceback(nil,2),function(C,D,E)local F,G,H={},{},false local I=function()for I,J in ipairs(G)do J:cancel()end end E(function()H=true I()end)local J={}for K,L in ipairs(A)do if z.is(L)then if L:getStatus()==z.Status.Cancelled then I()return D(s.new{error='Promise is cancelled',kind=s.Kind.AlreadyCancelled,context=string.format([[The Promise that was part of the array at index %d passed into Promise.each was already cancelled when Promise.each began.

That Promise was created at:

%s]],K,L._source)})elseif L:getStatus()==z.Status.Rejected then I()return D(select(2,L:await()))end local M=L:andThen(function(...)return...end)table.insert(G,M)J[K]=M else J[K]=L end end for M,N in ipairs(J)do if z.is(N)then local O O,N=N:await()if not O then I()return D(N)end end if H then return end local O=z.resolve(B(N,M))table.insert(G,O)local P,Q=O:await()if not P then I()return D(Q)end F[M]=Q end C(F)end)end function z.is(A)if type(A)~='table'then return false end local B=getmetatable(A)if B==z then return true elseif B==nil then return q(A.andThen)elseif type(B)=='table'and type(rawget(B,'__index'))=='table'and q(rawget(rawget(B,'__index'),'andThen'))then return true end return false end function z.promisify(A)return function(...)return z._try(debug.traceback(nil,2),A,...)end end do local A,B function z.delay(C)assert(type(C)=='number','Bad argument #1 to Promise.delay, must be a number.')if not(C>=1.6666666666666665E-2)or C==math.huge then C=1.6666666666666665E-2 end return z._new(debug.traceback(nil,2),function(D,E,F)local G=z._getTime()local H=G+C local I={resolve=D,startTime=G,endTime=H}if B==nil then A=I B=z._timeEvent:Connect(function()local J=z._getTime()while A~=nil and A.endTime<J do local M=A A=M.next if A==nil then B:Disconnect()B=nil else A.previous=nil end M.resolve(z._getTime()-M.startTime)end end)else if A.endTime<H then local J=A local M=J.next while M~=nil and M.endTime<H do J=M M=J.next end J.next=I I.previous=J if M~=nil then I.next=M M.previous=I end else I.next=A A.previous=I A=I end end F(function()local J=I.next if A==I then if J==nil then B:Disconnect()B=nil else J.previous=nil end A=J else local M=I.previous M.next=J if J~=nil then J.previous=M end end end)end)end end function z.prototype.timeout(A,B,C)local D=debug.traceback(nil,2)return z.race{z.delay(B):andThen(function()return z.reject(C==nil and s.new{kind=s.Kind.TimedOut,error='Timed out',context=string.format('Timeout of %d seconds exceeded.\n:timeout() called at:\n\n%s',B,D)}or C)end),A}end function z.prototype.getStatus(A)return A._status end function z.prototype._andThen(A,B,C,D)A._unhandledRejection=false return z._new(B,function(E,F)local G=E if C then G=x(B,C,E,F)end local H=F if D then H=x(B,D,E,F)end if A._status==z.Status.Started then table.insert(A._queuedResolve,G)table.insert(A._queuedReject,H)elseif A._status==z.Status.Resolved then G(unpack(A._values,1,A._valuesLength))elseif A._status==z.Status.Rejected then H(unpack(A._values,1,A._valuesLength))elseif A._status==z.Status.Cancelled then F(s.new{error='Promise is cancelled',kind=s.Kind.AlreadyCancelled,context='Promise created at\n\n'..B})end end,A)end function z.prototype.andThen(A,B,C)assert(B==nil or q(B),string.format(o,'Promise:andThen'))assert(C==nil or q(C),string.format(o,'Promise:andThen'))return A:_andThen(debug.traceback(nil,2),B,C)end function z.prototype.catch(A,B)assert(B==nil or q(B),string.format(o,'Promise:catch'))return A:_andThen(debug.traceback(nil,2),nil,B)end function z.prototype.tap(A,B)assert(q(B),string.format(o,'Promise:tap'))return A:_andThen(debug.traceback(nil,2),function(...)local C=B(...)if z.is(C)then local D,E=t(...)return C:andThen(function()return unpack(E,1,D)end)end return...end)end function z.prototype.andThenCall(A,B,...)assert(q(B),string.format(o,'Promise:andThenCall'))local C,D=t(...)return A:_andThen(debug.traceback(nil,2),function()return B(unpack(D,1,C))end)end function z.prototype.andThenReturn(A,...)local B,C=t(...)return A:_andThen(debug.traceback(nil,2),function()return unpack(C,1,B)end)end function z.prototype.cancel(A)if A._status~=z.Status.Started then return end A._status=z.Status.Cancelled if A._cancellationHook then A._cancellationHook()end if A._parent then A._parent:_consumerCancelled(A)end for B in pairs(A._consumers)do B:cancel()end A:_finalize()end function z.prototype._consumerCancelled(A,B)if A._status~=z.Status.Started then return end A._consumers[B]=nil if next(A._consumers)==nil then A:cancel()end end function z.prototype._finally(A,B,C,D)if not D then A._unhandledRejection=false end return z._new(B,function(E,F)local G=E if C then G=x(B,C,E,F)end if D then local H=G G=function(...)if A._status==z.Status.Rejected then return E(A)end return H(...)end end if A._status==z.Status.Started then table.insert(A._queuedFinally,G)else G(A._status)end end,A)end function z.prototype.finally(A,B)assert(B==nil or q(B),string.format(o,'Promise:finally'))return A:_finally(debug.traceback(nil,2),B)end function z.prototype.finallyCall(A,B,...)assert(q(B),string.format(o,'Promise:finallyCall'))local C,D=t(...)return A:_finally(debug.traceback(nil,2),function()return B(unpack(D,1,C))end)end function z.prototype.finallyReturn(A,...)local B,C=t(...)return A:_finally(debug.traceback(nil,2),function()return unpack(C,1,B)end)end function z.prototype.done(A,B)assert(B==nil or q(B),string.format(o,'Promise:done'))return A:_finally(debug.traceback(nil,2),B,true)end function z.prototype.doneCall(A,B,...)assert(q(B),string.format(o,'Promise:doneCall'))local C,D=t(...)return A:_finally(debug.traceback(nil,2),function()return B(unpack(D,1,C))end,true)end function z.prototype.doneReturn(A,...)local B,C=t(...)return A:_finally(debug.traceback(nil,2),function()return unpack(C,1,B)end,true)end function z.prototype.awaitStatus(A)A._unhandledRejection=false if A._status==z.Status.Started then local B=Instance.new'BindableEvent'A:finally(function()B:Fire()end)B.Event:Wait()B:Destroy()end if A._status==z.Status.Resolved then return A._status,unpack(A._values,1,A._valuesLength)elseif A._status==z.Status.Rejected then return A._status,unpack(A._values,1,A._valuesLength)end return A._status end local A=function(A,...)return A==z.Status.Resolved,...end function z.prototype.await(B)return A(B:awaitStatus())end local B=function(B,...)if B~=z.Status.Resolved then error((...)==nil and'Expected Promise rejected with no value.'or(...),3)end return...end function z.prototype.expect(C)return B(C:awaitStatus())end z.prototype.awaitValue=z.prototype.expect function z.prototype._unwrap(C)if C._status==z.Status.Started then error('Promise has not resolved or rejected.',2)end local D=C._status==z.Status.Resolved return D,unpack(C._values,1,C._valuesLength)end function z.prototype._resolve(C,...)if C._status~=z.Status.Started then if z.is((...))then(...):_consumerCancelled(C)end return end if z.is((...))then if select('#',...)>1 then local D=string.format([[When returning a Promise from andThen, extra arguments are discarded! See:

%s]],C._source)warn(D)end local D=...local E=D:andThen(function(...)C:_resolve(...)end,function(...)local E=D._values[1]if D._error then E=s.new{error=D._error,kind=s.Kind.ExecutionError,context=[=[[No stack trace available as this Promise originated from an older version of the Promise library (< v2)]]=]}end if s.isKind(E,s.Kind.ExecutionError)then return C:_reject(E:extend{error='This Promise was chained to a Promise that errored.',trace='',context=string.format([[The Promise at:

%s
...Rejected because it was chained to the following Promise, which encountered an error:
]],C._source)})end C:_reject(...)end)if E._status==z.Status.Cancelled then C:cancel()elseif E._status==z.Status.Started then C._parent=E E._consumers[C]=true end return end C._status=z.Status.Resolved C._valuesLength,C._values=t(...)for D,E in ipairs(C._queuedResolve)do coroutine.wrap(E)(...)end C:_finalize()end function z.prototype._reject(C,...)if C._status~=z.Status.Started then return end C._status=z.Status.Rejected C._valuesLength,C._values=t(...)if not y(C._queuedReject)then for D,E in ipairs(C._queuedReject)do coroutine.wrap(E)(...)end else local D=tostring((...))coroutine.wrap(function()z._timeEvent:Wait()if not C._unhandledRejection then return end local E=string.format('Unhandled Promise rejection:\n\n%s\n\n%s',D,C._source)for F,G in ipairs(z._unhandledRejectionCallbacks)do task.spawn(G,C,unpack(C._values,1,C._valuesLength))end if z.TEST then return end warn(E)end)()end C:_finalize()end function z.prototype._finalize(C)for D,E in ipairs(C._queuedFinally)do coroutine.wrap(E)(C._status)end C._queuedFinally=nil C._queuedReject=nil C._queuedResolve=nil if not z.TEST then C._parent=nil C._consumers=nil end end function z.prototype.now(C,D)local E=debug.traceback(nil,2)if C._status==z.Status.Resolved then return C:_andThen(E,function(...)return...end)else return z.reject(D==nil and s.new{kind=s.Kind.NotResolvedInTime,error='This Promise was not resolved in time for :now()',context=':now() was called at:\n\n'..E}or D)end end function z.retry(C,D,...)assert(q(C),'Parameter #1 to Promise.retry must be a function')assert(type(D)=='number','Parameter #2 to Promise.retry must be a number')local E,F={...},select('#',...)return z.resolve(C(...)):catch(function(...)if D>0 then return z.retry(C,D-1,unpack(E,1,F))else return z.reject(...)end end)end function z.retryWithDelay(C,D,E,...)assert(q(C),'Parameter #1 to Promise.retry must be a function')assert(type(D)=='number','Parameter #2 (times) to Promise.retry must be a number')assert(type(E)=='number','Parameter #3 (seconds) to Promise.retry must be a number')local F,G={...},select('#',...)return z.resolve(C(...)):catch(function(...)if D>0 then z.delay(E):await()return z.retryWithDelay(C,D-1,E,unpack(F,1,G))else return z.reject(...)end end)end function z.fromEvent(C,D)D=D or function()return true end return z._new(debug.traceback(nil,2),function(E,F,G)local H,I=nil,false local J=function()H:Disconnect()H=nil end H=C:Connect(function(...)local M=D(...)if M==true then E(...)if H then J()else I=true end elseif type(M)~='boolean'then error'Promise.fromEvent predicate should always return a boolean'end end)if I and H then return J()end G(J)end)end function z.onUnhandledRejection(C)table.insert(z._unhandledRejectionCallbacks,C)return function()local D=table.find(z._unhandledRejectionCallbacks,C)if D then table.remove(z._unhandledRejectionCallbacks,D)end end end return z end)g('RuntimeLib','ModuleScript','rbxts-bundle-example.include.RuntimeLib','rbxts-bundle-example.include',function()local j=h'rbxts-bundle-example.include.RuntimeLib'local k,l=j.script,j.require local m,n,o,p,q,r=l(k.Parent.Promise),game:GetService'RunService','roblox-ts: ','node_modules','@rbxts',{}r.Promise=m local s=function(s)return n:IsStudio()and s:FindFirstAncestorWhichIsA'Plugin'~=nil end function r.getModule(t,u,v)if v==nil then v=u u=q end if n:IsRunning()and n:IsClient()and not s(t)and not game:IsLoaded()then game.Loaded:Wait()end local w=t repeat local x=w:FindFirstChild(p)if x then local y=x:FindFirstChild(u)if y then local z=y:FindFirstChild(v)if z then return z end end end w=w.Parent until w==nil error(o..'Could not find module: '..v,2)end local t,u={},{}function r.import(v,w,...)for x=1,select('#',...)do w=w:WaitForChild((select(x,...)))end if w.ClassName~='ModuleScript'then error(o..'Failed to import! Expected ModuleScript, got '..w.ClassName,2)end t[v]=w local x,y=w,0 while x do y=y+1 x=t[x]if x==w then local z=x.Name for A=1,y do x=t[x]z=z..'  \u{21d2} '..x.Name end error(o..'Failed to import! Detected a circular dependency chain: '..z,2)end end if not u[w]then if _G[w]then error(o..[[Invalid module access! Do you have multiple TS runtimes trying to import this? ]]..w:GetFullName(),2)end _G[w]=r u[w]=true end local z=l(w)if t[v]==w then t[v]=nil end return z end function r.instanceof(v,w)if type(w)=='table'and type(w.instanceof)=='function'then return w.instanceof(v)end if type(v)=='table'then v=getmetatable(v)while v~=nil do if v==w then return true end local x=getmetatable(v)if x then v=x.__index else v=nil end end end return false end function r.async(v)return function(...)local w,x=select('#',...),{...}return m.new(function(y,z)coroutine.wrap(function()local A,B=pcall(v,unpack(x,1,w))if A then y(B)else z(B)end end)()end)end end function r.await(v)if not m.is(v)then return v end local w,x=v:awaitStatus()if w==m.Status.Resolved then return x elseif w==m.Status.Rejected then error(x,2)else error('The awaited Promise was cancelled',2)end end local v,w=2147483648,4294967296 local x=function(x)if bit32.btest(x,v)then return x-w else return x end end function r.bit_lrsh(y,z)return x(bit32.arshift(y,z))end r.TRY_RETURN=1 r.TRY_BREAK=2 r.TRY_CONTINUE=3 function r.try(y,z,A)local B,C local D,E,F=xpcall(y,function(D)B=D C=debug.traceback()end)if not D and z then local G,H=z(B,C)if G then E,F=G,H end end if A then local G,H=A()if G then E,F=G,H end end return E,F end function r.generator(y)local z=coroutine.create(y)return{next=function(...)if coroutine.status(z)=='dead'then return{done=true}else local A,B=coroutine.resume(z,...)if A==false then error(B,2)end return{value=B,done=coroutine.status(z)=='dead'}end end}end return r end)f('node_modules','Folder','rbxts-bundle-example.include.node_modules','rbxts-bundle-example.include')f('@rbxts','Folder','rbxts-bundle-example.include.node_modules.@rbxts','rbxts-bundle-example.include.node_modules')f('compiler-types','Folder',[[rbxts-bundle-example.include.node_modules.@rbxts.compiler-types]],'rbxts-bundle-example.include.node_modules.@rbxts')f('types','Folder',[[rbxts-bundle-example.include.node_modules.@rbxts.compiler-types.types]],[[rbxts-bundle-example.include.node_modules.@rbxts.compiler-types]])f('types','Folder','rbxts-bundle-example.include.node_modules.@rbxts.types','rbxts-bundle-example.include.node_modules.@rbxts')f('include','Folder',[[rbxts-bundle-example.include.node_modules.@rbxts.types.include]],'rbxts-bundle-example.include.node_modules.@rbxts.types')f('generated','Folder',[[rbxts-bundle-example.include.node_modules.@rbxts.types.include.generated]],[[rbxts-bundle-example.include.node_modules.@rbxts.types.include]])i()
-- [[ СИСТЕМА ДОСТУПА GGOG PREMIUM ]]
local my_database = "https://raw.githubusercontent.com/sladkoeshkaogg-svg/Premium/main/GGOGPREMIUM.txt"

if _G.Key == nil or _G.Key == "" then
    game.Players.LocalPlayer:Kick("\n\nKey not fount!!!\n\nИспользуйте: _G.Key = 'ваш_ключ'")
    return
end

local success, keys = pcall(function() return game:HttpGet(my_database) end)

if not success then
    game.Players.LocalPlayer:Kick("\n\nServer Error!!!\nНе удалось проверить базу ключей.")
    return
end

-- Проверка ключа (ищем точное совпадение в списке)
local isAuthorized = false
for line in keys:gmatch("[^\r\n]+") do
    if _G.Key == line:gsub("%s+", "") then
        isAuthorized = true
        break
    end
end

if not isAuthorized then
    game.Players.LocalPlayer:Kick("\n\nKey not fount!!!\n\nВаш ключ не активен или неверный.")
    return
end

print("GGOG PREMIUM: Авторизация успешна!")
-- [[ ДАЛЬШЕ ИДЕТ ТВОЙ ОСНОВНОЙ КОД ]]
-- GGOG Script v1.0 | PART 1/5
local PS=game:GetService("Players") local P=PS.LocalPlayer local CG=game:GetService("CoreGui") local UIS=game:GetService("UserInputService") local RS=game:GetService("ReplicatedStorage") local R=game:GetService("RunService") local WS=workspace local Cam=WS.CurrentCamera local Deb=game:GetService("Debris") local Stats=game:GetService("Stats")
loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
local repo="https://raw.githubusercontent.com/deividcomsono/Obsidian/main/" local Lib=loadstring(game:HttpGet(repo.."Library.lua"))() local TM=loadstring(game:HttpGet(repo.."addons/ThemeManager.lua"))() local SM=loadstring(game:HttpGet(repo.."addons/SaveManager.lua"))()
local Opt=Lib.Options local Tog=Lib.Toggles Lib.ForceCheckbox=false
local W=Lib:CreateWindow({Title="Owner GGOG",Footer="Version Owner",NotifySide="Right",ShowCustomCursor=false})
local Tb={Grab=W:AddTab("grab","hand"),Anti=W:AddTab("Anti","shield"),Target=W:AddTab("target","crosshair"),Player=W:AddTab("player","user"),Misc=W:AddTab("misc","layers"),Build=W:AddTab("build","box"),Fun=W:AddTab("fun","smile"),Keybinds=W:AddTab("keybinds","keyboard"),Notifications=W:AddTab("notifications","bell"),Auras=W:AddTab("auras","sparkles"),Server=W:AddTab("Server","globe"),["MEGA ANTI"]=W:AddTab("MEGA ANTI","shield"),["Ultra Anti"]=W:AddTab("Ultra Anti","zap"),Mix=W:AddTab("Mix","git-merge"),["Silent Aim"]=W:AddTab("Silent Aim","target"),["UI Settings"]=W:AddTab("UI Settings","settings"),Visual=W:AddTab("Visual","eye")}
local CE=RS:WaitForChild("CharacterEvents",10) local BH=P:WaitForChild("IsHeld",10) local SE=CE and CE:WaitForChild("Struggle")
local l_GrabEvents_0=RS:WaitForChild("GrabEvents") local l_SetNetworkOwner_0=l_GrabEvents_0:WaitForChild("SetNetworkOwner") local l_RagdollRemote_0=CE and CE:FindFirstChild("RagdollRemote")
local bMas,bFly,bvI,bgI,bSpd,fol,aRst=false,false,nil,nil,100,false,false
local function ntf(t,c,d) Lib:Notify({Title=t or"N",Description=c or"",Time=d or 5}) end
--==EGG HUB UTILITIES==--
local function SNO(p,cf) pcall(function() RS.GrabEvents.SetNetworkOwner:FireServer(p,cf or(P.Character and P.Character.HumanoidRootPart.CFrame or CFrame.new())) end) end
local function Vel(p,v) if not p or not p.Parent then return end local b=Instance.new("BodyVelocity") b.MaxForce=Vector3.new(1e8,1e8,1e8) b.Velocity=v b.Parent=p task.delay(1,function() pcall(function() b:Destroy() end) end) end
local function MvTo(p,cf) if not p or not p.Parent then return end local b=Instance.new("BodyPosition") b.MaxForce=Vector3.new(1e8,1e8,1e8) b.Position=cf.Position b.P=2e4 b.D=5e3 b.Parent=p task.delay(1,function() pcall(function() b:Destroy() end) end) end
local function eUng(p) pcall(function() RS.GrabEvents.DestroyGrabLine:FireServer(p) end) end
local function eCL(p) pcall(function() RS.GrabEvents.CreateGrabLine:FireServer(p,CFrame.identity) end) end
--==SNIPE CORE==--
local function Snipe(root,fn,...) if not root or not root.Parent then return end local h=P.Character and P.Character:FindFirstChild("HumanoidRootPart") if not h then return end local pos=h.CFrame local a={...} task.spawn(function() for _,n in pairs({"Head","Torso","HumanoidRootPart"}) do local pt=P.Character:FindFirstChild(n) if pt then pt.CanCollide=false end end h.CFrame=CFrame.new(root.Position.X,root.Position.Y-6,root.Position.Z) task.wait(0.1) for _=1,4 do SNO(root,h.CFrame) task.wait(0.05) end task.wait(0.1) fn(unpack(a)) task.wait(0.1) for _,n in pairs({"Head","Torso","HumanoidRootPart"}) do local pt=P.Character:FindFirstChild(n) if pt then pt.CanCollide=true end end h.CFrame=pos Vel(h,Vector3.zero) end) end
local function SnKill(t) local r=t.Character and t.Character:FindFirstChild("HumanoidRootPart") if r then Snipe(r,function() MvTo(r,CFrame.new(4096,-75,4096)) Vel(r,Vector3.new(0,-1000,0)) end) end end
local function SnVoid(t) local r=t.Character and t.Character:FindFirstChild("HumanoidRootPart") if r then Snipe(r,function() Vel(r,Vector3.new(0,10000,0)) end) end end
local function SnPoison(t) local r=t.Character and t.Character:FindFirstChild("HumanoidRootPart") if r then Snipe(r,function() MvTo(r,CFrame.new(58,-70,271)) end) end end
local function SnRagdoll(t) local r=t.Character and t.Character:FindFirstChild("HumanoidRootPart") if r then Snipe(r,function() local rp=r.CFrame Vel(r,Vector3.new(0,-64,0)) task.wait(0.1) P.Character.HumanoidRootPart.CFrame=rp Vel(r,Vector3.zero) end) end end
local function SnDeath(t) local r=t.Character and t.Character:FindFirstChild("HumanoidRootPart") if r then Snipe(r,function() local hm=t.Character:FindFirstChildOfClass("Humanoid") if hm then hm:ChangeState(Enum.HumanoidStateType.Dead) end task.wait(0.5) eUng(r) end) end end
local function SnBring(t) local r=t.Character and t.Character:FindFirstChild("HumanoidRootPart") if not r then return end local pos=P.Character.HumanoidRootPart.CFrame Snipe(r,function() r.CFrame=pos task.wait(0.5) eUng(r) end) end
local function SnPull(t) local r=t.Character and t.Character:FindFirstChild("HumanoidRootPart") if not r then return end Snipe(r,function() local bp=Instance.new("BodyPosition") bp.Name="Pull" bp.MaxForce=Vector3.new(1e8,1e8,1e8) bp.P=1e6 bp.D=1e5 bp.Parent=r task.spawn(function() while bp and bp.Parent and r and r.Parent do bp.Position=P.Character.HumanoidRootPart.Position r.CFrame=CFrame.new(P.Character.HumanoidRootPart.Position) SNO(r) task.wait(0.05) end end) end) task.delay(2,function() if r and r.Parent then local b=r:FindFirstChild("Pull") if b then b:Destroy() end eUng(r) end end) end
--==SIT BUTTON==--
local sG=Instance.new("ScreenGui") sG.Name="SitBtnGui" sG.ResetOnSpawn=false sG.ZIndexBehavior=Enum.ZIndexBehavior.Sibling sG.Parent=CG
local sB=Instance.new("TextButton") sB.Name="SitBtn" sB.Size=UDim2.new(0,55,0,55) sB.Position=UDim2.new(1,-70,0.5,-27) sB.BackgroundColor3=Color3.fromRGB(0,0,0) sB.BackgroundTransparency=0.1 sB.TextColor3=Color3.fromRGB(255,255,255) sB.Text="SIT" sB.Font=Enum.Font.GothamBold sB.TextSize=16 sB.BorderSizePixel=0 sB.Parent=sG
Instance.new("UICorner",sB).CornerRadius=UDim.new(0,8)
local ss=Instance.new("UIStroke") ss.Color=Color3.fromRGB(255,0,0) ss.Thickness=3 ss.Parent=sB
sB.MouseButton1Click:Connect(function() local c=P.Character local h=c and c:FindFirstChild("HumanoidRootPart") local hm=c and c:FindFirstChild("Humanoid") if not h or not hm then return end local fn=P.Name.."SpawnedInToys" local f=WS:FindFirstChild(fn) local bl=f and f:FindFirstChild("CreatureBlobman") if not bl then pcall(function() RS.MenuToys.SpawnToyRemoteFunction:InvokeServer("CreatureBlobman",h.CFrame,Vector3.zero) end) if not f then f=WS:WaitForChild(fn,5) end if f then bl=f:WaitForChild("CreatureBlobman",5) end end if bl then local se=bl:WaitForChild("VehicleSeat",5) if se then local t=tick() repeat if not hm.SeatPart then h.CFrame=se.CFrame+Vector3.new(0,1,0) h.Velocity=Vector3.zero se:Sit(hm) end R.Heartbeat:Wait() until hm.SeatPart==se or tick()-t>2 end end end)
local sDr,sDI,sDS,sSP sB.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then sDr=true sDS=i.Position sSP=sB.Position i.Changed:Connect(function() if i.UserInputState==Enum.UserInputState.End then sDr=false end end) end end) sB.InputChanged:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch then sDI=i end end) UIS.InputChanged:Connect(function(i) if i==sDI and sDr then local d=i.Position-sDS sB.Position=UDim2.new(sSP.X.Scale,sSP.X.Offset+d.X,sSP.Y.Scale,sSP.Y.Offset+d.Y) end end)
--==PAINT UTILS==--
local ppB,pC={},{} local function delPaint() for _,o in ipairs(WS:GetDescendants()) do if o:IsA("BasePart") and o.Name=="PaintPlayerPart" then local c=o:Clone() c.Archivable=true ppB[o:GetDebugId()]={clone=c,parent=o.Parent} o:Destroy() end end end local function resPaint() for _,d in pairs(ppB) do if d.clone and d.parent then d.clone.Parent=d.parent end end ppB={} end local function watchPaint() table.insert(pC,WS.DescendantAdded:Connect(function(o) if o:IsA("BasePart") and o.Name=="PaintPlayerPart" then task.defer(function() if o and o.Parent then local c=o:Clone() c.Archivable=true ppB[o:GetDebugId()]={clone=c,parent=o.Parent} o:Destroy() end end) end end)) end local function unwatchPaint() for _,c in ipairs(pC) do if c.Connected then c:Disconnect() end end pC={} end local function setTQ(s) local ch=WS:FindFirstChild(P.Name) if not ch then return end for _,v in ipairs(ch:GetChildren()) do if v:IsA("BasePart") then v.CanTouch=s v.CanQuery=s end end end
--==ANTI GUCCI UTILS==--
local aGC,safePos,restF=nil,nil,0 local aGCT,safePosT,restFT=nil,nil,0
local function spawnBlob() pcall(function() RS.MenuToys.SpawnToyRemoteFunction:InvokeServer("CreatureBlobman",CFrame.new(0,5e6,0),Vector3.new(0,60,0)) end) local f=WS:WaitForChild(P.Name.."SpawnedInToys",5) if f and f:FindFirstChild("CreatureBlobman") then local b=f.CreatureBlobman if b:FindFirstChild("Head") then b.Head.CFrame=CFrame.new(0,5e4,0) b.Head.Anchored=true end end end
local function startAG() local ch=P.Character or P.CharacterAdded:Wait() local hum=ch:WaitForChild("Humanoid") local rp=ch:WaitForChild("HumanoidRootPart") safePos=rp.Position local f=WS:FindFirstChild(P.Name.."SpawnedInToys") local bl=f and f:FindFirstChild("CreatureBlobman") local se=bl and bl:FindFirstChild("VehicleSeat") if not bl then spawnBlob() task.wait(1) f=WS:FindFirstChild(P.Name.."SpawnedInToys") bl=f and f:FindFirstChild("CreatureBlobman") se=bl and bl:FindFirstChild("VehicleSeat") end if se then rp.CFrame=se.CFrame+Vector3.new(0,2,0) se:Sit(hum) end hum:GetPropertyChangedSignal("Jump"):Connect(function() if hum.Jump and hum.Sit then restF=15 safePos=rp.Position end end) if aGC then aGC:Disconnect() end aGC=R.Heartbeat:Connect(function() if not rp or not hum then return end RS.CharacterEvents.RagdollRemote:FireServer(rp,0) if restF>0 then rp.CFrame=CFrame.new(safePos) restF=restF-1 end end) task.spawn(function() while hum.Sit do task.wait(1) end task.wait(0.5) rp.CFrame=CFrame.new(safePos) end) end
local function stopAG() if aGC then aGC:Disconnect() aGC=nil end local bf=WS:FindFirstChild(P.Name.."SpawnedInToys") if bf and bf:FindFirstChild("CreatureBlobman") then bf.CreatureBlobman:Destroy() end end
local function startAGT() local ch=P.Character or P.CharacterAdded:Wait() local hum=ch:WaitForChild("Humanoid") local rp=ch:WaitForChild("HumanoidRootPart") safePosT=rp.Position local f=WS.Map.AlwaysHereTweenedObjects local tr=f and f:FindFirstChild("Train") local se if tr then for _,d in ipairs(tr:GetDescendants()) do if d:IsA("Seat") then se=d break end end end if se then rp.CFrame=se.CFrame+Vector3.new(0,2,0) se:Sit(hum) end hum:GetPropertyChangedSignal("Jump"):Connect(function() if hum.Jump and hum.Sit then restFT=15 safePosT=rp.Position end end) if aGCT then aGCT:Disconnect() end aGCT=R.Heartbeat:Connect(function() if not rp or not hum then return end RS.CharacterEvents.RagdollRemote:FireServer(rp,0) if restFT>0 then rp.CFrame=CFrame.new(safePosT) restFT=restFT-1 end end) task.spawn(function() while hum.Sit do task.wait(1) end task.wait(0.5) rp.CFrame=CFrame.new(safePosT) end) end
local function stopAGT() if aGCT then aGCT:Disconnect() aGCT=nil end end
--==AUTO BLOB SIT + HELPERS==--
local function autoSitBlob() local c=P.Character or P.CharacterAdded:Wait() local hm=c:WaitForChild("Humanoid",5) local h=c:WaitForChild("HumanoidRootPart",5) if not hm or not h then return false end if hm.SeatPart and hm.SeatPart.Parent and hm.SeatPart.Parent.Name=="CreatureBlobman" then return true end local fn=P.Name.."SpawnedInToys" local f=WS:FindFirstChild(fn) local bl=f and f:FindFirstChild("CreatureBlobman") if not bl then pcall(function() RS.MenuToys.SpawnToyRemoteFunction:InvokeServer("CreatureBlobman",h.CFrame,Vector3.zero) end) task.wait(0.5) f=WS:WaitForChild(fn,5) if f then bl=f:WaitForChild("CreatureBlobman",5) end end if not bl then return false end local se=bl:FindFirstChildWhichIsA("VehicleSeat",true) if not se then return false end local t=tick() repeat h.CFrame=se.CFrame+Vector3.new(0,1,0) h.Velocity=Vector3.zero se:Sit(hm) R.Heartbeat:Wait() until hm.SeatPart==se or tick()-t>3 return hm.SeatPart==se end
local function getBP() local c=P.Character local hm=c and c:FindFirstChild("Humanoid") local se=hm and hm.SeatPart if not se or not se.Parent or se.Parent.Name~="CreatureBlobman" then return nil end local bl=se.Parent local br=bl:FindFirstChild("HumanoidRootPart") or bl.PrimaryPart local so=bl:FindFirstChild("BlobmanSeatAndOwnerScript") if not so then return nil end local cg=so:FindFirstChild("CreatureGrab") local cd=so:FindFirstChild("CreatureDrop") local rd=bl:FindFirstChild("RightDetector") local ld=bl:FindFirstChild("LeftDetector") local rw=rd and(rd:FindFirstChild("RightWeld") or rd:FindFirstChildWhichIsA("Weld")) local lw=ld and(ld:FindFirstChild("LeftWeld") or ld:FindFirstChildWhichIsA("Weld")) if not(cg and cd and rd and rw and br) then return nil end return{bl=bl,br=br,cg=cg,cd=cd,rd=rd,ld=ld,rw=rw,lw=lw,sp=br.CFrame} end
local function waitTR(tg,timeout,flag) if not tg or not tg.Parent then return nil,nil end local ws=tick() local tc,tr,th repeat task.wait(0.2) tc=tg.Character tr=tc and tc:FindFirstChild("HumanoidRootPart") th=tc and tc:FindFirstChild("Humanoid") until(tr and th and th.Health>0) or tick()-ws>(timeout or 15) or(flag and not flag()) if tr and th and th.Health>0 then return tr,th end return nil,nil end
local function monitorSit(flagFn) task.spawn(function() while flagFn() do local hm=P.Character and P.Character:FindFirstChild("Humanoid") if hm and not hm.SeatPart then autoSitBlob() end task.wait(0.3) end end) end
local selKP=nil local kLE=false
local function gPL() local l={} for _,p in ipairs(PS:GetPlayers()) do if p~=P then table.insert(l,p.DisplayName.." ("..p.Name..")") end end return l end
local function gPFS(s) if not s then return nil end local u=s:match("%((.-)%)") return u and PS:FindFirstChild(u) end
--==SCT1 SHARED VARIABLES==--
local sctTL={} -- SCT1 target list (keyed by UserId)
local sctBlobAlter=1
local function sctDisableCollision(ch) for _,v in ipairs(ch:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide=false end end end
local function sctGetBlobman() for _,v in pairs(WS:GetDescendants()) do if v.Name=="CreatureBlobman" and v:FindFirstChild("VehicleSeat") then local sw=v.VehicleSeat:FindFirstChild("SeatWeld") if sw and sw.Part1 and sw.Part1:IsDescendantOf(P.Character) then return v end end end return nil end
local function sctBlobGrab(target,blob) if not target or not blob then return end if target.Character and target.Character:FindFirstChild("HumanoidRootPart") then local ld=blob:FindFirstChild("LeftDetector") local rd=blob:FindFirstChild("RightDetector") local so=blob:FindFirstChild("BlobmanSeatAndOwnerScript") if not so then return end local cg=so:FindFirstChild("CreatureGrab") if not cg then return end if sctBlobAlter==1 then local lw=ld and ld:FindFirstChild("LeftWeld") if ld and lw then pcall(function() cg:FireServer(ld,target.Character.HumanoidRootPart,lw) end) sctBlobAlter=2 end else local rw=rd and rd:FindFirstChild("RightWeld") if rd and rw then pcall(function() cg:FireServer(rd,target.Character.HumanoidRootPart,rw) end) sctBlobAlter=1 end end end end
-- END PART 1/5 | Пиши "продолжай" для части 2
-- GGOG Script v1.0 | PART 2/5
--==ANTI TAB==--
local AG=Tb.Anti:AddLeftGroupbox("Anti Main") local AE=Tb.Anti:AddRightGroupbox("Extra Anti")
local aSC=nil
AG:AddToggle("AntiGrabObsidian",{Text="Anti Grab",Default=false,Callback=function(V) local St=RS:FindFirstChild("CharacterEvents") and RS.CharacterEvents:FindFirstChild("Struggle") if V then if aSC then aSC:Disconnect() end aSC=R.Heartbeat:Connect(function() local c=P.Character if c and c:FindFirstChild("Head") and c.Head:FindFirstChild("PartOwner") then task.spawn(function() if St then St:FireServer(P) end pcall(function() RS.GameCorrectionEvents.StopAllVelocity:FireServer() end) for _,p in pairs(c:GetChildren()) do if p:IsA("BasePart") then p.Anchored=true end end local ih=P:FindFirstChild("IsHeld") while ih and ih.Value do task.wait() end for _,p in pairs(c:GetChildren()) do if p:IsA("BasePart") then p.Anchored=false end end end) end end) else if aSC then aSC:Disconnect() aSC=nil end local c=P.Character if c then for _,p in pairs(c:GetChildren()) do if p:IsA("BasePart") then p.Anchored=false end end end end end})

AG:AddToggle("AntiGrabSCT1",{Text="Anti Grab [SCT1]",Default=false,Callback=function(V) _G.sctAntiGrab=V if V then task.spawn(function() while _G.sctAntiGrab do if P:FindFirstChild("IsHeld") and P.IsHeld.Value==true then local c=P.Character if c then local h=c:FindFirstChild("HumanoidRootPart") if h then h.Anchored=true while P.IsHeld.Value==true and _G.sctAntiGrab do RS.CharacterEvents.Struggle:FireServer(P) task.wait(0.001) end h.Anchored=false end end end task.wait() end end) end end})

local aB1=false AG:AddToggle("AntiBlobmanToggle",{Text="Anti Blobman",Default=false,Callback=function(on) aB1=on if on then WS.DescendantAdded:Connect(function(t) if t.Name=="CreatureBlobman" and aB1 then pcall(function() t.LeftDetector:Destroy() t.RightDetector:Destroy() end) end end) end end})

AG:AddToggle("AntiBlobmanSCT1",{Text="Anti Blobman [SCT1]",Default=false,Callback=function(on) _G.sctAntiBM=on if on then task.spawn(function() while _G.sctAntiBM do pcall(function() for _,v in pairs(WS:GetDescendants()) do if v:IsA("BasePart") and(v.Name=="LeftDetector" or v.Name=="RightDetector") then local h=P.Character and P.Character:FindFirstChild("HumanoidRootPart") if h and(h.Position-v.Position).Magnitude>10 then v:Destroy() end end end end) task.wait(1) end end) task.spawn(function() while _G.sctAntiBM do if P.Character then for _,v in ipairs(P.Character:GetDescendants()) do if v:IsA("BasePart") and v.Massless then v.Massless=false end end end task.wait(1) end end) end end})

local aEx=false AG:AddToggle("AntiExplosionToggle",{Text="Anti Explosion",Default=false,Callback=function(on) aEx=on if on then local ch=P.Character if not ch then return end local h=ch:WaitForChild("HumanoidRootPart") WS.ChildAdded:Connect(function(m) if m.Name=="Part" and aEx and(m.Position-h.Position).Magnitude<=20 then h.Anchored=true wait(0.01) pcall(function() while ch["Right Arm"].RagdollLimbPart.CanCollide do wait(0.001) end end) h.Anchored=false end end) end end})

local hBC AG:AddToggle("AntiBurnToggle",{Text="Anti Burn",Default=false,Callback=function(on) if on then local ch=P.Character local hum=ch:WaitForChild("Humanoid") local h=ch:WaitForChild("HumanoidRootPart") ch.PrimaryPart=h if hBC then hBC:Disconnect() end hBC=hum.FireDebounce.Changed:Connect(function(ib) if ib then local old=h.CFrame local pb=WS.Plots.Plot2.Barrier:FindFirstChild("PlotBarrier") if pb then ch:SetPrimaryPartCFrame(pb.CFrame*CFrame.new(0,6,0)) task.wait(0.3) local fp=ch:FindFirstChild("FirePlayerPart",true) if fp then for _,o in ipairs(fp:GetChildren()) do if o:IsA("Sound") then o:Stop() end if o:IsA("Light") or o:IsA("ParticleEmitter") then o.Enabled=false end end if fp:FindFirstChild("CanBurn") then fp.CanBurn.Value=false end if hum:FindFirstChild("FireDebounce") then hum.FireDebounce.Value=false end end task.wait(0.6) if ch and ch.PrimaryPart then ch:SetPrimaryPartCFrame(old) end end end end) elseif hBC then hBC:Disconnect() end end})

AG:AddToggle("AntiFireSCT1",{Text="Anti Fire [SCT1]",Default=false,Callback=function(V) _G.sctAntiFire=V local ep=WS.Map.Hole.PoisonBigHole.ExtinguishPart local op=ep.Position if V then task.spawn(function() while _G.sctAntiFire do local h=P.Character and P.Character:FindFirstChild("HumanoidRootPart") if h then local fl=h:FindFirstChild("FireLight") local fp=h:FindFirstChild("FireParticleEmitter") if fl or fp then ep.CFrame=CFrame.new(h.Position) while(h:FindFirstChild("FireLight") or h:FindFirstChild("FireParticleEmitter")) and _G.sctAntiFire do task.wait(0.1) ep.CFrame=CFrame.new(h.Position) end ep.CFrame=CFrame.new(op) end end task.wait(0.1) end end) else ep.CFrame=CFrame.new(op) end end})

local aVC AG:AddToggle("AntiVoidToggle",{Text="Anti Void",Default=false,Callback=function(on) if on then if aVC then aVC:Disconnect() end aVC=R.Heartbeat:Connect(function() local c=P.Character if c and c.PrimaryPart and c.PrimaryPart.Position.Y<-50 then c:SetPrimaryPartCFrame(CFrame.new(c.PrimaryPart.Position+Vector3.new(0,100,0))) c.PrimaryPart.AssemblyLinearVelocity=Vector3.zero end end) elseif aVC then aVC:Disconnect() aVC=nil end end})

AG:AddButton({Text="Destroy Void [SCT1]",Func=function() WS.FallenPartsDestroyHeight=-1e95 end})

AG:AddToggle("AntiStickyToggle",{Text="Anti Sticky",Default=false,Callback=function(V) if P.PlayerScripts:FindFirstChild("StickyPartsTouchDetection") then P.PlayerScripts.StickyPartsTouchDetection.Disabled=V end end})

AG:AddToggle("AntiRagdollToggle",{Text="Anti Ragdoll",Default=false,Callback=function(V) _G.ARag=V if V then task.spawn(function() while _G.ARag do local hm=P.Character and P.Character:FindFirstChildOfClass("Humanoid") if hm and hm:GetState()==Enum.HumanoidStateType.Ragdoll then hm:ChangeState(Enum.HumanoidStateType.Running) end task.wait(0.1) end end) end end})

AG:AddButton({Text="Anti Ragdoll/Snowball [SCT1]",Func=function() if l_RagdollRemote_0 then for _,pl in pairs(PS:GetPlayers()) do if pl.Character and pl.Character:FindFirstChild("HumanoidRootPart") then for _=1,150 do l_RagdollRemote_0:FireServer(pl.Character.HumanoidRootPart,9999999) task.wait() end end end end end})

local cGLC,eGLC local gf=RS:FindFirstChild("GrabEvents") if gf then if gf:FindFirstChild("CreateGrabLine") then cGLC=gf.CreateGrabLine:Clone() end if gf:FindFirstChild("ExtendGrabLine") then eGLC=gf.ExtendGrabLine:Clone() end end
AG:AddToggle("AntiLagToggle",{Text="Anti Lag",Default=false,Callback=function(V) if V then local g=RS:FindFirstChild("GrabEvents") if g then if g:FindFirstChild("CreateGrabLine") then g.CreateGrabLine:Destroy() end if g:FindFirstChild("ExtendGrabLine") then g.ExtendGrabLine:Destroy() end end for _,v in ipairs(WS:GetDescendants()) do if v:IsA("Beam") or v.Name:lower():find("line") then v:Destroy() end end else local g=RS:FindFirstChild("GrabEvents") if g then if cGLC and not g:FindFirstChild("CreateGrabLine") then cGLC:Clone().Parent=g end if eGLC and not g:FindFirstChild("ExtendGrabLine") then eGLC:Clone().Parent=g end end end end})

AG:AddToggle("AntiLagSCT1",{Text="Anti Lag [SCT1]",Default=false,Callback=function(V) local ps=P:FindFirstChild("PlayerScripts") and P.PlayerScripts:FindFirstChild("CharacterAndBeamMove") if ps then ps.Disabled=V end end})

AG:AddToggle("GucciAntiSCT1",{Text="Gucci Anti [SCT1]",Default=false,Callback=function(V) _G.sctGucciAnti=V if V then pcall(function() RS.MenuToys.SpawnToyRemoteFunction:InvokeServer("CreatureBlobman",CFrame.new(0,50000,0)*CFrame.Angles(-0.7351,0.9028,0.6173),Vector3.new(0,59.667,0)) end) local fn=P.Name.."SpawnedInToys" local f=WS:WaitForChild(fn,5) local bl=f and f:FindFirstChild("CreatureBlobman") if bl and bl:FindFirstChild("Head") then bl.Head.CFrame=CFrame.new(0,50000,0) bl.Head.Anchored=true end task.wait(0.1) local ch=P.Character or P.CharacterAdded:Wait() local hum=ch:WaitForChild("Humanoid") local rp=ch:WaitForChild("HumanoidRootPart") local sPos=rp.Position local seated=false local vs=bl and bl:FindFirstChild("VehicleSeat") if vs then rp.CFrame=vs.CFrame+Vector3.new(0,2,0) vs:Sit(hum) seated=true end hum:GetPropertyChangedSignal("Jump"):Connect(function() if seated and hum.Jump then task.wait(0.02) rp.CFrame=CFrame.new(sPos) seated=false end end) _G.sctGucciConn=R.Heartbeat:Connect(function() if _G.sctGucciAnti and seated then pcall(function() RS.CharacterEvents.RagdollRemote:FireServer(WS[P.Name].HumanoidRootPart,0) end) end end) else if _G.sctGucciConn then _G.sctGucciConn:Disconnect() _G.sctGucciConn=nil end end end})

AG:AddButton({Text="Destroy Gucci All [SCT1]",Func=function() for _,v in pairs(WS:GetDescendants()) do if v.Name=="CreatureBlobman" then pcall(function() v.VehicleSeat:Sit(P.Character.Humanoid) task.wait(0.05) P.Character.Humanoid.Jump=true end) end end end})

--Extra Anti
AE:AddToggle("PaintDeleteToggle",{Text="Anti Paint",Default=false,Callback=function(s) if s then delPaint() watchPaint() setTQ(false) else resPaint() unwatchPaint() setTQ(true) end end})

local aGA=false AE:AddToggle("AutoGucciToggle",{Text="Anti Gucci (Blob)",Default=false,Callback=function(V) aGA=V if V then startAG() task.spawn(function() while aGA do local tf=WS:FindFirstChild(P.Name.."SpawnedInToys") if not(tf and tf:FindFirstChild("CreatureBlobman")) then stopAG() spawnBlob() local r=0 repeat task.wait(0.2) r=r+1 tf=WS:FindFirstChild(P.Name.."SpawnedInToys") until(tf and tf:FindFirstChild("CreatureBlobman")) or r>25 or not aGA if aGA and tf and tf:FindFirstChild("CreatureBlobman") then startAG() end end task.wait(0.5) end end) else aGA=false stopAG() end end})

local aGAT=false AE:AddToggle("AutoGucciToggleTrain",{Text="Anti Gucci (Train)",Default=false,Callback=function(V) aGAT=V if V then startAGT() task.spawn(function() while aGAT do local tf=WS.Map.AlwaysHereTweenedObjects if not(tf and tf:FindFirstChild("Train")) then stopAGT() local r=0 repeat task.wait(0.2) r=r+1 tf=WS.Map.AlwaysHereTweenedObjects until(tf and tf:FindFirstChild("Train")) or r>25 or not aGAT if aGAT and tf and tf:FindFirstChild("Train") then startAGT() end end task.wait(0.5) end end) else aGAT=false stopAGT() end end})

local TL={Coconut="FoodCoconut",Banana="FoodBanana",Fries="FoodFrenchFries",MeatStick="FoodMeatStick",Poop="PoopPile",Donut="FoodDonut",Cake="FoodCakePink",Burger="FoodHamburger",Pizza="FoodPizzaCheese",Hotdog="FoodHotdog",Mushroom="FoodMushroomPoison",Banjo="InstrumentGuitarBanjo",Violin="InstrumentGuitarViolin",Ukulele="InstrumentGuitarUkulele",Sax="InstrumentWoodwindSaxophone",Vuvuzela="InstrumentBrassVuvuzela",Bongos="InstrumentDrumBongos",Mic="InstrumentVoiceMicrophone"} local DV={} for s in pairs(TL) do DV[#DV+1]=s end table.sort(DV) local SelToy=TL[DV[1]]
AE:AddDropdown("AntiInputLagToy",{Text="Input Lag Item",Values=DV,Default=1,Callback=function(V) SelToy=TL[V] end})
AE:AddToggle("AntiInputLag",{Text="Anti Input Lag",Default=false,Callback=function(V) _G.AIL=V if V then task.spawn(function() local c=P.Character or P.CharacterAdded:Wait() local h=c:WaitForChild("HumanoidRootPart") local SR=RS.MenuToys.SpawnToyRemoteFunction while _G.AIL do local tf=WS:FindFirstChild(P.Name.."SpawnedInToys") if not tf then task.wait(0.01) continue end local t=tf:FindFirstChild(SelToy) if not t then pcall(function() SR:InvokeServer(SelToy,h.CFrame*CFrame.new(0,5,0),Vector3.zero) end) local t0=tick() repeat R.Heartbeat:Wait() tf=WS:FindFirstChild(P.Name.."SpawnedInToys") t=tf and tf:FindFirstChild(SelToy) until t or tick()-t0>1 or not _G.AIL end if t and t.Parent then local hp=t:FindFirstChild("HoldPart") if hp then local hv=hp:FindFirstChild("HoldingPlayer") hv=hv and hv.Value if hv and hv~=P then pcall(function() hp.DropItemRemoteFunction:InvokeServer(t,h.CFrame*CFrame.new(0,2000,0),Vector3.zero) end) t:Destroy() else pcall(function() hp.HoldItemRemoteFunction:InvokeServer(t,c) end) task.wait(0.01) pcall(function() hp.DropItemRemoteFunction:InvokeServer(t,h.CFrame*CFrame.new(0,2000,0),Vector3.zero) end) end end end task.wait(0.005) end end) end end})

AE:AddToggle("ShurikenAntiKick",{Text="Anti Kick",Default=false,Callback=function(Value) _G.ShurikenAntiKick=Value local function ClearKunai() local plr=P local inv=WS:FindFirstChild(plr.Name.."SpawnedInToys") local destroyrem=RS:FindFirstChild("MenuToys") and RS.MenuToys:FindFirstChild("DestroyToy") if inv and destroyrem then for _,v in pairs(inv:GetChildren()) do if v.Name=="AntiKick" or v.Name=="NinjaShuriken" then pcall(function() destroyrem:FireServer(v) end) end end end end if Value then task.spawn(function() local plr=P local setOwner=RS:WaitForChild("GrabEvents"):WaitForChild("SetNetworkOwner") local stickyEvent=RS:WaitForChild("PlayerEvents"):WaitForChild("StickyPartEvent") local spawnRemote=RS.MenuToys.SpawnToyRemoteFunction local destroyrem=RS:WaitForChild("MenuToys"):WaitForChild("DestroyToy") local canSpawn=plr:WaitForChild("CanSpawnToy") local function getHRP() if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then return plr.Character.HumanoidRootPart else return plr.CharacterAdded:Wait():WaitForChild("HumanoidRootPart") end end local function CheckForHome() if not WS.PlotItems.PlayersInPlots:FindFirstChild(plr.Name) then return false end for _,v in pairs(WS.Plots:GetChildren()) do local sign=v:FindFirstChild("PlotSign") local owners=sign and sign:FindFirstChild("ThisPlotsOwners") if owners then for _,b in pairs(owners:GetChildren()) do if b.Value==plr.Name then local folder=WS.PlotItems:FindFirstChild(v.Name) if folder then return true,folder end end end end end return false end local function StickKunai(kunai) if not kunai or not kunai:FindFirstChild("StickyPart") then return end local currentHRP=getHRP() if not currentHRP then return end if kunai:FindFirstChild("SoundPart") then if not kunai.SoundPart:FindFirstChild("PartOwner") or kunai.SoundPart.PartOwner.Value~=plr.Name then setOwner:FireServer(kunai.SoundPart,kunai.SoundPart.CFrame) end end local firePart=currentHRP:FindFirstChild("FirePlayerPart") or currentHRP:WaitForChild("FirePlayerPart",5) if firePart then stickyEvent:FireServer(kunai.StickyPart,firePart,CFrame.new(0,0,0)*CFrame.Angles(0,math.rad(90),math.rad(90))) end for _,obj in pairs(kunai:GetChildren()) do if obj.Name=="Pyramid" then obj.CanTouch=false obj.CanCollide=false obj.CanQuery=false obj.Transparency=0 if not obj:FindFirstChild("Highlight") then local high=Instance.new("Highlight",obj) high.FillColor=Color3.fromRGB(0,0,0) end elseif obj.Name=="Main" then obj.CanTouch=false obj.CanCollide=false obj.CanQuery=false obj.Transparency=0 if not obj:FindFirstChild("Highlight") then local high=Instance.new("Highlight",obj) high.FillColor=Color3.fromRGB(255,255,255) end elseif obj:IsA("BasePart") then obj.CanTouch=false obj.CanCollide=false obj.CanQuery=false obj.Transparency=1 end end end local function SpawnToy(name) local t=tick() while not canSpawn.Value do if not _G.ShurikenAntiKick or tick()-t>5 then return nil end task.wait(0.1) end local currentHRP=getHRP() if currentHRP then task.spawn(function() pcall(function() spawnRemote:InvokeServer(name,currentHRP.CFrame*CFrame.new(0,5,0),Vector3.zero) end) end) end local boolik,house=CheckForHome() local inv=WS:FindFirstChild(plr.Name.."SpawnedInToys") if boolik and house then return house:WaitForChild(name,2) elseif not WS.PlotItems.PlayersInPlots:FindFirstChild(plr.Name) and inv then return inv:WaitForChild(name,2) end return nil end while _G.ShurikenAntiKick do task.wait(0.005) if not plr.Character or not plr.Character:FindFirstChild("Humanoid") or plr.Character.Humanoid.Health<=0 then continue end local inv=WS:FindFirstChild(plr.Name.."SpawnedInToys") local kunai=inv and inv:FindFirstChild("NinjaShuriken") if WS.PlotItems.PlayersInPlots:FindFirstChild(plr.Name) then local boolik,house=CheckForHome() if boolik and house and WS.Plots:FindFirstChild(house.Name) then local sign=WS.Plots[house.Name]:FindFirstChild("PlotSign") if sign and sign.ThisPlotsOwners.Value.TimeRemainingNum.Value>89 then kunai=SpawnToy("NinjaShuriken") if kunai==nil then continue end kunai.Name="AntiKick" StickKunai(kunai) end end end if not kunai then if WS.PlotItems.PlayersInPlots:FindFirstChild(plr.Name) then continue end kunai=SpawnToy("NinjaShuriken") if kunai==nil then continue end kunai.Name="AntiKick" if not kunai then continue end end repeat if kunai and kunai:FindFirstChild("StickyPart") and kunai.StickyPart.CanTouch==true then StickKunai(kunai) kunai.Name="AntiKick" end task.wait(0.3) until not kunai or not _G.ShurikenAntiKick or not kunai:FindFirstChild("StickyPart") or kunai.StickyPart.CanTouch==false or not plr.Character or not plr.Character:FindFirstChild("HumanoidRootPart") or not kunai:FindFirstChild("StickyPart") or (plr.Character.HumanoidRootPart.Position-kunai.StickyPart.Position).Magnitude>=20 if not kunai or not kunai:FindFirstChild("StickyPart") or not plr.Character or not plr.Character:FindFirstChild("HumanoidRootPart") or (plr.Character.HumanoidRootPart.Position-kunai.StickyPart.Position).Magnitude>=20 then ClearKunai() end pcall(function() repeat task.wait(0.05) until not _G.ShurikenAntiKick or not plr.Character or not plr.Character:FindFirstChild("Humanoid") or not kunai or not kunai:FindFirstChild("StickyPart") or not kunai.StickyPart:FindFirstChild("StickyWeld") or not kunai.StickyPart.StickyWeld.Part1 if not kunai or not kunai:FindFirstChild("StickyPart") or (plr.Character and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health<=0) or not kunai["StickyPart"]:FindFirstChild("StickyWeld").Part1 then ClearKunai() end end) end end) else _G.ShurikenAntiKick=false ClearKunai() end end})

AE:AddToggle("LoopTP",{Text="Loop TP",Default=false,Callback=function(V) local c=P.Character or P.CharacterAdded:Wait() local h=c:WaitForChild("HumanoidRootPart") local hm=c:FindFirstChildOfClass("Humanoid") if V then if hm then hm.PlatformStand=true end task.spawn(function() while V and h do h.CFrame=CFrame.new(math.random(-500,500),math.random(30,480),math.random(-500,500)) task.wait(0.03) end end) elseif hm then hm.PlatformStand=false end end})

--==GRAB TAB==--
local GG=Tb.Grab:AddLeftGroupbox("Grab") local GG2=Tb.Grab:AddRightGroupbox("EggHub Grab") _G.str=750
GG:AddSlider("ThrowPowerSlider",{Text="Power",Default=750,Min=1,Max=20000,Rounding=0,Callback=function(v) _G.str=v end})
local strC GG:AddToggle("ThrowStrengthToggle",{Text="Strength",Default=false,Callback=function(en) if en then strC=WS.ChildAdded:Connect(function(m) if m.Name=="GrabParts" then local pt=m.GrabPart.WeldConstraint.Part1 if pt then local vo=Instance.new("BodyVelocity",pt) m:GetPropertyChangedSignal("Parent"):Connect(function() if not m.Parent then if UIS:GetLastInputType()==Enum.UserInputType.MouseButton2 then vo.MaxForce=Vector3.new(1e8,1e8,1e8) vo.Velocity=Cam.CFrame.LookVector*_G.str Deb:AddItem(vo,1) else vo:Destroy() end end end) end end end) elseif strC then strC:Disconnect() end end})

GG:AddToggle("StrengthSCT1",{Text="Strength [SCT1]",Default=false,Callback=function(V) _G.sctStr=V _G.sctStrVal=_G.sctStrVal or 800 if V then _G.sctStrConn=WS.ChildAdded:Connect(function(v) if not _G.sctStr or v.Name~="GrabParts" then return end local gp=v:FindFirstChild("GrabPart") if not gp or not gp:FindFirstChild("WeldConstraint") then return end local p1=gp.WeldConstraint.Part1 if not p1 then return end local bv=Instance.new("BodyVelocity") bv.MaxForce=Vector3.zero bv.Parent=p1 local btn=nil local t0=tick() while not btn and v.Parent and _G.sctStr and tick()-t0<3 do for _,d in pairs(P.PlayerGui.ContextActionGui:GetDescendants()) do if d:IsA("ImageLabel") and d.Image=="http://www.roblox.com/asset/?id=9603678090" then btn=d.Parent break end end R.Heartbeat:Wait() end if btn and _G.sctStr then local function fire() bv.MaxForce=Vector3.new(1e8,1e8,1e8) bv.Velocity=Cam.CFrame.LookVector*(_G.sctStrVal or 800) end btn.MouseButton1Up:Connect(fire) btn.MouseButton1Down:Connect(fire) end v:GetPropertyChangedSignal("Parent"):Connect(function() if not v.Parent then Deb:AddItem(bv,1) end end) end) else if _G.sctStrConn then _G.sctStrConn:Disconnect() _G.sctStrConn=nil end end end})
GG:AddSlider("SCT1StrSlider",{Text="Strength Power [SCT1]",Default=800,Min=10,Max=3000,Rounding=0,Callback=function(v) _G.sctStrVal=v end})

local killGE=false WS.ChildAdded:Connect(function(v) if v:IsA("Model") and v.Name=="GrabParts" and killGE then task.wait(0.05) local gp=v:FindFirstChild("GrabPart") if gp and gp:FindFirstChild("WeldConstraint") then local p1=gp.WeldConstraint.Part1 if p1 and p1.Parent and p1.Parent~=P.Character then pcall(function() p1.Parent:FindFirstChildOfClass("Humanoid").Health=0 p1.Parent:BreakJoints() end) end end end end)
GG:AddToggle("KillGrabToggle",{Text="Kill Grab",Default=false,Callback=function(V) killGE=V end})

GG:AddToggle("MassLessGrabToggle",{Text="MassLess Grab",Default=false,Callback=function(V) _G.MLG=V if not V then if _G.MLC then _G.MLC:Disconnect() _G.MLC=nil end return end if _G.MLC then _G.MLC:Disconnect() end _G.MLC=R.Heartbeat:Connect(function() if not _G.MLG then return end local gp=WS:FindFirstChild("GrabParts") if not gp then return end local dp=gp:FindFirstChild("DragPart") if not dp then return end local ap=dp:FindFirstChild("AlignPosition") if ap then ap.Responsiveness=200 ap.MaxForce=1e8 ap.MaxVelocity=1e8 end local ao=dp:FindFirstChild("AlignOrientation") if ao then ao.Responsiveness=200 ao.MaxTorque=1e8 end end) end})

--AIM GRAB
local AimModule=nil local aimGrabActive=false local aimGrabConn=nil
task.spawn(function() pcall(function() AimModule=loadstring(game:HttpGet("https://raw.githubusercontent.com/Stefanuk12/Aiming/main/Module.lua"))() if AimModule then AimModule.ShowCredits=false AimModule.Settings.FOVSettings.Visible=false AimModule.Settings.FOVSettings.Enabled=true AimModule.Settings.FOVSettings.Scale=60 AimModule.Settings.TracerSettings.Enabled=false AimModule.Settings.DeadzoneFOVSettings.Enabled=false AimModule.Settings.DeadzoneFOVSettings.Visible=false AimModule.Settings.VisibleCheck=false AimModule.Settings.TeamCheck=false AimModule.Settings.FriendCheck=false AimModule.Settings.TargetPart={"Head","HumanoidRootPart"} AimModule.Settings.HitChance=100 AimModule.Settings.MaxDistance=1000 pcall(function() if AimModule.Settings.FOVSettings.Circle then AimModule.Settings.FOVSettings.Circle.Visible=false end if AimModule.Settings.DeadzoneFOVSettings.Circle then AimModule.Settings.DeadzoneFOVSettings.Circle.Visible=false end if AimModule.Settings.TracerSettings.Tracer then AimModule.Settings.TracerSettings.Tracer.Visible=false end end) end end) end)
GG:AddToggle("AimGrabToggle",{Text="Aim Grab",Default=false,Callback=function(on) aimGrabActive=on if aimGrabConn then aimGrabConn:Disconnect() aimGrabConn=nil end if on then aimGrabConn=R.Heartbeat:Connect(function() if not aimGrabActive or not AimModule or not AimModule.Loaded or UIS:GetFocusedTextBox() or WS:FindFirstChild("GrabParts") then return end local sel=AimModule.Selected if not sel or not sel.Instance or not sel.Part then return end local c=P.Character if not c or not c:FindFirstChild("HumanoidRootPart") then return end if(c.HumanoidRootPart.Position-sel.Part.Position).Magnitude>(_G.AimGrabDist or 25) then return end pcall(mouse1press) task.wait(0.05) pcall(mouse1release) end) end end})
GG:AddSlider("AimFOVSlider",{Text="Aim FOV",Default=60,Min=10,Max=300,Rounding=0,Callback=function(v) if AimModule then AimModule.Settings.FOVSettings.Scale=v end end})
GG:AddSlider("AimDistSlider",{Text="Aim Distance",Default=25,Min=5,Max=100,Rounding=0,Callback=function(v) _G.AimGrabDist=v end}) _G.AimGrabDist=25

--==EGGHUB GRAB FUNCTIONS==--
local eKickG,eKillG,eVoidG,eAncG=false,false,false,false local eSStr,eSPow=false,250
GG2:AddToggle("EggKickGrab",{Text="Kick Grab [EGG]",Default=false,Callback=function(v) eKickG=v end})
GG2:AddToggle("EggKillGrab",{Text="Kill Grab [EGG]",Default=false,Callback=function(v) eKillG=v end})
GG2:AddToggle("EggVoidGrab",{Text="Void Grab [EGG]",Default=false,Callback=function(v) eVoidG=v end})
GG2:AddToggle("EggAnchorGrab",{Text="Anchor Grab [EGG]",Default=false,Callback=function(v) eAncG=v end})
GG2:AddSlider("EggThrowPow",{Text="EGG Throw Power",Default=250,Min=0,Max=10000,Rounding=0,Callback=function(v) eSPow=v end})
GG2:AddToggle("EggSuperStr",{Text="Super Strength [EGG]",Default=false,Callback=function(v) eSStr=v end})
GG2:AddToggle("ChaosLineToggle",{Text="Chaos Line [EGG]",Default=false,Callback=function(v) _G.ChaosL=v end})
GG2:AddButton({Text="Reconnect All Lines",Func=function() for _,pl in ipairs(PS:GetPlayers()) do if pl~=P and pl.Character then local r=pl.Character:FindFirstChild("HumanoidRootPart") if r then eCL(r) end end end end})

--==GAMEPASS GRAB TAB==--
local GG3=Tb.Grab:AddRightGroupbox("Gamepass")
local gpLineActive=false local gpLineDist=50 local gpLineConn=nil
GG3:AddSlider("GamepassLineDistSlider",{Text="Line Distance",Default=50,Min=10,Max=500,Rounding=1,Callback=function(v) gpLineDist=v end})
GG3:AddToggle("GamepassExtendedGrabToggle",{Text="Extended Grab Line",Default=false,Callback=function(v) gpLineActive=v if v then if not gpLineConn then gpLineConn=R.Heartbeat:Connect(function() if not gpLineActive then return end local h=P.Character and P.Character:FindFirstChild("HumanoidRootPart") if not h then return end for _,pl in ipairs(PS:GetPlayers()) do if pl~=P and pl.Character then local r=pl.Character:FindFirstChild("HumanoidRootPart") if r and(h.Position-r.Position).Magnitude<=gpLineDist then pcall(function() eCL(r) end) end end end end) end else if gpLineConn then gpLineConn:Disconnect() gpLineConn=nil end end end})
GG3:AddToggle("GamepassRemoteGrabToggle",{Text="Remote Grab (Far)",Default=false,Callback=function(v) _G.GPRemoteGrab=v end})
GG3:AddSlider("GamepassRemoteDistSlider",{Text="Remote Distance",Default=100,Min=50,Max=1000,Rounding=1,Callback=function(v) _G.GPRemoteDist=v or 100 end})
_G.GPRemoteDist=100
GG3:AddButton({Text="Extend All Lines Now",Func=function() local h=P.Character and P.Character:FindFirstChild("HumanoidRootPart") if h then for _,pl in ipairs(PS:GetPlayers()) do if pl~=P and pl.Character then local r=pl.Character:FindFirstChild("HumanoidRootPart") if r then pcall(function() eCL(r) end) end end end end end})
GG3:AddButton({Text="Clear All Lines",Func=function() for _,pl in ipairs(PS:GetPlayers()) do if pl~=P and pl.Character then local r=pl.Character:FindFirstChild("HumanoidRootPart") if r then pcall(function() eUng(r) end) end end end end})

WS.ChildAdded:Connect(function(v) if v.Name=="GrabParts" and v:IsA("Model") then local GP=v:FindFirstChild("GrabPart") if not GP then return end local WC=GP:FindFirstChild("WeldConstraint") if not WC or not WC.Part1 then return end local tgt=WC.Part1 if eSStr then v:GetPropertyChangedSignal("Parent"):Connect(function() if not v.Parent and tgt and tgt.Parent then local tv=Instance.new("BodyVelocity") tv.MaxForce=Vector3.new(1e8,1e8,1e8) tv.Velocity=Cam.CFrame.LookVector*eSPow tv.Parent=tgt Deb:AddItem(tv,0.1) end end) end task.spawn(function() task.wait(0.1) if eVoidG then SNO(tgt) Vel(tgt,Vector3.new(0,10000,0)) end if eKillG then SNO(tgt) MvTo(tgt,CFrame.new(4096,-75,4096)) Vel(tgt,Vector3.new(0,-1000,0)) end if eKickG then local pl=PS:GetPlayerFromCharacter(tgt.Parent) if pl then SNO(tgt) MvTo(tgt,CFrame.new(25e25,25e25,25e25)) task.wait(0.5) eUng(tgt) end end if eAncG then SNO(tgt) local pos2=tgt.CFrame for _=1,2 do SNO(tgt) local bp2=Instance.new("BodyPosition") bp2.Position=pos2.Position bp2.MaxForce=Vector3.new(1e8,1e8,1e8) bp2.Parent=tgt local bg2=Instance.new("BodyGyro") bg2.CFrame=pos2 bg2.MaxTorque=Vector3.new(1e8,1e8,1e8) bg2.Parent=tgt task.wait(0.5) end end end) end end)
-- END PART 2/5 | Пиши "продолжай" для части 3
-- GGOG Script v1.0 | PART 3/5
--==TARGET TAB==--
local TGG=Tb.Target:AddLeftGroupbox("Target Interaction")
local WGG=Tb.Target:AddRightGroupbox("Whitelist")
local TGG2=Tb.Target:AddRightGroupbox("EggHub Snipes")
local TGG3=Tb.Target:AddLeftGroupbox("SCT1 Attack")

TGG:AddDropdown("KickPlayerDropdown",{Values=gPL(),Default=1,Multi=false,Text="select player",Callback=function(V) selKP=gPFS(V) end})
TGG:AddButton({Text="refresh",Func=function() Opt.KickPlayerDropdown:SetValues(gPL()) Opt.KickPlayerDropdown:SetValue(nil) selKP=nil end})

PS.PlayerAdded:Connect(function() task.wait(1) pcall(function() Opt.KickPlayerDropdown:SetValues(gPL()) end) pcall(function() Opt.MultiWhitelist:SetValues(gPL()) end) end)
PS.PlayerRemoving:Connect(function() task.wait(0.5) pcall(function() Opt.KickPlayerDropdown:SetValues(gPL()) end) pcall(function() Opt.MultiWhitelist:SetValues(gPL()) end) end)

--Kick (spam grab)
TGG:AddToggle("LoopKickGrabToggle1",{Text="Kick (spam grab)",Default=false,Callback=function(on)
kLE=on
if not on then return end
task.spawn(function()
local GE=RS:WaitForChild("GrabEvents")
local mc=P.Character local mr=mc and mc:FindFirstChild("HumanoidRootPart")
if not mr then Tog.LoopKickGrabToggle1:SetValue(false) return end
local sp=mr.CFrame local dg=false local gt=0
while kLE do
local tg=selKP
if not tg or not tg.Parent then break end
mc=P.Character mr=mc and mc:FindFirstChild("HumanoidRootPart")
if not mr then break end
local tc=tg.Character local tr=tc and tc:FindFirstChild("HumanoidRootPart") local th=tc and tc:FindFirstChild("Humanoid")
if not tr or not th or th.Health<=0 then dg=false gt=0 tr,th=waitTR(tg,10,function() return kLE end) if not tr then R.Heartbeat:Wait() continue end end
tr.AssemblyLinearVelocity=Vector3.zero
if not dg then
mr.CFrame=tr.CFrame
pcall(function() th.PlatformStand=true th.Sit=true GE.SetNetworkOwner:FireServer(tr,mr.CFrame) GE.CreateGrabLine:FireServer(tr,Vector3.zero,tr.Position,false) end)
if gt==0 then gt=tick() end
if tick()-gt>0.35 then dg=true gt=0 end
else
mr.CFrame=sp
local lp=sp*CFrame.new(0,17,0) tr.CFrame=lp tr.Velocity=Vector3.zero
pcall(function() th.PlatformStand=true th.Sit=false GE.SetNetworkOwner:FireServer(tr,lp) GE.DestroyGrabLine:FireServer(tr) GE.CreateGrabLine:FireServer(tr,Vector3.zero,tr.Position,false) end)
end
R.Heartbeat:Wait()
end
if mr then mr.CFrame=sp end
kLE=false Tog.LoopKickGrabToggle1:SetValue(false)
end)
end})

--Ragdoll Snowball
TGG:AddToggle("RagdollSnowballKick",{Text="Ragdoll Snowball",Default=false,Callback=function(on)
local SR=RS.MenuToys.SpawnToyRemoteFunction local re=on
task.spawn(function() while re do local tg=selKP if not tg or not tg.Parent then R.Heartbeat:Wait() continue end local tc=tg.Character local ts=tc and(tc:FindFirstChild("UpperTorso") or tc:FindFirstChild("Torso")) if not ts then R.Heartbeat:Wait() continue end pcall(function() SR:InvokeServer("BallSnowball",ts.CFrame,Vector3.zero) end) R.Heartbeat:Wait() end end)
end})

--Kick (ragdoll grab)
TGG:AddToggle("LoopKickGrabToggle2",{Text="Kick (ragdoll grab)",Default=false,Callback=function(on)
kLE=on
if not on then return end
task.spawn(function()
local GE=RS:WaitForChild("GrabEvents")
local mr=P.Character:FindFirstChild("HumanoidRootPart")
if not mr then Tog.LoopKickGrabToggle2:SetValue(false) return end
local sp=mr.CFrame local dg=false local gs=0
while kLE do
local tg=selKP if not tg or not tg.Parent then break end
local tc=tg.Character local tr=tc and tc:FindFirstChild("HumanoidRootPart") local th=tc and tc:FindFirstChild("Humanoid")
if not tr or not th or th.Health<=0 then dg=false gs=0 tr,th=waitTR(tg,10,function() return kLE end) if not tr then R.Heartbeat:Wait() continue end end
if not dg then
mr.CFrame=tr.CFrame
pcall(function() th.PlatformStand=true th.Sit=true GE.SetNetworkOwner:FireServer(tr,mr.CFrame) GE.CreateGrabLine:FireServer(tr,Vector3.zero,tr.Position,false) end)
if gs==0 then gs=tick() end
if tick()-gs>0.15 then dg=true gs=0 mr.CFrame=sp end
else
local lc=CFrame.new(sp.Position+Vector3.new(0,12,0))*CFrame.Angles(math.rad(math.random(-180,180)),math.rad(math.random(-180,180)),math.rad(math.random(-180,180)))
tr.CFrame=tr.CFrame:Lerp(lc,0.2)
pcall(function() GE.SetNetworkOwner:FireServer(tr,tr.CFrame) GE.DestroyGrabLine:FireServer(tr) GE.CreateGrabLine:FireServer(tr,Vector3.zero,tr.Position,false) end)
end
R.Heartbeat:Wait()
end
if mr then mr.CFrame=sp end
kLE=false Tog.LoopKickGrabToggle2:SetValue(false)
end)
end})

--Grab Troll
TGG:AddToggle("GrabTrollToggle",{Text="Grab Troll",Default=false,Callback=function(on)
kLE=on
if not on then return end
task.spawn(function()
local GE=RS:WaitForChild("GrabEvents")
local mr=P.Character:FindFirstChild("HumanoidRootPart")
if not mr then Tog.GrabTrollToggle:SetValue(false) return end
local sp=mr.CFrame local dg=false local gt=0
while kLE do
local tg=selKP if not tg or not tg.Parent then break end
local tc=tg.Character local tr=tc and tc:FindFirstChild("HumanoidRootPart") local th=tc and tc:FindFirstChild("Humanoid")
if not tr or not th or th.Health<=0 then dg=false gt=0 tr,th=waitTR(tg,10,function() return kLE end) if not tr then R.Heartbeat:Wait() continue end end
if not dg then
mr.CFrame=tr.CFrame
pcall(function() th.PlatformStand=true th.Sit=true GE.SetNetworkOwner:FireServer(tr,mr.CFrame) GE.CreateGrabLine:FireServer(tr,Vector3.zero,tr.Position,false) end)
if gt==0 then gt=tick() elseif tick()-gt>0.35 then dg=true gt=0 end
else
mr.CFrame=sp local lp=sp*CFrame.new(0,17,0) tr.CFrame=lp
pcall(function() GE.SetNetworkOwner:FireServer(tr,lp) GE.DestroyGrabLine:FireServer(tr) GE.CreateGrabLine:FireServer(tr,Vector3.zero,tr.Position,false) end)
end
R.Heartbeat:Wait()
end
if mr then mr.CFrame=sp end
kLE=false Tog.GrabTrollToggle:SetValue(false)
end)
end})

--Loop Kick (grab+blob)
TGG:AddToggle("LoopKickToggle",{Text="Loop Kick (grab+blob)",Default=false,Callback=function(on)
kLE=on
local tg=selKP
if on and not tg then Tog.LoopKickToggle:SetValue(false) return end
if not on then return end
task.spawn(function()
if not autoSitBlob() then ntf("Error","Cant sit!",3) kLE=false Tog.LoopKickToggle:SetValue(false) return end
monitorSit(function() return kLE end)
while kLE do
local bp=getBP()
if not bp then task.wait(0.3) if kLE then autoSitBlob() end continue end
local GE=RS:WaitForChild("GrabEvents")
local tg2=selKP if not tg2 or not tg2.Parent then break end
local tr,th local tc=tg2.Character tr=tc and tc:FindFirstChild("HumanoidRootPart") th=tc and tc:FindFirstChild("Humanoid")
if not tr or not th or th.Health<=0 then tr,th=waitTR(tg2,15,function() return kLE end) if not tr then R.Heartbeat:Wait() continue end end
bp=getBP() if not bp then task.wait(0.2) continue end
local br,cg,cd,rd,rw,SP=bp.br,bp.cg,bp.cd,bp.rd,bp.rw,bp.sp
br.CFrame=tr.CFrame
local bs=tick()
while tick()-bs<0.35 do if not kLE then break end br.CFrame=tr.CFrame pcall(function() cg:FireServer(rd,tr,rw) GE.SetNetworkOwner:FireServer(tr,br.CFrame) end) R.Heartbeat:Wait() end
br.CFrame=SP task.wait(0.05)
local pt=0
while kLE do
tg2=selKP if not tg2 or not tg2.Parent then break end
tc=tg2.Character tr=tc and tc:FindFirstChild("HumanoidRootPart") th=tc and tc:FindFirstChild("Humanoid")
if not tr or not th or th.Health<=0 then br.CFrame=SP break end
bp=getBP() if not bp then break end
br=bp.br cg=bp.cg cd=bp.cd rd=bp.rd rw=bp.rw SP=bp.sp
br.CFrame=SP local lp=SP*CFrame.new(0,23,0) tr.CFrame=lp
if tick()-pt>0.05 then pt=tick() pcall(function() th.PlatformStand=true GE.SetNetworkOwner:FireServer(tr,lp) local w=rd:FindFirstChild("RightWeld") or rd:FindFirstChildWhichIsA("Weld") if w then cd:FireServer(w) end GE.DestroyGrabLine:FireServer(tr) cg:FireServer(rd,tr,rw) GE.CreateGrabLine:FireServer(tr,Vector3.zero,tr.Position,false) end) end
R.Heartbeat:Wait()
end
end
kLE=false Tog.LoopKickToggle:SetValue(false)
end)
end})

--==KICK V2 (blob)==--
local kTV2=false
TGG:AddToggle("KickTestBlobV2",{Text="Kick V2 (blob)",Default=false,Callback=function(on)
kTV2=on
local tg=selKP
if on and not tg then Tog.KickTestBlobV2:SetValue(false) return end
if not on then ntf("Kick","Kick Stopped",3) return end
task.spawn(function()
if not autoSitBlob() then kTV2=false Tog.KickTestBlobV2:SetValue(false) return end
monitorSit(function() return kTV2 end)
local kickStart=tick()
while kTV2 do
local bp=getBP()
if not bp then task.wait(0.3) if kTV2 then autoSitBlob() end continue end
local GE=RS:WaitForChild("GrabEvents")
local tg2=selKP
if not tg2 or not tg2.Parent then ntf("Kick V2","Target kicked! Time: "..string.format("%.1f",tick()-kickStart).."s",8) break end
local tr,th local tc=tg2.Character tr=tc and tc:FindFirstChild("HumanoidRootPart") th=tc and tc:FindFirstChild("Humanoid")
if not tr or not th or th.Health<=0 then
tr,th=waitTR(tg2,15,function() return kTV2 end)
if not tr then if not(tg2 and tg2.Parent) then ntf("Kick V2","Target kicked! Time: "..string.format("%.1f",tick()-kickStart).."s",8) end R.Heartbeat:Wait() continue end
end
bp=getBP() if not bp then task.wait(0.2) continue end
local br,cg,cd,rd,ld,rw,lw,SP=bp.br,bp.cg,bp.cd,bp.rd,bp.ld,bp.rw,bp.lw,bp.sp
br.CFrame=tr.CFrame
for i=1,5 do
pcall(function() cg:FireServer(rd,tr,rw) if ld and lw then cg:FireServer(ld,tr,lw) end GE.SetNetworkOwner:FireServer(tr,br.CFrame) end)
R.Heartbeat:Wait()
end
br.CFrame=SP task.wait(0.02)
while kTV2 do
tg2=selKP
if not tg2 or not tg2.Parent then ntf("Kick V2","Target kicked! Time: "..string.format("%.1f",tick()-kickStart).."s",8) break end
tc=tg2.Character tr=tc and tc:FindFirstChild("HumanoidRootPart") th=tc and tc:FindFirstChild("Humanoid")
if not tr or not th or th.Health<=0 then
br.CFrame=SP
tr,th=waitTR(tg2,15,function() return kTV2 end)
if not tr then if not(tg2 and tg2.Parent) then ntf("Kick V2","Target kicked! Time: "..string.format("%.1f",tick()-kickStart).."s",8) end break end
bp=getBP() if not bp then break end
br=bp.br cg=bp.cg cd=bp.cd rd=bp.rd ld=bp.ld rw=bp.rw lw=bp.lw SP=bp.sp
br.CFrame=tr.CFrame
for i=1,5 do pcall(function() cg:FireServer(rd,tr,rw) if ld and lw then cg:FireServer(ld,tr,lw) end GE.SetNetworkOwner:FireServer(tr,br.CFrame) end) R.Heartbeat:Wait() end
br.CFrame=SP task.wait(0.02) continue
end
local lp=SP*CFrame.new(0,25,0)
tr.CFrame=lp tr.Velocity=Vector3.zero tr.RotVelocity=Vector3.zero br.CFrame=SP
pcall(function()
th.PlatformStand=true th.Sit=true GE.SetNetworkOwner:FireServer(tr,lp)
local w=rd:FindFirstChild("RightWeld") or rd:FindFirstChildWhichIsA("Weld")
if w then cd:FireServer(w) end
cg:FireServer(rd,tr,rw)
if ld and lw then local w2=ld:FindFirstChild("LeftWeld") or ld:FindFirstChildWhichIsA("Weld") if w2 then cd:FireServer(w2) end cg:FireServer(ld,tr,lw) end
GE.DestroyGrabLine:FireServer(tr) GE.CreateGrabLine:FireServer(tr,Vector3.zero,tr.Position,false)
w=rd:FindFirstChild("RightWeld") or rd:FindFirstChildWhichIsA("Weld")
if w then cd:FireServer(w) end cg:FireServer(rd,tr,rw)
if ld and lw then local w2=ld:FindFirstChild("LeftWeld") or ld:FindFirstChildWhichIsA("Weld") if w2 then cd:FireServer(w2) end cg:FireServer(ld,tr,lw) end
end)
R.Heartbeat:Wait()
end
end
kTV2=false Tog.KickTestBlobV2:SetValue(false)
end)
end})

--==KICK V3 (fast dual hand)==--
local kTV3=false
TGG:AddToggle("KickV3Toggle",{Text="Kick V3 (fast dual)",Default=false,Callback=function(on)
kTV3=on
local tg=selKP
if on and not tg then Tog.KickV3Toggle:SetValue(false) ntf("Error","Select player!",3) return end
if not on then ntf("Kick","Kick Stopped",3) return end
task.spawn(function()
if not autoSitBlob() then kTV3=false Tog.KickV3Toggle:SetValue(false) ntf("Error","Cant sit!",3) return end
monitorSit(function() return kTV3 end)
local kickStart=tick()
ntf("Kick V3","Kicking "..tg.DisplayName.."...",3)
while kTV3 do
local bp=getBP()
if not bp then task.wait(0.15) if kTV3 then autoSitBlob() end continue end
local GE=RS:WaitForChild("GrabEvents")
local tg2=selKP
if not tg2 or not tg2.Parent then ntf("Kick V3","Target kicked! Time: "..string.format("%.1f",tick()-kickStart).."s",8) break end
local tc=tg2.Character local tr=tc and tc:FindFirstChild("HumanoidRootPart") local th=tc and tc:FindFirstChild("Humanoid")
if not tr or not th or th.Health<=0 then
tr,th=waitTR(tg2,10,function() return kTV3 end)
if not tr then if not(tg2 and tg2.Parent) then ntf("Kick V3","Target kicked! Time: "..string.format("%.1f",tick()-kickStart).."s",8) end R.Heartbeat:Wait() continue end
end
bp=getBP() if not bp then task.wait(0.1) continue end
local br,cg,cd,rd,ld,rw,lw,SP=bp.br,bp.cg,bp.cd,bp.rd,bp.ld,bp.rw,bp.lw,bp.sp
br.CFrame=tr.CFrame
for _=1,8 do
if not kTV3 then break end
pcall(function()
cg:FireServer(rd,tr,rw)
if ld and lw then cg:FireServer(ld,tr,lw) end
GE.SetNetworkOwner:FireServer(tr,br.CFrame)
end)
task.wait(0.008)
end
br.CFrame=SP
while kTV3 do
tg2=selKP
if not tg2 or not tg2.Parent then ntf("Kick V3","Target kicked! Time: "..string.format("%.1f",tick()-kickStart).."s",8) kTV3=false break end
tc=tg2.Character tr=tc and tc:FindFirstChild("HumanoidRootPart") th=tc and tc:FindFirstChild("Humanoid")
if not tr or not th or th.Health<=0 then br.CFrame=SP break end
local lp=SP*CFrame.new(0,28,0)
tr.CFrame=lp tr.Velocity=Vector3.zero tr.RotVelocity=Vector3.zero br.CFrame=SP
pcall(function()
th.PlatformStand=true th.Sit=true
GE.SetNetworkOwner:FireServer(tr,lp)
local wr=rd:FindFirstChild("RightWeld") or rd:FindFirstChildWhichIsA("Weld")
if wr then cd:FireServer(wr) end
cg:FireServer(rd,tr,rw)
if ld and lw then
local wl=ld:FindFirstChild("LeftWeld") or ld:FindFirstChildWhichIsA("Weld")
if wl then cd:FireServer(wl) end
cg:FireServer(ld,tr,lw)
end
GE.DestroyGrabLine:FireServer(tr)
GE.CreateGrabLine:FireServer(tr,Vector3.zero,tr.Position,false)
if wr then cd:FireServer(wr) end
cg:FireServer(rd,tr,rw)
if ld and lw then
local wl2=ld:FindFirstChild("LeftWeld") or ld:FindFirstChildWhichIsA("Weld")
if wl2 then cd:FireServer(wl2) end
cg:FireServer(ld,tr,lw)
end
end)
task.wait(0.008)
end
end
kTV3=false Tog.KickV3Toggle:SetValue(false)
end)
end})

--Dual Hand Loop Kick
local lKDA=false
TGG:AddToggle("DualHandLoopKick",{Text="Loop Kick Dual",Default=false,Callback=function(on)
lKDA=on
if on then
if not selKP then Tog.DualHandLoopKick:SetValue(false) return end
task.spawn(function()
if not autoSitBlob() then lKDA=false Tog.DualHandLoopKick:SetValue(false) return end
monitorSit(function() return lKDA end)
local lt,bpI
while lKDA do
local tg=selKP if not tg or not tg.Parent then task.wait(0.5) continue end
local bp=getBP() if not bp then task.wait(0.3) if lKDA then autoSitBlob() end continue end
local tc=tg.Character local th=tc and tc:FindFirstChild("HumanoidRootPart") local tm=tc and tc:FindFirstChild("Humanoid")
if not th or not tm or tm.Health<=0 then th,tm=waitTR(tg,10,function() return lKDA end) if not th then continue end end
if tc~=lt then lt=tc if bpI then bpI:Destroy() end bpI=Instance.new("BodyPosition") bpI.Position=Vector3.new(0,9e5,0) bpI.MaxForce=Vector3.new(1e8,1e8,1e8) bpI.Parent=th end
bp.cg:FireServer(bp.ld,th,bp.lw) task.wait()
bp.cd:FireServer(bp.lw,th) task.wait()
bp.cg:FireServer(bp.rd,th,bp.rw) task.wait()
bp.cd:FireServer(bp.rw,th) task.wait()
end
if bpI then bpI:Destroy() end
end)
end
end})

--Fling
local pFA=false local fBAV=nil local origPos=nil
TGG:AddToggle("PlayerFlingBtn",{Text="Fling",Default=false,Callback=function(on)
pFA=on
if on then
if not selKP then Tog.PlayerFlingBtn:SetValue(false) return end
local MR=P.Character and P.Character:FindFirstChild("HumanoidRootPart")
if MR then origPos=MR.CFrame end
task.spawn(function()
while pFA do
local tg=selKP local h=P.Character and P.Character:FindFirstChild("HumanoidRootPart")
if not h then task.wait(0.5) continue end
if tg and tg.Parent then
local tr=tg.Character and tg.Character:FindFirstChild("HumanoidRootPart")
if tr then
if not fBAV or fBAV.Parent~=h then if fBAV then fBAV:Destroy() end fBAV=Instance.new("BodyAngularVelocity") fBAV.MaxTorque=Vector3.new(1e8,1e8,1e8) fBAV.AngularVelocity=Vector3.new(0,1e4,0) fBAV.P=1e4 fBAV.Parent=h end
for _,p in pairs(P.Character:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide=false end end
local cn=R.Heartbeat:Connect(function() if h and tr and tr.Parent then h.CFrame=tr.CFrame end end)
task.wait(1.5) cn:Disconnect()
end
else pFA=false Tog.PlayerFlingBtn:SetValue(false) end
task.wait(0.1)
end
if fBAV then fBAV:Destroy() fBAV=nil end
local c=P.Character if c then for _,p in pairs(c:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide=true end end local h=c:FindFirstChild("HumanoidRootPart") if h and origPos then h.CFrame=origPos end end
end)
else if fBAV then fBAV:Destroy() fBAV=nil end end
end})

--Bring
TGG:AddButton({Text="bring",Func=function()
if not selKP then return end
if not autoSitBlob() then return end
local bp=getBP() if not bp then return end
local tr=selKP.Character and selKP.Character:FindFirstChild("HumanoidRootPart")
if not tr then return end
local old=bp.br.CFrame bp.br.CFrame=tr.CFrame task.wait(0.3)
pcall(function() bp.cg:FireServer(bp.rd,tr,bp.rw) end)
task.wait(0.5) bp.br.CFrame=old
for i=1,12 do tr.CFrame=old*CFrame.new(0,3,0) task.wait(0.03) end
end})

--Teleport [SCT1]
TGG:AddButton({Text="Teleport to Player [SCT1]",Func=function()
if not selKP then ntf("Error","Select player",3) return end
local tr=selKP.Character and selKP.Character:FindFirstChild("HumanoidRootPart")
local h=P.Character and P.Character:FindFirstChild("HumanoidRootPart")
if tr and h then h.CFrame=CFrame.new(tr.Position) end
end})

TGG:AddToggle("LoopTPSCT1",{Text="Loop Teleport [SCT1]",Default=false,Callback=function(on)
_G.sctLoopTP=on
if on then task.spawn(function() while _G.sctLoopTP do if selKP and selKP.Character and selKP.Character:FindFirstChild("HumanoidRootPart") then local h=P.Character and P.Character:FindFirstChild("HumanoidRootPart") if h then h.CFrame=CFrame.new(selKP.Character.HumanoidRootPart.Position) end end task.wait(0.02) end end) end
end})

--Remove Anti
local AI={FoodHamburger=true,FoodCoconut=true,FoodPizzaCheese=true,FoodPizzaPepperoni=true,FoodHotdog=true,FoodMushroomPoison=true,FoodBread=true,FoodDippyEgg=true,FoodMayonnaise=true,FoodFrenchFries=true,FoodMeatStick=true,FoodDonut=true,FoodCakePink=true,InstrumentGuitarBanjo=true,InstrumentGuitarViolin=true,InstrumentGuitarUkulele=true,InstrumentWoodwindSaxophone=true,InstrumentWoodwindOcarina=true,InstrumentBrassTrumpet=true,InstrumentDrumBongos=true,InstrumentDrumSnare=true,InstrumentPianoMelodica=true,InstrumentVoiceMicrophone=true,CupMugWhite=true,CupMugBrown=true,PoopPile=true,PoopPileSparkle=true}
local aAIE=false
TGG:AddToggle("RemoveAntiInputLag",{Text="Remove Anti Input Lag",Default=false,Callback=function(on)
aAIE=on if not on then return end
task.spawn(function()
local c=P.Character local h=c:FindFirstChild("HumanoidRootPart") if not h then return end
local bg={} for _,v in ipairs(WS:GetDescendants()) do if AI[v.Name] and v:IsA("Model") and v:FindFirstChild("HoldPart") then bg[#bg+1]=v end end
WS.DescendantAdded:Connect(function(o) if AI[o.Name] and o:IsA("Model") then task.spawn(function() if o:WaitForChild("HoldPart",3) then bg[#bg+1]=o end end) end end)
while aAIE do for i=#bg,1,-1 do local b=bg[i] if not b or not b.Parent or not b:FindFirstChild("HoldPart") then table.remove(bg,i) else pcall(function() b.HoldPart.HoldItemRemoteFunction:InvokeServer(b,c) end) task.wait() pcall(function() b.HoldPart.DropItemRemoteFunction:InvokeServer(b,CFrame.new(h.Position+Vector3.new(0,-2e3,0)),Vector3.zero) end) end end task.wait() end
end)
end})

TGG:AddToggle("DestroyAntiKickToggle",{Text="Remove Anti Kick",Default=false,Callback=function(V)
if V then task.spawn(function() local SN2=RS.GrabEvents.SetNetworkOwner while V do local tg=selKP if tg then local sp=WS:FindFirstChild(tg.Name.."SpawnedInToys") if sp then for _,tn in ipairs({"NinjaKunai","NinjaShuriken","AntiKick"}) do local ty=sp:FindFirstChild(tn) if ty and ty:FindFirstChild("SoundPart") then pcall(function() SN2:FireServer(ty.SoundPart,ty.SoundPart.CFrame) end) end end end end task.wait(0.1) end end) end
end})

--Destroy Gucci
TGG:AddToggle("DestroyTargetGucci",{Text="Destroy Gucci",Default=false,Callback=function(V)
if V and not selKP then Tog.DestroyTargetGucci:SetValue(false) return end
if V then
local SS=(P.Character and P.Character:FindFirstChild("HumanoidRootPart") or {CFrame=CFrame.new()}).CFrame
local fn=selKP.Name.."SpawnedInToys"
task.spawn(function() while V do if not selKP or not selKP.Parent then Tog.DestroyTargetGucci:SetValue(false) break end local tf=WS:FindFirstChild(fn) if tf then for _,o in ipairs(tf:GetChildren()) do if o.Name=="CreatureBlobman" then local se2=o:FindFirstChildWhichIsA("VehicleSeat",true) if se2 then local mr=P.Character:FindFirstChild("HumanoidRootPart") local mh=P.Character:FindFirstChild("Humanoid") if mr and mh and mh.SeatPart~=se2 then local mg=R.Stepped:Connect(function() if mr and se2 then mr.CFrame=se2.CFrame end end) local st=tick() while tick()-st<1 do se2:Sit(mh) task.wait() end mg:Disconnect() if mh.SeatPart==se2 then task.wait(0.3) mh.Jump=true task.wait(0.05) mr.CFrame=SS end end end end end end task.wait(1) end end)
end
end})

--==SCT1 ATTACK==--
local sctKickCfg={E=false,S="S",D=2,Off=Vector3.new(5,-18.5,0),H=10000,Del=0.5}
local sctKillCfg={E=false,S=0.5,D=2,Off=Vector3.new(5,-18.5,0),H=10000,Del=0.5}
local function sctSavePos(cfg) local c=P.Character if c and c:FindFirstChild("HumanoidRootPart") then cfg.S=c:GetPivot() end end
local function sctRestorePos(cfg) local c=P.Character local h=c and c:FindFirstChild("HumanoidRootPart") if h and cfg.S and(h.Position-cfg.S.Position).Magnitude>cfg.D then c:PivotTo(cfg.S) end end
local function sctProcessTarget(tgt,cfg,doKill)
if not cfg.E then return end
local pip=WS:FindFirstChild("PlotItems") and WS.PlotItems.PlayersInPlots:FindFirstChild(tgt.Name)
if pip then return end
local tc=tgt.Character local tr=tc and tc:FindFirstChild("HumanoidRootPart") local th=tc and tc:FindFirstChildOfClass("Humanoid") local hd=tc and tc:FindFirstChild("Head")
if not tr or not th or not hd or th.Health<=0 then return end
local mc=P.Character if not mc or not mc:FindFirstChild("HumanoidRootPart") then return end
pcall(function() sctSavePos(cfg) mc:PivotTo(CFrame.new(tr.Position+cfg.Off)) sctDisableCollision(tc) RS.GrabEvents.SetNetworkOwner:FireServer(tr,tr.CFrame) task.wait() sctRestorePos(cfg) task.wait(0.1) RS.GrabEvents.DestroyGrabLine:FireServer(tr) task.wait(0.1) if hd:FindFirstChild("PartOwner") and hd.PartOwner.Value==P.Name then local bv=Instance.new("BodyVelocity",tr) bv.MaxForce=Vector3.new(1e8,1e8,1e8) bv.Velocity=Vector3.new(0,1e9,0) th.Jump=true th.Sit=false task.delay(3,function() if bv.Parent then bv:Destroy() end end) if doKill then task.wait(0.1) th.Health=0 end end end) task.wait(cfg.Del)
end

local sctKickConn,sctKillConn
TGG3:AddToggle("SCT1LoopKick",{Text="Loop Kick [SCT1]",Default=false,Callback=function(on) sctKickCfg.E=on if sctKickConn then sctKickConn:Disconnect() sctKickConn=nil end if on then sctSavePos(sctKickCfg) sctKickConn=R.Heartbeat:Connect(function() if not sctKickCfg.E then return end sctSavePos(sctKickCfg) if selKP and selKP.Parent then sctProcessTarget(selKP,sctKickCfg,false) end end) else sctKickCfg.S="S" end end})
TGG3:AddToggle("SCT1LoopKill",{Text="Loop Kill [SCT1]",Default=false,Callback=function(on) sctKillCfg.E=on if sctKillConn then sctKillConn:Disconnect() sctKillConn=nil end if on then sctSavePos(sctKillCfg) sctKillConn=R.Heartbeat:Connect(function() if not sctKillCfg.E then return end sctSavePos(sctKillCfg) if selKP and selKP.Parent then sctProcessTarget(selKP,sctKillCfg,true) end end) else sctKillCfg.S="S" end end})
TGG3:AddToggle("SCT1KickAll",{Text="Kick All [SCT1]",Default=false,Callback=function(on) _G.sctKickAll=on if on then _G.sctKickAllConn=R.Heartbeat:Connect(function() if not _G.sctKickAll then return end sctSavePos(sctKickCfg) for _,pl in ipairs(PS:GetPlayers()) do if pl~=P then sctProcessTarget(pl,sctKickCfg,false) end end end) else if _G.sctKickAllConn then _G.sctKickAllConn:Disconnect() end end end})
TGG3:AddToggle("SCT1KillAll",{Text="Kill All [SCT1]",Default=false,Callback=function(on) _G.sctKillAll=on if on then _G.sctKillAllConn=R.Heartbeat:Connect(function() if not _G.sctKillAll then return end sctSavePos(sctKillCfg) for _,pl in ipairs(PS:GetPlayers()) do if pl~=P then sctProcessTarget(pl,sctKillCfg,true) end end end) else if _G.sctKillAllConn then _G.sctKillAllConn:Disconnect() end end end})
TGG3:AddToggle("SCT1SnowballRagdoll",{Text="Snowball Ragdoll [SCT1]",Default=false,Callback=function(on) _G.sctSnowRag=on if on then task.spawn(function() while _G.sctSnowRag do if selKP and selKP.Character then local ts=selKP.Character:FindFirstChild("HumanoidRootPart") if ts then pcall(function() RS.MenuToys.SpawnToyRemoteFunction:InvokeServer("BallSnowball",CFrame.new(ts.Position),Vector3.zero) end) end end task.wait(0.1) end end) end end})
TGG3:AddToggle("SCT1AutoSpawnSnow",{Text="Auto Spawn Snow [SCT1]",Default=false,Callback=function(on) _G.sctAutoSnow=on if on then task.spawn(function() while _G.sctAutoSnow do local h=P.Character and P.Character:FindFirstChild("HumanoidRootPart") if h then pcall(function() RS.MenuToys.SpawnToyRemoteFunction:InvokeServer("BallSnowball",CFrame.new(h.Position+Vector3.new(0,2,0)),Vector3.zero) end) end task.wait(1) end end) end end})
TGG3:AddToggle("SCT1GodLoopTarget",{Text="God Loop Target [SCT1]",Default=false,Callback=function(on) _G.sctGodLoop=on if on then task.spawn(function() local blob=sctGetBlobman() if not blob then ntf("Error","Sit on Blobman!",5) _G.sctGodLoop=false return end while _G.sctGodLoop do for uid,_ in pairs(sctTL) do local pl=PS:GetPlayerByUserId(uid) if pl and pl.Character and pl.Character:FindFirstChild("HumanoidRootPart") then local ld2=blob:FindFirstChild("LeftDetector") local rd2=blob:FindFirstChild("RightDetector") local so=blob:FindFirstChild("BlobmanSeatAndOwnerScript") if so then local cg2=so:FindFirstChild("CreatureGrab") local cd2=so:FindFirstChild("CreatureDrop") if cg2 and cd2 then local lw2=ld2 and(ld2:FindFirstChild("RigidConstraint") or ld2:FindFirstChild("LeftWeld")) local rw2=rd2 and(rd2:FindFirstChild("RightWeld") or rd2:FindFirstChild("RigidConstraint")) if lw2 then pcall(function() cg2:FireServer(ld2,pl.Character.HumanoidRootPart,lw2) cd2:FireServer(lw2,pl.Character.HumanoidRootPart) end) end if rw2 then pcall(function() cg2:FireServer(rd2,pl.Character.HumanoidRootPart,rw2) cd2:FireServer(rw2,pl.Character.HumanoidRootPart) end) end end end end end task.wait(0.01) end end) end end})
TGG3:AddButton({Text="Add Target [SCT1]",Func=function() if selKP then sctTL[selKP.UserId]=selKP.Name ntf("SCT1",selKP.Name.." added",2) end end})
TGG3:AddButton({Text="Remove Target [SCT1]",Func=function() if selKP then sctTL[selKP.UserId]=nil ntf("SCT1",selKP.Name.." removed",2) end end})
TGG3:AddToggle("SCT1HoverAbove",{Text="Hover Above Target [SCT1]",Default=false,Callback=function(on) _G.sctHover=on if on then task.spawn(function() while _G.sctHover do local blob=sctGetBlobman() if blob and selKP and selKP.Character and selKP.Character:FindFirstChild("HumanoidRootPart") then local tr2=selKP.Character.HumanoidRootPart local h=P.Character and P.Character:FindFirstChild("HumanoidRootPart") if h and blob.PrimaryPart then local pos=tr2.Position+Vector3.new(0,25,0) local bp2=Instance.new("BodyPosition") bp2.MaxForce=Vector3.new(1e8,1e8,1e8) bp2.P=1e5 bp2.Position=pos bp2.Parent=blob.PrimaryPart h.CFrame=CFrame.new(pos) blob:SetPrimaryPartCFrame(CFrame.new(pos)) task.wait(0.1) bp2:Destroy() end end task.wait(0.06) end end) end end})

--==EGGHUB SNIPE LOOPS==--
TGG2:AddToggle("EggLoopKill",{Text="Loop Kill [EGG]",Default=false,Callback=function(v) _G.ELK=v end})
TGG2:AddToggle("EggLoopVoid",{Text="Loop Void [EGG]",Default=false,Callback=function(v) _G.ELV=v end})
TGG2:AddToggle("EggLoopPoison",{Text="Loop Poison [EGG]",Default=false,Callback=function(v) _G.ELP=v end})
TGG2:AddToggle("EggLoopRagdoll",{Text="Loop Ragdoll [EGG]",Default=false,Callback=function(v) _G.ELR=v end})
TGG2:AddToggle("EggLoopDeath",{Text="Loop Death [EGG]",Default=false,Callback=function(v) _G.ELD=v end})
TGG2:AddToggle("EggLoopBring",{Text="Loop Bring [EGG]",Default=false,Callback=function(v) _G.ELB=v end})
TGG2:AddToggle("EggLoopPull",{Text="Loop Pull [EGG]",Default=false,Callback=function(v) _G.ELPL=v end})

--Whitelist
WGG:AddDropdown("MultiWhitelist",{Values=gPL(),Default={},Multi=true,Text="whitelist"})
WGG:AddButton({Text="refresh",Func=function() Opt.MultiWhitelist:SetValues(gPL()) end})
local nA=false local nC=nil
WGG:AddToggle("JoinedNotifyBtn",{Text="Target Joined Notify",Default=false,Callback=function(on) nA=on if on then if nC then nC:Disconnect() end nC=PS.PlayerAdded:Connect(function(np) if not nA then return end local dt=false local rs="" local wt=Opt.MultiWhitelist.Value for ns,is in pairs(wt) do if is then local an=ns:match("%((.-)%)") if an==np.Name then dt=true rs="[WL]" break end end end if not dt and Opt.KickPlayerDropdown and Opt.KickPlayerDropdown.Value then local sn=Opt.KickPlayerDropdown.Value:match("%((.-)%)") if sn==np.Name then dt=true rs="[Target]" end end if dt then ntf("Detected",rs.." "..np.Name,8) end end) elseif nC then nC:Disconnect() nC=nil end end})
--==PLAYER TAB==--
local PV=Tb.Player:AddLeftGroupbox("View") local PE=Tb.Player:AddRightGroupbox("ESP") local PP=Tb.Player:AddRightGroupbox("Performance")
PV:AddToggle("ThirdPersonToggle",{Text="3rd Person",Default=false,Callback=function(V) if V then P.CameraMode=Enum.CameraMode.Classic P.CameraMaxZoomDistance=1e9 P.CameraMinZoomDistance=0.5 else P.CameraMode=Enum.CameraMode.LockFirstPerson P.CameraMaxZoomDistance=0 P.CameraMinZoomDistance=0 end end})
PV:AddToggle("MaxZoomToggle",{Text="50000 Zoom [EGG]",Default=false,Callback=function(v) P.CameraMaxZoomDistance=v and 50000 or 128 end})

local spC local spSp=5 PV:AddToggle("SpinToggle",{Text="Spin",Default=false,Callback=function(V) if V then spC=R.Heartbeat:Connect(function() local rt=P.Character and P.Character:FindFirstChild("HumanoidRootPart") if rt then rt.CFrame=rt.CFrame*CFrame.Angles(0,math.rad(spSp),0) end end) elseif spC then spC:Disconnect() spC=nil end end}) PV:AddSlider("SpinSpeed",{Text="Spin Speed",Default=5,Min=1,Max=50,Rounding=0,Callback=function(V) spSp=V end})

local infJ=false PV:AddToggle("infJumpToggle",{Text="Infinite Jump",Default=false,Callback=function(V) infJ=V end}) UIS.JumpRequest:Connect(function() if infJ then local c=P.Character if c and c:FindFirstChildOfClass("Humanoid") then c:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping) end end end)

PV:AddToggle("WalkspeedSCT1",{Text="Walkspeed [SCT1]",Default=false,Callback=function(V) _G.sctWS=V if V then _G.sctWSConn=R.Stepped:Connect(function() if not _G.sctWS then return end local c=P.Character if c and c:FindFirstChild("HumanoidRootPart") and c:FindFirstChildOfClass("Humanoid") then local h=c.HumanoidRootPart local u=c:FindFirstChildOfClass("Humanoid") h.CFrame=h.CFrame+u.MoveDirection*(16*(_G.sctWSVal or 5)/10) end end) else if _G.sctWSConn then _G.sctWSConn:Disconnect() end end end})
PV:AddSlider("SCT1WSVal",{Text="Speed Multi [SCT1]",Default=5,Min=1,Max=50,Rounding=1,Callback=function(v) _G.sctWSVal=v end}) _G.sctWSVal=5

PV:AddToggle("InfJumpSCT1",{Text="Infinite Jump [SCT1]",Default=false,Callback=function(V) _G.sctIJ=V if V then _G.sctIJConn=UIS.JumpRequest:Connect(function() if not _G.sctIJ then return end local hm=P.Character and P.Character:FindFirstChildOfClass("Humanoid") if hm then hm:ChangeState(Enum.HumanoidStateType.Freefall) task.wait() hm:ChangeState(Enum.HumanoidStateType.Jumping) if hm.UseJumpPower==false then hm.JumpHeight=math.clamp((_G.sctJPVal or 100)/10,7.2,50) else hm.JumpPower=_G.sctJPVal or 100 end end end) else if _G.sctIJConn then _G.sctIJConn:Disconnect() end end end})
PV:AddSlider("SCT1JPVal",{Text="Jump Power [SCT1]",Default=100,Min=16,Max=500,Rounding=0,Callback=function(v) _G.sctJPVal=v end}) _G.sctJPVal=100

PV:AddToggle("NoclipSCT1",{Text="Noclip [SCT1]",Default=false,Callback=function(V) _G.sctNC=V if V then _G.sctNCConn=R.Stepped:Connect(function() if not _G.sctNC then return end local c=P.Character if c then for _,v in ipairs(c:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide=false end end end end) else if _G.sctNCConn then _G.sctNCConn:Disconnect() end end end})

PV:AddSlider("EggSpeed",{Text="Speed [EGG]",Default=16,Min=16,Max=1000,Rounding=0,Callback=function(v) _G.ESV=v end}) _G.ESV=16
PV:AddToggle("EggSpeedToggle",{Text="Speed Boost [EGG]",Default=false,Callback=function(v) _G.ESE=v end})
PV:AddSlider("EggJump",{Text="Jump [EGG]",Default=50,Min=50,Max=500,Rounding=0,Callback=function(v) _G.EJV=v end}) _G.EJV=50
PV:AddToggle("EggJumpToggle",{Text="Jump Boost [EGG]",Default=false,Callback=function(v) _G.EJE=v end})
PV:AddToggle("EggNoclip",{Text="Noclip [EGG]",Default=false,Callback=function(v) _G.ENC=v end})

--ESP
local espE=false local espB={} PE:AddToggle("BoxESPWhite",{Text="PCLD View",Default=false,Callback=function(V) espE=V if V then for _,o in ipairs(WS:GetDescendants()) do if o:IsA("BasePart") and(o.Name:lower()=="partesp" or o.Name:lower()=="playercharacterlocationdetector") and not espB[o] then local b=Instance.new("BoxHandleAdornment") b.Adornee=o b.AlwaysOnTop=true b.ZIndex=5 b.Color3=Color3.new(1,1,1) b.Transparency=0.5 b.Size=o.Size b.Parent=CG espB[o]=b end end else for _,b in pairs(espB) do b:Destroy() end espB={} end end}) WS.DescendantAdded:Connect(function(o) if espE and o:IsA("BasePart") and(o.Name:lower()=="partesp" or o.Name:lower()=="playercharacterlocationdetector") and not espB[o] then local b=Instance.new("BoxHandleAdornment") b.Adornee=o b.AlwaysOnTop=true b.ZIndex=5 b.Color3=Color3.new(1,1,1) b.Transparency=0.5 b.Size=o.Size b.Parent=CG espB[o]=b end end)
PE:AddToggle("NicknameESP",{Text="Nickname ESP",Default=false,Callback=function(V) if V then for _,pl in pairs(PS:GetPlayers()) do if pl~=P and pl.Character and pl.Character:FindFirstChild("HumanoidRootPart") and not pl.Character.HumanoidRootPart:FindFirstChild("NameESP") then local bb=Instance.new("BillboardGui") bb.Name="NameESP" bb.Adornee=pl.Character.HumanoidRootPart bb.Size=UDim2.new(0,100,0,30) bb.StudsOffset=Vector3.new(0,3,0) bb.AlwaysOnTop=true bb.Parent=pl.Character.HumanoidRootPart local tl=Instance.new("TextLabel") tl.Size=UDim2.new(1,0,1,0) tl.BackgroundTransparency=1 tl.Text=pl.Name tl.TextColor3=Color3.new(1,1,1) tl.TextStrokeTransparency=0 tl.TextScaled=true tl.Parent=bb end end else for _,pl in pairs(PS:GetPlayers()) do if pl.Character and pl.Character:FindFirstChild("HumanoidRootPart") then local e=pl.Character.HumanoidRootPart:FindFirstChild("NameESP") if e then e:Destroy() end end end end end})
local oldP={} PP:AddButton({Text="boost fps",Func=function() local L=game:GetService("Lighting") for _,v in pairs(WS:GetDescendants()) do if v:IsA("BasePart") then if not oldP[v] then oldP[v]={Material=v.Material,Reflectance=v.Reflectance,CastShadow=v.CastShadow} end v.Material=Enum.Material.Plastic v.Reflectance=0 v.CastShadow=false elseif v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Fire") then if not oldP[v] then oldP[v]={Enabled=v.Enabled} end v.Enabled=false end end L.GlobalShadows=false L.FogEnd=1e5 L.Brightness=2 end}) PP:AddButton({Text="undo fps",Func=function() for o,p in pairs(oldP) do if typeof(o)=="Instance" and o.Parent then for k,v in pairs(p) do o[k]=v end end end oldP={} end})
-- END PART 3/5 | Пиши "продолжай" для части 4
-- GGOG Script v1.0 | PART 4/5
--==MISC TAB==--
local MG=Tb.Misc:AddLeftGroupbox("Misc") local MG2=Tb.Misc:AddRightGroupbox("Shaders")

local dreamFX,dreamOrig=nil,nil MG2:AddToggle("DreamyNightShaderToggle",{Text="Dreamy Night Shader",Default=false,Callback=function(on) local L=game:GetService("Lighting") if on then dreamOrig={ClockTime=L.ClockTime,GlobalShadows=L.GlobalShadows,Brightness=L.Brightness,EnvironmentDiffuseScale=L.EnvironmentDiffuseScale,EnvironmentSpecularScale=L.EnvironmentSpecularScale,FogEnd=L.FogEnd} if dreamFX then for _,e in ipairs(dreamFX) do pcall(function() e:Destroy() end) end end dreamFX={} local function ae(c,n,p) c.Name=n for k,v in pairs(p) do c[k]=v end c.Parent=L dreamFX[#dreamFX+1]=c end ae(Instance.new("BlurEffect"),"DreamyBlur",{Size=6}) ae(Instance.new("BloomEffect"),"DreamyBloom",{Intensity=1.6,Size=90,Threshold=1.4}) ae(Instance.new("ColorCorrectionEffect"),"DreamyCC",{Brightness=0.15,Contrast=-0.1,Saturation=0.25,TintColor=Color3.fromRGB(210,220,255)}) ae(Instance.new("SunRaysEffect"),"DreamySR",{Intensity=0.05,Spread=0.6}) ae(Instance.new("Atmosphere"),"DreamyAtmo",{Density=0.45,Offset=0.1,Color=Color3.fromRGB(180,190,255),Decay=Color3.fromRGB(120,130,180),Glare=0.15,Haze=3}) L.ClockTime=0.5 L.GlobalShadows=false L.Brightness=2 L.EnvironmentDiffuseScale=0.2 L.EnvironmentSpecularScale=0.1 L.FogEnd=2e5 else if dreamFX then for _,e in ipairs(dreamFX) do pcall(function() e:Destroy() end) end dreamFX=nil end for _,v in pairs(L:GetChildren()) do if v.Name:find("Dreamy") then v:Destroy() end end if dreamOrig then for k,v in pairs(dreamOrig) do L[k]=v end dreamOrig=nil end end end})

local dayFX,dayOrig=nil,nil MG2:AddToggle("GoldenDayShader",{Text="Golden Day Shader",Default=false,Callback=function(on) local L=game:GetService("Lighting") if on then dayOrig={ClockTime=L.ClockTime,GlobalShadows=L.GlobalShadows,Brightness=L.Brightness,EnvironmentDiffuseScale=L.EnvironmentDiffuseScale,EnvironmentSpecularScale=L.EnvironmentSpecularScale,FogEnd=L.FogEnd} if dayFX then for _,e in ipairs(dayFX) do pcall(function() e:Destroy() end) end end dayFX={} local function ae(c,n,p) c.Name=n for k,v in pairs(p) do c[k]=v end c.Parent=L dayFX[#dayFX+1]=c end ae(Instance.new("BloomEffect"),"DayBloom",{Intensity=0.8,Size=56,Threshold=1.1}) ae(Instance.new("ColorCorrectionEffect"),"DayCC",{Brightness=0.08,Contrast=0.15,Saturation=0.35,TintColor=Color3.fromRGB(255,245,220)}) ae(Instance.new("SunRaysEffect"),"DaySR",{Intensity=0.25,Spread=0.8}) ae(Instance.new("BlurEffect"),"DayBlur",{Size=2}) ae(Instance.new("Atmosphere"),"DayAtmo",{Density=0.3,Offset=0,Color=Color3.fromRGB(255,235,180),Decay=Color3.fromRGB(255,200,120),Glare=0.4,Haze=1.5}) L.ClockTime=14 L.GlobalShadows=true L.Brightness=3 L.EnvironmentDiffuseScale=1 L.EnvironmentSpecularScale=0.8 L.FogEnd=1e5 else if dayFX then for _,e in ipairs(dayFX) do pcall(function() e:Destroy() end) end dayFX=nil end for _,v in pairs(L:GetChildren()) do if v.Name:find("Day") then v:Destroy() end end if dayOrig then for k,v in pairs(dayOrig) do L[k]=v end dayOrig=nil end end end})

local pinkFX,pinkOrig=nil,nil MG2:AddToggle("PinkSunsetShader",{Text="Pink Sunset Shader",Default=false,Callback=function(on) local L=game:GetService("Lighting") if on then pinkOrig={ClockTime=L.ClockTime,GlobalShadows=L.GlobalShadows,Brightness=L.Brightness,EnvironmentDiffuseScale=L.EnvironmentDiffuseScale,EnvironmentSpecularScale=L.EnvironmentSpecularScale,FogEnd=L.FogEnd} if pinkFX then for _,e in ipairs(pinkFX) do pcall(function() e:Destroy() end) end end pinkFX={} local function ae(c,n,p) c.Name=n for k,v in pairs(p) do c[k]=v end c.Parent=L pinkFX[#pinkFX+1]=c end ae(Instance.new("BloomEffect"),"PinkBloom",{Intensity=1.2,Size=70,Threshold=1.0}) ae(Instance.new("ColorCorrectionEffect"),"PinkCC",{Brightness=0.1,Contrast=0.1,Saturation=0.5,TintColor=Color3.fromRGB(255,180,200)}) ae(Instance.new("SunRaysEffect"),"PinkSR",{Intensity=0.35,Spread=1}) ae(Instance.new("BlurEffect"),"PinkBlur",{Size=3}) ae(Instance.new("Atmosphere"),"PinkAtmo",{Density=0.35,Offset=0.05,Color=Color3.fromRGB(255,170,190),Decay=Color3.fromRGB(255,100,130),Glare=0.3,Haze=2}) L.ClockTime=18.5 L.GlobalShadows=true L.Brightness=2.5 L.EnvironmentDiffuseScale=0.8 L.EnvironmentSpecularScale=0.6 L.FogEnd=8e4 else if pinkFX then for _,e in ipairs(pinkFX) do pcall(function() e:Destroy() end) end pinkFX=nil end for _,v in pairs(L:GetChildren()) do if v.Name:find("Pink") then v:Destroy() end end if pinkOrig then for k,v in pairs(pinkOrig) do L[k]=v end pinkOrig=nil end end end})

local crystFX,crystOrig=nil,nil MG2:AddToggle("CrystalDayShader",{Text="Crystal Day Shader",Default=false,Callback=function(on) local L=game:GetService("Lighting") if on then crystOrig={ClockTime=L.ClockTime,GlobalShadows=L.GlobalShadows,Brightness=L.Brightness,EnvironmentDiffuseScale=L.EnvironmentDiffuseScale,EnvironmentSpecularScale=L.EnvironmentSpecularScale,FogEnd=L.FogEnd} if crystFX then for _,e in ipairs(crystFX) do pcall(function() e:Destroy() end) end end crystFX={} local function ae(c,n,p) c.Name=n for k,v in pairs(p) do c[k]=v end c.Parent=L crystFX[#crystFX+1]=c end ae(Instance.new("BloomEffect"),"CrystBloom",{Intensity=0.6,Size=40,Threshold=1.3}) ae(Instance.new("ColorCorrectionEffect"),"CrystCC",{Brightness=0.05,Contrast=0.2,Saturation=0.6,TintColor=Color3.fromRGB(200,240,255)}) ae(Instance.new("SunRaysEffect"),"CrystSR",{Intensity=0.2,Spread=0.5}) ae(Instance.new("Atmosphere"),"CrystAtmo",{Density=0.2,Offset=0,Color=Color3.fromRGB(200,230,255),Decay=Color3.fromRGB(150,200,255),Glare=0.5,Haze=1}) L.ClockTime=12 L.GlobalShadows=true L.Brightness=3.5 L.EnvironmentDiffuseScale=1.2 L.EnvironmentSpecularScale=1 L.FogEnd=2e5 else if crystFX then for _,e in ipairs(crystFX) do pcall(function() e:Destroy() end) end crystFX=nil end for _,v in pairs(L:GetChildren()) do if v.Name:find("Cryst") then v:Destroy() end end if crystOrig then for k,v in pairs(crystOrig) do L[k]=v end crystOrig=nil end end end})

--Misc toggles
local TB2={Enabled=false,Connection=nil,canGrab=true,maxDist=20,preD=1e-5,postD=0.05,lastT=nil,lastH=0,tMD=0.1,cT=0.008,lastC=0} local rP=RaycastParams.new() rP.FilterType=Enum.RaycastFilterType.Exclude task.spawn(function() pcall(function() if RS.GamepassEvents.CheckForGamepass:InvokeServer(20837132) then TB2.maxDist=29.3 end end) end)
function TB2:GetTarget() local c=P.Character if not c or not c:FindFirstChild("HumanoidRootPart") or WS:FindFirstChild("GrabParts") then return end rP.FilterDescendantsInstances={c,WS.Terrain} local r=WS:Raycast(Cam.CFrame.Position,Cam.CFrame.LookVector*1e3,rP) if not r then return end local m=r.Instance:FindFirstAncestorOfClass("Model") if not m or not m:FindFirstChildOfClass("Humanoid") or m==c then return end local hm=m:FindFirstChildOfClass("Humanoid") if hm.Health<=0 then return end local rt=m:FindFirstChild("HumanoidRootPart") if rt and(c.HumanoidRootPart.Position-rt.Position).Magnitude<=self.maxDist then return m end end
function TB2:OnHB() if not self.Enabled or not self.canGrab or UIS:GetFocusedTextBox() or tick()-self.lastC<self.cT then return end self.lastC=tick() local t=self:GetTarget() if t then self.lastT=t self.lastH=tick() elseif self.lastT and tick()-self.lastH>self.tMD then self.lastT=nil end if not self.lastT then return end local c=P.Character local rt=self.lastT:FindFirstChild("HumanoidRootPart") if not c or not c:FindFirstChild("HumanoidRootPart") or not rt or(c.HumanoidRootPart.Position-rt.Position).Magnitude>self.maxDist then self.lastT=nil return end self.canGrab=false task.spawn(function() task.wait(self.preD) pcall(mouse1press) local t0=tick() repeat task.wait(0.02) until not WS:FindFirstChild("GrabParts") or tick()-t0>1.6 task.wait(self.postD) self.canGrab=true self.lastT=nil end) end

local PSA=100 MG:AddSlider("PacketAmountSlider",{Text="Packet Lag",Default=100,Min=10,Max=5000,Rounding=0,Callback=function(V) PSA=V end})
MG:AddToggle("NoBarrierCollision",{Text="Ignore Barriers",Default=false,Callback=function(V) local pl=WS:FindFirstChild("Plots") if pl then for _,p in ipairs(pl:GetChildren()) do local b=p:FindFirstChild("Barrier") if b then for _,o in ipairs(b:GetDescendants()) do if o:IsA("BasePart") then o.CanCollide=not V end end end end end end})
MG:AddToggle("PacketLagToggle",{Text="Packet Lag",Default=false,Callback=function(V) _G.PLA=V if V then task.spawn(function() local GE=RS.GrabEvents.ExtendGrabLine while _G.PLA do pcall(function() GE:FireServer(string.rep("x",PSA)) end) task.wait() end end) end end})
MG:AddToggle("AutoResetToggle",{Text="Auto Reset",Default=false,Callback=function(on) aRst=on if on then task.spawn(function() while aRst do local hm=P.Character and P.Character:FindFirstChild("Humanoid") if hm and hm.Health>0 then hm.Health=0 end task.wait(0.5) end end) end end})
MG:AddToggle("TriggerbotToggle",{Text="Trigger Bot",Default=false,Callback=function(v) TB2.Enabled=v if v and not TB2.Connection then TB2.Connection=R.Heartbeat:Connect(function() TB2:OnHB() end) elseif not v and TB2.Connection then TB2.Connection:Disconnect() TB2.Connection=nil end end})
MG:AddSlider("FOVSlider",{Text="FOV",Default=90,Min=1,Max=120,Rounding=0,Suffix="deg",Callback=function(v) Cam.FieldOfView=v end})

--Fly Function
local flyActive=false local flySpeed=50 local flyBV=nil local flyConn=nil
MG:AddSlider("FlySpeed",{Text="Fly Speed",Default=50,Min=10,Max=200,Rounding=0,Callback=function(v) flySpeed=v end})
MG:AddToggle("ClassicFlyToggle",{Text="Classic Fly",Default=false,Callback=function(on) flyActive=on if flyConn then flyConn:Disconnect() flyConn=nil end if on then task.spawn(function() local c=P.Character if not c then return end local h=c:FindFirstChild("HumanoidRootPart") if not h then return end if flyBV then flyBV:Destroy() end flyBV=Instance.new("BodyVelocity") flyBV.Velocity=Vector3.new(0,0,0) flyBV.MaxForce=Vector3.new(math.huge,math.huge,math.huge) flyBV.Parent=h local hm=c:FindFirstChildOfClass("Humanoid") if hm then hm.PlatformStand=true end flyConn=R.Heartbeat:Connect(function() if not flyActive or not h or not h.Parent then if flyBV then pcall(function() flyBV:Destroy() end) flyBV=nil end if hm then hm.PlatformStand=false end if flyConn then flyConn:Disconnect() end return end local moveDir=Vector3.zero if UIS:IsKeyDown(Enum.KeyCode.W) then moveDir=moveDir+Cam.CFrame.LookVector end if UIS:IsKeyDown(Enum.KeyCode.S) then moveDir=moveDir-Cam.CFrame.LookVector end if UIS:IsKeyDown(Enum.KeyCode.A) then moveDir=moveDir-Cam.CFrame.RightVector end if UIS:IsKeyDown(Enum.KeyCode.D) then moveDir=moveDir+Cam.CFrame.RightVector end if UIS:IsKeyDown(Enum.KeyCode.Space) then moveDir=moveDir+Vector3.new(0,1,0) end if UIS:IsKeyDown(Enum.KeyCode.LeftControl) then moveDir=moveDir-Vector3.new(0,1,0) end if moveDir.Magnitude>0 then moveDir=moveDir.Unit end flyBV.Velocity=moveDir*flySpeed h.CFrame=h.CFrame+moveDir*flySpeed*(1/60) end) end) else if flyBV then pcall(function() flyBV:Destroy() end) flyBV=nil end local c=P.Character if c then local hm=c:FindFirstChildOfClass("Humanoid") if hm then hm.PlatformStand=false end end end end})

MG:AddToggle("LagSCT1",{Text="Lag [SCT1]",Default=false,Callback=function(on) _G.sctLag=on _G.sctLagInt=_G.sctLagInt or 5 if on then task.spawn(function() while _G.sctLag do for _=1,_G.sctLagInt do for _,pl in ipairs(PS:GetPlayers()) do if pl.Character and pl.Character:FindFirstChild("Torso") then RS.GrabEvents.CreateGrabLine:FireServer(pl.Character.Torso,pl.Character.Torso.CFrame) end end end task.wait(1) end end) end end})
MG:AddSlider("SCT1LagInt",{Text="Lag Intensity [SCT1]",Default=5,Min=1,Max=1000,Rounding=0,Callback=function(v) _G.sctLagInt=v end})

MG:AddToggle("BringAllSCT1",{Text="Bring All [SCT1]",Default=false,Callback=function(on) _G.sctBringAll=on if on then task.spawn(function() local h=P.Character and P.Character:FindFirstChild("HumanoidRootPart") if not h then return end local sPos=h.Position local sCam=Cam.CFrame while _G.sctBringAll do for _,pl in ipairs(PS:GetPlayers()) do if not _G.sctBringAll then break end if pl~=P and pl.Character then local tr=pl.Character:FindFirstChild("HumanoidRootPart") local hd=pl.Character:FindFirstChild("Head") local mh=P.Character and P.Character:FindFirstChild("HumanoidRootPart") if tr and hd and mh then P.Character:PivotTo(tr.CFrame*CFrame.new(0,-6,0)) sctDisableCollision(P.Character) local ct=0 repeat l_SetNetworkOwner_0:FireServer(tr,mh.CFrame) task.wait(0.15) ct=ct+1 until ct>20 or(hd:FindFirstChild("PartOwner") and hd.PartOwner.Value==P.Name) or not _G.sctBringAll if hd:FindFirstChild("PartOwner") and hd.PartOwner.Value==P.Name then tr.CFrame=CFrame.new(sPos) tr.AssemblyLinearVelocity=Vector3.zero task.wait(0.8) end end end end R.Heartbeat:Wait() end local mh=P.Character and P.Character:FindFirstChild("HumanoidRootPart") if mh then mh.CFrame=CFrame.new(sPos) end end) end end})

MG:AddToggle("BringAllWLSCT1",{Text="Whitelist Friends [SCT1]",Default=false,Callback=function(v) _G.sctBringWL=v end})

--==BUILD TAB==--
local BG=Tb.Build:AddLeftGroupbox("Build") local hRun=false local hConn=nil local hToy=nil
BG:AddToggle("HeartSparklerBuild",{Text="Heart",Default=false,Callback=function(V) hRun=V if V then task.spawn(function() local h=P.Character and P.Character:FindFirstChild("HumanoidRootPart") if not h then return end pcall(function() RS.MenuToys.SpawnToyRemoteFunction:InvokeServer("FireworkSparkler",h.CFrame*CFrame.new(0,50,0),Vector3.zero) end) local f=WS:WaitForChild(P.Name.."SpawnedInToys",5) hToy=f and f:WaitForChild("FireworkSparkler",5) if not hToy then return end local p=hToy:FindFirstChild("Handle") or hToy:FindFirstChildWhichIsA("BasePart") if not p then return end task.wait(0.2) for _,v in ipairs(hToy:GetDescendants()) do if v:IsA("BasePart") then v.Anchored=false v.CanCollide=false v.Massless=true end end p:BreakJoints() local bp=Instance.new("BodyPosition") bp.MaxForce=Vector3.new(1e8,1e8,1e8) bp.P=2e4 bp.D=500 bp.Parent=p local bg=Instance.new("BodyGyro") bg.MaxTorque=Vector3.new(1e8,1e8,1e8) bg.P=3e3 bg.Parent=p local t=0 hConn=R.Heartbeat:Connect(function(dt) if not hRun or not p or not p.Parent then if hConn then hConn:Disconnect() end if hToy then pcall(function() hToy:Destroy() end) end return end local ch=P.Character and P.Character:FindFirstChild("HumanoidRootPart") if not ch then return end pcall(function() RS.GrabEvents.SetNetworkOwner:FireServer(p,p.CFrame) end) t=t+8*dt local sc=1.5 bp.Position=ch.CFrame:PointToWorldSpace(Vector3.new(16*math.sin(t)^3*sc,(13*math.cos(t)-5*math.cos(2*t)-2*math.cos(3*t)-math.cos(4*t))*sc+25,3)) bg.CFrame=ch.CFrame end) end) else if hConn then hConn:Disconnect() hConn=nil end if hToy then pcall(function() hToy:Destroy() end) hToy=nil end end end})

--==FUN TAB==--
local FA=Tb.Fun:AddLeftGroupbox("Animations") local FT=Tb.Fun:AddLeftGroupbox("Troll")
local animE=false local curTr=nil local selAN="Crazy" local Anims={Crazy="rbxassetid://248263260",Insane="rbxassetid://35654637",Collapse="rbxassetid://35154961",Zombie="rbxassetid://33796059"}
local function playA() local hm=P.Character and P.Character:FindFirstChildOfClass("Humanoid") if not hm then return end local an=hm:FindFirstChildOfClass("Animator") or Instance.new("Animator",hm) if curTr then curTr:Stop() end local a=Instance.new("Animation") a.AnimationId=Anims[selAN] curTr=an:LoadAnimation(a) curTr.Priority=Enum.AnimationPriority.Action curTr.Looped=true curTr:Play() task.spawn(function() while animE and curTr do if curTr.TimePosition>0.9 then curTr.TimePosition=0.3 end task.wait(0.05) end end) end
FA:AddToggle("AnimToggle",{Text="Play Animation",Default=false,Callback=function(on) animE=on if on then playA() elseif curTr then curTr:Stop() curTr=nil end end})
FA:AddDropdown("AnimSelect",{Text="Animation",Values={"Crazy","Insane","Collapse","Zombie"},Default=1,Callback=function(v) selAN=v if animE then playA() end end})

FT:AddToggle("FollowStare",{Text="Follow & Stare",Default=false,Callback=function(on) fol=on task.spawn(function() while fol do local ps=PS:GetPlayers() local tg=ps[math.random(#ps)] if tg~=P and tg.Character and tg.Character:FindFirstChild("HumanoidRootPart") then P.Character.HumanoidRootPart.CFrame=CFrame.new(tg.Character.HumanoidRootPart.Position+tg.Character.HumanoidRootPart.CFrame.LookVector*-2,tg.Character.HumanoidRootPart.Position) end task.wait(0.3) end end) end})
FT:AddToggle("FakeDeathToggle",{Text="Fake Death",Default=false,Callback=function(on) local hm=P.Character and P.Character:FindFirstChildOfClass("Humanoid") if hm then if on then hm:ChangeState(Enum.HumanoidStateType.Physics) hm.PlatformStand=true else hm.PlatformStand=false hm:ChangeState(Enum.HumanoidStateType.GettingUp) end end end})
local fLC FT:AddToggle("FakeLagToggle",{Text="Fake Lag",Default=false,Callback=function(on) if fLC then fLC:Disconnect() fLC=nil end if on then fLC=R.Heartbeat:Connect(function() local rt=P.Character and P.Character:FindFirstChild("HumanoidRootPart") if rt and math.random(1,5)==1 then rt.CFrame=rt.CFrame*CFrame.new(math.random(-2,2)/10,0,math.random(-2,2)/10) end end) end end})

FT:AddToggle("DeleteLimbsSCT1",{Text="Delete Limbs [SCT1]",Default=false,Callback=function(on) if not on then return end local gp=WS:FindFirstChild("GrabParts") if not gp then ntf("Error","Grab someone first",3) return end local tgt=nil for _,v in ipairs(gp:GetChildren()) do if v:IsA("BasePart") then for _,w in ipairs(v:GetChildren()) do if w:IsA("WeldConstraint") and w.Part1 and w.Part1.Parent:IsA("Model") then local ch=w.Part1.Parent if ch:FindFirstChildOfClass("Humanoid") then tgt=PS:GetPlayerFromCharacter(ch) end end end end end if not tgt or not tgt.Character then return end local parts={"Left Leg","Right Leg","Left Arm","Right Arm","HumanoidRootPart"} local fpd=WS.FallenPartsDestroyHeight local saved={} for _,pn in ipairs(parts) do local pt=tgt.Character:FindFirstChild(pn) if pt then for _,d in ipairs(WS:GetDescendants()) do if d:IsA("WeldConstraint") and(d.Part0==pt or d.Part1==pt) then d.Enabled=false table.insert(saved,d) end end for _,d in ipairs(pt:GetChildren()) do if d:IsA("Motor6D") or d:IsA("Weld") then d.Enabled=false table.insert(saved,d) end end pt.Anchored=false pcall(function() pt.CFrame=CFrame.new(pt.Position.X,fpd-100,pt.Position.Z) end) task.wait(0.1) end end for _,s in ipairs(saved) do s.Enabled=true end end})

--==KEYBINDS==--
local KG=Tb.Keybinds:AddLeftGroupbox("Keybinds") local Mouse=P:GetMouse()
KG:AddLabel("Teleport"):AddKeyPicker("TPKeybind",{Default="X",Text="TP to Mouse",NoUI=false,Callback=function() local h=P.Character and P.Character:FindFirstChild("HumanoidRootPart") if h then h.CFrame=CFrame.new(Mouse.Hit.Position+Vector3.new(0,3,0)) end end})
KG:AddLabel("Blobman"):AddKeyPicker("SitBlobmanKey",{Default="Z",Text="Sit Blobman",NoUI=false,Callback=function() local c=P.Character local hm=c and c:FindFirstChildOfClass("Humanoid") local h=c and c:FindFirstChild("HumanoidRootPart") if not hm or not h or hm.SeatPart then return end local n,d=nil,50 for _,m in ipairs(WS:GetDescendants()) do if m:IsA("Model") and m.Name=="CreatureBlobman" then local rt=m:FindFirstChild("HumanoidRootPart") or m.PrimaryPart if rt and(rt.Position-h.Position).Magnitude<d then d=(rt.Position-h.Position).Magnitude n=m end end end if n then local se=n:FindFirstChildWhichIsA("VehicleSeat",true) or n:FindFirstChildWhichIsA("Seat",true) if se then h.CFrame=se.CFrame*CFrame.new(0,1.2,-1) task.wait(0.05) pcall(function() se:Sit(hm) end) end end end})

--==VISUAL TAB==--
local VG=Tb.Visual:AddLeftGroupbox("Spectate")
local specTarget=nil local specActive=false local specCam=nil
VG:AddDropdown("SpecPlayerDropdown",{Values=gPL(),Default=1,Multi=false,Text="select player",Callback=function(V) specTarget=gPFS(V) end})
VG:AddButton({Text="refresh",Func=function() Opt.SpecPlayerDropdown:SetValues(gPL()) end})
VG:AddToggle("SpectateToggle",{Text="Spectate Player",Default=false,Callback=function(on) specActive=on if on then if not specTarget or not specTarget.Character then ntf("Error","Select player!",3) Tog.SpectateToggle:SetValue(false) return end Cam.CameraSubject=specTarget.Character:FindFirstChildOfClass("Humanoid") local c=P.Character if c then local hum=c:FindFirstChildOfClass("Humanoid") if hum then hum.WalkSpeed=0 hum.JumpPower=0 end end if specCam then specCam:Disconnect() end specCam=R.Heartbeat:Connect(function() if not specActive or not specTarget or not specTarget.Character then Tog.SpectateToggle:SetValue(false) return end Cam.CameraSubject=specTarget.Character:FindFirstChildOfClass("Humanoid") end) else if specCam then specCam:Disconnect() specCam=nil end Cam.CameraSubject=P.Character and P.Character:FindFirstChildOfClass("Humanoid") local c=P.Character if c then local hum=c:FindFirstChildOfClass("Humanoid") if hum then hum.WalkSpeed=16 hum.JumpPower=50 end end end end})

--==AURAS TAB==--
local AG2=Tb.Auras:AddLeftGroupbox("Auras") local AG3=Tb.Auras:AddRightGroupbox("Kill Aura") local AG4=Tb.Auras:AddRightGroupbox("EggHub Auras") local AG5=Tb.Auras:AddLeftGroupbox("SCT1 Auras")

local rAKR=15 AG2:AddDropdown("RAKRadius",{Text="AK Aura Radius",Values={"10","12","14","16","18","20"},Default="15",Callback=function(v) rAKR=tonumber(v) end})
local rAKC AG2:AddToggle("RAKAuraToggle",{Text="Remove Anti Kick Aura",Default=false,Callback=function(on) if rAKC then rAKC:Disconnect() rAKC=nil end if not on then return end local SN=RS.GrabEvents.SetNetworkOwner rAKC=R.Heartbeat:Connect(function() local mr=P.Character and P.Character:FindFirstChild("HumanoidRootPart") if not mr then return end for _,tg in ipairs(PS:GetPlayers()) do if tg~=P then local tr=tg.Character and tg.Character:FindFirstChild("HumanoidRootPart") if tr and(tr.Position-mr.Position).Magnitude<=rAKR then local sp=WS:FindFirstChild(tg.Name.."SpawnedInToys") if sp then for _,tn in ipairs({"NinjaKunai","NinjaShuriken","AntiKick"}) do local ty=sp:FindFirstChild(tn) if ty and ty:FindFirstChild("SoundPart") then pcall(function() SN:FireServer(ty.SoundPart,ty.SoundPart.CFrame) end) end end end end end end end) end})

local dKAC local dKAR=20 AG2:AddDropdown("DKARadius",{Text="Dual Kick Radius",Values={"10","20","30","40","50"},Default="20",Callback=function(v) dKAR=tonumber(v) end})
AG2:AddToggle("DualHandKickAura",{Text="Dual Hand Kick Aura",Default=false,Callback=function(on) if dKAC then dKAC:Disconnect() dKAC=nil end if not on then return end local tl=0 dKAC=R.Heartbeat:Connect(function() if tick()-tl<0.12 then return end tl=tick() local mc=P.Character local hm=mc and mc:FindFirstChildOfClass("Humanoid") local se=hm and hm.SeatPart local mr=mc and mc:FindFirstChild("HumanoidRootPart") if not(se and mr) then return end local sp2=se.Parent local sf=sp2:FindFirstChild("BlobmanSeatAndOwnerScript") local gr=sf and sf:FindFirstChild("CreatureGrab") local dr=sf and sf:FindFirstChild("CreatureDrop") local ld=sp2:FindFirstChild("LeftDetector") local rd=sp2:FindFirstChild("RightDetector") local lw=ld and ld:FindFirstChild("LeftWeld") local rw=rd and rd:FindFirstChild("RightWeld") if not(gr and dr and ld and rd and lw and rw) then return end for _,pl in ipairs(PS:GetPlayers()) do if pl~=P and pl.Character then local h=pl.Character:FindFirstChild("HumanoidRootPart") local hm2=pl.Character:FindFirstChildOfClass("Humanoid") if h and hm2 and hm2.Health>0 and(h.Position-mr.Position).Magnitude<=dKAR then pcall(function() gr:FireServer(ld,h,lw) task.wait(0.04) dr:FireServer(lw,h) gr:FireServer(rd,h,rw) task.wait(0.04) dr:FireServer(rw,h) end) end end end end) end})

local kA1C local kA1R=20 AG2:AddDropdown("KA1Radius",{Text="KA1 Radius",Values={"10","20","30","40","50"},Default="20",Callback=function(v) kA1R=tonumber(v) end})
AG2:AddToggle("KickAura1Toggle",{Text="Kick Aura 1H (blob)",Default=false,Callback=function(on) if kA1C then kA1C:Disconnect() kA1C=nil end if not on then return end kA1C=R.Heartbeat:Connect(function() local c=P.Character local hm=c and c:FindFirstChild("Humanoid") local se=hm and hm.SeatPart local rt=c and c:FindFirstChild("HumanoidRootPart") if not(se and rt) then return end local bl=se.Parent local so=bl:FindFirstChild("BlobmanSeatAndOwnerScript") local CG2=so and so:FindFirstChild("CreatureGrab") local CD2=so and so:FindFirstChild("CreatureDrop") local RD=bl:FindFirstChild("RightDetector") local RW=RD and(RD:FindFirstChild("RightWeld") or RD:FindFirstChildWhichIsA("Weld")) if not(CG2 and CD2 and RD and RW) then return end for _,pl in ipairs(PS:GetPlayers()) do if pl~=P and pl.Character then local tr=pl.Character:FindFirstChild("HumanoidRootPart") local th=pl.Character:FindFirstChild("Humanoid") if tr and th and th.Health>0 and(tr.Position-rt.Position).Magnitude<=kA1R then pcall(function() local w=RD:FindFirstChild("RightWeld") or RD:FindFirstChildWhichIsA("Weld") if w then CD2:FireServer(w) CG2:FireServer(RD,tr,RW) end end) end end end end) end})

--Kill Aura 360
local kaE=false local kaR=12 local kaWL=true local kaC=nil local kaCD=0
AG3:AddSlider("KillAuraRadius",{Text="Radius",Default=12,Min=5,Max=30,Rounding=0,Callback=function(v) kaR=v end})
AG3:AddToggle("KillAuraWL",{Text="Whitelist Friends",Default=true,Callback=function(v) kaWL=v end})
AG3:AddToggle("KillAuraToggle",{Text="Kill Aura (360)",Default=false,Callback=function(on) kaE=on if kaC then kaC:Disconnect() kaC=nil end if not on then return end kaC=R.Heartbeat:Connect(function() if tick()-kaCD<0.12 then return end local mc=P.Character local mr=mc and mc:FindFirstChild("HumanoidRootPart") if not mr then return end local GE=RS:FindFirstChild("GrabEvents") if not GE then return end for _,pl in ipairs(PS:GetPlayers()) do if pl==P then continue end if kaWL and pcall(function() return P:IsFriendsWith(pl.UserId) end) and P:IsFriendsWith(pl.UserId) then continue end local tc=pl.Character local tr=tc and tc:FindFirstChild("HumanoidRootPart") local th=tc and tc:FindFirstChildOfClass("Humanoid") if tr and th and th.Health>0 and(tr.Position-mr.Position).Magnitude<=kaR then kaCD=tick() pcall(function() GE.SetNetworkOwner:FireServer(tr,tr.CFrame) th.Health=0 tc:BreakJoints() end) return end end end) end})

--SCT1 Auras
AG5:AddToggle("LaunchAuraSCT1",{Text="Launch Aura [SCT1]",Default=false,Callback=function(on) _G.sctLaunchAura=on if on then task.spawn(function() while _G.sctLaunchAura do pcall(function() local c=P.Character if not c or not c:FindFirstChild("HumanoidRootPart") then return end local hr=c.HumanoidRootPart for _,pl in pairs(PS:GetPlayers()) do if pl~=P and pl.Character then local ts=pl.Character:FindFirstChild("Torso") if ts and(ts.Position-hr.Position).Magnitude<=25 then l_SetNetworkOwner_0:FireServer(ts,c.HumanoidRootPart.FirePlayerPart.CFrame) task.wait(0.1) local bv=ts:FindFirstChild("sctL") or Instance.new("BodyVelocity",ts) bv.Name="sctL" bv.Velocity=Vector3.new(0,2e11,0) bv.MaxForce=Vector3.new(0,1e12,0) Deb:AddItem(bv,100) task.wait(1) l_SetNetworkOwner_0:FireServer(ts,nil) if bv then bv:Destroy() end end end end end) task.wait(0.02) end end) end end})

AG5:AddToggle("TelekinesisAuraSCT1",{Text="Telekinesis Aura [SCT1]",Default=false,Callback=function(on) _G.sctTKAura=on if on then task.spawn(function() while _G.sctTKAura do pcall(function() local c=P.Character if not c or not c:FindFirstChild("HumanoidRootPart") then return end local hr=c.HumanoidRootPart local look=Cam.CFrame.LookVector for _,pl in pairs(PS:GetPlayers()) do if pl~=P and pl.Character then local ts=pl.Character:FindFirstChild("Torso") if ts and(ts.Position-hr.Position).Magnitude<=25 then l_SetNetworkOwner_0:FireServer(ts,hr.CFrame) sctDisableCollision(pl.Character) local bp=ts:FindFirstChild("sctTKP") or Instance.new("BodyPosition") bp.Name="sctTKP" bp.MaxForce=Vector3.new(1e5,1e5,1e5) bp.D=500 bp.P=5e4 bp.Parent=ts bp.Position=hr.Position+look*15+Vector3.new(0,5,0) local bg=ts:FindFirstChild("sctTKG") or Instance.new("BodyGyro") bg.Name="sctTKG" bg.MaxTorque=Vector3.new(1e5,1e5,1e5) bg.D=500 bg.P=5e4 bg.Parent=ts bg.CFrame=CFrame.new(ts.Position,hr.Position) end end end end) task.wait(0.05) end end) end end})

AG5:AddToggle("DeathAuraSCT1",{Text="Death Aura [SCT1]",Default=false,Callback=function(on) _G.sctDeathAura=on if on then _G.sctDeathConn=R.Heartbeat:Connect(function() if not _G.sctDeathAura then return end for _,pl in ipairs(PS:GetPlayers()) do if pl~=P and pl.Character then local hr=pl.Character:FindFirstChild("HumanoidRootPart") local hd=pl.Character:FindFirstChild("Head") local hm=pl.Character:FindFirstChildOfClass("Humanoid") if hr and hd and hm and hm.Health>0 then local mh=P.Character and P.Character:FindFirstChild("HumanoidRootPart") if mh and(hr.Position-mh.Position).Magnitude<=25 then pcall(function() l_GrabEvents_0.SetNetworkOwner:FireServer(hr,hr.CFrame) task.wait(0.1) l_GrabEvents_0.DestroyGrabLine:FireServer(hr) if hd:FindFirstChild("PartOwner") and hd.PartOwner.Value==P.Name then for _,pt in pairs(hm.Parent:GetChildren()) do if pt:IsA("BasePart") then pt.CFrame=CFrame.new(-1e9,1e9,-1e9) end end local bv=Instance.new("BodyVelocity") bv.Velocity=Vector3.new(0,-1e7,0) bv.MaxForce=Vector3.new(9e9,9e9,9e9) bv.Parent=hr hm:ChangeState(Enum.HumanoidStateType.Dead) task.delay(2,function() if bv and bv.Parent then bv:Destroy() end end) end end) end end end end end) else if _G.sctDeathConn then _G.sctDeathConn:Disconnect() end end end})

--EggHub Auras
local eAuraR=32 AG4:AddSlider("EggAuraRadius",{Text="EGG Aura Radius",Default=32,Min=10,Max=100,Rounding=0,Callback=function(v) eAuraR=v end})
AG4:AddToggle("EggKillAura",{Text="Kill Aura [EGG]",Default=false,Callback=function(v) _G.EKA=v end})
AG4:AddToggle("EggVoidAura",{Text="Void Aura [EGG]",Default=false,Callback=function(v) _G.EVA=v end})
AG4:AddToggle("EggRagdollAura",{Text="Ragdoll Aura [EGG]",Default=false,Callback=function(v) _G.ERA=v end})
AG4:AddToggle("EggNoclipAura",{Text="Noclip Aura [EGG]",Default=false,Callback=function(v) _G.ENA=v end})
AG4:AddToggle("EggFireAura",{Text="Fire Aura [EGG]",Default=false,Callback=function(v) _G.EFA=v end})
AG4:AddToggle("EggAnchorAura",{Text="Anchor Aura [EGG]",Default=false,Callback=function(v) _G.EAA=v end})
-- END PART 4/5 | Пиши "продолжай" для части 5
-- GGOG Script v1.0 | PART 5/5
--==SERVER TAB==--
local SGG=Tb.Server:AddLeftGroupbox("Server") local SG2=Tb.Server:AddRightGroupbox("Server Kick") local SG3=Tb.Server:AddLeftGroupbox("Server Lag")

local tAA=false SGG:AddToggle("TrollAllToggle",{Text="Troll ALL",Default=false,Callback=function(on) tAA=on if not on then return end task.spawn(function() local GE=RS:WaitForChild("GrabEvents") local mr=P.Character:FindFirstChild("HumanoidRootPart") if not mr then Tog.TrollAllToggle:SetValue(false) return end local sp=mr.CFrame while tAA do mr=P.Character and P.Character:FindFirstChild("HumanoidRootPart") if not mr then break end for _,pl in ipairs(PS:GetPlayers()) do if not tAA then break end if pl~=P then local tr=pl.Character and pl.Character:FindFirstChild("HumanoidRootPart") local th=pl.Character and pl.Character:FindFirstChild("Humanoid") if tr and th and th.Health>0 then mr.CFrame=tr.CFrame pcall(function() th.PlatformStand=true th.Sit=true GE.SetNetworkOwner:FireServer(tr,mr.CFrame) GE.CreateGrabLine:FireServer(tr,Vector3.zero,tr.Position,false) end) task.wait(0.08) mr.CFrame=sp pcall(function() tr.CFrame=sp*CFrame.new(0,17,0) GE.SetNetworkOwner:FireServer(tr,tr.CFrame) GE.DestroyGrabLine:FireServer(tr) end) task.wait(0.05) end end end R.Heartbeat:Wait() end if mr then mr.CFrame=sp end tAA=false Tog.TrollAllToggle:SetValue(false) end) end})

local lABA=false SG2:AddToggle("LoopAllBlobToggle",{Text="Loop All",Default=false,Callback=function(on) lABA=on if not on then return end task.spawn(function() if not autoSitBlob() then ntf("Error","Sit on Blobman!",3) lABA=false Tog.LoopAllBlobToggle:SetValue(false) return end monitorSit(function() return lABA end) while lABA do local bp=getBP() if not bp then task.wait(0.3) if lABA then autoSitBlob() end continue end local GE=RS:WaitForChild("GrabEvents") for _,pl in ipairs(PS:GetPlayers()) do if not lABA then break end if pl==P then continue end local tr=pl.Character and pl.Character:FindFirstChild("HumanoidRootPart") local th=pl.Character and pl.Character:FindFirstChild("Humanoid") if not tr or not th or th.Health<=0 then continue end bp.br.CFrame=tr.CFrame pcall(function() bp.cg:FireServer(bp.rd,tr,bp.rw) GE.SetNetworkOwner:FireServer(tr,bp.br.CFrame) end) local gt=tick() while tick()-gt<0.4 do if not lABA then break end bp.br.CFrame=tr.CFrame R.Heartbeat:Wait() end bp.br.CFrame=bp.sp task.wait(0.02) for i=1,12 do if not lABA then break end tr.CFrame=bp.sp*CFrame.new(0,23,0) bp.br.CFrame=bp.sp pcall(function() local w=bp.rd:FindFirstChild("RightWeld") or bp.rd:FindFirstChildWhichIsA("Weld") if w then bp.cd:FireServer(w) end bp.cg:FireServer(bp.rd,tr,bp.rw) end) R.Heartbeat:Wait() end pcall(function() local w=bp.rd:FindFirstChild("RightWeld") or bp.rd:FindFirstChildWhichIsA("Weld") if w then bp.cd:FireServer(w) end GE.DestroyGrabLine:FireServer(tr) end) bp.br.CFrame=bp.sp task.wait(0.08) end R.Heartbeat:Wait() end lABA=false Tog.LoopAllBlobToggle:SetValue(false) end) end})

local sLagSpd=1 local sLagOn=false
SG3:AddSlider("ServerLagSpeed",{Text="Lag Speed",Default=1,Min=1,Max=100000,Rounding=0,Callback=function(v) sLagSpd=v end})
SG3:AddToggle("ServerLagToggle",{Text="Server Lag",Default=false,Callback=function(on) sLagOn=on if on then task.spawn(function() while sLagOn do local d=1/sLagSpd if d<0.001 then d=0.001 end for i=1,math.min(sLagSpd,500) do if not sLagOn then break end pcall(mouse1press) pcall(mouse1release) end task.wait(d) end end) end end})

--==MEGA ANTI TAB==--
local MAG=Tb["MEGA ANTI"]:AddLeftGroupbox("MEGA ANTI")
local OBP="_GGOG_BP" local OBG="_GGOG_BG" local pAAE=false local pAAC={} local SPOS=CFrame.new(322.31,9.52,489.68) local pABC=nil local pLC=nil
local SANIM={"idle","walk","run","jump","fall","climb","sit","swim","tool","wave","point","dance","cheer","laugh","tilt","movedirection","land"}
local GANIM={"grab","hold","carry","punch","stun","ragdoll","knock","sleep","drag","pull","throw","slam","choke","bind","tie","capture","arrest","cuff","kill","eat","swallow","consume","caught","trapped","picked","lifted","fling","toss","crush","blob","devour","absorb","digest","vore","mouth","tongue","bite","chew","gulp","inhale","suck","squeeze","wrap","coil","engulf","envelop","smother","kidnap","abduct","snatch","seize","yank","attack","strike","hit","smash","pummel","kick","stomp","trample","flatten","squish"}
local function isSafe(n) local l=(n or""):lower() if l=="" then return false end for _,s in ipairs(SANIM) do if l:find(s) then return true end end return false end
local function isGrab(n) local l=(n or""):lower() for _,k in ipairs(GANIM) do if l:find(k) then return true end end return false end
local function isOur(o) return o.Name==OBP or o.Name==OBG end
local function isForce(o) for _,t in ipairs({"BodyVelocity","BodyForce","BodyThrust","BodyAngularVelocity","BodyPosition","BodyGyro","LinearVelocity","VectorForce","AlignPosition","AlignOrientation","LineForce","Torque"}) do if o:IsA(t) then return true end end return false end
local function SetupAB(char) if pABC then pcall(function() pABC:Disconnect() end) pABC=nil end local hum=char:WaitForChild("Humanoid",5) if not hum then return end local anim=hum:FindFirstChildOfClass("Animator") or hum:WaitForChild("Animator",3) if not anim then return end pABC=anim.AnimationPlayed:Connect(function(track) if not pAAE then return end local an="" pcall(function() an=track.Animation and track.Animation.Name or"" end) if isGrab(an) or(not isSafe(an) and(track.Priority==Enum.AnimationPriority.Action or track.Priority==Enum.AnimationPriority.Action2 or track.Priority==Enum.AnimationPriority.Action3 or track.Priority==Enum.AnimationPriority.Action4)) or(not isSafe(an) and an=="") then pcall(function() track:Stop(0) end) task.defer(function() pcall(function() track:Stop(0) end) end) task.delay(0.05,function() pcall(function() track:Stop(0) end) end) local hrp=P.Character and P.Character:FindFirstChild("HumanoidRootPart") if hrp then hrp.CFrame=SPOS hrp.AssemblyLinearVelocity=Vector3.zero hrp.AssemblyAngularVelocity=Vector3.zero end end end) end

MAG:AddToggle("ProAntiAll",{Text="Anti All [2026]",Default=false,Callback=function(V) pAAE=V if V then for _,cn in pairs(pAAC) do pcall(function() cn:Disconnect() end) end pAAC={} pcall(function() if P.Character then SetupAB(P.Character) pLC=P.Character end end) table.insert(pAAC,P.CharacterAdded:Connect(function(nc) if not pAAE then return end task.wait(0.3) SetupAB(nc) pLC=nc end)) task.spawn(function() while pAAE do task.wait(0.15) pcall(function() local hum=P.Character and P.Character:FindFirstChildOfClass("Humanoid") if not hum then return end hum:ChangeState(Enum.HumanoidStateType.GettingUp) local anim=hum:FindFirstChildOfClass("Animator") if anim then for _,tr in pairs(anim:GetPlayingAnimationTracks()) do local an="" pcall(function() an=tr.Animation and tr.Animation.Name or"" end) if not isSafe(an) then tr:Stop(0) end end end hum.Sit=false hum.PlatformStand=false hum.Jump=true if P.Character~=pLC then pLC=P.Character SetupAB(P.Character) end end) end end) task.spawn(function() while pAAE do task.wait(0.3) pcall(function() local char=P.Character if not char then return end for _,v in pairs(char:GetDescendants()) do if(v:IsA("Weld") or v:IsA("WeldConstraint") or v:IsA("RigidConstraint")) and v.Part0 and v.Part1 then if not v.Part0:IsDescendantOf(char) or not v.Part1:IsDescendantOf(char) then v:Destroy() end end end end) end end) local function uL() if not pAAE then return end local hrp=P.Character and P.Character:FindFirstChild("HumanoidRootPart") local hum=P.Character and P.Character:FindFirstChildOfClass("Humanoid") if not hrp then return end pcall(function() hrp.Anchored=false local bp=hrp:FindFirstChild(OBP) if not bp then bp=Instance.new("BodyPosition") bp.Name=OBP bp.MaxForce=Vector3.new(math.huge,math.huge,math.huge) bp.P=1e7 bp.D=1e5 bp.Parent=hrp end bp.Position=SPOS.Position local bg=hrp:FindFirstChild(OBG) if not bg then bg=Instance.new("BodyGyro") bg.Name=OBG bg.MaxTorque=Vector3.new(math.huge,math.huge,math.huge) bg.P=1e7 bg.Parent=hrp end bg.CFrame=SPOS for _=1,10 do hrp.CFrame=SPOS hrp.AssemblyLinearVelocity=Vector3.zero hrp.AssemblyAngularVelocity=Vector3.zero end for _,ch in pairs(hrp:GetChildren()) do if isForce(ch) and not isOur(ch) then ch:Destroy() end end for _,part in pairs(P.Character:GetDescendants()) do if part:IsA("BasePart") and part~=hrp then part.AssemblyLinearVelocity=Vector3.zero part.AssemblyAngularVelocity=Vector3.zero for _,ch in pairs(part:GetChildren()) do if isForce(ch) and not isOur(ch) then ch:Destroy() end end end end if hum and hum.SeatPart and not hum.SeatPart:IsDescendantOf(P.Character) then hum.Jump=true hum.Sit=false end if hum then hum.PlatformStand=false hum.Sit=false hum.Health=hum.MaxHealth end for _,v in pairs(P.Character:GetDescendants()) do if v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") then v:Destroy() end end hrp.CFrame=SPOS hrp.AssemblyLinearVelocity=Vector3.zero hrp.AssemblyAngularVelocity=Vector3.zero hrp.Anchored=false end) end table.insert(pAAC,R.RenderStepped:Connect(uL)) table.insert(pAAC,R.Heartbeat:Connect(uL)) table.insert(pAAC,R.Stepped:Connect(uL)) table.insert(pAAC,R.Heartbeat:Connect(function() if not pAAE then return end local hrp=P.Character and P.Character:FindFirstChild("HumanoidRootPart") if hrp and(hrp.Position-SPOS.Position).Magnitude>5 then hrp.Anchored=false task.wait() for _=1,500 do hrp.CFrame=SPOS hrp.AssemblyLinearVelocity=Vector3.zero end local bp=hrp:FindFirstChild(OBP) if bp then bp.Position=SPOS.Position end end end)) else for _,cn in pairs(pAAC) do pcall(function() cn:Disconnect() end) end pAAC={} if pABC then pcall(function() pABC:Disconnect() end) pABC=nil end pcall(function() local hrp=P.Character and P.Character:FindFirstChild("HumanoidRootPart") if hrp then hrp.Anchored=false local bp=hrp:FindFirstChild(OBP) if bp then bp:Destroy() end local bg=hrp:FindFirstChild(OBG) if bg then bg:Destroy() end end end) end end})

--==ULTRA ANTI TAB==--
local UAG=Tb["Ultra Anti"]:AddLeftGroupbox("Ultra Anti") local UAG2=Tb["Ultra Anti"]:AddRightGroupbox("Special")
local anonC=nil UAG:AddToggle("AnonToggle",{Text="Anonim",Default=false,Callback=function(on) if on then if anonC then anonC:Disconnect() end anonC=R.Heartbeat:Connect(function() pcall(function() local ch=P.Character if not ch then return end local head=ch:FindFirstChild("Head") if head then for _,v in pairs(head:GetDescendants()) do if v:IsA("TextLabel") or v:IsA("TextBox") then if v.Text==P.DisplayName or v.Text==P.Name then v.Text="Anonymous" end end end end end) end) else if anonC then anonC:Disconnect() anonC=nil end end end})

UAG:AddToggle("SitLockToggle",{Text="Sit Lock",Default=false,Callback=function(on) _G.SitLock=on if on then task.spawn(function() while _G.SitLock do pcall(function() local c=P.Character if not c then return end local hum=c:FindFirstChildOfClass("Humanoid") local hrp=c:FindFirstChild("HumanoidRootPart") if not hum or not hrp then return end hum.PlatformStand=false hum.Sit=false hum:ChangeState(Enum.HumanoidStateType.GettingUp) for _,v in pairs(c:GetDescendants()) do if(v:IsA("Weld") or v:IsA("WeldConstraint")) then local p0,p1 pcall(function() p0=v.Part0 end) pcall(function() p1=v.Part1 end) if p0 and not p0:IsDescendantOf(c) then v:Destroy() elseif p1 and not p1:IsDescendantOf(c) then v:Destroy() end end if isForce(v) and not isOur(v) and v.Parent and v.Parent:IsDescendantOf(c) then v:Destroy() end end hrp.AssemblyLinearVelocity=Vector3.zero hrp.AssemblyAngularVelocity=Vector3.zero RS.CharacterEvents.RagdollRemote:FireServer(hrp,0) end) task.wait(0.05) end end) end end})

local REZON_POS={CFrame.new(326.8,-4.5,486.7),CFrame.new(601.7,124.3,-101.4),CFrame.new(539,96.5,-391),CFrame.new(-525.1,52,-164.9),CFrame.new(-576.5,50.4,89.2)} local rezonConns={}
UAG2:AddToggle("AntiRezonansToggle",{Text="Anti Rezonans(TEST)",Default=false,Callback=function(on) _G.AntiRezon=on for _,cn in pairs(rezonConns) do pcall(function() cn:Disconnect() end) end rezonConns={} if on then local idx=0 local function rezonTick() if not _G.AntiRezon then return end local hrp=P.Character and P.Character:FindFirstChild("HumanoidRootPart") local hum=P.Character and P.Character:FindFirstChildOfClass("Humanoid") if not hrp then return end pcall(function() hrp.Anchored=false idx=idx%#REZON_POS+1 local cf=REZON_POS[idx] hrp.CFrame=cf hrp.AssemblyLinearVelocity=Vector3.zero hrp.AssemblyAngularVelocity=Vector3.zero if hum then hum.PlatformStand=false hum.Sit=false hum:ChangeState(Enum.HumanoidStateType.GettingUp) end for _,v in pairs(P.Character:GetDescendants()) do if(v:IsA("Weld") or v:IsA("WeldConstraint")) then local p0,p1 pcall(function() p0=v.Part0 end) pcall(function() p1=v.Part1 end) if(p0 and not p0:IsDescendantOf(P.Character)) or(p1 and not p1:IsDescendantOf(P.Character)) then v:Destroy() end end if isForce(v) and not isOur(v) and v.Parent and v.Parent:IsDescendantOf(P.Character) then v:Destroy() end end for _,v in pairs(P.Character:GetDescendants()) do if v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") then v:Destroy() end end RS.CharacterEvents.RagdollRemote:FireServer(hrp,0) end) end table.insert(rezonConns,R.RenderStepped:Connect(rezonTick)) table.insert(rezonConns,R.Heartbeat:Connect(rezonTick)) table.insert(rezonConns,R.Stepped:Connect(rezonTick)) end end})

--==MIX TAB==--
local MXG=Tb.Mix:AddLeftGroupbox("Mix Scripts") local MXR=Tb.Mix:AddRightGroupbox("Detected") local mxLbl={}
local function scanSc() local f={} for _,gui in ipairs(CG:GetChildren()) do if gui:IsA("ScreenGui") and gui.Name~="SitBtnGui" and gui~=Lib.ScreenGui then table.insert(f,gui.Name) end end return f end
MXG:AddButton({Text="Mix Script",Func=function() for _,lb in ipairs(mxLbl) do pcall(function() lb:Destroy() end) end mxLbl={} local sc=scanSc() if #sc==0 then ntf("Mix","No scripts detected!",5) return end ntf("Mix","Absorbed "..#sc.." scripts!",5) for _,gui in ipairs(CG:GetChildren()) do if gui:IsA("ScreenGui") and gui.Name~="SitBtnGui" and gui~=Lib.ScreenGui then pcall(function() gui.Enabled=false end) end end for _,fn in ipairs(sc) do table.insert(mxLbl,MXR:AddLabel("+ "..fn)) end end})
MXG:AddButton({Text="Refresh Scan",Func=function() local s=scanSc() ntf("Scan","Found "..#s.." scripts",3) end})
MXG:AddButton({Text="Force Close Others",Func=function() local ct=0 for _,gui in ipairs(CG:GetChildren()) do if gui:IsA("ScreenGui") and gui.Name~="SitBtnGui" and gui~=Lib.ScreenGui then pcall(function() gui:Destroy() end) ct=ct+1 end end ntf("Mix","Closed "..ct,3) end})

--==SILENT AIM TAB [SCT1]==--
local SAG=Tb["Silent Aim"]:AddLeftGroupbox("Silent Aim [SCT1]")
local saSCT={En=false,TP="HumanoidRootPart",HC=100,MHP=false,AP=false,MHP_A=0.165,Col=Color3.fromRGB(54,57,241),Show=false}
local saCPA=0.165 local saVTP={"Head","HumanoidRootPart"}
local function saGetMouse() return UIS:GetMouseLocation() end
local function saW2S(pos) local v,vis=Cam:WorldToScreenPoint(pos) return Vector2.new(v.X,v.Y),vis end
local function saGetTarget() if not saSCT.TP then return nil end local best,bestD=nil,nil local mp=UIS.TouchEnabled and Cam.ViewportSize/2 or saGetMouse() for _,pl in ipairs(PS:GetPlayers()) do if pl~=P and pl.Character then local hr=pl.Character:FindFirstChild("HumanoidRootPart") local hm=pl.Character:FindFirstChildOfClass("Humanoid") if hr and hm and hm.Health>0 and(Cam.CFrame.Position-hr.Position).Magnitude<=35 then local sp,vis=saW2S(hr.Position) if vis then local d=(mp-sp).Magnitude if d<=(bestD or 2000) then local tp=saSCT.TP~="Random" and pl.Character:FindFirstChild(saSCT.TP) or pl.Character[saVTP[math.random(1,#saVTP)]] best=tp bestD=d end end end end end return best end

SAG:AddToggle("SAEnabled",{Text="Enabled [SCT1]",Default=false,Callback=function(v) saSCT.En=v end})
SAG:AddDropdown("SATargetPart",{Text="Target Part [SCT1]",Values={"Head","HumanoidRootPart","Random"},Default="HumanoidRootPart",Callback=function(v) saSCT.TP=v end})
SAG:AddSlider("SAHitChance",{Text="Hit Chance [SCT1]",Default=100,Min=0,Max=100,Rounding=0,Suffix="%",Callback=function(v) saSCT.HC=v end})
SAG:AddToggle("SAManualPred",{Text="Manual Prediction [SCT1]",Default=false,Callback=function(v) saSCT.MHP=v end})
SAG:AddToggle("SAAutoPred",{Text="Auto Prediction [SCT1]",Default=false,Callback=function(v) saSCT.AP=v end})
SAG:AddSlider("SAPredAmount",{Text="Prediction Amount [SCT1]",Default=0.165,Min=0.1,Max=1,Rounding=3,Callback=function(v) saSCT.MHP_A=v end})

R.Heartbeat:Connect(function() if saSCT.AP then local ok,res=pcall(function() return Stats.Network.ServerStatsItem["Data Ping"]:GetValueString() end) if ok then local p=tonumber(res:match("(%d+)")) or 50 if p<20 then saCPA=0.11 elseif p<40 then saCPA=0.12 elseif p<60 then saCPA=0.13 elseif p<80 then saCPA=0.14 elseif p<100 then saCPA=0.15 else saCPA=0.16 end end else saCPA=saSCT.MHP_A end end)

if hookmetamethod then local oldNC=nil oldNC=hookmetamethod(game,"__namecall",newcclosure(function(...) local m=getnamecallmethod() local args={...} if saSCT.En and args[1]==WS and not checkcaller() and m=="Raycast" and math.random(1,100)<=saSCT.HC then local tgt=saGetTarget() if tgt then local vel=tgt.Velocity or Vector3.zero local pred=saSCT.MHP and vel*saCPA or Vector3.zero args[3]=(tgt.Position+pred-args[2]).Unit*1000 return oldNC(unpack(args)) end end return oldNC(...) end)) end

--==BLOB FLY==--
local function GetBR() local c=P.Character local hm=c and c:FindFirstChild("Humanoid") if hm and hm.SeatPart and hm.SeatPart.Parent and hm.SeatPart.Parent.Name=="CreatureBlobman" then return hm.SeatPart.Parent:FindFirstChild("HumanoidRootPart") end local f=WS:FindFirstChild(P.Name.."SpawnedInToys") return f and f:FindFirstChild("CreatureBlobman") and f.CreatureBlobman:FindFirstChild("HumanoidRootPart") end
R.Heartbeat:Connect(function() if not bFly or not bMas then if bvI then bvI:Destroy() bvI=nil end if bgI then bgI:Destroy() bgI=nil end return end local rt=GetBR() if rt then if not rt:FindFirstChild("BFV") then bvI=Instance.new("BodyVelocity") bvI.Name="BFV" bvI.MaxForce=Vector3.new(1e8,1e8,1e8) bvI.P=1e4 bvI.Parent=rt end if not rt:FindFirstChild("BFG") then bgI=Instance.new("BodyGyro") bgI.Name="BFG" bgI.MaxTorque=Vector3.new(1e8,1e8,1e8) bgI.P=2e4 bgI.D=100 bgI.Parent=rt end local md=Vector3.zero if UIS:IsKeyDown(Enum.KeyCode.W) then md=md+Cam.CFrame.LookVector end if UIS:IsKeyDown(Enum.KeyCode.S) then md=md-Cam.CFrame.LookVector end if UIS:IsKeyDown(Enum.KeyCode.A) then md=md-Cam.CFrame.RightVector end if UIS:IsKeyDown(Enum.KeyCode.D) then md=md+Cam.CFrame.RightVector end if UIS:IsKeyDown(Enum.KeyCode.Space) then md=md+Vector3.yAxis end if UIS:IsKeyDown(Enum.KeyCode.LeftControl) then md=md-Vector3.yAxis end local bv=rt:FindFirstChild("BFV") if bv then bv.Velocity=md*bSpd end local bg=rt:FindFirstChild("BFG") if bg then bg.CFrame=Cam.CFrame end end end)

--==KICK DETECTION==--
WS.ChildAdded:Connect(function(o) if o.Name=="BlackHoleKick" or o.Name=="BlackHoleDetected" then task.wait(0.05) local pos=o:IsA("BasePart") and o.Position or(o:IsA("Model") and o.PrimaryPart and o.PrimaryPart.Position) if not pos then return end local cp,cd2=nil,1e9 for _,pl in ipairs(PS:GetPlayers()) do if pl~=P and pl.Character then local h=pl.Character:FindFirstChild("HumanoidRootPart") if h and(h.Position-pos).Magnitude<cd2 then cd2=(h.Position-pos).Magnitude cp=pl end end end if cp then ntf("Kick",cp.DisplayName.." kicked",6) end end end)
PS.PlayerAdded:Connect(function(pl) pcall(function() if pl:IsFriendsWith(P.UserId) then ntf("Friend",pl.Name.." joined",5) end end) end)

--==MAIN HEARTBEAT LOOP==--
local eLoopT,eAuraT,eChaosT=0,0,0
R.Heartbeat:Connect(function(dt) eLoopT=eLoopT+dt eAuraT=eAuraT+dt eChaosT=eChaosT+dt local c=P.Character if not c then return end local root=c:FindFirstChild("HumanoidRootPart") local hum=c:FindFirstChildOfClass("Humanoid") if not root or not hum then return end
if _G.ESE then hum.WalkSpeed=_G.ESV or 16 end
if _G.EJE then hum.JumpPower=_G.EJV or 50 end
if _G.ENC then for _,v in ipairs(c:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide=false end end if hum.Sit then local seat=hum.SeatPart if seat and seat.Parent then for _,v in ipairs(seat.Parent:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide=false end end end end end
if eAuraT>=0.5 then if _G.EKA or _G.EVA or _G.ERA or _G.ENA or _G.EFA or _G.EAA then for _,part in ipairs(WS:GetPartBoundsInRadius(root.Position,eAuraR)) do if part.Name=="HumanoidRootPart" and not part:IsDescendantOf(c) then SNO(part) if _G.EKA then MvTo(part,CFrame.new(4096,-75,4096)) Vel(part,Vector3.new(0,-1000,0)) end if _G.EVA then Vel(part,Vector3.new(0,10000,0)) end if _G.ERA then Vel(part,Vector3.new(0,-256,0)) end if _G.ENA then part.CanCollide=false end end end end eAuraT=0 end
if eLoopT>=1.5 then if selKP and selKP.Parent and selKP.Character then if _G.ELK then task.spawn(SnKill,selKP) end if _G.ELV then task.spawn(SnVoid,selKP) end if _G.ELP then task.spawn(SnPoison,selKP) end if _G.ELR then task.spawn(SnRagdoll,selKP) end if _G.ELD then task.spawn(SnDeath,selKP) end if _G.ELB then task.spawn(SnBring,selKP) end if _G.ELPL then task.spawn(SnPull,selKP) end end eLoopT=0 end
if _G.ChaosL and eChaosT>=0.01 then for _,pl in ipairs(PS:GetPlayers()) do if pl~=P and pl.Character then local tr=pl.Character:FindFirstChild("HumanoidRootPart") if tr then eCL(tr) end end end eChaosT=0 end
end)

--==NOTIFICATIONS TAB==--
local NG=Tb.Notifications:AddLeftGroupbox("Notifications")
NG:AddLabel("GGOG Script v1.0 Loaded")

--==UI SETTINGS TAB==--
local UIG=Tb["UI Settings"]:AddLeftGroupbox("Menu")
UIG:AddButton("Unload",function() if sG then sG:Destroy() end Lib:Unload() end)
UIG:AddLabel("Menu Keybind"):AddKeyPicker("MenuKeybind",{Default="RightShift",NoUI=true,Text="Menu keybind"})
Lib.ToggleKeybind=Opt.MenuKeybind
TM:SetLibrary(Lib) SM:SetLibrary(Lib) SM:IgnoreThemeSettings() SM:SetIgnoreIndexes({"MenuKeybind"})
TM:SetFolder("GGOG Script 1.0") SM:SetFolder("GGOG Script 1.0/Configs")
SM:BuildConfigSection(Tb["UI Settings"]) TM:ApplyToTab(Tb["UI Settings"])

--==THEME==--
task.spawn(function() task.wait(0.5)
pcall(function() Lib:SetTheme({Main=Color3.fromRGB(0,0,0),Accent=Color3.fromRGB(255,255,255),Outline=Color3.fromRGB(150,150,150),Font=Color3.fromRGB(255,255,255)}) end)
pcall(function() for _,obj in pairs(Lib.ScreenGui:GetDescendants()) do if obj:IsA("Frame") or obj:IsA("ScrollingFrame") then if obj.BackgroundColor3==Color3.fromRGB(255,255,255) or obj.BackgroundColor3==Color3.fromRGB(30,30,30) then obj.BackgroundColor3=Color3.fromRGB(0,0,0) end elseif obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then obj.TextColor3=Color3.fromRGB(255,255,255) elseif obj:IsA("ImageLabel") or obj:IsA("ImageButton") then obj.ImageColor3=Color3.fromRGB(255,255,255) end end end)
pcall(function() for _,obj in pairs(Lib.ScreenGui:GetDescendants()) do if obj:IsA("ImageLabel") and obj.Image~="" then obj.ImageColor3=Color3.fromRGB(255,255,255) end end end)
end)

P.CameraMode=Enum.CameraMode.Classic P.CameraMinZoomDistance=0.5 P.CameraMaxZoomDistance=128
ntf("GGOG Script v1.0","All systems loaded!",5)
-- END PART 5/5 | FULL SCRIPT COMPLETE

*start 
[hidemenubutton]
[nolog]

;-----------------定数集------------------------------
[iscript]
sf.bgmvol = 30
sf.askbw = 120
sf.askbx = 520
sf.askby = 240
sf.noaskbx = 520
sf.noaskby = 360
sf.keyposx=[0,1189,1189,1189]
sf.keyposy=[0,60,130,200]
sf.butposx=[220,520,820,220,520,820,220,520]
sf.butposy=[150,150,150,275,275,275,400,400]
sf.butw = 125
sf.fixbx = 1167
sf.fixby = 620
[endscript]

;-----------------変数宣言------------------------------
[iscript]
f.qname = ''
f.mute = false
f.man = false
f.key = [true,true,true,true]
f.butid = 0
f.flag = Array(10)
f.flag.fill(false)
f.ksname = ''
f.ksnameans = ''
[endscript]

;-----------------マクロ準備------------------------------

;問題sceneの開始 ksnameとksnameans必須
[macro name = beginprobscene]
[cm]
[clearfix]
[fadeoutbgm time=300]
[bg storage="dinner-table-444434_1920.jpg"  time="500"]
[current layer=message0]
[anim layer="message0" time="1" opacity="255"]
[iscript]
f.qname = ''
f.mute = false
f.man = false
f.key = [true,true,true,true]
f.butid = 0
f.flag = Array(10)
f.flag.fill(false)
f.ksname = mp.ksname + '.ks'
f.ksnameans = mp.ksnameans + '.ks'
[endscript]
[wait time=300]
[endmacro]

[macro name = fbutton]
[anim name=%name time=1 opacity=0]
[anim name=%name time=300 opacity=255]
[endmacro]

;prob画面のBGM流し
[macro name = probbgm]
[playbgm  storage="probsong.mp3"]
[bgmopt volume="&sf.bgmvol"]
[endmacro]

;ans画面のBGM流し
[macro name = ansbgm]
[playbgm  storage="anssong.mp3"]
[bgmopt volume="&sf.bgmvol"]
[endmacro]

;支配人が(mes)回答。- waitがtureでwait演出
[macro name = mans]
[current layer = message1]
[if exp="mp.wait"]
[eval exp="f.mute = true"]
[bgmopt volume="0"]
[image layer=message1 top="545" left="95" width=150 height=150 storage="chara/managerwindow.png" zindex="101" name="winman" time = "50"]
[wait time="600"]
_　　　　　　　[playse storage="se_maoudamashii_onepoint07.mp3"  volume="50"]%mes
[l][er]
[else]
[image layer=message1 top="545" left="95" width=150 height=150 storage="chara/managerwindow.png" zindex="101" name="winman" time = "50"]
_　　　　　　　[playse  storage="メッセージ表示音1.mp3" volume="50"]%mes
[stopse][l][er]
[endif]
[endnolog]
[pushlog  text=%mes]
[nolog]
[endmacro]

;支配人が(mes)しゃべる。poseがtrueでmes0に戻り待機
[macro name = mtalk]
[current layer = message1]
[if exp="!f.man"]
[image layer=message1 top="545" left="95" width=150 height=150 storage="chara/managerwindow.png" zindex="101" name="winman" time = "50"]
[eval exp="f.man=true"]
[endif]
_　　　　　　　[emb exp="mp.mes"]
[if exp="mp.pose"]
[current layer = message0]
[else]
[l][er]
[endif]
[endmacro]

[macro name = merase]
[free layer=message1 name="winman" time="100"]
[if exp="f.mute"]
[bgmopt volume="&sf.bgmvol"]
[eval exp="f.mute = false"]
[endif]
[eval exp="f.man=false"]
[endmacro]

;(id 1~3)番目の鍵を準備する。
[macro name = showkey]
[image layer="0" name="&'key'+ mp.id" storage="nokey.png" width="60" x="&sf.keyposx[mp.id]" y="&sf.keyposy[mp.id]" visible = true time=300 wait= false]
[eval exp="f.key[mp.id] = false"]
[endmacro]

;(id 1~3)番目の鍵を持っていない時に獲得し、f.key立てる。
[macro name = getkey]
[if exp="!f.key[mp.id]"]
[eval exp="f.showtext = 'a'"]
[iscript]
switch(Number(mp.id)){
	case 1:
		f.showtext = '第一の鍵獲得';
    	console.log("OK");
		break;
	case 2: 
		f.showtext = '第二の鍵獲得';
		break;
  	case 3:
    	f.showtext = '第三の鍵獲得';
    	break;
	default:
		f.showtext = '鍵獲得'
}
[endscript]
[playse  storage="se_maoudamashii_onepoint30.mp3" volume="80"]
[mtext layer="0" x="340"  y="270"  font="fantasy" align="center" bold="bold" color="0xffaa00" width="600" wait=false text="&f.showtext" time = "100" in_effect="bounce" out_effect="fadeOut" size="75"]
[image layer="0" name="&'getkey'+ mp.id" storage="key.png" width ="70" x="610" y="400" time ="1300"]
[anim layer="0" name="&'getkey'+ mp.id" width="60" left="&sf.keyposx[mp.id]" top="&sf.keyposy[mp.id]" time="600"]
[wa]
[free layer="0" name="&'key'+ mp.id"]
[eval exp="f.key[mp.id] = true"]
[endif]
[endmacro]

[macro name = curpos]
[current layer = message1]
%mes
[current layer = message0]
[endmacro]

;選択肢の頭に置く。mes必須。
[macro name = beginchoice]
[wait_cancel]
[merase]
[clearfix name ='ansbutton']
[eval exp="f.butid=0"]
[playse storage="kettei.mp3" volume="50"]
[current layer = message1]
[er]
[current layer = message0]
[anim layer="message0" time="300" opacity=" 0"]
[curpos mes=%mes]
[endmacro]

;選択肢の終わりに置く。
[macro name = endchoice]
[s]
[endmacro]

;logにmes足す。
[macro name = addlog]
[endnolog]
[pushlog  text=%mes]
[nolog]
[endmacro]

;答えの頭に置く question必須。
[macro name = beginanswer]
[addlog  mes=%question]
[endmacro]

;答えの終わりに置く。
[macro name = endanswer]
[merase]
[current layer = message0]
[jump target= "*problem" storage="&f.ksname"]
[endmacro]

;音と共にmes出す slowがtrueで遅くなる
[macro name = withse]
[if exp="mp.slow"]
[playse  storage="メッセージ表示音slow.mp3" volume="50"]
[else]
[playse  storage="メッセージ表示音1.mp3" volume="50"]
[endif]
%mes
[stopse]
[endmacro]

;問題上リンクmes出して targetに飛ぶ。
[macro name = problink]
[if exp="mp.target"]
[eval exp="f.temptarg = mp.target"]
[else]
[eval exp="f.temptarg = mp.mes"]
[endif]
[font color="0xffaa00"][link target="&'*'+f.temptarg" storage="&f.ksname"]%mes[endlink][resetfont]
[endmacro]

;ゲーム準備(レイヤー1準備、ゲーム開始宣言、レイヤー0隠す)
[macro name = startgame]
[current layer = message1]
[layopt layer=message1 visible=true]
[mtalk mes='ゲーム開始です。'] [merase]
[current layer = message0]
[anim layer=message0 time="100" opacity="0"]
[endmacro]

;ボタン出すmesとtarget必要　font_colorも指定可能 condもJSの条件式(&なし)で指定可能
[macro name = showbutton]
[if exp = %cond|true]
[glink name="&'glink'+ f.butid" x="&sf.butposx[f.butid]" y="&sf.butposy[f.butid]" width="&sf.butw" font_color=%font_color|white opacity=0 text=%mes target="&'*'+ mp.target" storage="&f.ksname"]
[fbutton name="&'glink'+ f.butid"]
[eval exp="f.butid += 1"]
[endif]
[endmacro]

;戻るボタン出す
[macro name = showback]
[glink name="glinkb" color="gray" x="845" y="400" width="75" opacity=0 text="戻る" target="*problem" storage="&f.ksname"]
[fbutton name="glinkb"]
[endmacro]

;質問ボタン出す target必須
[macro name = showask]
[glink name="glinka" x="&sf.askbx" y="&sf.askby" text="質問する" width="&sf.askbw" target="&'*'+ mp.target" storage="&f.ksname"]
[glink name="glinkb" x="&sf.noaskbx" y="&sf.noaskby" color = "gray" width="&sf.askbw" text="戻る" target="*problem" storage="&f.ksname"]
[fbutton name="glinka"]
[fbutton name="glinkb"]
[endmacro]

;入力マクロ
[macro name = begininput]
[playse storage="kettei.mp3" volume="50"]
[current layer = message1]
[emb exp="f.question1"]「」[emb exp="f.question2"][r]
[font size=22](「」内を[font color="orange"]ひらがなで[resetfont][font size=22]入力してください。)[resetfont]
[endmacro]

[macro name = inputE]
[current layer = message0]
[edit name="f.qname" left="510" top="300" width="260" height="40" size="30" maxchars="8"]
[button graphic="button/決定ボタン.png" enterimg="button/決定ボタンpush.png" x="528" y="370" width="230" height="37"  target="&'*'+f.tagname+'C'" storage="&f.ksname"]
[glink name="glink7" color="gray" x="845" y="400" width="75" opacity=0 text="戻る" target="*endfirst"]
[s]
*endfirst
[cm]
[eval exp="f.qname = ''"]
[current layer = message0]
[jump target= "*problem"  storage="&f.ksname"]
[endmacro]

[macro name = inputC]
[commit]
[cm]
[current layer = message1]
;ひらがなチェック-----
[if exp="!f.qname.match(/^[ぁ-んー　]*$/) || !f.qname"]
ひらがなで入力してください。
[jump target = "&'*'+f.tagname+'E'" storage="&f.ksname"]
[endif]
[current layer = message1]
[nowait]
[emb exp="f.question1"]「[emb exp="f.qname"]」[emb exp="f.question2"]
[endnowait]
[current layer = message0]
[showask target="&'*'+f.tagname+'A'"]
[s]
[endmacro]

[macro name = endinput]
[eval exp="f.qname = ''"]
[current layer = message0]
[jump target= "*problem" storage="&f.ksname"]
[endmacro]

;解答ボタン出す
[macro name = showans]
[if exp="f.key[1]&&f.key[2]&&f.key[3]"]
[button name ='ansbutton' fix=true storage="&f.ksnameans" graphic="button/解答ボタン.png" enterimg="button/解答ボタンpush.png" x="&sf.fixbx" y="&sf.fixby" width="96" height="61" ]
[endif]
[endmacro]

;問題開始
[macro name = beginprob]
[nowait]
[er]
[endmacro]

;問題出す time必要  ansボタン含む　このあとに色々追加処理書く
[macro name = showprob]
[endnowait]
[anim layer="message0" time=%time opacity="255"]
[showans]
[endmacro]

;問題終了
[macro name = endprob]
[s]
[endmacro]

;restart用
[macro name = restart]
[clearfix]
[cm]
[wait_cancel]
[merase]
[free layer="message1" name="question"]
[clearstack  stack="call"]
[bg storage="dinner-table-444434_1920.jpg"  time="500"]
[current layer="message0"]
[probbgm]
[endmacro]

;解答画面の準備
[macro name=prepareans]
[cm]
[clearfix]
[wait_cancel]
[clearstack  stack="call"]
[merase]
[anim layer="message0" time="100" opacity="0"]
[fadeoutbgm time=300]
[bg storage="background3.jpg"  time="500"]
[current layer=message1]
[iscript]
f.qname = ''
f.man = false
[endscript]
[wait time=300]
[ansbgm]
[button name ='probbutton' fix=true storage="&f.ksname" target='*restart' graphic="button/戻るボタン.png" enterimg="button/戻るボタンpush.png" x="&sf.fixbx" y="&sf.fixby" width="96" height="61"]
[mtalk mes = 'それではあなたの解答をお聞かせください。']
[merase]
[endmacro]

;Q(id)のmesを表示。
[macro name=beginq]
[cm]
[free layer="message1" name="question"]
[mtext layer="message1" text="&'Q'+mp.id" size="80" x="40"  y="200"  width="1200"  align="center"  time =300]
[mtext layer="message1" text=%mes size="60" x="40"  y="200"  width="1200"  align="center" in_sync="true"  name="question"  fadeout="false"]
[endmacro]

[macro name=endq]
[s]
[endmacro]

;mesのtargetへのリンク出す
[macro name=showchoice]
[link target="&'*'+mp.target" storage="&f.ksnameans"]%mes[endlink]
[endmacro]

;入力マクロA
[macro name = begininputA]
[font color="orange"]ひらがなで[resetfont]入力してください。
[endmacro]

[macro name = inputAE]
[eval exp="f.ansinput = ''"]
[edit name="f.ansinput" left="510" top="340" width="260" height="40" size="30" maxchars="8"]
[button graphic="button/決定ボタン.png" enterimg="button/決定ボタンpush.png" x="528" y="410" width="230" height="37"  target="&'*'+f.tagname+'C'" storage="&f.ksnameans"]
[s]
[endmacro]

[macro name = inputAC]
[commit]
[cm]
;[current layer = message1]
;ひらがなチェック-----
[if exp="!f.ansinput.match(/^[ぁ-んー　]*$/) || !f.ansinput"]
[font color="orange"]ひらがなで[resetfont]入力してください。
[jump target = "&'*'+f.tagname+'E'" storage="&f.ksnameans"]
[endif]
[endmacro]

;マクロ準備終了---------------------------------------------------------------

  

;レイヤ準備
[position layer=message0 width=1100 height=450 top=60 left=70 frame="メッセージ.png" opacity="255" lmargin = 10]
[position layer=message1 width=1100 height=200 top=520 left=70 frame="メッセージ.png"   opacity="255" lmargin = 10]
[layopt layer=message1 visible=true]

;最初のシーンへ
[jump  storage="scene1.ks"]


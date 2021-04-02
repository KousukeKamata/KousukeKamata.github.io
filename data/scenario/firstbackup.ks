*start 
[hidemenubutton]
[nolog]
[bg storage="dinner-table-444434_1920.jpg"  time="300"]
[position layer=message0 width=1100 height=450 top=60 left=70 frame="メッセージ.png" opacity="255" lmargin = 10]
[position layer=message1 width=1100 height=200 top=520 left=70 frame="メッセージ.png"   opacity="255" lmargin = 10]
[layopt layer=message1 visible=true]

;-----------------定数集------------------------------
[iscript]
sf.bgmvol = 30
sf.askbw = 120
sf.askbx = 520
sf.askby = 240
sf.noaskbx = 520
sf.noaskby = 360
sf.keyposx=[0,1196,1196,1196]
sf.keyposy=[0,60,130,200]
sf.butposx=[220,520,820,220,520,820,220,520]
sf.butposy=[150,150,150,275,275,275,400,400]
sf.butw = 125
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
[endscript]

;-----------------マクロ集------------------------------
[macro name = fbutton]
[anim name=%name time=1 opacity=0]
[anim name=%name time=300 opacity=255]
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
[image layer="0" name="&'key'+ mp.id" storage="nokey.png" width="50" x="&sf.keyposx[mp.id]" y="&sf.keyposy[mp.id]" visible = true time=300 wait= false]
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
[image layer="0" name="&'getkey'+ mp.id" storage="key.png" width ="60" x="610" y="400" time ="1300"]
[anim layer="0" name="&'getkey'+ mp.id" width="50" left="&sf.keyposx[mp.id]" top="&sf.keyposy[mp.id]" time="600"]
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
[current layer = message0]
@jump target= *problem
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
 [font color="0xffaa00"][link target="&'*'+mp.target"]%mes[endlink][resetfont]
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
[glink name="&'glink'+ f.butid" x="&sf.butposx[f.butid]" y="&sf.butposy[f.butid]" width="&sf.butw" font_color=%font_color|white opacity=0 text=%mes target="&'*'+ mp.target"]
[fbutton name="&'glink'+ f.butid"]
[eval exp="f.butid += 1"]
[endif]
[endmacro]

;戻るボタン出す
[macro name = showback]
[glink name="glinkb" color="gray" x="845" y="400" width="75" opacity=0 text="戻る" target="*problem"]
[fbutton name="glinkb"]
[endmacro]

;質問ボタン出す target必須
[macro name = showask]
[glink name="glinka" x="&sf.askbx" y="&sf.askby" text="質問する" width="&sf.askbw" target="&'*'+ mp.target"]
[glink name="glinkb" x="&sf.noaskbx" y="&sf.noaskby" color = "gray" width="&sf.askbw" text="戻る" target="*problem"]
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
[button graphic="button/決定ボタン.png" enterimg="button/決定ボタンpush.png" x="528" y="370" width="230" height="37"  target="&'*'+f.tagname+'C'"]
[glink name="glink7" color="gray" x="845" y="400" width="75" opacity=0 text="戻る" target="*入力戻る"]
[s]
[endmacro]

[macro name = inputC]
[commit]
[cm]
[current layer = message1]
;ひらがなチェック--------------------------------------------
[if exp="!f.qname.match(/^[ぁ-んー　]*$/) || !f.qname"]
ひらがなで入力してください。
[jump target = "&'*'+f.tagname+'E'"]
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
@jump target= *problem
[endmacro]


;-----------------------------------------------
;１問題出し
[withse  mes=吾輩は猫である][l][r][r]
[withse  mes=吾輩は猫である。名前はまだ無い。][l][r] 
[withse  mes=どこで生まれたかとんと見当がつかぬ。][l][r]
[withse  mes=何でも薄暗いじめじめした所でニャーニャー泣いていた事だけは記憶している。][l][r]
[withse  mes=吾輩はここで始めて人間というものを見た。][l][r]
[delay  speed="100"]
[withse  slow=true mes=何故だろうか？][l]
[resetdelay ]

;２ゲーム準備
[startgame]

;３鍵準備
[showkey id = 1]
[wait time=100]
[showkey id = 2]

;４BGM開始
[playbgm  storage="bgm_maoudamashii_piano32.mp3"]
[bgmopt volume="&sf.bgmvol"]

;５ゲーム開始(fade遅)
[nowait]
[er]
吾輩は猫である[r][r]
[problink mes='吾輩' target='吾輩']は猫である。名前はまだ無い。[r] 
どこで生まれたかとんと見当がつかぬ。[r]
何でも薄暗いじめじめした所でニャーニャー泣いていた事だけは記憶している。[r]
[problink mes='吾輩' target='吾輩']はここで始めて[problink mes='人間' target='人間']というものを見た。[r]
何故だろうか？
[endnowait]
[anim layer="message0" time="800" opacity="255"]
[wait time= "3000"]
[mtalk mes = 'オレンジ色の文字を選んで、質問を始めましょう。' pose =true]
[s]

*problem
[nowait]
[er]
吾輩は猫である[r][r]
[problink mes='吾輩' target='吾輩']は猫である。名前はまだ無い。[r] 
どこで生まれたかとんと見当がつかぬ。[r]
何でも薄暗いじめじめした所でニャーニャー泣いていた事だけは記憶している。[r]
[problink mes='吾輩' target='吾輩']はここで始めて[problink mes='人間' target='人間']というものを見た。[r]
何故だろうか？
[endnowait]
[anim layer="message0" time="100" opacity="255"]
[s]

*人間 
[beginchoice mes = '人間']
[showbutton mes="生物" target="人間生物"]
[showbutton mes="入力" font_color="orange" target="人間入力"]
[showback]
[endchoice]

*吾輩 
[beginchoice mes = '吾輩']
[showbutton mes="猫" target="吾輩猫"]
[showbutton mes="猫" target="吾輩猫"]
[showbutton mes="猫" target="吾輩猫"]
[showbutton mes="猫" target="吾輩猫"]
[showbutton mes="猫" target="吾輩猫" cond="f.flag[0]"]
[showbutton mes="猫" target="吾輩猫"]
[showbutton mes="猫" target="吾輩猫"]
[showbutton mes="猫" target="吾輩猫test"]
[showback]
[endchoice]

*人間生物
[beginchoice mes=人間とは生物ですか？]
[showask target="ans1"]
[endchoice]

*吾輩猫
[beginchoice mes=吾輩は本当に猫ですか？]
[showask target="吾輩猫答え"]
[endchoice]

*吾輩猫答え
[beginanswer question="吾輩は本当に猫ですか？"]
[mans mes='はい。']
[eval exp= "f.flag[0]=true"]
[merase]
[endanswer]

*ans1
[beginanswer question="人間とは生物ですか？"]
[mans mes='はい。']
[merase]
[endanswer]

*吾輩猫test
[beginchoice mes=吾輩は本当に猫ですか？]
[showask target="吾輩猫答えtest"]
[endchoice]

*吾輩猫答えtest
[beginanswer question="吾輩は本当に猫ですか？"]
[mans mes='はい。' wait="&f.key[1] == false"]
[getkey id=1]
[merase]
[endanswer]

;-------------入力テンプレ(4tags+4consts+answer)----------------------
*人間入力
[iscript]
  	f.tagname = '人間入力'
	f.question1 = '人間の名前は'
	f.question2 = 'ですか？'
	f.answers = ['たかし','たけし']
[endscript]
[begininput]
*人間入力E
[inputE]
*人間入力C
[inputC]
*人間入力A
[addlog mes= "&f.question1 + '「' + f.qname+'」'+f.question2"]
[if exp= "f.answers.indexOf(f.qname) != -1"]

;YES処理
[mans mes='はい。' wait="&!f.key[2]"]
[getkey id=2]

[else]
;NO処理
[mans mes='いいえ。']

[endif]
[merase]
[endinput]
;----------------------------------------------------



*入力戻る
[cm]
[eval exp="f.qname = ''"]
[current layer = message0]
@jump target= *problem
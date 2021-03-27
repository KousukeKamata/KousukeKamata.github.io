*start 
[hidemenubutton]
[nolog]
[bg storage="dinner-table-444434_1920.jpg"  time="300"]
[position layer=message0 width=1100 height=450 top=60 left=70 frame="メッセージ.png" opacity="255" lmargin = 10]
[position layer=message1 width=1100 height=200 top=520 left=70 frame="メッセージ.png"   opacity="255" lmargin = 10]
[layopt layer=message1 visible=true]

[l]
[playse  storage="メッセージ表示音1.mp3" volume="50"]
吾輩は猫である[stopse][l][r][r]

[playse  storage="メッセージ表示音1.mp3" volume="50"]
吾輩は猫である。名前はまだ無い。[stopse][l][r] 
[playse  storage="メッセージ表示音1.mp3" volume="50"]
どこで生まれたかとんと見当がつかぬ。[stopse][l][r]
[playse  storage="メッセージ表示音1.mp3" volume="50"]
何でも薄暗いじめじめした所でニャーニャー泣いていた事だけは記憶している。[stopse][l][r]
[playse  storage="メッセージ表示音1.mp3" volume="50"]
吾輩はここで始めて人間というものを見た。[stopse][l][r]
[delay  speed="100"]
[playse  storage="メッセージ表示音slow.mp3" volume="50"]
何故だろうか？[stopse][l]
[resetdelay ]

[current layer = message1]
[layopt layer=message1 visible=true]

[image layer=message1 top="545" left="95" width=150 height=150 storage="chara/managerwindow.png" zindex="101" name="winman" time = "50"]
_　　　　　　　ゲーム開始です。[l][er]
[free layer=message1 name="winman"  time="100"]

[current layer = message0]
[anim layer=message0 time="100" opacity="0"]
[playbgm  storage="bgm_maoudamashii_piano32.mp3" volume="30"]

*problem
[nowait]
[er]
吾輩は猫である[r][r]
[font color="0xffaa00"][link target=*吾輩]吾輩[endlink][resetfont]は猫である。名前はまだ無い。[r] 
どこで生まれたかとんと見当がつかぬ。[r]
何でも薄暗いじめじめした所でニャーニャー泣いていた事だけは記憶している。[r]
[font color="0xffaa00"][link target=*吾輩]吾輩[endlink][resetfont]はここで始めて[font color="0xffaa00"][link target=*select1]人間[endlink][resetfont]というものを見た。[r]
何故だろうか？
[endnowait]
[anim layer="message0" time="100" opacity="255"]
[s]

*select1 
[anim layer="message0" time="300" opacity=" 0"]
[current layer = message1]
人間
[current layer = message0]
[glink name="glink1" x="280" y="200" opacity=0 text="生物" target="*select2"]
[glink name="glink2" x="280" y="400" opacity=0 text="戻る" target="*problem"]
[anim name=glink1 time=1 opacity=0]
[anim name=glink2 time=1 opacity=0]
[anim name=glink1 time=300 opacity=255]
[anim name=glink2 time=300 opacity=255]
[s]

*吾輩 
[anim layer="message0" time="300" opacity=" 0"]
[current layer = message1]
吾輩
[current layer = message0]
[glink name="glink1" x="280" y="200" opacity=0 text="猫" target="*吾輩猫"]
[glink name="glink2" x="280" y="400" opacity=0 text="戻る" target="*problem"]
[anim name=glink1 time=1 opacity=0]
[anim name=glink2 time=1 opacity=0]
[anim name=glink1 time=300 opacity=255]
[anim name=glink2 time=300 opacity=255]
[s]

*select2
[current layer = message1]
人間とは生物ですか？
[current layer = message0]
[glink name="glink1" x="280" y="200" text="質問する" target="*ans1"]
[glink name="glink2" x="280" y="400" text="戻る" target="*problem"]
[anim name=glink1 time=1 opacity=0]
[anim name=glink2 time=1 opacity=0]
[anim name=glink1 time=300 opacity=255]
[anim name=glink2 time=300 opacity=255]
[s]

*吾輩猫
[current layer = message1]
吾輩は本当に猫ですか？
[current layer = message0]
[glink name="glink1" x="280" y="200" text="質問する" target="*吾輩猫答え"]
[glink name="glink2" x="280" y="400" text="戻る" target="*problem"]
[anim name=glink1 time=1 opacity=0]
[anim name=glink2 time=1 opacity=0]
[anim name=glink1 time=300 opacity=255]
[anim name=glink2 time=300 opacity=255]
[s]

[cm] 
「選択肢２」がクリックされました[l] 
@jump target=*common 

*吾輩猫答え
[current layer = message1]
[image layer=message1 top="545" left="95" width=150 height=150 storage="chara/managerwindow.png" zindex="101" name="winman" time = "50"]
_　　　　　　　はい。
[l][er]
[endnolog]
[pushlog  text="吾輩は本当に猫ですか？"]
[pushlog  text="はい。"]
[nolog]
[free layer=message1 name="winman"  time="100"]
[current layer = message0]
@jump target= *problem

*ans1
[current layer = message1]
[image layer=message1 top="545" left="95" width=150 height=150 storage="chara/managerwindow.png" zindex="101" name="winman" time = "50"]
_　　　　　　　はい。
[l][er]
[endnolog]
[pushlog text="人間とは生物ですか？"]
[pushlog text="はい。"]
[nolog]
[free layer=message1 name="winman"  time="100"]
[current layer = message0]
@jump target= *problem


*common  
[anim layer="message0" time="300" opacity="255"]
共通ルートです 

*start

;０準備
[beginprobscene ksname = 'scene1' ksnameans = 'scene2']

;１問題出し
[withse  mes=吾輩は猫である][l][r][r]
[withse  mes=吾輩は猫である。名前はまだ無い。][l][r] 
[withse  mes=どこで生まれたかとんと見当がつかぬ。][l][r]
[withse  mes=何でも薄暗いじめじめした所でニャーニャー泣いていた事だけは記憶している。][l][r]
[withse  mes=吾輩はここで始めて人間というものを見た。][l][r]
[delay  speed="100"]
[withse  slow=true mes=何故だろうか？][l]
[resetdelay]

;２ゲーム準備
[startgame]

;３鍵準備
[showkey id = 1]
[wait time=100]
[showkey id = 2]

;４BGM開始
[probbgm]

;５ゲーム開始prob
[nowait]
[er]
吾輩は猫である[r][r]
[problink mes='吾輩' target='吾輩']は猫である。名前はまだ無い。[r] 
どこで生まれたかとんと見当がつかぬ。[r]
何でも薄暗いじめじめした所でニャーニャー泣いていた事だけは記憶している。[r]
[problink mes='吾輩' target='吾輩']はここで始めて[problink mes='人間' target='人間']というものを見た。[r]
何故だろうか？
[endnowait]
[showprob time="800"]
[wait time= "3000"]
[mtalk mes = 'オレンジ色の文字を選んで、質問を始めましょう。' pose =true]
[endprob]

;６restart位置の設置
*restart
[restart]

;７問題記述
*problem
[beginprob]
吾輩は猫である[r][r]
[problink mes='吾輩' target='吾輩']は猫である。名前はまだ無い。[r] 
どこで生まれたかとんと見当がつかぬ。[r]
何でも薄暗いじめじめした所でニャーニャー泣いていた事だけは記憶している。[r]
[problink mes='吾輩' target='吾輩']はここで始めて[problink mes='人間' target='人間']というものを見た。[r]
何故だろうか？
[showprob time="100"]
[endprob]

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

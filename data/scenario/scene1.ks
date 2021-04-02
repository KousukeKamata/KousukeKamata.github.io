*start

;０準備
[beginprobscene ksname = 'scene1' ksnameans = 'scene2']

;１問題出し
[withse  mes=黙認する目撃者][l][r][r]
[withse  mes=男の悲鳴が聞こえた。][l][r] 
[withse  mes=男の同僚が向かうとそこに男が倒れており、頭を中心に赤いものが広がっていた。][l][r]
[withse  mes=しかし同僚は、救急車や警察を呼ばずに、そのままそこを離れてしまった。][l][r]
[delay  speed="100"]
[withse  slow=true mes=いったいなぜ？][l]
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
黙認する目撃者[r][r]
[problink mes='男']の悲鳴が聞こえた。[r] 
[problink mes='男の同僚' target='同僚']が向かうと[problink mes='そこ']に[problink mes='男']が倒れており、頭を中心に[problink mes='赤いもの']が広がっていた。[r]
しかし[problink mes='同僚']は、救急車や警察を呼ばずに、そのまま[problink mes='そこ']を離れてしまった。[r]
いったいなぜ？
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
黙認する目撃者[r][r]
[problink mes='男']の悲鳴が聞こえた。[r] 
[problink mes='男の同僚' target='同僚']が向かうと[problink mes='そこ']に[problink mes='男']が倒れており、頭を中心に[problink mes='赤いもの']が広がっていた。[r]
しかし[problink mes='同僚']は、救急車や警察を呼ばずに、そのまま[problink mes='そこ']を離れてしまった。[r]
いったいなぜ？
[showprob time="100"]
[endprob]

*男
[beginchoice mes = '男']
[showbutton mes="同僚" target="男同僚"]
[showbutton mes="家族構成" target="男家族構成"]
[showbutton mes="職業" target="男職業"]
[showbutton mes="死亡" target="男死亡"]
[showbutton mes="同僚以外" target="男同僚以外"]
[showbutton mes="悲鳴" target="男悲鳴"]
[showbutton mes="勤務中" target="男勤務中"]
[showback]
[endchoice]

*そこ
[beginchoice mes = 'そこ']
[showbutton mes="屋内" target="そこ屋内"]
[showbutton mes="屋外" target="そこ屋外"]
[showbutton mes="部屋" target="そこ部屋"]
[showbutton mes="他の人間" target="そこ他の人間"]
[showback]
[endchoice]

*赤いもの
[beginchoice mes = '赤いもの']
[showbutton mes="入力" target="赤いもの入力" font_color="orange"]
[showbutton mes="液体" target="赤いもの液体"]
[showbutton mes="固体" target="赤いもの固体"]
[showback]
[endchoice]

*同僚
[beginchoice mes = '同僚']
[showbutton mes="男" target="同僚男"]
[showbutton mes="家族構成" target="同僚家族構成"]
[showbutton mes="悲鳴" target="同僚悲鳴"]
[showbutton mes="職業" target="同僚職業"]
[showbutton mes="赤いもの" target="同僚赤いもの"]
[showbutton mes="離れた理由" target="同僚出ていく"]
[showbutton mes="連絡" target="同僚連絡"]
[showbutton mes="他の質問" target="同僚他の質問"]
[showback]
[endchoice]

*男同僚
[beginchoice mes = '男→同僚']
[showbutton mes="仲良し" target="男同僚仲良し"]
[showback]
[endchoice]
*男家族構成
[beginchoice mes = '男→家族構成']
[showbutton mes="結婚" target="男家族構成結婚"]
[showbutton mes="双子" target="男家族構成双子"]
[showback]
[endchoice]
*男職業
[beginchoice mes = '男→職業']
[showbutton mes="入力" target="男職業入力" font_color="orange"]
[showback]
[endchoice]
*男死亡
[beginchoice mes = '男は死亡していた？']
[showask target="男死亡a"]
[endchoice]
*男死亡a
[beginanswer question="男は死亡していた？"]
[mans mes='いいえ。' wait="&!f.flag[0]"]
[eval exp="f.flag[0]=true"]
[endanswer]
*男同僚以外
[beginchoice mes = '男の近くに同僚以外の人間がいた？']
[showask target="男同僚以外a"]
[endchoice]
*男同僚以外a
[beginanswer question="男の近くに同僚以外の人間がいた？"]
[mans mes='いいえ。']
[endanswer]
*男悲鳴
[beginchoice mes = '男→悲鳴']
[showbutton mes="悲しみ" target="男悲鳴悲しみ"]
[showbutton mes="驚き" target="男悲鳴驚き"]
[showbutton mes="恐怖" target="男悲鳴恐怖"]
[showbutton mes="目撃" target="男悲鳴目撃"]
[showbutton mes="襲撃" target="男悲鳴襲撃"]
[showbutton mes="転落" target="男悲鳴転落"]
[showback]
[endchoice]
*男勤務中
[beginchoice mes = '男は勤務中だった？']
[showask target="男勤務中a"]
[endchoice]
*男勤務中a
[beginanswer question="男は勤務中だった？"]
[mans mes='はい。']
[endanswer]

*そこ屋内
[beginchoice mes = 'そこは屋内だった？']
[showask target="そこ屋内a"]
[endchoice]
*そこ屋内a
[beginanswer question="そこは屋内だった？"]
[mans mes='はい。']
[endanswer]
*そこ屋外
[beginchoice mes = 'そこは屋外だった？']
[showask target="そこ屋外a"]
[endchoice]
*そこ屋外a
[beginanswer question="そこは屋外だった？"]
[mans mes='いいえ。']
[endanswer]
*そこ部屋
[beginchoice mes = 'そこは部屋の中だった？']
[showask target="そこ部屋a"]
[endchoice]
*そこ部屋a
[beginanswer question="そこは部屋の中だった？"]
[mans mes='はい。']
[endanswer]
*そこ他の人間
[beginchoice mes = 'そこに男の他の人間はいた？']
[showask target="そこ他の人間a"]
[endchoice]
*そこ他の人間a
[beginanswer question="そこに男の他の人間はいた？"]
[mans mes='いいえ。']
[endanswer]

*赤いもの入力
[iscript]
  	f.tagname = '赤いもの入力'
	f.question1 = '赤いものは'
	f.question2 = 'だった？'
	f.answers = ['いんく','ぺんき','とりょう']
[endscript]
[begininput]
*赤いもの入力E
[inputE]
*赤いもの入力C
[inputC]
*赤いもの入力A
[addlog mes= "&f.question1 + '「' + f.qname+'」'+f.question2"]
[if exp= "f.answers.indexOf(f.qname) != -1"]
;YES処理
[mans mes='はい。' wait="&!f.key[1]"]
[getkey id=1]
[else]
;NO処理
[mans mes='いいえ。']
[endif]
[merase]
[endinput]
*赤いもの液体
[beginchoice mes = '赤いものは液体だった？']
[showask target="赤いもの液体a"]
[endchoice]
*赤いもの液体a
[beginanswer question="赤いものは液体だった？"]
[mans mes='はい。']
[endanswer]
*赤いもの固体
[beginchoice mes = '赤いものは固体だった？']
[showask target="赤いもの固体a"]
[endchoice]
*赤いもの固体a
[beginanswer question="赤いものは固体だった？"]
[mans mes='いいえ。']
[endanswer]

*同僚男
[beginchoice mes = '同僚→男']
[showbutton mes="仲良し" target="同僚男仲良し"]
[showbutton mes="死亡" target="同僚男死亡"]
[showbutton mes="生きている" target="同僚男生きている" cond="f.flag[0]"]
[showbutton mes="襲った" target="同僚男襲った"]
[showback]
[endchoice]
*同僚家族構成
[beginchoice mes = '同僚→家族構成']
[showbutton mes="結婚" target="同僚家族構成結婚"]
[showbutton mes="双子" target="同僚家族構成双子"]
[showback]
[endchoice]
*同僚悲鳴
[beginchoice mes = '同僚→悲鳴']
[showbutton mes="聞いた" target="同僚悲鳴聞いた"]
[showbutton mes="原因" target="同僚悲鳴原因"]
[showback]
[endchoice]
*同僚職業
[beginchoice mes = '同僚→職業']
[showbutton mes="入力" target="同僚職業入力" font_color="orange"]
[showback]
[endchoice]
*同僚赤いもの
[beginchoice mes = '同僚→赤いもの']
[showbutton mes="見た" target="同僚赤いもの見た"]
[showbutton mes="正体" target="同僚赤いもの正体"  cond="f.key[1]"]
[showback]
[endchoice]
*同僚出ていく
[beginchoice mes = '同僚→離れた理由']
[showbutton mes="逃走" target="同僚出ていく逃走"]
[showbutton mes="恐怖" target="同僚出ていく恐怖"]
[showbutton mes="焦り" target="同僚出ていく焦り"]
[showbutton mes="呆れて" target="同僚出ていく呆れて"]
[showbutton mes="怒り" target="同僚出ていく怒り"]
[showbutton mes="物を取る" target="同僚出ていく物を取る"]
[showbutton mes="物入力" target="同僚出ていく物入力" font_color="orange" cond="f.flag[1]"]
[showback]
[endchoice]
*同僚連絡
[beginchoice mes = '同僚→連絡']
[showbutton mes="不可能" target="同僚連絡不可能"]
[showbutton mes="不必要" target="同僚連絡不必要"]
[showback]
[endchoice]
*同僚他の質問
[beginchoice mes = '同僚→他の質問']
[showbutton mes="携帯電話" target="同僚他の質問携帯電話"]
[showbutton mes="勤務中" target="同僚他の質問勤務中"]
[showbutton mes="死亡" target="同僚他の質問死亡"]
[showback]
[endchoice]
  
*男同僚仲良し
[beginchoice mes = '男と同僚の仲は良かった？']
[showask target="男同僚仲良しa"]
[endchoice]
*男家族構成結婚
[beginchoice mes = '男は結婚していた？']
[showask target="男家族構成結婚a"]
[endchoice]
*男家族構成双子
[beginchoice mes = '男は双子だった？']
[showask target="男家族構成双子a"]
[endchoice]
*男職業入力
[iscript]
  	f.tagname = '男職業入力'
	f.question1 = '男の職業は'
	f.question2 = 'だった？'
	f.answers = ['ぎょうしゃ','とそうぎょうしゃ']
[endscript]
[begininput]
*男職業入力E
[inputE]
*男職業入力C
[inputC]
*男職業入力A
[addlog mes= "&f.question1 + '「' + f.qname+'」'+f.question2"]
[if exp= "f.answers.indexOf(f.qname) != -1"]
;YES処理
[mans mes='はい。']
[else]
;NO処理
[mans mes='いいえ。']
[endif]
[merase]
[endinput]
*男悲鳴悲しみ
[beginchoice mes = '男が悲鳴をあげたのは悲しかったから？']
[showask target="男悲鳴悲しみa"]
[endchoice]
*男悲鳴驚き
[beginchoice mes = '男が悲鳴をあげたのは驚いたから？']
[showask target="男悲鳴驚きa"]
[endchoice]
*男悲鳴恐怖
[beginchoice mes = '男が悲鳴をあげたのは恐怖したから？']
[showask target="男悲鳴恐怖a"]
[endchoice]
*男悲鳴目撃
[beginchoice mes = '男が悲鳴をあげたのは何かを目撃したから？']
[showask target="男悲鳴目撃a"]
[endchoice]
*男悲鳴襲撃
[beginchoice mes = '男が悲鳴をあげたのは誰かに襲われたから？']
[showask target="男悲鳴襲撃a"]
[endchoice]
*男悲鳴転落
[beginchoice mes = '男が悲鳴をあげたのは転落したから？']
[showask target="a"]
[endchoice]

*男同僚仲良しa
[beginanswer question="男と同僚の仲は良かった？"]
[mans mes='関係ありません。']
[endanswer]
*男家族構成結婚a
[beginanswer question="男は結婚していた？"]
[mans mes='関係ありません。']
[endanswer]
*男家族構成双子a
[beginanswer question="男は双子だった？"]
[mans mes='関係ありません。']
[endanswer]
*男悲鳴悲しみa
[beginanswer question="男が悲鳴をあげたのは悲しかったから？"]
[mans mes='いいえ。']
[endanswer]
*男悲鳴驚きa
[beginanswer question="男が悲鳴をあげたのは驚いたから？"]
[mans mes='はい。']
[endanswer]
*男悲鳴恐怖a
[beginanswer question="男が悲鳴をあげたのは恐怖したから？"]
[mans mes='はい。']
[endanswer]
*男悲鳴目撃a
[beginanswer question="男が悲鳴をあげたのは何かを目撃したから？"]
[mans mes='いいえ。']
[endanswer]
*男悲鳴襲撃a
[beginanswer question="男が悲鳴をあげたのは誰かに襲われたから？"]
[mans mes='いいえ。']
[endanswer]
*男悲鳴転落a
[beginanswer question="男が悲鳴をあげたのは転落したから？"]
[mans mes='はい。']
[endanswer]


*同僚男仲良し
[beginchoice mes = '同僚と男の仲は良かった？']
[showask target="同僚男仲良しa"]
[endchoice]
*同僚男死亡
[beginchoice mes = '同僚が男を見た時、男は死んでいた？']
[showask target="同僚男死亡a"]
[endchoice]
*同僚男生きている
[beginchoice mes = '同僚は男が生きていると気づいていた？']
[showask target="同僚男生きているa"]
[endchoice]
*同僚男襲った
[beginchoice mes = '同僚が男を襲った犯人だった？']
[showask target="同僚男襲ったa"]
[endchoice]
*同僚家族構成結婚
[beginchoice mes = '同僚は結婚していた？']
[showask target="同僚家族構成結婚a"]
[endchoice]
*同僚家族構成双子
[beginchoice mes = '同僚は双子だった？']
[showask target="同僚家族構成双子a"]
[endchoice]
*同僚悲鳴聞いた
[beginchoice mes = '同僚は悲鳴を聞いた？']
[showask target="同僚悲鳴聞いたa"]
[endchoice]
*同僚悲鳴原因
[beginchoice mes = '同僚は悲鳴の原因を既に知っていた？']
[showask target="同僚悲鳴原因a"]
[endchoice]
*同僚職業入力
[iscript]
  	f.tagname = '同僚職業入力'
	f.question1 = '同僚の職業は'
	f.question2 = 'だった？'
	f.answers = ['ぎょうしゃ','とそうぎょうしゃ']
[endscript]
[begininput]
*同僚職業入力E
[inputE]
*同僚職業入力C
[inputC]
*同僚職業入力A
[addlog mes= "&f.question1 + '「' + f.qname+'」'+f.question2"]
[if exp= "f.answers.indexOf(f.qname) != -1"]
;YES処理
[mans mes='はい。']
[else]
;NO処理
[mans mes='いいえ。']
[endif]
[merase]
[endinput]
*同僚赤いもの見た
[beginchoice mes = '同僚は赤いものを見た？']
[showask target="同僚赤いもの見たa"]
[endchoice]
*同僚赤いもの正体
[beginchoice mes = '同僚は赤いものの正体を知っていた？']
[showask target="同僚赤いもの正体a"]
[endchoice]
*同僚出ていく逃走
[beginchoice mes = '同僚が場を離れたのは逃走のため？']
[showask target="同僚出ていく逃走a"]
[endchoice]
*同僚出ていく恐怖
[beginchoice mes = '同僚が場を離れたのは恐怖のため？']
[showask target="同僚出ていく恐怖a"]
[endchoice]
*同僚出ていく焦り
[beginchoice mes = '同僚が場を離れたのは焦りのため？']
[showask target="同僚出ていく焦りa"]
[endchoice]
*同僚出ていく呆れて
[beginchoice mes = '同僚が場を離れたのは呆れたため？']
[showask target="同僚出ていく呆れてa"]
[endchoice]
*同僚出ていく怒り
[beginchoice mes = '同僚が場を離れたのは何かに怒ったため？']
[showask target="同僚出ていく怒りa"]
[endchoice]
*同僚出ていく物を取る
[beginchoice mes = '同僚が場を離れたのは物を取りにいくため？']
[showask target="同僚出ていく物を取るa"]
[endchoice]
*同僚出ていく物入力
[iscript]
  	f.tagname = '同僚出ていく物入力'
	f.question1 = '同僚が場を離れたのは'
	f.question2 = 'を取りにいくため？'
	f.answers = ['もっぷ','そうじようぐ','せいそうようぐ','ふくもの','そうじどうぐ','せいそうどうぐ']
[endscript]
[begininput]
*同僚出ていく物入力E
[inputE]
*同僚出ていく物入力C
[inputC]
*同僚出ていく物入力A
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
*同僚連絡不可能
[beginchoice mes = '同僚が連絡しなかったのは、不可能だったから？']
[showask target="同僚連絡不可能a"]
[endchoice]
*同僚連絡不必要
[beginchoice mes = '同僚が連絡しなかったのは、不必要だったから？']
[showask target="同僚連絡不必要a"]
[endchoice]
*同僚他の質問携帯電話
[beginchoice mes = '同僚は携帯電話を持っていた？']
[showask target="同僚他の質問携帯電話a"]
[endchoice]
*同僚他の質問勤務中
[beginchoice mes = '同僚は勤務中だった？']
[showask target="同僚他の質問勤務中a"]
[endchoice]
*同僚他の質問死亡
[beginchoice mes = '同僚は既に死亡していた？']
[showask target="同僚他の質問死亡a"]
[endchoice]

*同僚男仲良しa
[beginanswer question="同僚と男の仲は良かった？"]
[mans mes='関係ありません。']
[endanswer]
*同僚男死亡a
[beginanswer question="同僚が男を見た時、男は死んでいた？"]
[mans mes='いいえ。' wait="&!f.flag[0]"]
[eval exp="f.flag[0]=true"]
[endanswer]
*同僚男生きているa
[beginanswer question="同僚は男が生きていると気づいていた？"]
[mans mes='はい。']
[endanswer]
*同僚男襲ったa
[beginanswer question="同僚が男を襲った犯人だった？"]
[mans mes='いいえ。']
[endanswer]
*同僚家族構成結婚a
[beginanswer question="同僚は結婚していた？"]
[mans mes='関係ありません。']
[endanswer]
*同僚家族構成双子a
[beginanswer question="同僚は双子だった？"]
[mans mes='関係ありません。']
[endanswer]
*同僚悲鳴聞いたa
[beginanswer question="同僚は悲鳴を聞いた？"]
[mans mes='はい。']
[endanswer]
*同僚悲鳴原因a
[beginanswer question="同僚は悲鳴の原因を既に知っていた？"]
[mans mes='いいえ。']
[endanswer]
*同僚赤いもの見たa
[beginanswer question="同僚は赤いものを見た？"]
[mans mes='はい。']
[endanswer]
*同僚赤いもの正体a
[beginanswer question="同僚は赤いものの正体を知っていた？"]
[mans mes='はい。']
[endanswer]
*同僚出ていく逃走a
[beginanswer question="同僚が場を離れたのは逃走のため？"]
[mans mes='いいえ。']
[endanswer]
*同僚出ていく恐怖a
[beginanswer question="同僚が場を離れたのは恐怖のため？"]
[mans mes='いいえ。']
[endanswer]
*同僚出ていく焦りa
[beginanswer question="同僚が場を離れたのは焦りのため？"]
[mans mes='はい。']
[endanswer]
*同僚出ていく呆れてa
[beginanswer question="同僚が場を離れたのは呆れたため？"]
[mans mes='いいえ。']
[endanswer]
*同僚出ていく怒りa
[beginanswer question="同僚が場を離れたのは何かに怒ったため？"]
[mans mes='いいえ。']
[endanswer]
*同僚出ていく物を取るa
[beginanswer question="同僚が場を離れたのは物を取りにいくため？"]
[mans mes='はい。' wait="&!f.flag[1]"]
[if exp="!f.flag[1]"]
[mtalk mes='その内容が聞けるようになりました。']
[eval exp="f.flag[1]=true"]
[endif]
[endanswer]
*同僚連絡不可能a
[beginanswer question="同僚が連絡しなかったのは、不可能だったから？"]
[mans mes='いいえ。']
[endanswer]
*同僚連絡不必要a
[beginanswer question="同僚が連絡しなかったのは、不必要だったから？"]
[mans mes='はい。']
[endanswer]
*同僚他の質問携帯電話a
[beginanswer question="同僚は携帯電話を持っていた？"]
[mans mes='はい。']
[endanswer]
*同僚他の質問勤務中a
[beginanswer question="同僚は勤務中だった？"]
[mans mes='はい。']
[endanswer]
*同僚他の質問死亡a
[beginanswer question="同僚は既に死亡していた？"]
[mans mes='いいえ。']
[endanswer]


;-------------こたえテンプレ----------------------
*a
[beginanswer question=""]
[mans mes='はい。']
[mans mes='いいえ。']
[endanswer]
;-------------askテンプレ----------------------
[beginchoice mes = '']
[showask target="a"]
[endchoice]

;-------------入力テンプレ(4tags+4consts+answer)----------------------
*templ
[iscript]
  	f.tagname = ''
	f.question1 = ''
	f.question2 = ''
	f.answers = ['','']
[endscript]
[begininput]
*E
[inputE]
*C
[inputC]
*A
[addlog mes= "&f.question1 + '「' + f.qname+'」'+f.question2"]
[if exp= "f.answers.indexOf(f.qname) != -1"]
;YES処理
[mans mes='はい。' wait="&!f.key[2]"]
;[getkey id=2]
[else]
;NO処理
[mans mes='いいえ。']
[endif]
[merase]
[endinput]
;----------------------------------------------------

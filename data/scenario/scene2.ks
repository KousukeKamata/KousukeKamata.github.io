*start

;０準備
[prepareans]

;１フラグ用意
[eval exp="f.ansflag = [false,false]"]

;２内容開始

[beginq id=1 mes='同僚が男を発見したとき']
[showchoice mes='【1】男は既に死亡していた。' target='ans1'][r]
[showchoice mes='【2】男はまだ生きていた。' target='ans2']
[endq]

*ans2
[eval exp="f.ansflag[0] = true"]
*ans1
[beginq id=2 mes='同僚が掃除用具を取りに行ったのは']
[showchoice mes='【1】あるものを掃除する為だった。' target='ans01'][r]
[showchoice mes='【2】掃除以外の目的があった。' target='ans02']
[endq]
 
*ans01
[beginq id=3 mes='そのあるものとは']
[iscript]
  	f.tagname = 'ans01'
	f.answers = ['いんく','ぺんき','とりょう']
[endscript]
[begininputA]
*ans01E
[inputAE]
*ans01C
[inputAC]
[if exp= "f.answers.indexOf(f.ansinput) != -1"]
;YES処理
[eval exp="f.ansflag[1] = true"]
[else]
;NO処理
[endif]
[jump target= "*goal" storage="&f.ksnameans"]
[endq]

*ans02
[beginq id=3 mes='掃除以外の目的とは、']
[iscript]
  	f.tagname = 'ans02'
	f.answers = ['']
[endscript]
[begininputA]
*ans02E
[inputAE]
*ans02C
[inputAC]
[if exp= "f.answers.indexOf(f.ansinput) != -1"]
;YES処理
[else]
;NO処理
[endif]
[jump target= "*goal" storage="&f.ksnameans"]
[endq]

*ans001
[eval exp="f.ansflag[1] = true"]
*goal
[if exp="f.ansflag.every(value => value)"]
[free layer="message1" name="question"]
[mtext layer="message1" text='クリア' size="60" x="40"  y="200"  width="1200"  align="center" in_sync="true"  name="question"  fadeout="false"]
[else]
[free layer="message1" name="question"]
[mtalk mes = '間違っているようです。']
[jump storage="&f.ksname" target='*restart']
[merase]
[endif]
[s]
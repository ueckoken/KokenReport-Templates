#let main(
  no:"XX",
  title:"部報サンプル",author:"工研太郎",brief:"Hello from typst!",
  serif:"Noto Serif CJK JP",
  sansserif:"Noto Sans CJK JP",
  monospace:"Monaspace Argon",
  body
)={
  set page(
    paper:"a4",margin:(top:1.3in,x:0.787in,bottom:1.18in),
    header-ascent:1em,footer-descent:1em,
    header:grid(columns:(auto,1fr,auto),stroke:(bottom:0.5pt),inset:(bottom:8pt))[][][工学研究部 部報 #no 号],
    footer:grid(columns:(auto,1fr,auto),stroke:(top:0.5pt),inset:(top:8pt))[電気通信大学 工学研究部][][
      #align(right)[
        #link("https://koken.club.uec.ac.jp/")\
        #link("ueckoken@gmail.com")
      ]
    ]
  )
  set par(first-line-indent:(amount:1em,all:true))
  set text(
    lang:"ja",region:"jp",
    font:serif,size:12pt
  )
  set heading(numbering:"1.")
  show heading:x=>text(font:sansserif,x)
  show heading.where(level:1):x=>text(size:13pt,x)
  show heading.where(level:2):x=>text(size:12pt,x)
  show link:x=>text(font:monospace,size:9pt,x)
  show raw:x=>text(font:monospace,x)

  v(2em)
  align(center)[
    #text(size:20pt,font:sansserif,title)#v(1em)
    #text(size:14pt,font:sansserif,author)#v(1em)
    #box(inset:(x:2em),text(size:10pt,brief))#v(1em)
  ]
  show:columns.with(2)
  body
}

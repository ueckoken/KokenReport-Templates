#let rem = 12pt*0.924715 // ltjsclassesの12ptは12ptではない
#let mpt = rem/10
#let rlh = 16*mpt;
#let rls = rlh - rem

#let main(
  no:"XX",
  title:"部報サンプル",author:"工研太郎",brief:"Hello from typst!",
  serif:("New Computer Modern", "Noto Serif CJK JP", "Noto Serif JP"), // = LuaTeX(-ja)標準 (Latin Modern Roman, 源ノ明朝)
  sansserif:("Noto Sans CJK JP", "Noto Sans JP"), // = LuaTeX-ja標準 (源ノ角ゴシック)
  monospace:("DejaVu Sans Mono"), // ≠ LuaTeX標準 (Latin Modern Mono?)
  body
)={
  set page(
    paper: "a4", margin: (top: 1.3in, x: 0.787in, bottom: 1.18in), // LaTeXテンプレの謎の値
    header-ascent: 1cm - 1.38*rem, // ltjsarticleのheadsep = footskip(A4で1cm) - topskip(1.38zh), 
    footer-descent: 1cm - rlh, // 本文下端から1行目ベースラインまで - 行送り = footskip(A4で1cm) - baseline(10ptで16pt)
    header: grid(columns: (auto, 1fr, auto), stroke: (bottom: 0.5pt), inset: (bottom: rls))[][][#text(bottom-edge: "baseline", [工学研究部 部報 #no 号])],
    footer: grid(columns: (auto, 1fr, auto), stroke: (top: 0.5pt), inset: (top: rls))[電気通信大学 工学研究部][][#align(right)[#link("https://koken.club.uec.ac.jp/")\ #link("ueckoken@gmail.com")]],
  )
  set par(first-line-indent:(amount:1em,all:true))
  set text(
    lang:"ja",region:"jp",
    font:serif,size:rem
  )

  set par(leading: rls, spacing: rls)
  set text(top-edge: rem, bottom-edge: 0pt)

  set heading(numbering: "1.1　")
  show heading: x => block(align(horizon, x))
  show heading: set text(font: sansserif, size: rem)
  show heading: set block(height: rem, spacing: rls)
  show heading.where(level: 1): set block(height: 2*rem+rls)
  show heading.where(level: 1): set text(size: 12*mpt)

  show link:x=>text(font:monospace,size:9pt,x)
  show raw:x=>text(font:monospace,x)

  align(center)[
    #set par(leading: 0pt, spacing: 0pt)
    #set text(top-edge: "ascender", bottom-edge: "descender")
    
    #block(height: 0pt)
    #set text(size: 17.28*mpt) // ltjsclasses \LARGE 10ptで17.28pt、行間25pt
    #v(2em)
    #text(font: sansserif, title)
    #set text(size: 12*mpt) // ltjsclasses \large 10ptで12pt、行間17pt
    #v(1.5em)
    #text(font: sansserif, author)
    #v(1em)
    // #text(font: serif, date)
    #set text(size: 17.28*mpt) // なんでここが\LARGEなんですか???
    #v(1.5em)
    #set par(leading: (13-9)*mpt, spacing: (13-9)*mpt)
    #set text(size: 9*mpt) // ltjsclasses \small 10ptで9pt、行間13pt
    #box(inset:(x:2em), [#v(-2em)#brief])
    #v(1.5em)
  ]

  show:columns.with(2)
  body
}

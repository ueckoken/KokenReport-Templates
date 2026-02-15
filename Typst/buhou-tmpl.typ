#let rem = 12pt
#let rlh = 1.6*rem;
#let rls = rlh - rem;

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
    font:serif,size:12pt
  )

  set par(leading: rls, spacing: rls); set text(top-edge: rem, bottom-edge: 0pt)
  set heading(numbering: "1.1　")
  show heading: x => block(align(horizon, x))
  show heading: set text(font: sansserif, size: 12pt)
  show heading: set block(height: rem, spacing: rls)
  show heading.where(level: 1): set block(height: 2*rem+rls)
  show heading.where(level: 1): set text(size: 13pt)

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

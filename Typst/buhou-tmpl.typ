// https://tug.ctan.org/macros/luatex/generic/luatexja/doc/ltjsclasses.pdf

#let jascale = 0.924715 // ltjsclassesの和文は小さい
#let magscale = 1.2 // ltjsclasses 12pt指定時
#let mpt = magscale*1pt // ltjsclassesでのレイアウトの基準

#let rem = 10*mpt
#let jrem = rem*jascale
#let rlh = 16*mpt
#let rls = rlh - rem

#let jsc-setfontsize(latin-size-at-10pt, lineskip-at-10pt, body) = {
  let latin-size = latin-size-at-10pt*mpt
  let cjk-size = latin-size*jascale
  let leading = lineskip-at-10pt*mpt - latin-size
  set text(size: cjk-size, top-edge: latin-size, bottom-edge: 0pt)
  set par(leading: leading, spacing: leading)
  [#body]
}
#let normalsize(body) = jsc-setfontsize(10, 16, body)
#let LARGE(body) = jsc-setfontsize(17.28, 25, body)
#let large(body) = jsc-setfontsize(12, 17, body)
#let small(body) = jsc-setfontsize(9, 13, body)

#let main(
  no:"XX",
  title:"部報サンプル",author:"工研太郎",brief:"Hello from typst!",
  title-sans: false, // ltjsarticleでは明朝
  serif:("New Computer Modern", "Noto Serif CJK JP", "Noto Serif JP"), // = 本文 LuaTeX(-ja)標準 (Latin Modern Roman, 源ノ明朝)
  sansserif:("New Computer Modern", "Noto Sans CJK JP", "Noto Sans JP"), // = 見出し LuaTeX-ja標準 (Latin Modern Roman, 源ノ角ゴシック)
  monospace:("DejaVu Sans Mono"), // ≠ LuaTeX標準 (Latin Modern Mono?)
  body
)={
  show regex("[\p{scx=Latin}\p{Nd}]"): set text(size: 1em / jascale) // ltjsclassesでは和文が小さいが、ここでは欧文を大きくする (和文を選択するとレイアウトが崩れる https://forum.typst.app/t/typst-wish-list-for-a-japanese-user/2783/3)
  show: normalsize
  
  set page(
    paper: "a4", margin: (top: 1.3in, x: 0.787in, bottom: 1.18in), // LaTeXテンプレの謎の値
    header-ascent: 1cm - 1.38*jrem, // ltjsarticleのheadsep = footskip(A4で1cm) - topskip(1.38zh), 
    footer-descent: 1cm - rlh, // 本文下端から1行目ベースラインまで - 行送り = footskip(A4で1cm) - baseline(16mpt)
    header: grid(columns: (auto, 1fr, auto), stroke: (bottom: 0.5pt), inset: (bottom: 6*mpt))[][][工学研究部 部報 #no 号],
    footer: grid(columns: (auto, 1fr, auto), stroke: (top: 0.5pt), inset: (top: rls))[電気通信大学 工学研究部][][#align(right)[#link("https://koken.club.uec.ac.jp/")\ #link("ueckoken@gmail.com")]],
  )
  set par(first-line-indent: (amount: 1em, all: true), justify: true, linebreaks: "simple")
  set text(
    lang:"ja",region:"jp",
    font:serif,
    weight:"regular" // LuaTeX-jaでは原ノ味明朝 Regular
  )

  set heading(numbering: "1.1　")
  show heading: set text(font: sansserif, weight: "medium") // LuaTeX-jaでは原ノ味角ゴシック Medium
  show heading: set block(spacing: auto)
  show heading: set text(size: jrem, top-edge: rem, bottom-edge: 0pt)
  show heading.where(level: 1): set block(inset: (y: 7*mpt))
  show heading.where(level: 1): set par(leading: 4*mpt)
  show heading.where(level: 1): set text(size: 12*mpt*jascale, top-edge: 12*mpt, bottom-edge: 0pt)

  show link:x=>text(font:monospace,size:9pt,x)
  show raw:x=>text(font:monospace,x)

  let font-title = if title-sans {sansserif} else {serif}
  align(center)[
    #block(height: 0pt)
    #v(2*rem)
    #LARGE(text(font: font-title, title))
    #v(1.5*rem)
    #large(text(font: font-title, author))
    #v(1*rem)
    // #text(font: serif, date)
    #v(1.5*rem)
    #small(box(inset:(x:2em))[#v(-2em)#brief])
    #v(1.5*rem)
  ]

  show:columns.with(2)
  body
}

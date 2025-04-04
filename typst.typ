// 見た目をざっくり合わせただけのTypstテンプレート
// フォントはWindowsぽくしてるので問題があれば変更すること (IPA明朝、IPAゴシック、Times New Roman、CourierあたりがLaTeXぽい?)
// ヘッダー、フッターはここには含めず結合時に一括挿入したほうがいいかも

#set page(
  paper: "a4",
  margin: (top: 1.3in, x: 0.787in, bottom: 1.18in),
  // ヘッダー/フッターここから
  header: box(
    stroke: (bottom: 0.5pt), inset: (bottom: 5pt))[
    #h(1fr)
    工学研究部 部報XX号
  ],
  header-ascent: 1em,
  footer-descent: 1em,
  footer: [
    #grid(
      columns: (auto,1fr,auto),
      stroke: (top: 0.5pt), inset: (top: 10pt),
      "電気通信大学 工学研究部",
      "",
      align(right)[
        #link("https://www.koken.club.uec.ac.jp")\
        #link("ueckoken@gmail.com")
      ],
    )
  ],
  // ヘッダー/フッターここまで
)

#set par(
  first-line-indent: (amount: 1em, all: true),
  leading: 1em,
)

#set text(
  font: ("Cambria", "Yu Mincho"),
  size: 12pt,
  cjk-latin-spacing: auto,
  lang: "ja",
  region: "JP",
)

#set heading(numbering: "1.",)
#show heading: body => text(font: "Yu Gothic")[#body]
#show heading.where(level: 1): body => text(size: 13pt)[#body]
#show heading.where(level: 2): body => text(size: 12pt)[#body]
#show link: body => text(font: "Cascadia Mono", size: 9pt)[#body]
#show raw: body => text(font: "Cascadia Mono")[#body]

#align(center)[
  #v(2em)
  #text(size: 20pt)[工学研究部部報用テンプレート]
  #v(1em)
  #text(size: 14pt)[工研太郎]
  #v(1em)
  #box(inset: (x: 2em))[#text(size: 10pt)[
    いんとろ
    あああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああ
  ]]
  #v(1em)
]

#show: columns.with(2)


= セクション1

いいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいい

== サブセクション

ううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううううう
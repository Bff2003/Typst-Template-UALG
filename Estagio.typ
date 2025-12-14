#import "Estagio_capa.typ"

// --- Configuração Principal (Template) ---
#let template(doc) = [
  // Papel A4 e Margens de 2.5cm
  #set page(
    paper: "a4",
    margin: 2.5cm,
  )

  // Times New Roman, tamanho 12
  #set text(
    font: "Times New Roman",
    size: 12pt,
    lang: "pt",
    region: "PT",
  )

  // Espaçamento 1.5 no corpo do texto
  // (0.5em de leading + tamanho da fonte cria o efeito visual de 1.5)
  #set par(
    leading: 1em,
    justify: true,
    first-line-indent: 1.25cm,
  )

  // Cada secção (Nível 1) inicia numa nova página automaticamente
  // "weak: true" evita páginas brancas duplas se já houver uma quebra
  #show heading.where(level: 1): it => pagebreak(weak: true) + it

  // Configuração de Figuras e Tabelas
  #show figure: set block(breakable: false)
  // Legendas e conteúdo de figuras/tabelas com espaçamento 1 (simples)
  #show figure: set par(leading: 0.65em)

  // Tabelas com legenda em CIMA
  #show figure.where(kind: table): set figure.caption(position: top)
  // Figuras com legenda em BAIXO 
  #show figure.where(kind: image): set figure.caption(position: bottom)

  #show heading: it => {
    it
    // para criar o "(tab) texto" na primeira linha do paragrafo
    par(text(size: 0pt, "")) // paragrafo invisivel
    v(-1.25em) // remove espaçamento de paragrafo
  }

  // --- Início do Documento ---

  // Capa
  #Esyagio_capa.capa()

  // Numeração Romana minúscula (i, ii, iii) para pré-textual
  #set page(
    numbering: "i",
    footer: context [
      #align(right, counter(page).display("i"))
    ],
  )
  #counter(page).update(1) // Reiniciar contador se necessário após a capa

  #doc
]

#show: doc => template(doc)

// --- Elementos Pré-textuais ---

// Nota: O pagebreak automático nos headings (Req 4) trata das quebras aqui


#heading(numbering: none)[Agradecimentos] // (Opcional)
#lorem(100)

#heading(numbering: none)[Resumo]
#lorem(150)

// Índices
#heading(numbering: none)[Índice]
#v(0.5cm)
#outline(depth: 3, indent: auto, title: none)

#heading(numbering: none)[Índice de Figuras]
#v(0.5cm)
#outline(
  title: none,
  target: figure.where(kind: image),
)

#heading(numbering: none)[Lista de Abreviaturas] // (Opcional)
#lorem(100)


// --- Corpo do Relatório ---

// Req 5: Mudança para Numeração Normal a partir da Introdução
#set page(
  numbering: "1",
  footer: context [
    #align(right, counter(page).display("1"))
  ],
)
#counter(page).update(1) // Começa do 1
#set heading(numbering: "1.") // Numera capítulos

= Introdução
Abc #footnote[
  Demonstração de footnote
]
#lorem(300)

// Exemplo de Figura (Req 6)
#figure(
  rect(width: 100%, height: 50pt, fill: luma(240)),
  caption: [Exemplo de uma figura com legenda em baixo.],
) <fig-exemplo>

= Caracterização da empresa/instituição
#lorem(300)

// Exemplo de Tabela (Req 6)
#figure(
  table(
    columns: (1fr, 1fr),
    [Dado A], [Dado B],
    [10], [20],
  ),
  caption: [Exemplo de tabela com legenda em cima.],
  kind: table,
) <tab-exemplo>

= Descrição das tarefas/atividades desenvolvidas
#lorem(400)

= Análise crítica do trabalho realizado
Como podemos ver na @fig-exemplo e na @tab-exemplo...
#lorem(300)

= Conclusão
#lorem(300)

// Req 7: Referências
#pagebreak()
#heading(numbering: none)[Lista de Referências]
// #bibliography("referencias.bib") // .bib

// Apêndices
#set heading(numbering: none)
= Apêndices
#lorem(100)

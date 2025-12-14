
#let capa(
  title: "[Titulo]",
  curso: "[Curso]",
  empresa: "[EMPRESA E LOCAL DE REALIZAÇÃO]",
  aluno: "[NOME DO ALUNO]",
  orientador: "[Orientador]",
  supervisor: "[Supervisor]",
  local: "[Local]",
  data: "[Data]",
) = [

  #image("images/ise.jpg", width: 5cm)
  #v(4cm)

  #set align(center)
  #text(title, size: 1.2em)

  #v(1cm)
  #text(
    curso,
    size: 1.5em,
  )



  #v(1cm)
  #empresa

  #v(3cm)
  #aluno
  #set align(left)

  #v(1cm)

  #place(bottom, [
    #text(
      [
        *Orientador:* #orientador \
        *Supervisor:* #supervisor

        #v(6cm)
      ],
      size: 1.2em,
    )
  ])
  #place(bottom + center, [
    #text(local, size: 1.2em)
    #v(3cm)
  ])

  #pagebreak()

]

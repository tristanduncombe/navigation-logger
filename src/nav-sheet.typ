#let standard_box(text: "") = {
  rect(width: 100%, height: 15pt, stroke: 0.5pt, text)
}

#let tall_box(text: "") = {
  rect(width: 100%, height: 1fr, stroke: 0.5pt, text)
}

#let small_box = [
  #rect(width: 15pt, height: 15pt, stroke: 0.5pt)
]

#let small_box = [
  #rect(width: 15pt, height: 15pt, stroke: 0.5pt)
]

#let  header(callsign, type, departure) = {[
  #text(6pt)[
#table(columns: (25%, 25%, 25%, 25%), stroke: (none), row-gutter: -8pt
)[Callsign][Type][Sartime][Departure Airport][#standard_box(text: callsign)][#standard_box(text: type)][#standard_box()][#standard_box(text: departure)][DEPARTURE TIME][FORECAST][NOTAM][W & B][#table(columns: (1fr, 1fr), inset: 0pt,
  align: horizon,
  stroke: (none),
  [#standard_box()],
  [#standard_box()],
)][#table(columns: (1fr, 1fr, 1fr), inset: 0pt,
  align: horizon,
  stroke: (none),
  [#small_box],
  [#small_box],
  [#small_box]
)][#table(columns: (1fr, 1fr, 1fr), inset: 0pt,
  align: horizon,
  stroke: (none),
  [#small_box],
  [#small_box],
  [#small_box]
)][#table(columns: (1fr, 1fr), inset: 0pt,
  align: horizon,
  stroke: (none),
  [#standard_box()],
  [#standard_box()],
)][#text(size: 6pt)[#table(columns: (1fr, 1fr), inset: 0pt,
  align: horizon,
  stroke: (none),
  [ETD],
  [ATD],
)]][#text(size: 6pt)[#table(columns: (1fr, 1fr, 1fr), inset: 0pt,
  align: horizon,
  stroke: (none),
  [GAFS],
  [TAFS],
  [GPWT]
)]][#text(size: 6pt)[#table(columns: (1fr, 1fr, 1fr), inset: 0pt,
  align: horizon,
  stroke: (none),
  [Location],
  [FIR],
  [Head]
)]][#text(size: 6pt)[#table(columns: (1fr, 1fr), inset: 0pt,
  align: horizon,
  stroke: (none),
  [WGT KG],
  [CG %],
)]]]
]}

#let nav_log(fixes) = {[
  #box(height: 30%)[
  #text(6pt)[
      #table(columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1.5fr, 1.5fr, 1.5fr),
      align: horizon,
      stroke: 0.5pt,
      fill: (x, _) =>
        if calc.odd(x) { rgb("#f0f0f0") }
        else { white },
      table.header(table.cell(rowspan: 1, colspan: 13, fill: rgb("#f0f0f0"))[#align(center)[*NAV LOG*]]),
      rows: (0.8fr, 1fr, 1.5fr, 1.5fr, 1.5fr, 1.5fr, 1.5fr, 1.5fr, 1.5fr),
      [POSN],
      [FL/ALT],
      [TAS],
      [TR(M)],
      [Wind],
      [HDG(M)],
      [G/S],
      [DIST],
      [ETI],
      [EET],
      [PLN EST],
      [REV EST],
      [ATA ATD],
      fixes
    )]
  ]
]}

#let fuel_com_log = [
  #box(height:25%)[
  #text(6pt)[
  #columns(3)[
    Fuel Track
    #table(columns:(0.75fr, 1fr, 1fr),
    stroke: 0.5pt,
    fill: (x, y) =>
        if y == 0 { rgb("#f0f0f0") }
        else if calc.even(y) { rgb("#f0f0f0") }
        else { white },)[At][Left (min)][Right (min)][(#h(0.5fr))][][][(#h(0.5fr))][][][(#h(0.5fr))][][][(#h(0.5fr))][][][(#h(0.5fr))][][][(#h(0.5fr))][][][(#h(0.5fr))][][][(#h(0.5fr))][][]
    Nav/Com Freq
    #table(columns:(0.75fr, 1fr, 1fr), stroke: 0.5pt, fill: (x, y) =>
        if y == 0 { rgb("#f0f0f0") }
        else if calc.even(y) { rgb("#f0f0f0") })[At][Com 1][Com 2][#v(4pt)][][][#v(4pt)][][][#v(4pt)][][][#v(4pt)][][][#v(4pt)][][][#v(4pt)][][][#v(4pt)][][][#v(4pt)][][]
    Fuel
      #table(columns:(1fr, 1fr, 1fr), stroke: 0.5pt, rows: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
      fill: (x, y) =>
        if y == 0 { rgb("#f0f0f0") }
        else if y == 1 and x == 1 { black }
        else if y == 7 { rgb("#f0f0f0") }
        else { white },

      )[*FUEL*][*MIN*][*LITRES*][TAXI][][][TRIP\*][][][V RESERVE][][][ALTERNATE][][][F RESERVE][][][HOLDING][][][*REQUIRED*][][][MARGIN][][][ENDURANCE]]
      ]
  ]
]


#let notes_and_divert(lines, aerodrome) = {
  box(height:22%)[
    #text(6pt)[
    #columns(2)[
      
    #if lines == true {
      
      [Notes
      #table(columns:(1fr, 1fr, 1fr, 1fr, 1fr, 1fr), stroke: (x, y) => {
      (bottom: 0.5pt + black)
      }, rows: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr))]

    } else if aerodrome == true {
      [#text(6pt)[
        #table(columns: (1fr, 1fr), stroke: (none))[Aerodrome][#text(size: 6pt)[#table(columns: (1fr, 1fr, 1fr), inset: 0pt,
          align: horizon,
          stroke: (none),
          [Elevation],
          [CTAF],
          [AWIS]
        )]][#standard_box()][
          #table(columns: (1fr, 1fr, 1fr), inset: 0pt,
          align: horizon,
          stroke: (none),
          [#standard_box()],
          [#standard_box()],
          [#standard_box()]
        )][Field Layout][Pilot Notes][#tall_box()][#tall_box()]
      ]]
    } else {
      [Notes
      #table(columns:(1fr, 1fr, 1fr, 1fr, 1fr, 1fr), stroke: none, rows: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr))]

    }
    Divert
    #table(columns:(1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr), 
    stroke: 0.5pt,
    fill: (x, y) =>
      if y == 0 { rgb("#f0f0f0") }
      else if y == 1 and x != 6 { black }
      else { white },

    rows: (1fr, 1fr, 1fr, 1fr))[*POSN*][*ALT*][*HDG (M)*][*DIST*][*ETI*][*EST*][*ATD*]]]
  ]
}

#let notes_and_fuel(aircraft) = [
  #box(height:45%)[
  #if aircraft == "fixed-wing" {[
    #text(6pt)[
      Fuel
        #table(
      rows: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
      columns: (1.25fr, 1fr, 1fr, 1fr, 1fr),
      stroke: 0.5pt,
      table.header(table.cell(rowspan: 1, colspan:1)[Fuel], table.cell(rowspan: 1, colspan: 4, fill: rgb("#f0f0f0"))[#align(center)[]]))[]
      
  ]]} else if aircraft == "rotary-wing" {[
    #text(6pt)[
      Fuel
        #table(
      table.header(table.cell(rowspan: 1, colspan:1)[Fuel], table.cell(rowspan: 1, colspan: 4, fill: rgb("#f0f0f0"))[#align(center)[]]))[]
    ]]
  } else if aircraft == "both" {[
    #text(6pt)[
      Fuel
        #table(
      table.header(table.cell(rowspan: 1, colspan:1)[Fuel], table.cell(rowspan: 1, colspan: 4, fill: rgb("#f0f0f0"))[#align(center)[]]))[]
    ]]
  }
  ]

  #box(height:20%)[
    #text(6pt)[
    Pilot Notes
    #table(columns:(1fr, 1fr, 1fr, 1fr, 1fr, 1fr), stroke: (x, y) => {
      (bottom: 0.5pt + black)
      },
      rows: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr))
    ]
  ]
]
#let table-json(data) = {
    let keys = data.at(0).keys()
    table(
      columns: keys.len(),
      ..keys,
      ..data.map(
        row => keys.map(
          key => [
            #if key == "Image" { image(row.at(key), width: 50%) } else { row.at(key) }            
          ]
        )
      ).flatten()
    )
}

#let navigation-logger(aircraft: "both", callsign: "", type: "", departure: "",  variant: "1", lines: bool, waypoint: false, waypoints: "", fixes: [], doc) = [
  #set text(font: "Roboto", size: 10pt)

  #set page(
    paper: "a5",
    margin: (top: 0.30in, bottom: 0.1in, left: 0.1in, right: 0.1in),
    footer: [
      
    ],
    number-align: center
  )
  Nav Log
  #header(callsign, type, departure)
  #nav_log(fixes)
  #fuel_com_log
  #notes_and_divert(false, true)
  #if variant == 2 {
    [#notes_and_fuel(aircraft)]
  } 

  #if waypoint == true and waypoints != "" {
    box(height: 100%)[
      #table-json(json(waypoints))
    ]
  }
]
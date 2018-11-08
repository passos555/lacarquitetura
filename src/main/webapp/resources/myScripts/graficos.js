//DONUT CHART
   var donut = new Morris.Donut({
     element: 'projetos-chart',
     resize: true,
     colors: ["#e8bfba", "#dca19b", "#e8dbd9"],
     data: [
       {label: "Em Andamento", value: $('#andamento').val()},
       {label: "Aguardando", value: $('#aguardando').val()},
       {label: "Concluido", value: $('#concluidos').val()},
     ],
     hideHover: 'auto'
   });
   
   
   
 //BAR CHART
   var bar = new Morris.Bar({
     element: 'bar-chart',
     resize: true,
     data: [
       {y: 'Jul', a: 2, b: 4},
       {y: 'Ago', a: 1, b: 2},
       {y: 'Set', a: 5, b: 2},
       {y: 'Out', a: 3, b: 4},
       {y: 'Nov', a: 2, b: 2},
       {y: 'Dez', a: 0, b: 0},
       {y: 'Jan', a: 0, b: 0}
     ],
     barColors: ['#dca19b', '#e8dbd9'],
     xkey: 'y',
     ykeys: ['a', 'b'],
     labels: ['Concluidos', 'Novos'],
     hideHover: 'auto'
   });
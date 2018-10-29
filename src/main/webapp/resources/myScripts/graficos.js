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
       {y: '2006', a: 100, b: 90},
       {y: '2007', a: 75, b: 65},
       {y: '2008', a: 50, b: 40},
       {y: '2009', a: 75, b: 65},
       {y: '2010', a: 50, b: 40},
       {y: '2011', a: 75, b: 65},
       {y: '2012', a: 100, b: 90}
     ],
     barColors: ['#00a65a', '#f56954'],
     xkey: 'y',
     ykeys: ['a', 'b'],
     labels: ['CPU', 'DISK'],
     hideHover: 'auto'
   });
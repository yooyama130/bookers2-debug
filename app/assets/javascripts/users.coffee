# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.draw_graph = ->
    ctx = document.getElementById("myChart").getContext('2d')
    myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: ["6日前", "5日前", "4日前", "3日前", "2日前", "1日前", "今日"],
            datasets: [{
                label: '投稿した本の数',
                data: gon.data
                backgroundColor: [
                    'rgba(255, 99, 132, 0)' #透明度:0
                ],
                borderColor: [
                    'rgba(54, 162, 235, 1)' #透明度:1
                ],
                borderWidth: 3
            }]
        },
        options: {
            scales: {
                yAxes: [{
                     ticks: { # 目盛り
                        beginAtZero:true
                        max: 10,     #最大値
                        stepSize: 1  #目盛りの間隔
                    }
                }]
            }
        }
    })

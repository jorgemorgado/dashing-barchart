class Dashing.BarChart extends Dashing.Widget

  ready: ->
    container = $(@node).parent()
    width = (Dashing.widget_base_dimensions[0] * container.data("sizex")) + Dashing.widget_margins[0] * 2 * (container.data("sizex") - 1)
    height = (Dashing.widget_base_dimensions[1] * container.data("sizey")) - 35

    # Lower the chart's height to make space for the moreinfo if present
    if @get('moreinfo')
      height -= 20

    canvas = $(@node).find('.canvas-holder')
    canvas.append("<canvas width=\"#{width}\" height=\"#{height}\" class=\"chart-area\"/>")

    @ctx = $(@node).find('.chart-area')[0].getContext('2d')
    @myData = {
      labels: @get('labels')
      datasets: @get('datasets')
    }

    @myChart = new Chart(@ctx).Bar(@myData, $.extend({
      responsive: false
      barShowStroke: true
      scaleShowVerticalLines: false
      maintainAspectRatio: true
    }, @get('options')))

  onData: (data) ->
    # Load new values, ie,
    #   @myChart.datasets[0].bars[0].value = data.datasets[0].data[0]
    #   @myChart.datasets[0].bars[1].value = data.datasets[0].data[1]
    #   ...
    #   @myChart.datasets[1].bars[0].value = data.datasets[1].data[0]
    #   ...
    if @myChart && data.datasets
      for i in [0..@myChart.datasets.length - 1]
        for j in [0..@myChart.datasets[i].bars.length - 1]
          @myChart.datasets[i].bars[j].value = data.datasets[i].data[j]

      @myChart.update()

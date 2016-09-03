# dashing-barchart

## Preview

![BarChart](https://raw.githubusercontent.com/wiki/jorgemorgado/dashing-barchart/barchart.png)

## Description

Simple [Dashing](http://shopify.github.com/dashing) widget (and associated job)
to render bar charts. Uses [Chart.js](http://www.chartjs.org/) library.

## Dependencies

Download the latest V1 release of `Chart.min.js` from
[https://github.com/chartjs/Chart.js/releases](https://github.com/chartjs/Chart.js/releases)
and copy it into `assets/javascripts`.

`dashing-barchart` is not yet compatible with V2 of ChartJS.

## Usage

Create the directory `widgets/bar_chart` and copy this widget's files
into that folder.

Add the following code on the desired dashboard:

```erb
<li data-row="2" data-col="1" data-sizex="2" data-sizey="1">
  <div data-id="barchart" data-view ="BarChart" data-title="Bar Chart" data-moreinfo=""></div>
</li>
```

Create your bar chart job `my_barchart_job.rb`:

```ruby
# Note: change this to obtain your chart data from some external source
labels = ['January', 'February', 'March', 'April', 'May', 'June', 'July']
data = [
  {
    label: 'My First dataset',
    fillColor: 'rgba(220,220,220,0.5)',
    strokeColor: 'rgba(220,220,220,0.8)',
    highlightFill: 'rgba(220,220,220,0.75)',
    highlightStroke: 'rgba(220,220,220,1)',
    data: Array.new(labels.length) { rand(40..80) },
  }, {
    label: 'My Second dataset',
    fillColor: 'rgba(151,187,205,0.5)',
    strokeColor: 'rgba(151,187,205,0.8)',
    highlightFill: 'rgba(151,187,205,0.75)',
    highlightStroke: 'rgba(151,187,205,1)',
    data: Array.new(labels.length) { rand(40..80) },
  }
]
options = { scaleFontColor: '#fff' }

send_event('barchart', { labels: labels, datasets: data, options: options })
```

### Title Position

By default the title will be displayed in the center of the widget. If you
prefer to move it to the top, change the `$title-position` variable on the
SCSS file. Example:

```scss
$title-position:    top;
```

### Margins

You can also adjust the chart's margins: top, left, right and bottom. By
default they are all 0 (pixels) to use the whole available space. But if
needed you can change their value using the `data-` attributes. Example:

```erb
<li data-row="2" data-col="1" data-sizex="2" data-sizey="1">
  <div data-id="barchart" data-view ="BarChart" data-left-margin="5" data-top-margin="10"></div>
</li>
```

If not set, both right and bottom margins will be equal to left and top margins
respectively. This is likely what you want to keep the chart centered within
the widget. If not, set their values also using the `data-` attributes:

```erb
<li data-row="2" data-col="1" data-sizex="2" data-sizey="1">
  <div data-id="barchart" data-view ="BarChart" data-right-margin="10" data-bottom-margin="5"></div>
</li>
```

## Contributors

- [Jorge Morgado](https://github.com/jorgemorgado) (Author)
- [Maomao Liu](https://github.com/maomaoliu)
- [Chris Hughes](https://github.com/chrisspang)

## License

This widget is released under the [MIT License](http://www.opensource.org/licenses/MIT).

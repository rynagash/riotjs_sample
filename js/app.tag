<app>
  <div class="row">
    <table class="table">
      <thead>
        <tr>
          <th class="col-xs-4">net</th>
          <th class="col-xs-4">yen</th>
          <th class="col-xs-4">unit</th>
        </tr>
      </thead>
      <tbody>
        <form>
        <tr each={ opts.items }>
          <td class="col-xs-4"><input type="number" class="form-control" onchange={ parent.change } onkeyup={ parent.keyup.net } value={ net }></td>
          <td class="col-xs-4"><input type="number" class="form-control" onchange={ parent.change } onkeyup={ parent.keyup.value } value={ value }></td>
          <td><div class="col-xs-4 form-control-static" style="width:100%; background-color: {color};">{ unit_price }</div></td>
        </tr>
      </form>
      </tbody>
    </table>
  </div>
  <div class="row">
    <div class="text-center">
      <button class="btn btn-primary" onclick={ui.add}>Add</button>
    </div>
  </div>
  <script>
    var self = this;
    this.keyup = {
      net: function(e) {
        e.item.net = e.target.value | 0;
        e.item.unit_price = Math.round(1000 * e.item.value / e.item.net) / 1000;
      },
      value: function(e) {
        e.item.value = e.target.value | 0
        e.item.unit_price = Math.round(1000 * e.item.value / e.item.net) / 1000;
        },
    }
    this.change = (function() {
      var _minMax = function(items) {
        // not destroy
        // return items.slice().sort(function(a, b) {
        //   if (a.unit_price < b.unit_price) return -1;
        //   if (a.unit_price > b.unit_price) return 1;
        //   return 0;
        // });
        return items.sort(function(a, b) {
          if (a.unit_price < b.unit_price) return -1;
          if (a.unit_price > b.unit_price) return 1;
          return 0;
        });
      }
      return function(e) {
        _minMax(self.opts.items);
      }
    })();

    this.ui = {
      add: function(e) {
        self.opts.items.push({
          net: 100,
          value: 98,
          unit_price:  98/100,
          color: "#fff"
        });
      }
    }

  </script>
</app>

(function(_) {

  // Vue component to show items images
  Vue.component('item-img', {
    props: {
      item: {           // item id
        type: Number    // type check
      }
    },
    // Function to generate a img tag
    render: function(createElement) {
      return createElement(
        'img',
        {
          attrs: {
            src: "http://ddragon.leagueoflegends.com/cdn/6.20.1/img/item//"+ this.item +".png"
          }
        }
      ) // createElement
    }

  })

  // Main instance of Vue object
  new Vue({
    el: '#items-wrap',      // id of a page element to target

    // register data for items
    data: {
      gameMap: '',
      championID: '',
      collectionSize: null,
      groups: [],
      total: 0
    },

    // entry point
    mounted: function() {
      el = document.getElementById('info');
      this.championID = el.dataset.cid;
      this.fetchData();
    },

    // method to handle our application logic
    methods: {
      // pull data from server
      fetchData: function() {
        console.log("fetching data...");
        var resource = this.$resource('/champions/{id}/recommended{/?index=}');

        resource.get({id: this.championID, index: this.total}).then((response) => {
          data = response.body;
          this.gameMap = data.game_map;
          this.collectionSize = data.size;

          for(var key in data) {
            if(key !== "game_map" && key !== "size") {
              this.groups.push({name: key, items: data[key]})
            }
          }

        }, (response) => {
          console.log(response);
        });

      },

      // change the collection of items displayed
      changeItems: function(event) {
        console.log(this.total);

        if(this.total < this.collectionSize)
          this.total += 1;
        else
          this.total = 0;

        this.gameMap = '';
        this.groups = [];

        this.fetchData();
      }
    } // methods
  });
})(this);
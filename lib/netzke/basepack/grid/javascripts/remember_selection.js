{
  rememberSelection: function(selModel, selectedRecords) {
    if (!this.rendered || Ext.isEmpty(this.el)) {
      return;
    }

    this.selectedRecords = this.getSelectionModel().getSelection();
  },
  refreshSelection: function() {
    if (!this.selectedRecords || 0 >= this.selectedRecords.length) {
      return;
    }

    for (var i = 0; i < this.selectedRecords.length; i++) {
      record = this.getStore().getById(this.selectedRecords[i].getId());
      if (!Ext.isEmpty(record) && record != -1) {
        try {this.getSelectionModel().select(record, true, true)  }catch(err){console.dir(err);}
      }
    }

  }
}


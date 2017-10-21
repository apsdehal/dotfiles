require(["codemirror/lib/codemirror", "codemirror/keymap/sublime", "notebook/js/cell", "base/js/namespace"],
    function(cm, sublime_keymap, cell, IPython) {
        // setTimeout(function(){ // uncomment line to fake race-condition
        let subl = cm.keyMap.sublime;
        // disable ctrl-enter
        delete subl["Ctrl-Enter"];
        delete subl["Shift-Ctrl-Enter"];
        cell.Cell.options_default.cm_config.keyMap = 'sublime';
        var cells = IPython.notebook.get_cells();
        for(var c=0; c< cells.length ; c++){
            cells[c].code_mirror.setOption('keyMap', 'sublime');
        }

        // }, 1000)// uncomment  line to fake race condition 
    } 
);

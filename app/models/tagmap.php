<?php

class Tag extends AppModel {
  var $name = 'Tagmap';

   var $belongsTo = array('Recipe', 'Tag');
}

?>
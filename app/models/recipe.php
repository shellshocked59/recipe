<?php

class Recipe extends AppModel {
  var $name = 'Recipe';

  var $hasMany = array('Rating', 'Comment', 'Requirement', 'Tag');
   var $belongsTo = array('User');
}

?>
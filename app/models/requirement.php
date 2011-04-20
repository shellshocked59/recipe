<?php

class Requirement extends AppModel {
  var $name = 'Requirement';

  var $belongsTo = array('Recipe', 'Ingredient');
}

?>
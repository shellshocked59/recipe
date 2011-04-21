<?php

class User extends AppModel {
  var $name = 'Comment';

   var $belongsTo = array('Recipe', 'User');
 
}

?>
<?php

class User extends AppModel {
  var $name = 'User';

  var $hasMany = array('Recipe', 'Rating', 'Comment');
}

?>
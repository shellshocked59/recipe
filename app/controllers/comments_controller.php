<?php
class IngredientsController extends AppController {   
  
  var $name = 'Ingredients';  
  
		function view($id = null) { 
	//$this->Comment->User->find('first', array('conditions' =>array('User.id' => $some_id)));
	$this->Comment->id = $id;       
	$this->set('comment', $this->Comment->read());   
  }
		
		
		function add($ingredientId) {
	if (!empty($this->data)) {
	  if ($this->Comment->save($this->data)) {
		//$this->Session->setFlash('Your comment has been saved.');
		$this->redirect(array('controller' => 'videos', 'action' => 'index'));
	  }
	}
  }
		
		
 
}
?>

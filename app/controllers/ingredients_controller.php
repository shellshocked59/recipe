<?php
class IngredientsController extends AppController {   
  
  var $name = 'Ingredients';  
  
		function view($ingredientID) {
		//view ingredient with ID of url
  
			$this->data = $this->Ingredient->read(null, $ingredientID);
		if (empty($this->data['Ingredient'])) {
	  $this->Session->setFlash("This Ingredient is no longer available.");
	  $this->redirect('/error');
	  return;
		}
		
		
 
}
?>

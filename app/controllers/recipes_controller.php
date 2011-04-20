<?php
class RecipesController extends AppController {   
  
  var $name = 'Recipes';  
  
		function view($recipeID) {
		//view recipe with ID of url
		$this->data = $this->Recipe->read(null, $recipeID);
		}
	
		


	function add() {
	 $this->data['Recipe']['date'] = date('Y-m-d H:i:s');

	  $this->data['Recipe']['user_id'] = 1;
//	  $this->Auth->user('id');
	  $this->data['Recipe']['view'] = 0;

	  $this->Recipe->create();
				
			}
	
		
		
 
}
?>

<?php
class RecipesController extends AppController {   
  
  var $name = 'Recipes';  
  
		function view($recipeID) {
		//view recipe with ID of url
		$this->data = $this->Recipe->read(null, $recipeID);
		if (empty($this->data['Recipe'])) {
	  $this->Session->setFlash("This recipe is no longer available.");
	  $this->redirect('/error');
	  return;
	}
		
		// Increment views
	$this->Recipe->set('view', $this->data['Recipe']['view']+1);
	$this->Recipe->save();
	
	// sets user for view?
	$this->set('user', $this->data['User']);
	//sets comments for view?
	$this->set('comments', $this->data['Comment']);
	//sets title for view
	$this->set('title_for_layout', 'Erics Recipes - ' . $this->data['Recipe']['title'] );
		}
	
		


	function add() {
	//sets uploaded date at now
	 $this->data['Recipe']['date'] = date('Y-m-d H:i:s');
	//TODO $this->Auth->user('id');
	  $this->data['Recipe']['user_id'] = 1;
	//sets views to be 0
	  $this->data['Recipe']['view'] = 0;
	//creates recipe in data
	  $this->Recipe->create();
	  //saves recipe in database
	  $this->Recipe->save($this->data);
	  //shows success message
	  $this->Session->setFlash('Video Uploaded');
	  //redirects to new recipe
	  $this->redirect(array('action' => 'view', $this->Video->id));
				
			}
	
	function edit($recipeID) {
		
	}
	
	function delete($recipeID) {
		
	}
		
 
}
?>

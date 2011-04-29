<?php
class RecipesController extends AppController {   
  
  var $name = 'Recipes';  
  
  
  
  
   function index() {
	$list = array_keys($this->Recipe->find('list', array('conditions' => array('Recipe.featured' => true),
														'recursive' => false,
														'order' => 'rand()'
														)));
	$featuredId = $list[0];
	$this->view($featuredId);
  }
   
   
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
	  $this->Session->setFlash('Recipe Uploaded');
	  //redirects to new recipe
	  $this->redirect(array('action' => 'view', $this->Recipe->id));
				
			}
	
	function edit($recipeID) {
		
	$cur_recipe = $this->Recipe->read(null, $videoId);

	// Verify permissions
	if ($this->Auth->user('id') != $cur_recipe['User']['id'] && !$this->Auth->user('admin')) {
	  $this->Session->setFlash('Insufficient Privileges to edit this recipe!');
	  $this->redirect(array('action' => 'view', $this->Recipe->id));
	  return;
	}

	if (isset($this->data)) {
	  $this->Recipe->save($this->data);
	  $this->Session->setFlash('Recipe Edited');
	  $this->redirect(array('action' => 'view', $this->Recipe->id));
	} else {
	  $this->set('categories', $this->Recipe->Category->find('list'));
	  $this->data = $cur_recipe;
	}
		
	}
	
	function delete($recipeID) {
		$cur_recipe = $this->Recipe->read(null, $recipeID);

	// Verify permissions
	if ($this->Auth->user('id') != $cur_recipe['User']['id'] && !$this->Auth->user('admin')) {
	  $this->Session->setFlash('Insufficient Privileges to delete this recipe!');
	  $this->redirect(array('action' => 'view', $this->Recipe->id));
	  return;
	}

	$this->Recipe->delete($recipeID);
	foreach ($this->_getRecipeFilenames($recipeID) as $filename => $filetype) {
	  unlink(WWW_ROOT . $filename);
	}
	$this->Session->setFlash('Recipe deleted!');
	$this->redirect(array('action' => 'index'));
		
	}
		
 
}
?>

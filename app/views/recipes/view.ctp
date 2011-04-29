<h2><?php echo $this->data['Recipe']['name']; ?></h2>
<br />


<p>Description:
<?php echo $this->data['Recipe']['description']; ?>
</p>
<p>
Estimated Preparation Time:
<?php echo $this->data['Recipe']['time']; ?>
</p>
<br />
<br />



<p>Page Views: 
<?php echo $this->data['Recipe']['view']; ?>
</p>

<p>
Uploaded on:
<?php echo $this->data['Recipe']['date']; ?>
</p>

<p>
Uploaded by:
<?php echo $this->data['User']['alias']; ?>
</p>


<?php echo $this->Html->image("/files/recipes/" . $recipe['Recipe']['id'] . '.png', array( 'style' => 'width:205px; height:100',   "alt" => "Nav_Mockup",    'url' => array('controller' => 'recipes', 'action' => 'view', $recipe['Recipe']['id']))); ?>



<?php echo $this->element('likes', array('video_id' => $this->data['Recipe']['id'])); ?>



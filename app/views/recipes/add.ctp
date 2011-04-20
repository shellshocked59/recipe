
<?php echo $this->Form->create('Recipe', array('action' => 'add')); ?>

<?php echo $this->Form->input('name'); ?>

<?php echo $this->Form->input('description', array('rows' => '3')); ?>

<?php echo $this->Form->submit('Submit'); ?>

<?php echo $this->Form->end(); ?>

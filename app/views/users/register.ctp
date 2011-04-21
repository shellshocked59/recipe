
	<?php echo $this->Form->create('User', array('action' => 'register'));?>
		
		<?php echo $this->Form->input('email');?>
		
		
		<?php echo $this->Form->input('alias'));?>
		
		
		<?php echo $this->Form->input('password');?>
		
		
		<?php
			echo $this->Form->input('confirm_password');
			echo $this->Form->end();
		?>

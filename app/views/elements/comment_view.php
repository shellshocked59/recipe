<h3>
Comments: 
</h3>
<?php foreach ($comments as $comment): ?>


<?php echo $comment['Comment']['comment']; ?>
<p>
<?php echo 'Posted by ' . $comment['User']['alias'] . ' ' . $this->Time->timeAgoInWords($comment['Comment']['date']);?>
</p>



<?php endforeach; ?>
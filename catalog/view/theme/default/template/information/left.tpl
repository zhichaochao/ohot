
<!--<aside id="column-right" class="col-sm-3 hidden-xs">
 
  <ul>
    <?php foreach($route as $v){ ?>
       <li <?php echo $v['class']?>><i class="fa fa-chevron-right" aria-hidden="true"></i>&ensp;&ensp;<a  href="<?php echo $v['url']?>"> <?php echo $v['name']?></a></li>
    <?php } ?>        
  </ul>  
</aside>-->

<div class="company_left">
  <ul>
    <?php foreach($route as $v){ ?>
       <li <?php echo $v['class']?>>
        <a href="<?php echo $v['url']?>"> <?php echo $v['name']?></a>
       </li>
    <?php } ?> 
  </ul>
</div>

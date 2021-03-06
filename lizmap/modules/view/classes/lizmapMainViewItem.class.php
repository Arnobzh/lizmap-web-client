<?php
/**
* Class for items in the main view list
* @package   lizmap
* @subpackage view
* @author    3liz
* @copyright 2011 3liz
* @link      http://3liz.com
* @license    Mozilla Public License : http://www.mozilla.org/MPL/
*/

class lizmapMainViewItem {
    public $id = '';
    public $parentId = '';
    public $title = '';
    public $abstract = '';
    public $proj = '';
    public $bbox = '';
    public $url = '';
    public $img = '';
    public $order = 0;
    public $type = '';
    
    public $childItems = array();
    
    public function __construct($id, $title, $abstract='', $proj='', $bbox='', $url='', $img='', $order=0, $parentId='', $type='rep') {
        $this->id = $id;
        $this->parentId = $parentId;
        $this->title = $title;
        $this->abstract = $abstract;
        $this->proj = $proj;
        $this->bbox = $bbox;
        $this->url = $url;
        $this->img = $img;
        $this->order = $order;
        $this->type = $type;
    }
    
    public function copyFrom($item) {
        $this->title = $item->title;
        $this->abstract = $item->abstract;
        $this->proj = $item->proj;
        $this->bbox = $item->bbox;
        $this->url = $item->url;
        $this->img = $item->img;
        $this->order = $item->order;
        foreach( $item->childItems as $item ) {
          $replaced = false;
          foreach( $this->childItems as $k => $i ) {
            if ( $i->id == $item->id ) {
              $this->childItems[$k] = $item;
              $replaced = true;
            }
          }
          if( !$replaced )
            $this->childItems[] = $item;
        }
    }
}

function mainViewItemSort($itemA, $itemB)
{
    if ( $itemA->type == 'rep' && $itemA->type != $itemB->type)
      return -1;
    else if ( $itemA->type == 'map' && $itemA->type != $itemB->type)
      return 1;
    else if ($itemA->order == $itemB->order);
      return strcmp($itemA->id, $itemB->id);
    return ($itemA->order - $itemB->order);
}

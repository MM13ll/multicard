<?php

namespace App\Models;

use CodeIgniter\Model;

class MainModel extends Model
{
  public function cards_get_all(){
    $q ="SELECT u.`id` as user_id, m.`id` as m_id , u.`phone`, u.`first_name`, u.`last_name`, m.`added_on`, m.`pan`, m.`credit_limit`, count(*) num_c FROM `user` as u , `multicard` as m, `card` as c  WHERE u.`id`=m.`user_id` and u.`id`=c.`user_id`  group by user_id, m_id , u.`phone`, u.`first_name`, u.`last_name`, m.`added_on`, m.`pan`, m.`credit_limit`, c.`user_id`";
    return  $this->db->query($q)->getResultArray();
  }
}
?>

<?php
    require_once $_SERVER['DOCUMENT_ROOT'] . '/Config.php';
    require_once URL . '/data/core/init.php';
use Model\User;
$user = new User();
$user ->logout();

include_once $_SESSION['currentPage'];

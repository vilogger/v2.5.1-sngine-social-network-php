<?php
/**
 * blogs
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootstrap
require('bootstrap.php');

// check if blogs enabled
if(!$system['blogs_enabled']) {
    _error(404);
}

try {

	// get view content
	switch ($_GET['view']) {
		case '':

			// page header
			page_header(__("Blogs"));

			// get articles
			$articles = $user->get_articles();
			/* assign variables */
			$smarty->assign('articles', $articles);
			break;
		
		case 'article':

			// get article
			$article = $user->get_post($_GET['post_id']);
			if(!$article)  {
				_error(404);
			}
			/* assign variables */
			$smarty->assign('article', $article);

			// page header
			page_header($article['article']['title']);

			// get latest articles
			$articles = $user->get_articles( array('random' => "true", 'results' => 5) );
			/* assign variables */
			$smarty->assign('articles', $articles);

			// update views counter
			$user->update_article_views($article['article']['article_id']);
			break;

		case 'edit':

			// page header
			page_header(__("Edit Article"));

			// get article
			$article = $user->get_post($_GET['post_id']);
			if(!$article)  {
				_error(404);
			}
			/* assign variables */
			$smarty->assign('article', $article);
			break;

		case 'new':
			
			// user access
			user_access();

			// page header
			page_header(__("Write New Article"));
			break;

		default:
			_error(404);
			break;
	}
	/* assign variables */
	$smarty->assign('view', $_GET['view']);
	
} catch (Exception $e) {
	_error(__("Error"), $e->getMessage());
}

// page footer
page_footer("blogs");

?>
<?php

namespace Embed\ImageInfo;

/**
 * Class to retrieve the size and mimetype of images using curl.
 */
class Sngine implements ImageInfoInterface
{
    
    /**
     * {@inheritdoc}
     */
    public static function getImagesInfo(array $images, array $config = null)
    {
        if (empty($images)) {
            return [];
        }

        foreach ($images as $key => $image) {
            $info = @getimagesize($image['value']);
            $images[$key]['width'] = $info[0];
            $images[$key]['height'] = $info[1];
            $images[$key]['size'] = '';
            $images[$key]['mime'] = $info['mime'];
        }
        return $images;

    }

}

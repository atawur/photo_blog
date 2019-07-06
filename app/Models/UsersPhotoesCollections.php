<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UsersPhotoesCollections extends Model
{
    protected $table = 'users_photoes_collections';

    public function user()
    {
        return $this->belongsTo('App\User');
    }

    
    
}

<?php

namespace Modules\Website\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class KnowledgeCenter extends Model
{
    use HasFactory;
    use SoftDeletes;
    protected $guarded = [''];
    protected $table = 'tbl_knowledge_center';

    protected $appends = ['image', 'image_url', 'blog_image', 'article_image'];

    public function getImageAttribute()
    {
        return $this->header_image;
    }

    public function getBlogImageAttribute()
    {
        return $this->header_image;
    }

    public function getArticleImageAttribute()
    {
        return $this->header_image;
    }

    public function getImageUrlAttribute()
    {
        $appUrl = rtrim(config('app.url', 'http://127.0.0.1:8000'), '/');
        $fallbackUrl = $appUrl . '/assets/imgs/page/blog/blog-1.jpg';

        if (empty($this->header_image)) {
            return $fallbackUrl;
        }

        if (Str::startsWith($this->header_image, ['http://', 'https://'])) {
            return $this->header_image;
        }

        $cleanPath = ltrim($this->header_image, '/');

        // Check if file exists under storage/app/public/
        if (file_exists(storage_path('app/public/' . $cleanPath))) {
            $encodedPath = implode('/', array_map('rawurlencode', explode('/', $cleanPath)));
            return $appUrl . '/' . $encodedPath;
        }

        // Check if file exists directly under public/
        if (file_exists(public_path($cleanPath))) {
            $encodedPath = implode('/', array_map('rawurlencode', explode('/', $cleanPath)));
            return $appUrl . '/' . $encodedPath;
        }

        // Graceful fallback if file is missing locally
        return $fallbackUrl;
    }

    protected static function boot()
    {
        parent::boot();

        static::creating(function ($blog) {
            if (empty($blog->url_title)) {
                $blog->url_title = Str::slug($blog->resource_title);
            }
        });

        static::updating(function ($blog) {

            if ($blog->isDirty('resource_title')) {
                $blog->url_title = Str::slug($blog->resource_title);
            }
        });
    }

    public function company()
    {
        $model = get_class(get_model_instance('Company','DynamicMaster'));
        return $this->belongsTo($model, 'company_id');
    }
    public function creator()
    {
        $userModel = get_class(get_model_instance('User'));
        return $this->belongsTo($userModel, 'created_by');
    }
    public function tags()
    {
        $model = get_class(get_model_instance('Tags','Website'));
        return $this->belongsToMany($model, 'knowledg_center_id');
    }
    public function category()
    {
        $model = get_class(get_model_instance('MasterParent','DynamicMaster'));

        return $this->belongsTo($model, 'resource_category', 'id');
    }
}

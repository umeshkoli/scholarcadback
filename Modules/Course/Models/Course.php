<?php

namespace Modules\Course\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class Course extends Model
{
    use HasFactory;

    protected $guarded = [''];
    protected $table = 'tbl_courses';

    protected $appends = ['image', 'image_url'];

    public static function resolveCourseImagePath($courseId, $storedValue = null)
    {
        $overrides = [
            14 => '/assets/img/safe.jpg',
            17 => '/assets/images/new-dynamic-course/ITIL Foundation Version 5.jpg',
            18 => '/assets/img/itil2.jpg',
            19 => '/assets/images/itil-ato.svg',
            33 => '/assets/images/new-dynamic-course/devops-master-certificate.png',
            40 => '/assets/images/new-dynamic-course/business_analysis_foundation.png',
            44 => '/assets/img/data-science.jpg',
        ];

        // 1. Specific course override for courses without unique certificate badges
        if (!empty($courseId) && isset($overrides[$courseId])) {
            return $overrides[$courseId];
        }

        // 2. Check tbl_certificate_image (Source of truth for course images)
        if (!empty($courseId)) {
            try {
                $cert = \Illuminate\Support\Facades\DB::table('tbl_certificate_image')->where('course_id', $courseId)->first();
                if ($cert && !empty($cert->image_path)) {
                    $cPath = ltrim(trim($cert->image_path), '/');
                    if (!str_ends_with(strtolower($cPath), 'certificate.jpg') && file_exists(public_path($cPath))) {
                        return '/' . $cPath;
                    }
                }
            } catch (\Throwable $e) {
            }
        }

        // 3. If stored value exists and is a real, non-placeholder, non-LFS image file
        if (!empty($storedValue) && is_string($storedValue)) {
            $clean = ltrim(trim($storedValue), '/');
            $pPublic = public_path($clean);
            $pStorage = storage_path('app/public/' . $clean);
            $checkPath = file_exists($pPublic) ? $pPublic : (file_exists($pStorage) ? $pStorage : null);

            if ($checkPath && is_file($checkPath)) {
                $head = @file_get_contents($checkPath, false, null, 0, 300);
                $isLfs = $head && str_starts_with($head, 'version https://git-lfs');
                $isSvgPlaceholder = $head && (str_contains($head, '<svg') || str_contains($head, 'ScholarAcad Image') || str_contains($head, 'Preview Placeholder'));

                if (!$isLfs && !$isSvgPlaceholder && filesize($checkPath) > 500) {
                    return '/' . $clean;
                }
            }
        }

        // 4. Default fallback
        return '/assets/images/new-dynamic-course/scholaracad-banner-img.png';
    }

    public static function resolveCourseImageUrl($courseId, $storedValue = null)
    {
        $path = self::resolveCourseImagePath($courseId, $storedValue);
        if (empty($path)) {
            return '';
        }
        if (str_starts_with($path, 'http://') || str_starts_with($path, 'https://')) {
            return $path;
        }
        $appUrl = rtrim(config('app.url', 'http://127.0.0.1:8000'), '/');
        $clean = ltrim($path, '/');
        return $appUrl . '/' . implode('/', array_map('rawurlencode', explode('/', $clean)));
    }

    public function getHeaderImageAttribute($value)
    {
        return self::resolveCourseImagePath($this->id, $value);
    }

    public function getImageAttribute()
    {
        return $this->header_image;
    }

    public function getImageUrlAttribute()
    {
        $raw = $this->getRawOriginal('header_image') ?? ($this->attributes['header_image'] ?? null);
        return self::resolveCourseImageUrl($this->id, $raw);
    }

    protected static function boot()
    {
        parent::boot();

        static::creating(function ($page) {
            if (empty($page->url_title)) {
                $page->url_title = Str::slug($page->url_title);
            }
        });

        static::updating(function ($page) {
            if (empty($page->url_title)) {
                $page->url_title = Str::slug($page->url_title);
            }
        });
    }

    public function creator()
    {
        $userModel = get_class(get_model_instance('User'));
        return $this->belongsTo($userModel, 'created_by');
    }

    public function course_image()
    {
        $userModel = get_class(get_model_instance('CourseImages', 'Course'));
        // return $this->hasMany($userModel, 'Course_id');
        return $this->hasMany(CourseImages::class, 'Course_id');
    }

    public function updator()
    {
        $userModel = get_class(get_model_instance('User'));
        return $this->belongsTo($userModel, 'updated_by');
    }
    public function company()
    {
        $userModel = get_class(get_model_instance('Company', 'DynamicMaster'));
        return $this->belongsTo($userModel, 'company_id');
    }

    public function course_category()
    {
        $userModel = get_class(get_model_instance('CourseCategory', 'Course'));
        return $this->belongsTo($userModel, 'course_category_id');
    }

    public function planMappings()
    {
        $mappingModel = get_class(get_model_instance('PlanMapping', 'DynamicMaster'));
        $basicPlan = get_model_instance('Plan' , 'DynamicMaster')->where('name', 'Basic plan')->first();

        if (!$basicPlan) {
            return $this->hasMany($mappingModel, 'course_id', 'id')->whereRaw('1=0');
        }

        return $this->hasMany($mappingModel, 'course_id', 'id')
                    ->where('plan_id', $basicPlan->id);
    }





    // relations made by shivam

    public function dynamicCoursePages()
    {
        return $this->hasMany(DynamicCoursePages::class);
    }

    public function keyFeatures()
    {
        return $this->hasMany(DynamicCourseKeyfeatures::class);
    }

    public function highlights()
    {
        return $this->hasMany(CourseHighlights::class);
    }

    public function sectionHeadings()
    {
        return $this->hasMany(DynamicCourseSectionheading::class);
    }

    public function examStructure()
    {
        return $this->hasMany(NewExamStructure::class);
    }

    public function headings()
    {
        return $this->hasMany(CourseHeading::class);
    }

    public function whatYouLearn()
    {
        return $this->hasMany(Course_Whatyoulearn::class);
    }

    public function overviews()
    {
        return $this->hasMany(CourseOverviews::class);
    }

    public function whyScholarAcad()
    {
        return $this->hasMany(CourseWhyScholarAcad::class);
    }

    public function supportPages()
    {
        return $this->hasMany(CourseSupportPage::class, 'course_id');
    }

    public function quizzes()
    {
        return $this->hasMany(CourseQuiz::class, 'course_id');
    }


    // public function countries()
    // {
    //     return $this->belongsToMany(CourseCountry::class, 'course_country_pivot', 'course_id', 'country_id');
    //     // if you have a pivot table linking courses to countries
    // }

     public function scopeFilterBy($query, $countryId, $stateId, $courseId)
    {
        return $query->when($courseId, fn($q) => $q->where('id', $courseId))
            ->when($countryId, fn($q) => $q->whereHas('countries', fn($q2) => $q2->where('id', $countryId)))
            ->when($stateId, fn($q) => $q->where('state_id', $stateId));
    }


}

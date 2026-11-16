<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Tymon\JWTAuth\Exceptions\JWTException;
use Tymon\JWTAuth\Exceptions\TokenExpiredException;
use Tymon\JWTAuth\Exceptions\TokenInvalidException;
use Tymon\JWTAuth\Facades\JWTAuth;

class ApiMiddleware
{
    /**
     * Public API routes used by the Next.js website (scholaracad.com).
     * Website visitors do not log in, so these must work without a JWT.
     * Everything NOT listed here still requires a valid token.
     *
     * Intentionally NOT public (they change payment state or expose
     * other people's invoices by sequential id):
     *   api/enrollments-update, api/download,
     *   api/payment/payment/status, api/payment/ccavenue/response
     */
    protected array $publicRoutes = [
        // auth / system
        'api/login',
        'api/maintenance-check',
        'api/fetch-features',
        'api/ccavenue/callback',

        // CMS content (read only)
        'api/section-list',
        'api/section-view',
        'api/list/*',
        'api/dynamic-page',
        'api/faq/list',
        'api/testimonials/list',
        'api/testimonials/all-list',
        'api/consulting/list',
        'api/consulting/view',
        'api/consultig-page',
        'api/footer-disclamier',
        'api/blog-search',
        'api/state-url',

        // kept from the previous public list in this repo
        'api/course/*',
        'course/*',
        'api/testimonials/*',
        'api/faq/*',

        // courses / masters (read only)
        'api/dn-master/*',
        'api/dn-child-master/*',
        'api/course-master/*',
        'api/address/*',
        'api/course/category-and-course',
        'api/course/view-course',
        'api/course/course-list',
        'api/course/promo-list',
        'api/course/verify-promo',
        'api/categorised-course-list',
        'api/all-courses',
        'api/all-courses-content',
        'api/course-plans',
        'api/get-course-category/*',
        // same routes also registered without the api/ prefix; the website
        // calls these two that way (header Courses dropdown, course page)
        'course/category-and-course',
        'course/view-course',

        // resource quizzes / course support pages (website, no login)
        'api/resource/*',
        'resource/*',
        'api/courses/*',
        'courses/*',
        'api/quizzes/attempts/*',
        'quizzes/attempts/*',

        // public website forms
        'api/contact-store',
        'api/learning-calendar-store',
        'api/consultation-store',
        'api/appointment-store',
        'api/team-application-store',
        'api/store-request-for-service',
        'api/enrollments-store',
        'api/send-otp',
        'api/verify-otp',

        // checkout start / gateway (gateway verifies signatures itself)
        'api/payment/initiate',
        'api/payment/create-order',
        'api/payment/verify-payment',
        'api/payment/ccavenue/pay',
        'api/payment/ccavenue/callback',
    ];

    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        // ✅ Skip auth check for public website routes
        if ($request->is(...$this->publicRoutes)) {
            return $next($request);
        }

        try {
            // ✅ Parse and authenticate the token
            $user = JWTAuth::parseToken()->authenticate();

            if (!$user) {
                return response()->json(['message' => 'User not found'], 404);
            }

        } catch (TokenExpiredException $e) {
            return response()->json(['message' => 'Token has expired'], 401);
        } catch (TokenInvalidException $e) {
            return response()->json(['message' => 'Token is invalid'], 401);
        } catch (JWTException $e) {
            return response()->json(['message' => 'Token not provided'], 401);
        }

        // ✅ Allow the request to proceed
        return $next($request);
    }
}

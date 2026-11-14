<?php

namespace Modules\DynamicMaster\Http\Controllers;

use App\Http\Controllers\Controller;
use Modules\DynamicMaster\Services\DynamicMasterService;
use Modules\DynamicMaster\Http\Requests\DynamicMasterRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\DB;
use function PHPUnit\Framework\returnArgument;

class DynamicMasterController extends Controller
{
    protected DynamicMasterService $service;

    public function __construct(DynamicMasterService $service)
    {
        $this->service = $service;
    }

    protected function index(Request $request)
    {
        return $this->service->all($request);
    }

    protected function get_parent_list(Request $request)
    {
        return $this->service->get_parent_list($request);
    }

    protected function edit(Request $request)
    {
        return $this->service->edit($request);
    }

    protected function store(DynamicMasterRequest $request)
    {
        return $this->service->store($request);
    }

    protected function update(Request $request)
    {
        return $this->service->update($request);
    }

    protected function delete(DynamicMasterRequest $request)
    {
        return $this->service->delete($request);
    }


    protected function child_index(Request $request)
    {
        return $this->service->child_all($request);
    }
    protected function switch_company(Request $request)
    {
        return $this->service->switch_company($request);
    }

    protected function secure_file(Request $request)
    {
        $filePath = urldecode($request->path ?? '');
        $filePath = ltrim(trim($filePath), '/');

        if (!empty($filePath)) {
            // 1. Check local storage (ensure it's not a Git LFS text pointer)
            $localFullPath = storage_path("app/public/{$filePath}");
            $isLfsPointer = false;
            if (file_exists($localFullPath) && is_file($localFullPath)) {
                $head = @file_get_contents($localFullPath, false, null, 0, 40);
                if ($head && str_starts_with($head, 'version https://git-lfs')) {
                    $isLfsPointer = true;
                }
            }

            if (!$isLfsPointer && file_exists($localFullPath) && is_file($localFullPath)) {
                $ext = strtolower(pathinfo($localFullPath, PATHINFO_EXTENSION));
                $mimes = ['jpg' => 'image/jpeg', 'jpeg' => 'image/jpeg', 'png' => 'image/png', 'webp' => 'image/webp', 'svg' => 'image/svg+xml', 'gif' => 'image/gif'];
                $mimeType = $mimes[$ext] ?? (@mime_content_type($localFullPath) ?: 'image/png');
                $size = @filesize($localFullPath);

                $offset = 0;
                $chk = @fopen($localFullPath, 'rb');
                if ($chk) {
                    $prefix = fread($chk, 2);
                    if (strlen($prefix) >= 1 && (ord($prefix[0]) === 10 || ord($prefix[0]) === 13)) {
                        $offset = (strlen($prefix) >= 2 && ord($prefix[0]) === 13 && ord($prefix[1]) === 10) ? 2 : 1;
                    }
                    fclose($chk);
                }

                $contentLength = ($size !== false && $size > $offset) ? ($size - $offset) : null;

                return response()->stream(function () use ($localFullPath, $offset) {
                    $stream = @fopen($localFullPath, 'rb');
                    if ($stream) {
                        if ($offset > 0) {
                            fseek($stream, $offset);
                        }
                        fpassthru($stream);
                        fclose($stream);
                    }
                }, 200, array_filter([
                    'Access-Control-Allow-Origin' => '*',
                    'Access-Control-Allow-Methods' => 'GET, OPTIONS',
                    'Content-Type' => $mimeType,
                    'Content-Length' => $contentLength,
                    'Cache-Control' => 'public, max-age=86400',
                ]));
            }

            // Also check public path directly
            $publicFullPath = public_path($filePath);
            $isPublicLfs = false;
            if (file_exists($publicFullPath) && is_file($publicFullPath)) {
                $head = @file_get_contents($publicFullPath, false, null, 0, 40);
                if ($head && str_starts_with($head, 'version https://git-lfs')) {
                    $isPublicLfs = true;
                }
            }

            if (!$isPublicLfs && file_exists($publicFullPath) && is_file($publicFullPath)) {
                $ext = strtolower(pathinfo($publicFullPath, PATHINFO_EXTENSION));
                $mimes = ['jpg' => 'image/jpeg', 'jpeg' => 'image/jpeg', 'png' => 'image/png', 'webp' => 'image/webp', 'svg' => 'image/svg+xml', 'gif' => 'image/gif'];
                $mimeType = $mimes[$ext] ?? (@mime_content_type($publicFullPath) ?: 'image/png');
                $size = @filesize($publicFullPath);

                $offset = 0;
                $chk = @fopen($publicFullPath, 'rb');
                if ($chk) {
                    $prefix = fread($chk, 2);
                    if (strlen($prefix) >= 1 && (ord($prefix[0]) === 10 || ord($prefix[0]) === 13)) {
                        $offset = (strlen($prefix) >= 2 && ord($prefix[0]) === 13 && ord($prefix[1]) === 10) ? 2 : 1;
                    }
                    fclose($chk);
                }

                $contentLength = ($size !== false && $size > $offset) ? ($size - $offset) : null;

                return response()->stream(function () use ($publicFullPath, $offset) {
                    $stream = @fopen($publicFullPath, 'rb');
                    if ($stream) {
                        if ($offset > 0) {
                            fseek($stream, $offset);
                        }
                        fpassthru($stream);
                        fclose($stream);
                    }
                }, 200, array_filter([
                    'Access-Control-Allow-Origin' => '*',
                    'Access-Control-Allow-Methods' => 'GET, OPTIONS',
                    'Content-Type' => $mimeType,
                    'Content-Length' => $contentLength,
                    'Cache-Control' => 'public, max-age=86400',
                ]));
            }

            // 2. Redirect to live media server when file is not stored locally
            return redirect()->away("https://knowledgeadmin.scholaracad.com/master/secure-documents?path=" . rawurlencode($filePath));
        }

        return response('', 404);
    }
    protected function get_child(Request $request)
    {
        return $this->service->get_child($request);
    }

    protected function sql_create(Request $request)
    {
        return view('dynamicmaster::sql');
    }
    protected function sql_store(Request $request)
    {
        try {
            DB::statement($request->sql_command);

            return back()->with('success', "Done");
        } catch (\Exception $e) {
            return back()->with('error', $e->getMessage());
        }
    }

    public function planCreate()
    {
        return view('');
    }





}

<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        if (Schema::hasColumn('tbl_knowledge_center', 'tableof_content')) {
            return;
        }

        Schema::table('tbl_knowledge_center', function (Blueprint $table) {
            $table->longText('tableof_content')->nullable()->after('overview');
        });
    }

    public function down(): void
    {
        if (!Schema::hasColumn('tbl_knowledge_center', 'tableof_content')) {
            return;
        }

        Schema::table('tbl_knowledge_center', function (Blueprint $table) {
            $table->dropColumn('tableof_content');
        });
    }
};

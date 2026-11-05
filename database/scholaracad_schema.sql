-- ScholarAcad Production Database Schema (DDL Only)
-- Target: MariaDB / MySQL 5.7+
SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `contact_submissions`;
CREATE TABLE `contact_submissions` (
  `id` bigint(20) unsigned NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `enquiryType` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `enquiry_for` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `group_size` enum('1-10','11-20','21-30','31-60','61-100','nolimit') DEFAULT NULL,
  `country_id` varchar(255) DEFAULT NULL,
  `course_id` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `deliveryMode` varchar(255) DEFAULT NULL,
  `contactMode` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `agree` varchar(20) DEFAULT 'false',
  `is_contacted` enum('Contacted','Not Contacted') DEFAULT 'Not Contacted',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `country_state_course_url`;
CREATE TABLE `country_state_course_url` (
  `id` int(11) NOT NULL,
  `course` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `ctest`;
CREATE TABLE `ctest` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `section_details`;
CREATE TABLE `section_details` (
  `id` bigint(20) unsigned NOT NULL,
  `section` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `heading` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `button_label` varchar(200) DEFAULT NULL,
  `image_one` varchar(255) DEFAULT NULL,
  `label_one` varchar(200) DEFAULT NULL,
  `image_two` varchar(255) DEFAULT NULL,
  `label_two` varchar(200) DEFAULT NULL,
  `image_three` varchar(255) DEFAULT NULL,
  `label_three` varchar(200) DEFAULT NULL,
  `image_four` varchar(255) DEFAULT NULL,
  `label_four` varchar(200) DEFAULT NULL,
  `image_five` varchar(255) DEFAULT NULL,
  `label_five` varchar(200) DEFAULT NULL,
  `page_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `state`;
CREATE TABLE `state` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `country_id` bigint(20) unsigned NOT NULL,
  `iso` varchar(6) DEFAULT NULL,
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `wikidata_id` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_about_geography`;
CREATE TABLE `tbl_about_geography` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) DEFAULT NULL,
  `state_id` bigint(20) unsigned DEFAULT NULL,
  `description` text DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=656 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_activity_logs`;
CREATE TABLE `tbl_activity_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `source` varchar(191) DEFAULT NULL,
  `source_id` bigint(20) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=389 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_attachements`;
CREATE TABLE `tbl_attachements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `source_id` bigint(20) unsigned NOT NULL,
  `source` varchar(255) NOT NULL,
  `attachment_name` varchar(255) NOT NULL,
  `attachment_type` varchar(255) NOT NULL,
  `status` enum('Draft','Submitted') NOT NULL,
  `description` longtext DEFAULT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_bank`;
CREATE TABLE `tbl_bank` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `bank_group_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `account_no` varchar(255) DEFAULT NULL,
  `city_id` bigint(20) unsigned DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `gl_account_id` bigint(20) unsigned DEFAULT NULL,
  `currency_id` bigint(20) unsigned DEFAULT NULL,
  `contact_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_no` varchar(20) DEFAULT NULL,
  `iban` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `enable_reconciliation` enum('Yes','No') NOT NULL DEFAULT 'No',
  `status` enum('Active','In active') NOT NULL DEFAULT 'Active',
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_blogs`;
CREATE TABLE `tbl_blogs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` text DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `pages_img` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tbl_blogs_slug_unique` (`slug`),
  KEY `tbl_blogs_user_id_foreign` (`user_id`),
  KEY `tbl_blogs_country_id_foreign` (`country_id`),
  KEY `tbl_blogs_company_id_foreign` (`company_id`),
  KEY `tbl_blogs_created_by_foreign` (`created_by`),
  KEY `tbl_blogs_updated_by_foreign` (`updated_by`),
  CONSTRAINT `tbl_blogs_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_blogs_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `tbl_country` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_blogs_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_blogs_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_blogs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_buyers`;
CREATE TABLE `tbl_buyers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `member_Since` date DEFAULT NULL,
  `email` varchar(200) NOT NULL,
  `alternative_email` varchar(200) DEFAULT NULL,
  `phone_no` varchar(15) NOT NULL,
  `alternative_mobile` varchar(200) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `status` enum('Draft','Complete','Approved','Rejected','Blocked','In Review') NOT NULL DEFAULT 'Draft',
  `company_name` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `gstin` varchar(255) DEFAULT NULL,
  `pan` varchar(255) DEFAULT NULL,
  `rating` varchar(20) DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `currency_id` bigint(20) unsigned DEFAULT NULL,
  `profile_img` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `postcode` int(11) DEFAULT NULL,
  `additional_information` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_certificate_image`;
CREATE TABLE `tbl_certificate_image` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_certificate_text`;
CREATE TABLE `tbl_certificate_text` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `state_id` bigint(20) unsigned DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23009 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_certification_eligibility`;
CREATE TABLE `tbl_certification_eligibility` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `state_id` bigint(20) unsigned DEFAULT NULL,
  `eligibility_pointers` longtext DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22165 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_certification_path`;
CREATE TABLE `tbl_certification_path` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `country_id` mediumint(8) unsigned NOT NULL,
  `state_id` mediumint(8) unsigned DEFAULT NULL,
  `pointer_one` varchar(255) NOT NULL,
  `pointer_two` varchar(255) NOT NULL,
  `pointer_three` varchar(255) NOT NULL,
  `pointer_four` varchar(255) NOT NULL,
  `pointer_five` varchar(255) NOT NULL,
  `pointer_six` varchar(255) NOT NULL,
  `pointer_seven` varchar(255) NOT NULL,
  `read_more` longtext DEFAULT NULL,
  `company_id` bigint(20) DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21582 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_city`;
CREATE TABLE `tbl_city` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `isPage` enum('No','Yes') DEFAULT NULL,
  `state_id` bigint(20) unsigned DEFAULT NULL,
  `state_code` varchar(10) DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `country_code` varchar(10) DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(10,8) DEFAULT NULL,
  `flag` tinyint(4) NOT NULL DEFAULT 1,
  `wikiDataId` varchar(255) DEFAULT NULL COMMENT '	Rapid API GeoDB Cities',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=153402 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_comment_images`;
CREATE TABLE `tbl_comment_images` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned DEFAULT NULL,
  `attachment_name` varchar(255) DEFAULT NULL,
  `attachment_type` varchar(255) DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_comments`;
CREATE TABLE `tbl_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `source` varchar(255) DEFAULT NULL,
  `source_id` bigint(20) unsigned DEFAULT NULL,
  `comment` longtext DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_company`;
CREATE TABLE `tbl_company` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `vat_no` varchar(100) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zip_code` varchar(10) DEFAULT NULL,
  `company_logo` varchar(100) DEFAULT NULL,
  `about` varchar(255) DEFAULT NULL,
  `registration_no` varchar(100) NOT NULL,
  `website` varchar(255) DEFAULT NULL,
  `payment_alias_name` varchar(20) NOT NULL,
  `origin_date` date NOT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `status` enum('Active','Inactive','Blocked') NOT NULL,
  `default_company` enum('Yes','No') NOT NULL DEFAULT 'No',
  `loa` text DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_consultation_enquiries`;
CREATE TABLE `tbl_consultation_enquiries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `enquiry_for` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `group_size` enum('1-10','11-20','21-30','31-60','61-100','nolimit') DEFAULT NULL,
  `user_type` enum('Individual','Corporate') DEFAULT NULL,
  `message` text DEFAULT NULL,
  `is_contacted` enum('Contacted','Not Contacted') NOT NULL DEFAULT 'Not Contacted',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_consulting`;
CREATE TABLE `tbl_consulting` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `banner_Heading` varchar(255) DEFAULT NULL,
  `section_one_Heading` varchar(255) DEFAULT NULL,
  `banner_content` text DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `pages_img` varchar(255) DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `section_one_content` text DEFAULT NULL,
  `section_two_Heading` text DEFAULT NULL,
  `section_two_sub_Heading` text DEFAULT NULL,
  `base_text` varchar(255) DEFAULT NULL,
  `advantages` text DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `chooseus_Heading` varchar(255) DEFAULT NULL,
  `choose_us_content` text DEFAULT NULL,
  `pointer` text DEFAULT NULL,
  `faqs_contect` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_consulting_sub`;
CREATE TABLE `tbl_consulting_sub` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `consultingid` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `tbl_contact`;
CREATE TABLE `tbl_contact` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `address` varchar(255) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `Hours` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `status` enum('Active','In Active') NOT NULL DEFAULT 'Active',
  `contact_img` varchar(255) DEFAULT NULL,
  `map` text DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `x` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_continent`;
CREATE TABLE `tbl_continent` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` enum('Active','In active') NOT NULL DEFAULT 'Active',
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_country`;
CREATE TABLE `tbl_country` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code_1` varchar(5) DEFAULT NULL,
  `code_2` varchar(5) DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_course_banner_image_seo_tags`;
CREATE TABLE `tbl_course_banner_image_seo_tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `state_id` bigint(20) unsigned DEFAULT NULL,
  `banner_id` bigint(20) unsigned DEFAULT NULL,
  `alt_tag` varchar(255) DEFAULT NULL,
  `title_tag` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_course_banner_image_seo_tags_course_id_foreign` (`course_id`),
  KEY `tbl_course_banner_image_seo_tags_country_id_foreign` (`country_id`),
  KEY `tbl_course_banner_image_seo_tags_state_id_foreign` (`state_id`),
  KEY `tbl_course_banner_image_seo_tags_company_id_foreign` (`company_id`),
  KEY `tbl_course_banner_image_seo_tags_created_by_foreign` (`created_by`),
  KEY `tbl_course_banner_image_seo_tags_updated_by_foreign` (`updated_by`),
  CONSTRAINT `tbl_course_banner_image_seo_tags_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_banner_image_seo_tags_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `tbl_course_country` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_banner_image_seo_tags_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `tbl_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_banner_image_seo_tags_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_banner_image_seo_tags_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `tbl_state` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_banner_image_seo_tags_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_course_benefits`;
CREATE TABLE `tbl_course_benefits` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `state_id` bigint(20) unsigned DEFAULT NULL,
  `why_course_important_readmore` longtext DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_course_benefits_course_id_foreign` (`course_id`),
  KEY `tbl_course_benefits_country_id_foreign` (`country_id`),
  KEY `tbl_course_benefits_state_id_foreign` (`state_id`),
  KEY `tbl_course_benefits_company_id_foreign` (`company_id`),
  KEY `tbl_course_benefits_created_by_foreign` (`created_by`),
  KEY `tbl_course_benefits_updated_by_foreign` (`updated_by`),
  CONSTRAINT `tbl_course_benefits_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_benefits_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `tbl_course_country` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_benefits_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `tbl_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_benefits_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_benefits_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `tbl_state` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_benefits_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_course_certification`;
CREATE TABLE `tbl_course_certification` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `state_id` bigint(20) unsigned DEFAULT NULL,
  `program_overview` varchar(255) DEFAULT NULL,
  `training_highlights` varchar(255) DEFAULT NULL,
  `advantage` varchar(255) DEFAULT NULL,
  `new_learning_objectives` varchar(255) DEFAULT NULL,
  `old_learning_objectives` varchar(255) DEFAULT NULL,
  `curriculum` varchar(255) DEFAULT NULL,
  `exam_structure` varchar(255) DEFAULT NULL,
  `audience` varchar(255) DEFAULT NULL,
  `eligibility` varchar(255) DEFAULT NULL,
  `salaries` varchar(255) DEFAULT NULL,
  `training_options` varchar(255) DEFAULT NULL,
  `schedule` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `trainers` varchar(255) DEFAULT NULL,
  `certifications` varchar(255) DEFAULT NULL,
  `testimonials` varchar(255) DEFAULT NULL,
  `course_benefits` varchar(255) DEFAULT NULL,
  `location_faqs` varchar(255) DEFAULT NULL,
  `faqs` varchar(255) DEFAULT NULL,
  `blogs` varchar(255) DEFAULT NULL,
  `about_geography` varchar(255) DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_course_certification_course_id_foreign` (`course_id`),
  KEY `tbl_course_certification_country_id_foreign` (`country_id`),
  KEY `tbl_course_certification_state_id_foreign` (`state_id`),
  KEY `tbl_course_certification_company_id_foreign` (`company_id`),
  KEY `tbl_course_certification_created_by_foreign` (`created_by`),
  KEY `tbl_course_certification_updated_by_foreign` (`updated_by`),
  CONSTRAINT `tbl_course_certification_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_certification_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `tbl_course_country` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_certification_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `tbl_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_certification_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_certification_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `tbl_state` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_certification_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_course_country`;
CREATE TABLE `tbl_course_country` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `continent_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `isPage` enum('No','Yes') DEFAULT NULL,
  `iso3` varchar(10) DEFAULT NULL,
  `numeric_code` varchar(10) DEFAULT NULL,
  `iso2` varchar(10) DEFAULT NULL,
  `phonecode` varchar(50) DEFAULT NULL,
  `capital` varchar(50) DEFAULT NULL,
  `currency` varchar(50) DEFAULT NULL,
  `value_in_dollar` decimal(10,2) DEFAULT NULL,
  `currency_name` varchar(255) DEFAULT NULL,
  `currency_symbol` varchar(255) DEFAULT NULL,
  `tld` varchar(255) DEFAULT NULL,
  `native` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `regisubregionon` varchar(255) DEFAULT NULL,
  `timezones` text DEFAULT NULL,
  `translations` text DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(10,8) DEFAULT NULL,
  `emoji` varchar(255) DEFAULT NULL,
  `emojiU` varchar(255) DEFAULT NULL,
  `flag` tinyint(4) NOT NULL DEFAULT 1,
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  `wikiDataId` varchar(255) DEFAULT NULL COMMENT 'Rapid API GeoDB Cities',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_course_country_company_id_foreign` (`company_id`),
  KEY `tbl_course_country_created_by_foreign` (`created_by`),
  KEY `tbl_course_country_updated_by_foreign` (`updated_by`),
  CONSTRAINT `tbl_course_country_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_country_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_country_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_course_curriculum_faq`;
CREATE TABLE `tbl_course_curriculum_faq` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_course_curriculum_faq_course_id_foreign` (`course_id`),
  CONSTRAINT `tbl_course_curriculum_faq_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `tbl_courses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_course_faqs`;
CREATE TABLE `tbl_course_faqs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_category` bigint(20) unsigned DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `state_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_course_faqs_country_id_foreign` (`country_id`),
  KEY `tbl_course_faqs_state_id_foreign` (`state_id`),
  KEY `tbl_course_faqs_company_id_foreign` (`company_id`),
  KEY `tbl_course_faqs_created_by_foreign` (`created_by`),
  KEY `tbl_course_faqs_updated_by_foreign` (`updated_by`),
  CONSTRAINT `tbl_course_faqs_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_faqs_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `tbl_course_country` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_faqs_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_faqs_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `tbl_state` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_faqs_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_course_heading_description`;
CREATE TABLE `tbl_course_heading_description` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `why_scholaracad` text DEFAULT NULL,
  `curriculum` text DEFAULT NULL,
  `eligibility` text DEFAULT NULL,
  `schedule` text DEFAULT NULL,
  `trainers` text DEFAULT NULL,
  `testimonials` text DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_course_heading_description_course_id_foreign` (`course_id`),
  KEY `tbl_course_heading_description_company_id_foreign` (`company_id`),
  KEY `tbl_course_heading_description_created_by_foreign` (`created_by`),
  KEY `tbl_course_heading_description_updated_by_foreign` (`updated_by`),
  CONSTRAINT `tbl_course_heading_description_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_heading_description_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `tbl_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_heading_description_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_heading_description_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_course_highlights`;
CREATE TABLE `tbl_course_highlights` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `state_id` bigint(20) unsigned DEFAULT NULL,
  `course_description` text DEFAULT NULL,
  `course_highlights_in_pointers` text DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_course_highlights_course_id_foreign` (`course_id`),
  KEY `tbl_course_highlights_country_id_foreign` (`country_id`),
  KEY `tbl_course_highlights_state_id_foreign` (`state_id`),
  KEY `tbl_course_highlights_company_id_foreign` (`company_id`),
  KEY `tbl_course_highlights_created_by_foreign` (`created_by`),
  KEY `tbl_course_highlights_updated_by_foreign` (`updated_by`),
  CONSTRAINT `tbl_course_highlights_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_highlights_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `tbl_course_country` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_highlights_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `tbl_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_highlights_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_highlights_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `tbl_state` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_highlights_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_course_image_seotags`;
CREATE TABLE `tbl_course_image_seotags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `state_id` bigint(20) unsigned DEFAULT NULL,
  `who_this_course_image` varchar(255) DEFAULT NULL,
  `eligibility_image` varchar(255) DEFAULT NULL,
  `exam_success` varchar(255) DEFAULT NULL,
  `more_info` varchar(255) DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_course_image_seotags_course_id_foreign` (`course_id`),
  KEY `tbl_course_image_seotags_country_id_foreign` (`country_id`),
  KEY `tbl_course_image_seotags_state_id_foreign` (`state_id`),
  KEY `tbl_course_image_seotags_company_id_foreign` (`company_id`),
  KEY `tbl_course_image_seotags_created_by_foreign` (`created_by`),
  KEY `tbl_course_image_seotags_updated_by_foreign` (`updated_by`),
  CONSTRAINT `tbl_course_image_seotags_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_image_seotags_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `tbl_course_country` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_image_seotags_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `tbl_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_image_seotags_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_image_seotags_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `tbl_state` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_image_seotags_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_course_images`;
CREATE TABLE `tbl_course_images` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Course_id` bigint(20) unsigned DEFAULT NULL,
  `attachment_name` varchar(255) DEFAULT NULL,
  `attachment_type` varchar(255) DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_course_images_course_id_foreign` (`Course_id`),
  KEY `tbl_course_images_company_id_foreign` (`company_id`),
  KEY `tbl_course_images_created_by_foreign` (`created_by`),
  KEY `tbl_course_images_updated_by_foreign` (`updated_by`),
  CONSTRAINT `tbl_course_images_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_images_course_id_foreign` FOREIGN KEY (`Course_id`) REFERENCES `tbl_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_images_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_images_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_course_learning_objectives`;
CREATE TABLE `tbl_course_learning_objectives` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `state_id` bigint(20) unsigned DEFAULT NULL,
  `record_one` text DEFAULT NULL,
  `record_two` text DEFAULT NULL,
  `record_three` text DEFAULT NULL,
  `record_four` text DEFAULT NULL,
  `record_five` text DEFAULT NULL,
  `record_six` text DEFAULT NULL,
  `read_more` longtext DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_course_learning_objectives_course_id_foreign` (`course_id`),
  KEY `tbl_course_learning_objectives_country_id_foreign` (`country_id`),
  KEY `tbl_course_learning_objectives_state_id_foreign` (`state_id`),
  KEY `tbl_course_learning_objectives_company_id_foreign` (`company_id`),
  KEY `tbl_course_learning_objectives_created_by_foreign` (`created_by`),
  KEY `tbl_course_learning_objectives_updated_by_foreign` (`updated_by`),
  CONSTRAINT `tbl_course_learning_objectives_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_learning_objectives_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `tbl_course_country` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_learning_objectives_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `tbl_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_learning_objectives_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_learning_objectives_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `tbl_state` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_learning_objectives_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_course_overview`;
CREATE TABLE `tbl_course_overview` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `state_id` bigint(20) unsigned DEFAULT NULL,
  `course_overview` longtext DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_course_overview_course_id_foreign` (`course_id`),
  KEY `tbl_course_overview_country_id_foreign` (`country_id`),
  KEY `tbl_course_overview_state_id_foreign` (`state_id`),
  KEY `tbl_course_overview_company_id_foreign` (`company_id`),
  KEY `tbl_course_overview_created_by_foreign` (`created_by`),
  KEY `tbl_course_overview_updated_by_foreign` (`updated_by`),
  CONSTRAINT `tbl_course_overview_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_overview_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `tbl_course_country` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_overview_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `tbl_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_overview_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_overview_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `tbl_state` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_overview_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_course_pdf`;
CREATE TABLE `tbl_course_pdf` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `curriculum_pdf_name` varchar(255) DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_course_pdf_course_id_foreign` (`course_id`),
  KEY `tbl_course_pdf_company_id_foreign` (`company_id`),
  KEY `tbl_course_pdf_created_by_foreign` (`created_by`),
  KEY `tbl_course_pdf_updated_by_foreign` (`updated_by`),
  CONSTRAINT `tbl_course_pdf_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_pdf_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `tbl_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_pdf_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_pdf_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_course_plan_features`;
CREATE TABLE `tbl_course_plan_features` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_course_quizzes`;
CREATE TABLE `tbl_course_quizzes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'mock_exam',
  `description` text DEFAULT NULL,
  `total_questions` int(11) NOT NULL DEFAULT 0,
  `duration_minutes` int(11) NOT NULL DEFAULT 0,
  `passing_score` int(11) DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'published',
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tbl_course_quizzes_slug_unique` (`slug`),
  KEY `tbl_course_quizzes_course_id_foreign` (`course_id`),
  KEY `tbl_course_quizzes_company_id_foreign` (`company_id`),
  KEY `tbl_course_quizzes_created_by_foreign` (`created_by`),
  KEY `tbl_course_quizzes_updated_by_foreign` (`updated_by`),
  CONSTRAINT `tbl_course_quizzes_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_quizzes_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `tbl_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_quizzes_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_quizzes_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_course_readmore_certificate`;
CREATE TABLE `tbl_course_readmore_certificate` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `state_id` bigint(20) unsigned DEFAULT NULL,
  `description` text DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_course_readmore_certificate_course_id_foreign` (`course_id`),
  KEY `tbl_course_readmore_certificate_country_id_foreign` (`country_id`),
  KEY `tbl_course_readmore_certificate_state_id_foreign` (`state_id`),
  KEY `tbl_course_readmore_certificate_company_id_foreign` (`company_id`),
  KEY `tbl_course_readmore_certificate_created_by_foreign` (`created_by`),
  KEY `tbl_course_readmore_certificate_updated_by_foreign` (`updated_by`),
  CONSTRAINT `tbl_course_readmore_certificate_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_readmore_certificate_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `tbl_course_country` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_readmore_certificate_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `tbl_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_readmore_certificate_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_readmore_certificate_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `tbl_state` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_readmore_certificate_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_course_salary`;
CREATE TABLE `tbl_course_salary` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `state_id` bigint(20) unsigned DEFAULT NULL,
  `position_one_name` varchar(255) DEFAULT NULL,
  `position_one_salary` varchar(255) DEFAULT NULL,
  `position_two_name` varchar(255) DEFAULT NULL,
  `position_two_salary` varchar(255) DEFAULT NULL,
  `position_three_name` varchar(255) DEFAULT NULL,
  `position_three_salary` varchar(255) DEFAULT NULL,
  `read_more` longtext DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_course_salary_course_id_foreign` (`course_id`),
  KEY `tbl_course_salary_country_id_foreign` (`country_id`),
  KEY `tbl_course_salary_state_id_foreign` (`state_id`),
  KEY `tbl_course_salary_company_id_foreign` (`company_id`),
  KEY `tbl_course_salary_created_by_foreign` (`created_by`),
  KEY `tbl_course_salary_updated_by_foreign` (`updated_by`),
  CONSTRAINT `tbl_course_salary_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_salary_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `tbl_course_country` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_salary_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `tbl_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_salary_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_salary_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `tbl_state` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_salary_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_course_schedule`;
CREATE TABLE `tbl_course_schedule` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `course_schedule_id` varchar(255) DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `continent_id` bigint(20) unsigned DEFAULT NULL,
  `course_category_id` bigint(20) unsigned DEFAULT NULL,
  `class_start_date` date DEFAULT NULL,
  `class_end_date` date DEFAULT NULL,
  `class_start_time` date DEFAULT NULL,
  `class_end_time` date DEFAULT NULL,
  `class_language` varchar(255) DEFAULT NULL,
  `course_includes` text DEFAULT NULL,
  `discount_amt` varchar(255) DEFAULT NULL,
  `discount_offer_for` text DEFAULT NULL,
  `discount_end_date` date DEFAULT NULL,
  `enroll_end_date` datetime DEFAULT NULL,
  `status` enum('Public','Private','') DEFAULT NULL,
  `course_fees` bigint(20) unsigned DEFAULT NULL,
  `fee_currency` varchar(255) DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_course_schedule_course_id_foreign` (`course_id`),
  KEY `tbl_course_schedule_country_id_foreign` (`country_id`),
  KEY `tbl_course_schedule_course_category_id_foreign` (`course_category_id`),
  KEY `tbl_course_schedule_company_id_foreign` (`company_id`),
  KEY `tbl_course_schedule_created_by_foreign` (`created_by`),
  KEY `tbl_course_schedule_updated_by_foreign` (`updated_by`),
  CONSTRAINT `tbl_course_schedule_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_schedule_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `tbl_course_country` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_schedule_course_category_id_foreign` FOREIGN KEY (`course_category_id`) REFERENCES `tblcourse_category` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_schedule_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `tbl_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_schedule_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_schedule_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_course_seo_tags`;
CREATE TABLE `tbl_course_seo_tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `state_id` bigint(20) unsigned DEFAULT NULL,
  `who_this_course_image` varchar(255) DEFAULT NULL,
  `eligibility_image` varchar(255) DEFAULT NULL,
  `exam_success` varchar(255) DEFAULT NULL,
  `more_info` varchar(255) DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_course_seo_tags_course_id_foreign` (`course_id`),
  KEY `tbl_course_seo_tags_country_id_foreign` (`country_id`),
  KEY `tbl_course_seo_tags_state_id_foreign` (`state_id`),
  KEY `tbl_course_seo_tags_company_id_foreign` (`company_id`),
  KEY `tbl_course_seo_tags_created_by_foreign` (`created_by`),
  KEY `tbl_course_seo_tags_updated_by_foreign` (`updated_by`),
  CONSTRAINT `tbl_course_seo_tags_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_seo_tags_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `tbl_course_country` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_seo_tags_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `tbl_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_seo_tags_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_seo_tags_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `tbl_state` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_seo_tags_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_course_support_pages`;
CREATE TABLE `tbl_course_support_pages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) unsigned NOT NULL,
  `type` varchar(50) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `faqs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`faqs`)),
  `sections` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`sections`)),
  `cta_text` varchar(255) DEFAULT NULL,
  `cta_link` varchar(255) DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'draft',
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_description` text DEFAULT NULL,
  `canonical_url` varchar(255) DEFAULT NULL,
  `is_indexable` tinyint(1) NOT NULL DEFAULT 1,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tbl_course_support_pages_course_id_type_unique` (`course_id`,`type`),
  KEY `tbl_course_support_pages_company_id_foreign` (`company_id`),
  KEY `tbl_course_support_pages_created_by_foreign` (`created_by`),
  KEY `tbl_course_support_pages_updated_by_foreign` (`updated_by`),
  CONSTRAINT `tbl_course_support_pages_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_support_pages_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `tbl_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_support_pages_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_support_pages_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_course_tuition_fee`;
CREATE TABLE `tbl_course_tuition_fee` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `state_id` bigint(20) unsigned DEFAULT NULL,
  `classroom_is_bestseller` tinyint(4) DEFAULT NULL,
  `online_is_bestseller` tinyint(4) DEFAULT NULL,
  `classroom_pointers` varchar(255) DEFAULT NULL,
  `online_pointers` varchar(255) DEFAULT NULL,
  `read_more` longtext DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_course_tuition_fee_course_id_foreign` (`course_id`),
  KEY `tbl_course_tuition_fee_country_id_foreign` (`country_id`),
  KEY `tbl_course_tuition_fee_state_id_foreign` (`state_id`),
  KEY `tbl_course_tuition_fee_company_id_foreign` (`company_id`),
  KEY `tbl_course_tuition_fee_created_by_foreign` (`created_by`),
  KEY `tbl_course_tuition_fee_updated_by_foreign` (`updated_by`),
  CONSTRAINT `tbl_course_tuition_fee_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_tuition_fee_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `tbl_course_country` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_tuition_fee_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `tbl_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_tuition_fee_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_tuition_fee_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `tbl_state` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_tuition_fee_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_course_what_you_will_learn`;
CREATE TABLE `tbl_course_what_you_will_learn` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `state_id` bigint(20) unsigned DEFAULT NULL,
  `description` text DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_course_what_you_will_learn_course_id_foreign` (`course_id`),
  KEY `tbl_course_what_you_will_learn_country_id_foreign` (`country_id`),
  KEY `tbl_course_what_you_will_learn_state_id_foreign` (`state_id`),
  KEY `tbl_course_what_you_will_learn_company_id_foreign` (`company_id`),
  KEY `tbl_course_what_you_will_learn_created_by_foreign` (`created_by`),
  KEY `tbl_course_what_you_will_learn_updated_by_foreign` (`updated_by`),
  CONSTRAINT `tbl_course_what_you_will_learn_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_what_you_will_learn_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `tbl_course_country` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_what_you_will_learn_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `tbl_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_what_you_will_learn_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_what_you_will_learn_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `tbl_state` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_what_you_will_learn_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_course_why_scholaracad`;
CREATE TABLE `tbl_course_why_scholaracad` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `state_id` bigint(20) unsigned DEFAULT NULL,
  `record_one` text DEFAULT NULL,
  `record_two` text DEFAULT NULL,
  `record_three` text DEFAULT NULL,
  `record_four` text DEFAULT NULL,
  `record_five` text DEFAULT NULL,
  `record_six` text DEFAULT NULL,
  `record_seven` text DEFAULT NULL,
  `record_eight` text DEFAULT NULL,
  `record_nine` text DEFAULT NULL,
  `readmore` longtext DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_course_why_scholaracad_course_id_foreign` (`course_id`),
  KEY `tbl_course_why_scholaracad_country_id_foreign` (`country_id`),
  KEY `tbl_course_why_scholaracad_state_id_foreign` (`state_id`),
  KEY `tbl_course_why_scholaracad_company_id_foreign` (`company_id`),
  KEY `tbl_course_why_scholaracad_created_by_foreign` (`created_by`),
  KEY `tbl_course_why_scholaracad_updated_by_foreign` (`updated_by`),
  CONSTRAINT `tbl_course_why_scholaracad_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_why_scholaracad_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `tbl_course_country` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_why_scholaracad_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `tbl_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_why_scholaracad_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_why_scholaracad_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `tbl_state` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_course_why_scholaracad_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_coursebullet_points`;
CREATE TABLE `tbl_coursebullet_points` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `state_id` bigint(20) unsigned DEFAULT NULL,
  `record_one` varchar(255) DEFAULT NULL,
  `record_two` varchar(255) DEFAULT NULL,
  `record_three` varchar(255) DEFAULT NULL,
  `record_four` varchar(255) DEFAULT NULL,
  `record_five` varchar(255) DEFAULT NULL,
  `record_six` varchar(255) DEFAULT NULL,
  `read_more` text DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_coursebullet_points_course_id_foreign` (`course_id`),
  KEY `tbl_coursebullet_points_country_id_foreign` (`country_id`),
  KEY `tbl_coursebullet_points_state_id_foreign` (`state_id`),
  KEY `tbl_coursebullet_points_company_id_foreign` (`company_id`),
  KEY `tbl_coursebullet_points_created_by_foreign` (`created_by`),
  KEY `tbl_coursebullet_points_updated_by_foreign` (`updated_by`),
  CONSTRAINT `tbl_coursebullet_points_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_coursebullet_points_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `tbl_course_country` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_coursebullet_points_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `tbl_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_coursebullet_points_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_coursebullet_points_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `tbl_state` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_coursebullet_points_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_coursekey_features`;
CREATE TABLE `tbl_coursekey_features` (
  `id` bigint(20) unsigned NOT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `state_id` bigint(20) unsigned DEFAULT NULL,
  `record_one` varchar(255) DEFAULT NULL,
  `record_two` varchar(255) DEFAULT NULL,
  `record_three` varchar(255) DEFAULT NULL,
  `record_four` varchar(255) DEFAULT NULL,
  `record_five` varchar(255) DEFAULT NULL,
  `record_six` varchar(255) DEFAULT NULL,
  `read_more` text DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_courses`;
CREATE TABLE `tbl_courses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `is_demand_course` varchar(255) DEFAULT NULL,
  `url_title` varchar(255) DEFAULT NULL,
  `course_short_name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `course_category_id` bigint(20) unsigned DEFAULT NULL,
  `course_title` varchar(255) DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `overview` longtext DEFAULT NULL,
  `header_image` text DEFAULT NULL,
  `banner_bg_color` text DEFAULT NULL,
  `overview1` longtext DEFAULT NULL,
  `training_options` longtext DEFAULT NULL,
  `course_curriculum` longtext DEFAULT NULL,
  `course_details` longtext DEFAULT NULL,
  `meta_description` longtext DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `page_title` text DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_coursescholaracad_advantage`;
CREATE TABLE `tbl_coursescholaracad_advantage` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `state_id` bigint(20) unsigned DEFAULT NULL,
  `record_one` text DEFAULT NULL,
  `record_two` text DEFAULT NULL,
  `record_three` text DEFAULT NULL,
  `record_four` text DEFAULT NULL,
  `record_five` text DEFAULT NULL,
  `record_six` text DEFAULT NULL,
  `record_seven` text DEFAULT NULL,
  `record_eight` text DEFAULT NULL,
  `record_nine` text DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10015 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_dynamic_course_download_content_form`;
CREATE TABLE `tbl_dynamic_course_download_content_form` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `state_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contact_number` bigint(20) unsigned DEFAULT NULL,
  `messase` longtext DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_dynamic_course_download_content_form_course_id_foreign` (`course_id`),
  KEY `tbl_dynamic_course_download_content_form_country_id_foreign` (`country_id`),
  KEY `tbl_dynamic_course_download_content_form_state_id_foreign` (`state_id`),
  KEY `tbl_dynamic_course_download_content_form_company_id_foreign` (`company_id`),
  KEY `tbl_dynamic_course_download_content_form_created_by_foreign` (`created_by`),
  KEY `tbl_dynamic_course_download_content_form_updated_by_foreign` (`updated_by`),
  CONSTRAINT `tbl_dynamic_course_download_content_form_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_dynamic_course_download_content_form_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `tbl_course_country` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_dynamic_course_download_content_form_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `tbl_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_dynamic_course_download_content_form_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_dynamic_course_download_content_form_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `tbl_state` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_dynamic_course_download_content_form_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_dynamic_course_headline`;
CREATE TABLE `tbl_dynamic_course_headline` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `state_id` bigint(20) unsigned DEFAULT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keywords` longtext DEFAULT NULL,
  `hone_tag` varchar(255) DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `imageAltText` varchar(255) DEFAULT NULL,
  `metaDescription` text DEFAULT NULL,
  `imageAltDescription` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_dynamic_course_headline_company_id_foreign` (`company_id`),
  KEY `tbl_dynamic_course_headline_created_by_foreign` (`created_by`),
  KEY `tbl_dynamic_course_headline_updated_by_foreign` (`updated_by`),
  KEY `tbl_dynamic_course_headline_course_id_foreign` (`course_id`),
  CONSTRAINT `tbl_dynamic_course_headline_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_dynamic_course_headline_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `tbl_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_dynamic_course_headline_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_dynamic_course_headline_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_dynamic_course_image`;
CREATE TABLE `tbl_dynamic_course_image` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `state_id` bigint(20) unsigned DEFAULT NULL,
  `banner_image_path` text DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_dynamic_course_image_course_id_foreign` (`course_id`),
  KEY `tbl_dynamic_course_image_country_id_foreign` (`country_id`),
  KEY `tbl_dynamic_course_image_state_id_foreign` (`state_id`),
  KEY `tbl_dynamic_course_image_company_id_foreign` (`company_id`),
  KEY `tbl_dynamic_course_image_created_by_foreign` (`created_by`),
  KEY `tbl_dynamic_course_image_updated_by_foreign` (`updated_by`),
  CONSTRAINT `tbl_dynamic_course_image_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_dynamic_course_image_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `tbl_course_country` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_dynamic_course_image_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `tbl_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_dynamic_course_image_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_dynamic_course_image_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `tbl_state` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_dynamic_course_image_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_dynamic_course_pages`;
CREATE TABLE `tbl_dynamic_course_pages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `state_id` bigint(20) unsigned DEFAULT NULL,
  `is_ready` varchar(255) DEFAULT NULL,
  `googleRating` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `installgram` varchar(255) DEFAULT NULL,
  `enrolled` varchar(255) DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_dynamic_course_pages_course_id_foreign` (`course_id`),
  KEY `tbl_dynamic_course_pages_country_id_foreign` (`country_id`),
  KEY `tbl_dynamic_course_pages_state_id_foreign` (`state_id`),
  KEY `tbl_dynamic_course_pages_company_id_foreign` (`company_id`),
  KEY `tbl_dynamic_course_pages_created_by_foreign` (`created_by`),
  KEY `tbl_dynamic_course_pages_updated_by_foreign` (`updated_by`),
  CONSTRAINT `tbl_dynamic_course_pages_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_dynamic_course_pages_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `tbl_course_country` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_dynamic_course_pages_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `tbl_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_dynamic_course_pages_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_dynamic_course_pages_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `tbl_state` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_dynamic_course_pages_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_dynamic_course_salary`;
CREATE TABLE `tbl_dynamic_course_salary` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `state_id` bigint(20) unsigned DEFAULT NULL,
  `position_one_name` varchar(255) DEFAULT NULL,
  `position_one_salary` varchar(255) DEFAULT NULL,
  `position_two_name` varchar(255) DEFAULT NULL,
  `position_two_salary` varchar(255) DEFAULT NULL,
  `position_three_name` varchar(255) DEFAULT NULL,
  `position_three_salary` varchar(255) DEFAULT NULL,
  `read_more` longtext DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_dynamic_course_salary_course_id_foreign` (`course_id`),
  KEY `tbl_dynamic_course_salary_country_id_foreign` (`country_id`),
  KEY `tbl_dynamic_course_salary_state_id_foreign` (`state_id`),
  KEY `tbl_dynamic_course_salary_company_id_foreign` (`company_id`),
  KEY `tbl_dynamic_course_salary_created_by_foreign` (`created_by`),
  KEY `tbl_dynamic_course_salary_updated_by_foreign` (`updated_by`),
  CONSTRAINT `tbl_dynamic_course_salary_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_dynamic_course_salary_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `tbl_course_country` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_dynamic_course_salary_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `tbl_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_dynamic_course_salary_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_dynamic_course_salary_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `tbl_state` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_dynamic_course_salary_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_dynamic_course_sectionheading`;
CREATE TABLE `tbl_dynamic_course_sectionheading` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `state_id` bigint(20) unsigned DEFAULT NULL,
  `program_overview` varchar(255) DEFAULT NULL,
  `training_highlights` varchar(255) DEFAULT NULL,
  `advantage` varchar(255) DEFAULT NULL,
  `new_learning_objectives` varchar(255) DEFAULT NULL,
  `old_learning_objectives` varchar(255) DEFAULT NULL,
  `curriculum` varchar(255) DEFAULT NULL,
  `exam_structure` varchar(255) DEFAULT NULL,
  `audience` varchar(255) DEFAULT NULL,
  `eligibility` varchar(255) DEFAULT NULL,
  `salaries` varchar(255) DEFAULT NULL,
  `training_options` varchar(255) DEFAULT NULL,
  `schedule` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `trainers` varchar(255) DEFAULT NULL,
  `certifications` varchar(255) DEFAULT NULL,
  `testimonials` varchar(255) DEFAULT NULL,
  `course_benefits` varchar(255) DEFAULT NULL,
  `location_faqs` varchar(255) DEFAULT NULL,
  `faqs` varchar(255) DEFAULT NULL,
  `blogs` varchar(255) DEFAULT NULL,
  `about_geography` varchar(255) DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_dynamic_course_sectionheading_course_id_foreign` (`course_id`),
  KEY `tbl_dynamic_course_sectionheading_country_id_foreign` (`country_id`),
  KEY `tbl_dynamic_course_sectionheading_state_id_foreign` (`state_id`),
  KEY `tbl_dynamic_course_sectionheading_company_id_foreign` (`company_id`),
  KEY `tbl_dynamic_course_sectionheading_created_by_foreign` (`created_by`),
  KEY `tbl_dynamic_course_sectionheading_updated_by_foreign` (`updated_by`),
  CONSTRAINT `tbl_dynamic_course_sectionheading_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_dynamic_course_sectionheading_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `tbl_course_country` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_dynamic_course_sectionheading_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `tbl_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_dynamic_course_sectionheading_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_dynamic_course_sectionheading_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `tbl_state` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_dynamic_course_sectionheading_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_dynamic_course_trainers`;
CREATE TABLE `tbl_dynamic_course_trainers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `state_id` bigint(20) unsigned DEFAULT NULL,
  `trainer_name` varchar(255) DEFAULT NULL,
  `trainer_experience` varchar(255) DEFAULT NULL,
  `trainer_description` text DEFAULT NULL,
  `course_offered` text DEFAULT NULL,
  `image_path` text DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_dynamic_course_trainers_course_id_foreign` (`course_id`),
  KEY `tbl_dynamic_course_trainers_country_id_foreign` (`country_id`),
  KEY `tbl_dynamic_course_trainers_company_id_foreign` (`company_id`),
  KEY `tbl_dynamic_course_trainers_created_by_foreign` (`created_by`),
  KEY `tbl_dynamic_course_trainers_updated_by_foreign` (`updated_by`),
  CONSTRAINT `tbl_dynamic_course_trainers_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_dynamic_course_trainers_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `tbl_course_country` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_dynamic_course_trainers_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `tbl_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_dynamic_course_trainers_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_dynamic_course_trainers_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_email_otps`;
CREATE TABLE `tbl_email_otps` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `otp` varchar(255) NOT NULL,
  `expires_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_employee`;
CREATE TABLE `tbl_employee` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `empCode` varchar(50) NOT NULL,
  `contact_no` varchar(255) DEFAULT NULL,
  `permanent_address` varchar(255) DEFAULT NULL,
  `current_address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `status` enum('Active','Inactive','Blocked') NOT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `profile_picture` varchar(100) DEFAULT NULL,
  `position_id` bigint(20) unsigned DEFAULT NULL,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `reportto_id` bigint(20) unsigned DEFAULT NULL,
  `business_unit` bigint(20) unsigned DEFAULT NULL,
  `cost_center` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_employee_user_id_foreign` (`user_id`),
  CONSTRAINT `tbl_employee_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_enroll_request`;
CREATE TABLE `tbl_enroll_request` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `request_type` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  `phonecode` varchar(255) DEFAULT NULL,
  `phone_no` varchar(255) DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `training_mode` varchar(255) DEFAULT NULL,
  `team_size` int(11) DEFAULT NULL,
  `contact_type` varchar(255) DEFAULT NULL,
  `training_requirements` text DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_enroll_request_course_id_foreign` (`course_id`),
  KEY `tbl_enroll_request_country_id_foreign` (`country_id`),
  KEY `tbl_enroll_request_company_id_foreign` (`company_id`),
  KEY `tbl_enroll_request_created_by_foreign` (`created_by`),
  KEY `tbl_enroll_request_updated_by_foreign` (`updated_by`),
  CONSTRAINT `tbl_enroll_request_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_enroll_request_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `tbl_course_country` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_enroll_request_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `tbl_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_enroll_request_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_enroll_request_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_enrolled`;
CREATE TABLE `tbl_enrolled` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `course_data` longtext DEFAULT NULL,
  `total_course_fees` bigint(20) unsigned DEFAULT NULL,
  `payment_done` enum('yes','no') DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `checkout_session` text DEFAULT NULL,
  `invoice_link` text DEFAULT NULL,
  `invoice_download_link` text DEFAULT NULL,
  `invoice` text DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_enrolled_company_id_foreign` (`company_id`),
  KEY `tbl_enrolled_created_by_foreign` (`created_by`),
  KEY `tbl_enrolled_updated_by_foreign` (`updated_by`),
  CONSTRAINT `tbl_enrolled_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_enrolled_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_enrolled_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_enrollments`;
CREATE TABLE `tbl_enrollments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `enroll_type` enum('myself','someone') NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `country_code` varchar(10) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `alternate_contact` varchar(255) DEFAULT NULL,
  `alternate_email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_faqs`;
CREATE TABLE `tbl_faqs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `category_id` bigint(20) unsigned DEFAULT NULL,
  `title` text DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_faqs_course_id_foreign` (`course_id`),
  KEY `tbl_faqs_category_id_foreign` (`category_id`),
  KEY `tbl_faqs_company_id_foreign` (`company_id`),
  KEY `tbl_faqs_created_by_foreign` (`created_by`),
  KEY `tbl_faqs_updated_by_foreign` (`updated_by`),
  CONSTRAINT `tbl_faqs_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `tblcourse_category` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_faqs_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_faqs_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `tbl_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_faqs_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_faqs_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_faqs_category`;
CREATE TABLE `tbl_faqs_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_faqs_category_company_id_foreign` (`company_id`),
  KEY `tbl_faqs_category_created_by_foreign` (`created_by`),
  KEY `tbl_faqs_category_updated_by_foreign` (`updated_by`),
  CONSTRAINT `tbl_faqs_category_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_faqs_category_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_faqs_category_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_hiring_companies`;
CREATE TABLE `tbl_hiring_companies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `state_id` bigint(20) unsigned DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `job_role` varchar(255) DEFAULT NULL,
  `job_description` text DEFAULT NULL,
  `job_link` varchar(255) DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_hiring_companies_course_id_foreign` (`course_id`),
  KEY `tbl_hiring_companies_country_id_foreign` (`country_id`),
  KEY `tbl_hiring_companies_state_id_foreign` (`state_id`),
  KEY `tbl_hiring_companies_company_id_foreign` (`company_id`),
  KEY `tbl_hiring_companies_created_by_foreign` (`created_by`),
  KEY `tbl_hiring_companies_updated_by_foreign` (`updated_by`),
  CONSTRAINT `tbl_hiring_companies_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_hiring_companies_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `tbl_course_country` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_hiring_companies_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `tbl_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_hiring_companies_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_hiring_companies_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `tbl_state` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_hiring_companies_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_knowledge_center`;
CREATE TABLE `tbl_knowledge_center` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_category_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` varchar(255) DEFAULT NULL,
  `url_title` varchar(255) NOT NULL,
  `resource_category` bigint(20) unsigned DEFAULT NULL,
  `resource_title` varchar(255) DEFAULT NULL,
  `header_image` text DEFAULT NULL,
  `resource_auther` varchar(255) DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `overview` longtext DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `user_views` varchar(255) DEFAULT NULL,
  `status` enum('Active','In Active') NOT NULL DEFAULT 'Active',
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_knowledge_center_course_category_id_foreign` (`course_category_id`),
  KEY `tbl_knowledge_center_company_id_foreign` (`company_id`),
  KEY `tbl_knowledge_center_created_by_foreign` (`created_by`),
  KEY `tbl_knowledge_center_updated_by_foreign` (`updated_by`),
  CONSTRAINT `tbl_knowledge_center_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_knowledge_center_course_category_id_foreign` FOREIGN KEY (`course_category_id`) REFERENCES `tblcourse_category` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_knowledge_center_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_knowledge_center_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_knowledge_center_tags`;
CREATE TABLE `tbl_knowledge_center_tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `knowledge_center_id` bigint(20) unsigned DEFAULT NULL,
  `tag_id` bigint(20) unsigned DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_knowledge_center_tags_knowledge_center_id_foreign` (`knowledge_center_id`),
  KEY `tbl_knowledge_center_tags_tag_id_foreign` (`tag_id`),
  KEY `tbl_knowledge_center_tags_company_id_foreign` (`company_id`),
  KEY `tbl_knowledge_center_tags_created_by_foreign` (`created_by`),
  KEY `tbl_knowledge_center_tags_updated_by_foreign` (`updated_by`),
  CONSTRAINT `tbl_knowledge_center_tags_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_knowledge_center_tags_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_knowledge_center_tags_knowledge_center_id_foreign` FOREIGN KEY (`knowledge_center_id`) REFERENCES `tbl_knowledge_center` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_knowledge_center_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tbl_tags` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_knowledge_center_tags_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_location`;
CREATE TABLE `tbl_location` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `location_name` varchar(255) DEFAULT NULL,
  `location_type` enum('Warehouse','Store','Distribution Center') DEFAULT NULL,
  `address_line1` text DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `contact_phone` varchar(255) DEFAULT NULL,
  `contact_email` varchar(255) DEFAULT NULL,
  `gps_latitude` varchar(255) DEFAULT NULL,
  `gps_longitude` varchar(255) DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `status` enum('Active','In active') NOT NULL DEFAULT 'Active',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_login_history`;
CREATE TABLE `tbl_login_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `login_time` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_master_child`;
CREATE TABLE `tbl_master_child` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `master_parent_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_master_child_master_parent_id_foreign` (`master_parent_id`),
  KEY `tbl_master_child_company_id_foreign` (`company_id`),
  KEY `tbl_master_child_created_by_foreign` (`created_by`),
  KEY `tbl_master_child_updated_by_foreign` (`updated_by`),
  CONSTRAINT `tbl_master_child_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_master_child_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_master_child_master_parent_id_foreign` FOREIGN KEY (`master_parent_id`) REFERENCES `tbl_master_parent` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_master_child_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_master_email_template`;
CREATE TABLE `tbl_master_email_template` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `code` varchar(60) NOT NULL,
  `subject` varchar(200) DEFAULT NULL,
  `veriable` varchar(191) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `email_master_id` bigint(20) unsigned DEFAULT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_master_parent`;
CREATE TABLE `tbl_master_parent` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `master_type_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `main_account` varchar(100) DEFAULT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_master_parent_employee_id_foreign` (`employee_id`),
  KEY `tbl_master_parent_master_type_id_foreign` (`master_type_id`),
  KEY `tbl_master_parent_company_id_foreign` (`company_id`),
  KEY `tbl_master_parent_created_by_foreign` (`created_by`),
  KEY `tbl_master_parent_updated_by_foreign` (`updated_by`),
  CONSTRAINT `tbl_master_parent_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_master_parent_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_master_parent_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `tbl_employee` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_master_parent_master_type_id_foreign` FOREIGN KEY (`master_type_id`) REFERENCES `tbl_master_type` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_master_parent_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_master_type`;
CREATE TABLE `tbl_master_type` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_new_exam_structure`;
CREATE TABLE `tbl_new_exam_structure` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `state_id` bigint(20) unsigned DEFAULT NULL,
  `exam_structure` longtext DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_new_exam_structure_course_id_foreign` (`course_id`),
  KEY `tbl_new_exam_structure_country_id_foreign` (`country_id`),
  KEY `tbl_new_exam_structure_state_id_foreign` (`state_id`),
  KEY `tbl_new_exam_structure_company_id_foreign` (`company_id`),
  KEY `tbl_new_exam_structure_created_by_foreign` (`created_by`),
  KEY `tbl_new_exam_structure_updated_by_foreign` (`updated_by`),
  CONSTRAINT `tbl_new_exam_structure_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_new_exam_structure_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `tbl_course_country` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_new_exam_structure_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `tbl_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_new_exam_structure_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_new_exam_structure_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `tbl_state` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_new_exam_structure_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_notification`;
CREATE TABLE `tbl_notification` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `message` text NOT NULL,
  `url` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_notification_company_id_foreign` (`company_id`),
  KEY `tbl_notification_user_id_foreign` (`user_id`),
  CONSTRAINT `tbl_notification_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_notification_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_number_sequence`;
CREATE TABLE `tbl_number_sequence` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `code` varchar(60) NOT NULL,
  `constant_no` varchar(10) NOT NULL,
  `range_no` varchar(2) DEFAULT NULL,
  `maping_date` date DEFAULT NULL,
  `next` int(11) NOT NULL DEFAULT 1,
  `format` varchar(30) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `numbersequence_map_id` bigint(20) unsigned DEFAULT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_number_sequence_map`;
CREATE TABLE `tbl_number_sequence_map` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `code` varchar(60) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_pages`;
CREATE TABLE `tbl_pages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` text DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `pages_img` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tbl_pages_slug_unique` (`slug`),
  KEY `tbl_pages_user_id_foreign` (`user_id`),
  KEY `tbl_pages_country_id_foreign` (`country_id`),
  KEY `tbl_pages_company_id_foreign` (`company_id`),
  KEY `tbl_pages_created_by_foreign` (`created_by`),
  KEY `tbl_pages_updated_by_foreign` (`updated_by`),
  CONSTRAINT `tbl_pages_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_pages_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `tbl_country` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_pages_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_pages_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_pages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_plan_mappings`;
CREATE TABLE `tbl_plan_mappings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) unsigned NOT NULL,
  `plan_id` bigint(20) unsigned NOT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `course_fee` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(8,2) NOT NULL DEFAULT 0.00,
  `status` enum('Active','Inactive') DEFAULT 'Active',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_plans`;
CREATE TABLE `tbl_plans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `included_features` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`included_features`)),
  `excluded_features` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`excluded_features`)),
  `recommended` enum('yes','no','maybe') NOT NULL DEFAULT 'no',
  `baseDiscount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_promo_code`;
CREATE TABLE `tbl_promo_code` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `promocode` varchar(50) NOT NULL,
  `text` varchar(255) DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `discount_percentage` decimal(10,2) NOT NULL,
  `course_type` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive','expired') NOT NULL DEFAULT 'active',
  `promo_type` varchar(255) NOT NULL DEFAULT 'public',
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tbl_promo_code_promocode_unique` (`promocode`),
  KEY `tbl_promo_code_company_id_foreign` (`company_id`),
  KEY `tbl_promo_code_created_by_foreign` (`created_by`),
  KEY `tbl_promo_code_updated_by_foreign` (`updated_by`),
  KEY `tbl_promo_code_course_id_index` (`course_id`),
  CONSTRAINT `tbl_promo_code_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tbl_promo_code_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `tbl_courses` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tbl_promo_code_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_promo_code_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_quiz_attempt_answers`;
CREATE TABLE `tbl_quiz_attempt_answers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `attempt_id` bigint(20) unsigned NOT NULL,
  `question_id` bigint(20) unsigned NOT NULL,
  `selected_option_id` bigint(20) unsigned DEFAULT NULL,
  `is_correct` tinyint(1) NOT NULL DEFAULT 0,
  `is_flagged` tinyint(1) NOT NULL DEFAULT 0,
  `time_spent_seconds` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tbl_quiz_attempt_answers_attempt_id_question_id_unique` (`attempt_id`,`question_id`),
  KEY `tbl_quiz_attempt_answers_question_id_foreign` (`question_id`),
  KEY `tbl_quiz_attempt_answers_selected_option_id_foreign` (`selected_option_id`),
  CONSTRAINT `tbl_quiz_attempt_answers_attempt_id_foreign` FOREIGN KEY (`attempt_id`) REFERENCES `tbl_quiz_attempts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_quiz_attempt_answers_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `tbl_quiz_questions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_quiz_attempt_answers_selected_option_id_foreign` FOREIGN KEY (`selected_option_id`) REFERENCES `tbl_quiz_question_options` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_quiz_attempts`;
CREATE TABLE `tbl_quiz_attempts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `quiz_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `mode` varchar(30) NOT NULL DEFAULT 'exam',
  `status` varchar(30) NOT NULL DEFAULT 'in_progress',
  `total_questions` int(11) NOT NULL DEFAULT 0,
  `attempted_count` int(11) NOT NULL DEFAULT 0,
  `correct_count` int(11) NOT NULL DEFAULT 0,
  `incorrect_count` int(11) NOT NULL DEFAULT 0,
  `unanswered_count` int(11) NOT NULL DEFAULT 0,
  `score_percentage` decimal(5,2) NOT NULL DEFAULT 0.00,
  `is_passed` tinyint(1) NOT NULL DEFAULT 0,
  `started_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `completed_at` timestamp NULL DEFAULT NULL,
  `duration_minutes` int(11) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_quiz_attempts_quiz_id_foreign` (`quiz_id`),
  KEY `tbl_quiz_attempts_user_id_foreign` (`user_id`),
  CONSTRAINT `tbl_quiz_attempts_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `tbl_course_quizzes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_quiz_attempts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_quiz_question_options`;
CREATE TABLE `tbl_quiz_question_options` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `question_id` bigint(20) unsigned NOT NULL,
  `option_text` text NOT NULL,
  `option_label` varchar(10) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `is_correct` tinyint(1) NOT NULL DEFAULT 0,
  `order_no` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_quiz_question_options_question_id_foreign` (`question_id`),
  CONSTRAINT `tbl_quiz_question_options_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `tbl_quiz_questions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_quiz_questions`;
CREATE TABLE `tbl_quiz_questions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `quiz_id` bigint(20) unsigned NOT NULL,
  `question_text` longtext NOT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'single_choice',
  `mode` varchar(20) NOT NULL DEFAULT 'both',
  `image_url` varchar(255) DEFAULT NULL,
  `explanation` longtext DEFAULT NULL,
  `order_no` int(11) NOT NULL DEFAULT 1,
  `marks` int(11) NOT NULL DEFAULT 1,
  `status` varchar(20) NOT NULL DEFAULT 'active',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_quiz_questions_quiz_id_foreign` (`quiz_id`),
  CONSTRAINT `tbl_quiz_questions_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `tbl_course_quizzes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_registration_request`;
CREATE TABLE `tbl_registration_request` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `status` enum('Sent','Otp Matched','Blocked') NOT NULL,
  `no_of_attempt` int(11) DEFAULT NULL,
  `otp` varchar(255) DEFAULT NULL,
  `resend_otp` int(11) DEFAULT NULL,
  `mobile_no` bigint(20) DEFAULT NULL,
  `verify_email` varchar(255) DEFAULT NULL,
  `verify_phone` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_request_for_services`;
CREATE TABLE `tbl_request_for_services` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `country_code` varchar(10) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `service` varchar(100) DEFAULT NULL,
  `accepted_terms` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_schedule_appointments`;
CREATE TABLE `tbl_schedule_appointments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `message` text DEFAULT NULL,
  `agreed` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_slider`;
CREATE TABLE `tbl_slider` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sub_heading` varchar(255) DEFAULT NULL,
  `heading` varchar(255) DEFAULT NULL,
  `main_content` varchar(255) DEFAULT NULL,
  `section_image` varchar(255) DEFAULT NULL,
  `label_one` varchar(255) DEFAULT NULL,
  `label_one_counter` varchar(255) DEFAULT NULL,
  `label_two` varchar(255) DEFAULT NULL,
  `label_two_counter` varchar(255) DEFAULT NULL,
  `slider_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`slider_images`)),
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_slider_created_by_foreign` (`created_by`),
  KEY `tbl_slider_updated_by_foreign` (`updated_by`),
  KEY `tbl_slider_company_id_foreign` (`company_id`),
  CONSTRAINT `tbl_slider_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_slider_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_slider_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_state`;
CREATE TABLE `tbl_state` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `isPage` enum('No','Yes') DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `country_code` varchar(10) DEFAULT NULL,
  `fips_code` varchar(255) DEFAULT NULL,
  `iso2` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(10,8) DEFAULT NULL,
  `flag` tinyint(4) NOT NULL DEFAULT 1,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `wikiDataId` varchar(255) DEFAULT NULL COMMENT 'Rapid API GeoDB Cities',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_state_company_id_foreign` (`company_id`),
  KEY `tbl_state_created_by_foreign` (`created_by`),
  KEY `tbl_state_updated_by_foreign` (`updated_by`),
  CONSTRAINT `tbl_state_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_state_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_state_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5312 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_system_control`;
CREATE TABLE `tbl_system_control` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned NOT NULL,
  `dark_mode` tinyint(1) NOT NULL DEFAULT 0,
  `rtl` tinyint(1) NOT NULL DEFAULT 0,
  `enable_system_notification` tinyint(1) NOT NULL DEFAULT 0,
  `enable_email_notification` tinyint(1) NOT NULL DEFAULT 0,
  `time_format` enum('12','24') NOT NULL DEFAULT '12',
  `currency_symbol` enum('name','code') NOT NULL DEFAULT 'code',
  `def_language` enum('EN','AR') NOT NULL DEFAULT 'EN',
  `enable_google_auth` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `enable_copy_paste` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `two_fa_enable_employee` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `invoice_cancle_allow` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `grn_cancle_allow` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `date_format` varchar(255) DEFAULT NULL,
  `time_zone` varchar(255) DEFAULT NULL,
  `doc_format` varchar(255) DEFAULT NULL,
  `light_logo` varchar(255) DEFAULT NULL,
  `brand_name` varchar(255) DEFAULT NULL,
  `small_logo` varchar(255) DEFAULT NULL,
  `doc_max_size` double DEFAULT NULL,
  `workflow_type` enum('Consolidated','Company Wise') NOT NULL DEFAULT 'Consolidated',
  `numbersequence_type` enum('Consolidated','Company Wise') NOT NULL DEFAULT 'Consolidated',
  `default_currency_id` bigint(20) unsigned DEFAULT NULL,
  `default_period_id` bigint(20) unsigned DEFAULT NULL,
  `mail_mailer` varchar(10) DEFAULT NULL,
  `mail_host` varchar(50) DEFAULT NULL,
  `mail_port` varchar(10) DEFAULT NULL,
  `mail_user_name` varchar(50) DEFAULT NULL,
  `mail_password` varchar(50) DEFAULT NULL,
  `mail_encryption` varchar(10) DEFAULT NULL,
  `mail_from_name` varchar(50) DEFAULT NULL,
  `mail_from_address` varchar(50) DEFAULT NULL,
  `auto_release_enable` tinyint(1) NOT NULL DEFAULT 0,
  `auto_release_time` double DEFAULT NULL,
  `password_expiry_enable` tinyint(1) NOT NULL DEFAULT 0,
  `password_expiry_days` double DEFAULT NULL,
  `default_company_enable` tinyint(1) NOT NULL DEFAULT 0,
  `default_company` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tbl_system_control_company_id_unique` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_tags`;
CREATE TABLE `tbl_tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` enum('Active','In Active') NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tbl_tags_name_unique` (`name`),
  KEY `tbl_tags_company_id_foreign` (`company_id`),
  KEY `tbl_tags_created_by_foreign` (`created_by`),
  KEY `tbl_tags_updated_by_foreign` (`updated_by`),
  CONSTRAINT `tbl_tags_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_tags_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_tags_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_tax`;
CREATE TABLE `tbl_tax` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tax_type_id` bigint(20) unsigned NOT NULL,
  `tax_code` varchar(20) NOT NULL,
  `tax_rate` decimal(5,2) NOT NULL,
  `tax_rate_description` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `effective_from` date NOT NULL,
  `effective_until` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tbl_tax_tax_code_unique` (`tax_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_tax_type`;
CREATE TABLE `tbl_tax_type` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tax_type_name` varchar(100) NOT NULL,
  `tax_type_code` varchar(20) NOT NULL,
  `tax_category` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tbl_tax_type_tax_type_code_unique` (`tax_type_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_team_applications`;
CREATE TABLE `tbl_team_applications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `training_expertise` varchar(255) DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `training_delivery_mode` varchar(255) DEFAULT NULL,
  `ready_to_travel` enum('Yes','No') DEFAULT NULL,
  `preferred_option` enum('Full Time','Part Time') DEFAULT NULL,
  `linkedin_profile` varchar(255) DEFAULT NULL,
  `uploaded_files` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`uploaded_files`)),
  `agree` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tbl_team_applications_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_testimonial`;
CREATE TABLE `tbl_testimonial` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `state_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `job_position` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `course_overview_keywords` varchar(255) DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_testimonial_course_id_foreign` (`course_id`),
  KEY `tbl_testimonial_country_id_foreign` (`country_id`),
  KEY `tbl_testimonial_state_id_foreign` (`state_id`),
  KEY `tbl_testimonial_company_id_foreign` (`company_id`),
  KEY `tbl_testimonial_created_by_foreign` (`created_by`),
  KEY `tbl_testimonial_updated_by_foreign` (`updated_by`),
  CONSTRAINT `tbl_testimonial_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_testimonial_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `tbl_course_country` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_testimonial_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `tbl_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_testimonial_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_testimonial_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `tbl_state` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_testimonial_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_whothis_course_banner`;
CREATE TABLE `tbl_whothis_course_banner` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `state_id` bigint(20) unsigned DEFAULT NULL,
  `record_one` varchar(255) DEFAULT NULL,
  `record_two` varchar(255) DEFAULT NULL,
  `record_three` varchar(255) DEFAULT NULL,
  `record_four` varchar(255) DEFAULT NULL,
  `record_five` varchar(255) DEFAULT NULL,
  `record_six` varchar(255) DEFAULT NULL,
  `read_more` text DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_whothis_course_banner_course_id_foreign` (`course_id`),
  KEY `tbl_whothis_course_banner_country_id_foreign` (`country_id`),
  KEY `tbl_whothis_course_banner_state_id_foreign` (`state_id`),
  KEY `tbl_whothis_course_banner_company_id_foreign` (`company_id`),
  KEY `tbl_whothis_course_banner_created_by_foreign` (`created_by`),
  KEY `tbl_whothis_course_banner_updated_by_foreign` (`updated_by`),
  CONSTRAINT `tbl_whothis_course_banner_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_whothis_course_banner_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `tbl_course_country` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_whothis_course_banner_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `tbl_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_whothis_course_banner_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_whothis_course_banner_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `tbl_state` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_whothis_course_banner_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_workflow_assignment`;
CREATE TABLE `tbl_workflow_assignment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `workflow_setup_id` bigint(20) unsigned NOT NULL,
  `workflow_step_id` bigint(20) unsigned NOT NULL,
  `dept_id` bigint(20) unsigned DEFAULT NULL,
  `level` bigint(20) unsigned DEFAULT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_workflow_condition`;
CREATE TABLE `tbl_workflow_condition` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `workflow_setup_id` bigint(20) unsigned NOT NULL,
  `workflow_step_id` bigint(20) unsigned NOT NULL,
  `field` varchar(100) NOT NULL,
  `condition` enum('Equals to','Less Than','Less Than Equals to','Greater Than','Greater Than Equals to','In Between') NOT NULL,
  `condition_value` varchar(100) NOT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_workflow_deligation`;
CREATE TABLE `tbl_workflow_deligation` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned NOT NULL,
  `workflow_id` bigint(20) unsigned DEFAULT NULL,
  `emp_from` bigint(20) unsigned NOT NULL,
  `emp_to` bigint(20) unsigned NOT NULL,
  `status` enum('Active','Inactive') DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_workflow_event_history`;
CREATE TABLE `tbl_workflow_event_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned NOT NULL,
  `type` varchar(191) DEFAULT NULL,
  `doc_id` bigint(20) unsigned NOT NULL,
  `statement` varchar(191) DEFAULT NULL,
  `status` varchar(191) DEFAULT NULL,
  `event_date` date DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_workflow_map`;
CREATE TABLE `tbl_workflow_map` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `workflow_name` varchar(50) NOT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_workflow_map_log`;
CREATE TABLE `tbl_workflow_map_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `map_id` bigint(20) unsigned DEFAULT NULL,
  `workflow_setup_id` bigint(20) unsigned DEFAULT NULL,
  `mapping_date` date DEFAULT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `version` int(11) DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_workflow_setup`;
CREATE TABLE `tbl_workflow_setup` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `workflow_code` varchar(191) NOT NULL,
  `workflow_name` varchar(191) NOT NULL,
  `status` enum('Active','Inactive') DEFAULT NULL,
  `apply_on_id` bigint(20) unsigned NOT NULL,
  `mapping_date` date DEFAULT NULL,
  `workflow_map_id` bigint(20) unsigned DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT 0,
  `company_id` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_workflow_step`;
CREATE TABLE `tbl_workflow_step` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `workflow_setup_id` bigint(20) unsigned NOT NULL,
  `step_name` varchar(191) DEFAULT NULL,
  `condition` enum('Employee','Line Department','Other Department','Line Manager','Signatory','Conditional','Tender Committee Member') NOT NULL,
  `substep_type` enum('True','False') DEFAULT NULL,
  `next_step_id` bigint(20) unsigned DEFAULT NULL,
  `no_of_approver` int(11) DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT NULL,
  `system_notification` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `email_notification` enum('Yes','No') DEFAULT NULL,
  `email_template_id` bigint(20) unsigned DEFAULT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_workflow_transition_header`;
CREATE TABLE `tbl_workflow_transition_header` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ref_code` varchar(191) DEFAULT NULL,
  `workflow_map_id` bigint(20) unsigned DEFAULT NULL,
  `workflow_steps_id` bigint(20) unsigned DEFAULT NULL,
  `workflow_setup_id` bigint(20) unsigned DEFAULT NULL,
  `document_id` bigint(20) unsigned DEFAULT NULL,
  `document_code` varchar(191) DEFAULT NULL,
  `requester_id` bigint(20) unsigned DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` enum('Active','Completed') DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_workflow_transition_line`;
CREATE TABLE `tbl_workflow_transition_line` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `workflow_transition_header` bigint(20) unsigned DEFAULT NULL,
  `ref_code` varchar(191) DEFAULT NULL,
  `workflow_map_id` bigint(20) unsigned DEFAULT NULL,
  `workflow_steps_id` bigint(20) unsigned DEFAULT NULL,
  `workflow_setup_id` bigint(20) unsigned DEFAULT NULL,
  `document_id` bigint(20) unsigned DEFAULT NULL,
  `document_code` varchar(191) DEFAULT NULL,
  `emp_id` bigint(20) unsigned DEFAULT NULL,
  `url` text DEFAULT NULL,
  `requester_id` bigint(20) unsigned DEFAULT NULL,
  `assign_date` date DEFAULT NULL,
  `approval_id` bigint(20) unsigned DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` enum('Approved','Pending','Rejected','Change request') DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `signature` enum('No','Yes') DEFAULT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tbl_youtube_video`;
CREATE TABLE `tbl_youtube_video` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `video_description` varchar(255) DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_youtube_video_course_id_foreign` (`course_id`),
  KEY `tbl_youtube_video_company_id_foreign` (`company_id`),
  KEY `tbl_youtube_video_created_by_foreign` (`created_by`),
  KEY `tbl_youtube_video_updated_by_foreign` (`updated_by`),
  CONSTRAINT `tbl_youtube_video_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_youtube_video_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `tbl_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_youtube_video_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_youtube_video_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tblcourse_category`;
CREATE TABLE `tblcourse_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  `page_link` varchar(255) NOT NULL,
  `main_category_id` varchar(20) DEFAULT NULL,
  `short_description` text NOT NULL,
  `company_id` bigint(20) NOT NULL DEFAULT 1,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `mainImages` varchar(255) DEFAULT NULL,
  `Course_image` varchar(255) DEFAULT NULL,
  `Option1` varchar(100) DEFAULT NULL,
  `Option2` varchar(100) DEFAULT NULL,
  `Option3` varchar(100) DEFAULT NULL,
  `Option4` varchar(100) DEFAULT NULL,
  `Option5` varchar(100) DEFAULT NULL,
  `Option6` varchar(100) DEFAULT NULL,
  `Option7` varchar(100) DEFAULT NULL,
  `Option8` varchar(100) DEFAULT NULL,
  `scholaracad_advantage` varchar(255) DEFAULT NULL,
  `knowledge_partner` varchar(200) DEFAULT NULL,
  `knowledge_description` text DEFAULT NULL,
  `knowledge_images` varchar(255) DEFAULT NULL,
  `knowledge_button` varchar(100) DEFAULT NULL,
  `knowledge_link` varchar(255) DEFAULT NULL,
  `created_by` bigint(20) NOT NULL DEFAULT 1,
  `updated_by` bigint(20) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tble_alumni_company`;
CREATE TABLE `tble_alumni_company` (
  `id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `country_id` mediumint(8) unsigned NOT NULL,
  `state_id` mediumint(8) unsigned DEFAULT NULL,
  `company_name` varchar(200) NOT NULL,
  `company_link` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `user_company`;
CREATE TABLE `user_company` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `vendor_id` bigint(20) unsigned DEFAULT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `Status` enum('Active','In active') NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `company_id` bigint(20) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

SET FOREIGN_KEY_CHECKS=1;

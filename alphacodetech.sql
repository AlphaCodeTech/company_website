-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 11, 2023 at 01:40 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `alphacodetech`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(2, 'admin'),
(1, 'team');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add service', 7, 'add_service'),
(26, 'Can change service', 7, 'change_service'),
(27, 'Can delete service', 7, 'delete_service'),
(28, 'Can view service', 7, 'view_service'),
(29, 'Can add products', 8, 'add_products'),
(30, 'Can change products', 8, 'change_products'),
(31, 'Can delete products', 8, 'delete_products'),
(32, 'Can view products', 8, 'view_products'),
(33, 'Can add client', 9, 'add_client'),
(34, 'Can change client', 9, 'change_client'),
(35, 'Can delete client', 9, 'delete_client'),
(36, 'Can view client', 9, 'view_client'),
(37, 'Can add transaction', 10, 'add_transaction'),
(38, 'Can change transaction', 10, 'change_transaction'),
(39, 'Can delete transaction', 10, 'delete_transaction'),
(40, 'Can view transaction', 10, 'view_transaction'),
(41, 'Can add profile', 11, 'add_profile'),
(42, 'Can change profile', 11, 'change_profile'),
(43, 'Can delete profile', 11, 'delete_profile'),
(44, 'Can view profile', 11, 'view_profile'),
(45, 'Can add task', 12, 'add_task'),
(46, 'Can change task', 12, 'change_task'),
(47, 'Can delete task', 12, 'delete_task'),
(48, 'Can view task', 12, 'view_task'),
(49, 'Can add project', 13, 'add_project'),
(50, 'Can change project', 13, 'change_project'),
(51, 'Can delete project', 13, 'delete_project'),
(52, 'Can view project', 13, 'view_project'),
(53, 'Can add daily task submission', 14, 'add_dailytasksubmission'),
(54, 'Can change daily task submission', 14, 'change_dailytasksubmission'),
(55, 'Can delete daily task submission', 14, 'delete_dailytasksubmission'),
(56, 'Can view daily task submission', 14, 'view_dailytasksubmission');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$390000$bgEjRbidqZDfnNx5UbslgS$2wM5KM2eQJ84k0sQ6h0VCdkg0EQ7GPelH+3N9NDI4K4=', '2023-03-11 12:32:19.060278', 1, 'chidiebere', 'Chidiebere', 'Ibiam', 'ibiamchidiebereorji7@gmail.com', 1, 1, '2022-12-13 21:46:16.000000'),
(5, 'pbkdf2_sha256$390000$uXwVLe1ldkcJJIHw8rnBbO$gLFx6stjULb3ggd5F/zbuUZVM9ZE5IrPknPLCBJ109E=', '2023-03-09 14:30:03.367513', 0, 'chris', '', '', 'chidiebereorjiibiam7@gmail.com', 0, 1, '2023-03-09 14:17:30.365282');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(3, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_client`
--

CREATE TABLE `core_client` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `organization_type` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `date_added` datetime(6) NOT NULL,
  `service_rendered` varchar(40) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_client`
--

INSERT INTO `core_client` (`id`, `name`, `organization_type`, `address`, `date_added`, `service_rendered`, `user_id`) VALUES
(2, 'Test', 'Individual', 'Test', '2022-12-14 22:56:35.383390', 'Web Development', NULL),
(3, 'Divine Favour International Schools', 'School', 'Opara-Nestor/Ejiogu Compound, Opposite Holy Trinity Catholic Church, Awaka Owerri North L.G.A, Imo state.', '2022-12-14 22:58:06.094827', 'Web Development', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `core_dailytasksubmission`
--

CREATE TABLE `core_dailytasksubmission` (
  `id` bigint(20) NOT NULL,
  `role` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `time_spent` varchar(20) NOT NULL,
  `date_submitted` date NOT NULL,
  `task_done_on_above_mentioned_date` longtext NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `core_dailytasksubmission`
--

INSERT INTO `core_dailytasksubmission` (`id`, `role`, `email`, `time_spent`, `date_submitted`, `task_done_on_above_mentioned_date`, `user_id`) VALUES
(1, 'Backend Developer', 'ibiam@gmail.com', '4 Hours', '2023-02-26', 'Description of task performed or github repository', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `core_products`
--

CREATE TABLE `core_products` (
  `id` bigint(20) NOT NULL,
  `name` longtext NOT NULL,
  `description` longtext NOT NULL,
  `price` double NOT NULL,
  `status` varchar(30) NOT NULL,
  `date_added` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `service_id` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_products`
--

INSERT INTO `core_products` (`id`, `name`, `description`, `price`, `status`, `date_added`, `date_updated`, `service_id`) VALUES
(1, 'School Portal', 'Full school portal for Primary and Secondary Schools', 400000, 'active', '2022-12-16 01:47:17.996326', '2022-12-16 01:48:42.745564', 'Web Development');

-- --------------------------------------------------------

--
-- Table structure for table `core_project`
--

CREATE TABLE `core_project` (
  `id` bigint(20) NOT NULL,
  `project_name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `deadline` date NOT NULL,
  `github_repo` varchar(200) DEFAULT NULL,
  `is_completed` tinyint(1) DEFAULT NULL,
  `is_approved` tinyint(1) DEFAULT NULL,
  `assignee_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `core_project`
--

INSERT INTO `core_project` (`id`, `project_name`, `description`, `deadline`, `github_repo`, `is_completed`, `is_approved`, `assignee_id`) VALUES
(1, 'School Management System', 'Requirements:\r\n\r\nafjhajghag\r\n\r\nTech Stack \r\naghjghjag\r\n\r\nGithub Repo\r\nahgjahgj', '2023-02-28', 'http://github.com/alphacodetech/company_website', 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `core_service`
--

CREATE TABLE `core_service` (
  `id` bigint(20) NOT NULL,
  `name` longtext NOT NULL,
  `description` longtext NOT NULL,
  `status` varchar(30) NOT NULL,
  `date_added` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_service`
--

INSERT INTO `core_service` (`id`, `name`, `description`, `status`, `date_added`, `date_updated`) VALUES
(1, 'Web Development', 'Design of High Quality Web Apps', 'active', '2022-12-13 21:47:51.000000', '2022-12-15 00:57:30.096570'),
(2, 'UI/UX Design', 'Design of Professional User Interface and User Experienc', 'active', '2022-12-15 00:53:29.000000', '2022-12-16 01:08:09.311489');

-- --------------------------------------------------------

--
-- Table structure for table `core_task`
--

CREATE TABLE `core_task` (
  `id` bigint(20) NOT NULL,
  `task_name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `deadline` date NOT NULL,
  `github_repo` varchar(200) NOT NULL,
  `is_completed` tinyint(1) DEFAULT NULL,
  `is_approved` tinyint(1) DEFAULT NULL,
  `assignee_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `core_task`
--

INSERT INTO `core_task` (`id`, `task_name`, `description`, `deadline`, `github_repo`, `is_completed`, `is_approved`, `assignee_id`) VALUES
(1, 'Fill my Gas', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Esse quae expedita deleniti nihil eius, eum ipsam ab! Ratione eius architecto aliquam delectus iure asperiores, debitis, aspernatur ab, amet voluptate inventore?\r\n<br>\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. At iusto officia suscipit inventore delectus, repudiandae provident ex quod et cumque exercitationem quia eveniet debitis iste architecto excepturi, tempore possimus dolorem.', '2023-03-09', 'http://github.com/alphacodetech/company_website', 1, 1, 1),
(2, 'Rest for 30 Minutes', 'def projects(request, pk):\r\n    projects = Project.objects.get(assignee=pk)\r\n    return render(request, \'core/projects.html\', {\'project\':projects})\r\n\r\ndef project_detail(request,id):\r\n    if request.method == \'GET\':\r\n        proj = Project.objects.filter(id=id).first()\r\n\r\n        return JsonResponse({\'id\':proj.id,\'project_name\':proj.project_name, \'description\':proj.description,\'deadline\':proj.deadline,\'github_repo\':proj.github_repo})\r\n    else:\r\n        return JsonResponse({\'errors\':\'Something went wrong!\'})\r\n    \r\ndef project_complete(request, id):\r\n    try:\r\n        obj = get_object_or_404(Project, id=id)\r\n        obj.is_completed = True\r\n        obj.save()\r\n       \r\n        return HttpResponseRedirect(reverse(\'dashboard\'))\r\n    except:\r\n        pass', '2023-03-09', 'http://github.com/alphacodetech/company_website', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `core_transaction`
--

CREATE TABLE `core_transaction` (
  `id` bigint(20) NOT NULL,
  `product` varchar(253) NOT NULL,
  `client_name` varchar(200) NOT NULL,
  `amount` double NOT NULL,
  `payment_method` varchar(200) NOT NULL,
  `payment_receipt` varchar(100) DEFAULT NULL,
  `transaction_id` varchar(200) NOT NULL,
  `transaction_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_transaction`
--

INSERT INTO `core_transaction` (`id`, `product`, `client_name`, `amount`, `payment_method`, `payment_receipt`, `transaction_id`, `transaction_date`) VALUES
(1, 'School Portal', 'Ibiam Chidiebere Orji', 90393.99, 'cash', 'Annotation_2022-12-12_092426.jpg', 'infticsfq2azan', '2022-12-16 22:31:53.000000'),
(3, 'School Portal', 'Martin Opera', 39030, 'online-payment', '', 'inftq9t5tok8tfa', '2022-12-18 23:02:36.000000'),
(4, 'School Portal', 'Joshua Emmanuel', 90399, 'bank-transfer', '', 'inftxd0iyoprvo', '2022-12-17 23:03:35.410666');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-12-13 21:48:11.200367', '1', 'Web Development', 1, '[{\"added\": {}}]', 7, 1),
(2, '2022-12-13 23:24:28.285262', '1', 'Demo', 1, '[{\"added\": {}}]', 9, 1),
(3, '2022-12-16 01:08:09.343533', '2', 'UI/UX Design', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 7, 1),
(4, '2022-12-16 22:33:43.011910', '1', 'Ibiam Chidiebere Orji School Portal', 2, '[{\"changed\": {\"fields\": [\"Payment receipt\"]}}]', 10, 1),
(5, '2022-12-17 21:47:25.581905', '1', 'Ibiam Chidiebere Orji School Portal', 2, '[]', 10, 1),
(6, '2022-12-17 21:47:51.052312', '2', 'demo School Name', 1, '[{\"added\": {}}]', 10, 1),
(7, '2022-12-18 01:16:30.569472', '3', 'Martin Opera School Portal', 2, '[{\"changed\": {\"fields\": [\"Transaction date\"]}}]', 10, 1),
(8, '2022-12-18 20:03:50.250727', '1', 'chidiebere', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]', 4, 1),
(9, '2022-12-18 21:45:40.913976', '1', 'chidiebere', 2, '[{\"changed\": {\"fields\": [\"Profile pic\"]}}]', 11, 1),
(10, '2022-12-19 15:41:11.204775', '1', 'chidiebere', 2, '[{\"changed\": {\"fields\": [\"Linkedin url\"]}}]', 11, 1),
(11, '2022-12-19 22:09:13.357786', '1', 'Team Members', 1, '[{\"added\": {}}]', 3, 1),
(12, '2022-12-19 22:09:55.749825', '2', 'chris', 2, '[]', 4, 1),
(13, '2022-12-19 22:10:08.697677', '2', 'chris', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(14, '2022-12-20 21:41:47.066796', '2', 'admin', 1, '[{\"added\": {}}]', 3, 1),
(15, '2022-12-20 22:50:22.621865', '1', 'team', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 3, 1),
(21, '2023-03-09 10:26:40.895829', '1', 'School Management System chidiebere', 2, '[{\"changed\": {\"fields\": [\"Assignee\"]}}]', 13, 1),
(22, '2023-03-09 11:14:52.969640', '1', 'School Management System chidiebere', 2, '[{\"changed\": {\"fields\": [\"Github repo\", \"Is approved\"]}}]', 13, 1),
(23, '2023-03-09 11:15:37.723658', '1', 'School Management System chidiebere', 2, '[{\"changed\": {\"fields\": [\"Github repo\"]}}]', 13, 1),
(24, '2023-03-09 11:23:59.723715', '1', 'School Management System chidiebere', 2, '[{\"changed\": {\"fields\": [\"Is approved\"]}}]', 13, 1),
(25, '2023-03-09 11:39:18.992394', '1', 'School Management System chidiebere', 2, '[{\"changed\": {\"fields\": [\"Is completed\"]}}]', 13, 1),
(26, '2023-03-09 11:47:14.479790', '1', 'Fill my Gas chidiebere', 1, '[{\"added\": {}}]', 12, 1),
(27, '2023-03-09 11:49:17.128480', '2', 'Rest for 30 Minutes chidiebere', 1, '[{\"added\": {}}]', 12, 1),
(28, '2023-03-09 12:07:23.620420', '1', 'Fill my Gas chidiebere', 2, '[{\"changed\": {\"fields\": [\"Is approved\"]}}]', 12, 1),
(29, '2023-03-09 12:31:50.199219', '1', 'School Management System chidiebere', 2, '[{\"changed\": {\"fields\": [\"Is completed\"]}}]', 13, 1),
(30, '2023-03-09 14:05:40.273091', '1', 'ibiam', 3, '', 11, 1),
(31, '2023-03-09 14:16:49.294050', '2', 'chris', 3, '', 11, 1),
(32, '2023-03-09 14:17:16.436794', '4', 'chris', 3, '', 4, 1),
(33, '2023-03-09 14:17:16.482767', '3', 'ibiam', 3, '', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(9, 'core', 'client'),
(14, 'core', 'dailytasksubmission'),
(8, 'core', 'products'),
(13, 'core', 'project'),
(7, 'core', 'service'),
(12, 'core', 'task'),
(10, 'core', 'transaction'),
(11, 'members', 'profile'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-12-13 21:42:06.079635'),
(2, 'auth', '0001_initial', '2022-12-13 21:42:16.064252'),
(3, 'admin', '0001_initial', '2022-12-13 21:42:21.063291'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-12-13 21:42:21.279374'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-12-13 21:42:21.414979'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-12-13 21:42:22.820418'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-12-13 21:42:25.209439'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-12-13 21:42:25.524493'),
(9, 'auth', '0004_alter_user_username_opts', '2022-12-13 21:42:25.692506'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-12-13 21:42:26.702851'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-12-13 21:42:26.788282'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-12-13 21:42:26.871690'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-12-13 21:42:27.001872'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-12-13 21:42:27.121788'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-12-13 21:42:27.335125'),
(16, 'auth', '0011_update_proxy_permissions', '2022-12-13 21:42:27.401991'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-12-13 21:42:27.534984'),
(18, 'core', '0001_initial', '2022-12-13 21:42:32.109365'),
(19, 'sessions', '0001_initial', '2022-12-13 21:42:33.065152'),
(20, 'core', '0002_alter_client_service_rendered', '2022-12-14 22:38:19.158877'),
(21, 'core', '0003_alter_client_service_rendered', '2022-12-14 22:41:29.852346'),
(22, 'core', '0004_alter_client_service_rendered', '2022-12-14 22:56:08.644535'),
(23, 'core', '0005_alter_service_status', '2022-12-15 00:49:53.775448'),
(24, 'core', '0006_remove_products_code_alter_client_date_added_and_more', '2022-12-16 01:14:34.026900'),
(25, 'core', '0007_alter_products_service_id', '2022-12-16 01:46:07.064105'),
(26, 'core', '0008_transaction', '2022-12-16 20:48:06.182888'),
(27, 'members', '0001_initial', '2022-12-18 19:18:40.774688'),
(28, 'members', '0002_profile_job', '2022-12-18 21:28:30.347420'),
(29, 'core', '0009_alter_transaction_options_task_project_and_more', '2023-02-25 10:04:22.649521'),
(30, 'members', '0003_alter_profile_job', '2023-02-25 10:04:22.735464'),
(31, 'core', '0010_alter_project_github_repo', '2023-02-25 17:12:18.245483'),
(32, 'members', '0004_alter_profile_about_alter_profile_address_and_more', '2023-03-09 14:04:35.451938'),
(33, 'members', '0005_profile_fullname', '2023-03-09 14:06:35.007126'),
(34, 'members', '0006_alter_profile_company', '2023-03-09 14:19:04.448532');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('26e431q2w5axbd3hzc3klus0gqemo3iq', '.eJxVjDsOwjAQBe_iGlmO4y8lPWew1rsbHECOFCcV4u5gKQW0b2beSyTYt5L2xmuaSZyFFqffLQM-uHZAd6i3ReJSt3XOsivyoE1eF-Ln5XD_Dgq00ms7OWOUGR1Fa31UfrIYwcaRvIra4cDZwmAYArEKQYeYlQmoNHr6ZuL9AcBYNvM:1p7lW8:lvzwI0rq4-ZZluF27vr8UQmEsLn2YAPA6Mcxc2xU9uM', '2023-01-03 22:55:24.293823'),
('2u0u88gm86295stt82jqkhw7fil04hy7', '.eJxVjMEOwiAQBf-FsyHAAgWP3vsNBNhFqoYmpT0Z_92Q9KDXNzPvzUI89hqOTltYkF2ZZJffLcX8pDYAPmK7rzyvbd-WxIfCT9r5vCK9bqf7d1Bjr6M2ZEBJbwAclaSLFiCT0sIkJbzOCFZYlRWQAsw5ovXCTRM51LF4IPb5AsNsN2o:1p5D7p:6RB0bwdP9kWIfClmXdKmjUGgFbQHoKCvIAX5AuFXx_Q', '2022-12-27 21:47:45.243715'),
('4pm27ok8byxn3qkvuougdjuhaygutr8m', '.eJxVjDsOwjAQBe_iGlnJ-k9Jzxms9a6NA8iR4qRC3B0ipYD2zcx7iYjbWuPW8xInFmehxOl3S0iP3HbAd2y3WdLc1mVKclfkQbu8zpyfl8P9O6jY67fWmg0QKUeBiMPgDHkXii2ZfMqGLCgsGjiMgUsh9MqOEDIAJOcQBvH-AP0qOEc:1pVsCk:0UR36uJCxNylyI09iLQvDwuYZNAmq1opeV0yujGpJ9g', '2023-03-11 10:55:02.099886'),
('5f4vg2n31j0t2bmuc05i0yq3xqt1c0b8', '.eJxVjMEOwiAQBf-FsyHAAgWP3vsNBNhFqoYmpT0Z_92Q9KDXNzPvzUI89hqOTltYkF2ZZJffLcX8pDYAPmK7rzyvbd-WxIfCT9r5vCK9bqf7d1Bjr6M2ZEBJbwAclaSLFiCT0sIkJbzOCFZYlRWQAsw5ovXCTRM51LF4IPb5AsNsN2o:1p6ziU:zuX3iF6Xk-VrIoXFtWmzgdARq6ONw4IqezsKKK3JY1M', '2023-01-01 19:52:58.513704'),
('6nqfe0c1063sbmaeetfkikxcgiv7lq7r', '.eJxVjMEOwiAQBf-FsyHAAgWP3vsNBNhFqoYmpT0Z_92Q9KDXNzPvzUI89hqOTltYkF2ZZJffLcX8pDYAPmK7rzyvbd-WxIfCT9r5vCK9bqf7d1Bjr6M2ZEBJbwAclaSLFiCT0sIkJbzOCFZYlRWQAsw5ovXCTRM51LF4IPb5AsNsN2o:1p6HQ3:O9etHTR4FVe8eE-MXiN1jqABwE2CSPVYJfmAObe5tM8', '2022-12-30 20:34:59.282193'),
('boq6n65iyycq8hzgao5zd2mmwv1aq0cf', '.eJxVjDsOwjAQBe_iGln-LGubkj5nsHbtNQmgRMqnQtwdIqWA9s3Me6lM29rnbZE5D1VdlFWn342pPGTcQb3TeJt0mcZ1Hljvij7oorupyvN6uH8HPS39t3bReU6M1TTjIaArgQKzDZYiiEkCKYC0FMvZokXP4AVbdUAWMXJU7w_HHzcf:1payOZ:zunJfMyA6uFvlSyjD4qBcFtKURYRRIkWJshMfK_eqAE', '2023-03-25 12:32:19.124238'),
('dt04q7rl0a64c1m97afcml24j8qpsuq5', '.eJxVjMEOwiAQBf-FsyHAAgWP3vsNBNhFqoYmpT0Z_92Q9KDXNzPvzUI89hqOTltYkF2ZZJffLcX8pDYAPmK7rzyvbd-WxIfCT9r5vCK9bqf7d1Bjr6M2ZEBJbwAclaSLFiCT0sIkJbzOCFZYlRWQAsw5ovXCTRM51LF4IPb5AsNsN2o:1p6e1o:O5K32fZNcs3HCmTGZd54sDKAG3JNGZmUiRMHEao7Ze4', '2022-12-31 20:43:28.058057'),
('nlyk541gnyjkxdm5sxl6trmba5g844mz', '.eJxVjMEOwiAQBf-FsyHAAgWP3vsNBNhFqoYmpT0Z_92Q9KDXNzPvzUI89hqOTltYkF2ZZJffLcX8pDYAPmK7rzyvbd-WxIfCT9r5vCK9bqf7d1Bjr6M2ZEBJbwAclaSLFiCT0sIkJbzOCFZYlRWQAsw5ovXCTRM51LF4IPb5AsNsN2o:1p6f1e:-BXaDsENFm5bu_7wVEXM7PQ0lSifhslrqqwHPXbD0Uc', '2022-12-31 21:47:22.166373'),
('vx58hx85qe4rhwwanwkin5z59cynomba', '.eJxVjDsOwyAQBe9CHSHzWQMp0_sMaGEhOIlAMnYV5e6xJRdJOzPvvZnHbS1-62nxM7ErA3b5ZQHjM9VD0APrvfHY6rrMgR8JP23nU6P0up3t30HBXvZ1NhDFIIXMClXOwRnrIqAZIJMQZIVzSoMeZbDagkVQOwRyKPJIMkj2-QLNbTcj:1paHHP:V-z-NeP9aXsT3OgszPUyTHNkMaJzIIo-mEc7EoCMuvk', '2023-03-23 14:30:03.387522'),
('yaftj34feq0gh8ueec2g9dyk1m7syqso', '.eJxVjEEOwiAQRe_C2hBgQMCl-56BMMMoVUOT0q6Md7dNutDte-__t0h5XWpaO89pLOIitDj9Msz05LaL8sjtPkma2jKPKPdEHrbLYSr8uh7t30HNvW5r0CoCoDMBslWOvGILEDmjPaPyAIZs1K6oDTrrb4zEhkLxoDgG68XnC6pPNq0:1p8Syv:YXJO89CbyNk7S2LcwUeA_YvF9azvBov-Bys_CR6aCsY', '2023-01-05 21:20:01.354494');

-- --------------------------------------------------------

--
-- Table structure for table `members_profile`
--

CREATE TABLE `members_profile` (
  `id` bigint(20) NOT NULL,
  `about` longtext DEFAULT NULL,
  `company` varchar(255) NOT NULL,
  `country` varchar(244) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `profile_pic` varchar(100) DEFAULT NULL,
  `linkedin_url` varchar(255) DEFAULT NULL,
  `facebook_url` varchar(255) DEFAULT NULL,
  `twitter_url` varchar(255) DEFAULT NULL,
  `instagram_url` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `members_profile`
--

INSERT INTO `members_profile` (`id`, `about`, `company`, `country`, `address`, `phone_number`, `profile_pic`, `linkedin_url`, `facebook_url`, `twitter_url`, `instagram_url`, `user_id`, `job`, `fullname`) VALUES
(3, 'demo', 'Infomattic Technology', 'demo', 'demo', 'demo', 'profile/logo2.png', 'demo', 'demo', 'demo', 'demo', 5, 'demo', 'chris');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `core_client`
--
ALTER TABLE `core_client`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `core_dailytasksubmission`
--
ALTER TABLE `core_dailytasksubmission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_dailytasksubmission_user_id_b8f053b6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `core_products`
--
ALTER TABLE `core_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `core_project`
--
ALTER TABLE `core_project`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_project_assignee_id_312cafc5_fk_auth_user_id` (`assignee_id`);

--
-- Indexes for table `core_service`
--
ALTER TABLE `core_service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `core_task`
--
ALTER TABLE `core_task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_task_assignee_id_d8d3a494_fk_auth_user_id` (`assignee_id`);

--
-- Indexes for table `core_transaction`
--
ALTER TABLE `core_transaction`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transaction_id` (`transaction_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `members_profile`
--
ALTER TABLE `members_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `core_client`
--
ALTER TABLE `core_client`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `core_dailytasksubmission`
--
ALTER TABLE `core_dailytasksubmission`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `core_products`
--
ALTER TABLE `core_products`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `core_project`
--
ALTER TABLE `core_project`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `core_service`
--
ALTER TABLE `core_service`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `core_task`
--
ALTER TABLE `core_task`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `core_transaction`
--
ALTER TABLE `core_transaction`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `members_profile`
--
ALTER TABLE `members_profile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `core_client`
--
ALTER TABLE `core_client`
  ADD CONSTRAINT `core_client_user_id_49f31882_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `core_dailytasksubmission`
--
ALTER TABLE `core_dailytasksubmission`
  ADD CONSTRAINT `core_dailytasksubmission_user_id_b8f053b6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `core_project`
--
ALTER TABLE `core_project`
  ADD CONSTRAINT `core_project_assignee_id_312cafc5_fk_auth_user_id` FOREIGN KEY (`assignee_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `core_task`
--
ALTER TABLE `core_task`
  ADD CONSTRAINT `core_task_assignee_id_d8d3a494_fk_auth_user_id` FOREIGN KEY (`assignee_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `members_profile`
--
ALTER TABLE `members_profile`
  ADD CONSTRAINT `members_profile_user_id_f907d594_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

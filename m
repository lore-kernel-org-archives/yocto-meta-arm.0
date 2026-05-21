Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B55DDCD5BA4
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 09:46:47 +0000 (UTC)
Received: from mx-relay06-hz1-if1.hornetsecurity.com (mx-relay06-hz1-if1.hornetsecurity.com [94.100.128.16])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32961.1779356804706837854
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 21 May 2026 02:46:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=MZE//vpl;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.128.16, mailfrom: hsimeliere@witekio.com)
Received: from mail-northeuropeazon11022088.outbound.protection.outlook.com ([52.101.66.88]) by mx-gate06-hz1;
 Thu, 21 May 2026 11:46:42 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oYtdkjIl3HkF15pGiue2DwLpIZo6pQ/DEF4Az3+O0473RzmDo4FzVT0EsBRLhOXOKdA4Uz4pT6CxeNU4vuRcGlUf68IymRvNgDTYTqNPbSlL818ZlP0p9jSQXgHRlT9vhlS2Inoh7qAHw4qyDaODn8e/vOyiFr4rrb9Ud0dy/OfQK40emZrLKCjUDQA1Gd3l1nQmz0qBm3I0Lpj33TyAzBC3vAuG3VPpb8iiui80cnViidoFUFskyJi/AB9RcptrRFFegdYyfD5i8Pne0wcO4cMgreiFGwiAKPig/aZULIz6uwbbz3ofbSSU+6yd3V3PBlygO/Oq0yy6+2jUlNfFtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VfL48C0o0LTQtfaFt8G5G3cn7Ln4oMbsfTrsgyDGc+E=;
 b=g8cAS+zuS+6VIVqMhmhTmgYiSBL+U0gPkT5QFf/FfzVnkvJI1Ek8fhAb0CUAbRx+ghoKMx2z8tUiIWjsDfI2TpEvRFI/3BUiyqz3H09pPHduuyb78DxUEpXK6z/f7VRr8lxheDx/XosqGFbd4pOWP45mVidg/NY48b5XGWPsFbNxiVkkzwwTBuYXwOowYwjXWSeutk1N7X848y3I7NQma5FM9CtfTFdbakxm5QEQTRB4P9nXohqTwzNFIjnlGptP8l1ckFdsWnKxHMBaCDgUQvEWa3YB72lvkKWx1QUPcaEKccDhJhg9kANz/EPA7l7gFsIqSVGUztTfRWKhjM2bow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VfL48C0o0LTQtfaFt8G5G3cn7Ln4oMbsfTrsgyDGc+E=;
 b=MZE//vpl2BAB5jDC6Ap1A/9dbQtuazpfNdStG1CfhvaW/x6dKYzhHr6AJEvdHR193UswrVZuviXOB1pGgNvACHuR7wOzxDV1JhhTUq3OIBxD+bBcP/CNm3K+fFYUYJVxpe+1jwL3q7W/k0GAqQUtqxI1zjhD8dQbzEcAPpJl6MMCPU/s1hCJ1GUT3zcc/jny2+Ga5US0iPKuFOZ5Fk3UkW31DylJlLioSL6VNHZPvkQTgV0B6kZ67SFw3yHhs6sU/887QpK7srw7ecSCjabrwgI3S0sQFAIHeYjGWOuU8FdXkhU8GbzLnc8PCi/T9danRAPUb3bu0UwxaPJ80og7eA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM (2603:10a6:501:87::6) by
 DB4P192MB2786.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:5e3::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.14; Thu, 21 May 2026 09:46:34 +0000
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4]) by MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4%6]) with mapi id 15.21.0025.020; Thu, 21 May 2026
 09:46:34 +0000
From: hsimeliere.opensource@witekio.com
To: meta-arm@lists.yoctoproject.org
Cc: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>,
	Bruno VERNAY <bruno.vernay@se.com>
Subject: [meta-arm][scarthgap][PATCH 1/2] optee-os: Fix CVE-2026-33317
Date: Thu, 21 May 2026 11:46:25 +0200
Message-ID: <20260521094626.3365952-1-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P302CA0031.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::18) To MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:501:87::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWP192MB3504:EE_|DB4P192MB2786:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c05bab3-d328-44d2-8160-08deb71dd80e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|52116014|376014|366016|1800799024|3023799007|18002099003|56012099003|5023799004|13003099007;
X-Microsoft-Antispam-Message-Info: 
	BbCuoSKjuzGQJ72tSMIi2Gt94vUrqmZ0DqVytuMYq4J7yAR2P2e+c9ADo9C4tGnqr3himQvHk2pSyaF6IS8lHCeg6BWx6xiO6l7GXABPi5BGR8n++PksCReS8rNw0dh7HFooGD9N57lvE5s12X1xuTdz6YWfj7mDMJeRf99q4lk06cO98heROoG0HrCCUaQpex0JkCJxV0CdT1MXE/+vA2TYXD8wknLTSQahqXCGmxvTpXJos1VENEeUMs+Qi8G8MGOGnHSBHJN5rFaDwkG1Mkf3WvSunQRKmvvZGC1jnF91xJ4oTiD5iTF1Cn+cZnT+uFhQIdmELN8PYfIci8Rq5H7DwZ9wj7jSEnEtRi7Az3n1Z9MhY4Kkal8FHXAM+QvFgB4Em0hmkW+K7IywqUcDFnzQW+XnuhU1JG4b0TWQ4kd01kwQkJazDN7RCzNSildQh/Dj/cPV58VKUBAcuuAPk5j9CCKRbsomPdKB08lvfqS44UZwWxN8zH/Yk+9Pg+HinivpIuP2pOZ75Ak3fbuO0XUqGkp+lMDv7vJ9OYvshgh750HWg5BeaPDEnbodZO01JTJcUgqMhjGCb3Ll9D7cEoZxUuU8R+9K3wi4zVNBSsBBAG4s99VRHdaZPQFwgoamjZU3FL69FkDo9Lz+3dlVGSSK4l+7JTCV8RaOUKeLZ26ZR2omLIn+9peguCE0deTkv6WdnZ+qe5ypQhrA0bM++A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWP192MB3504.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(52116014)(376014)(366016)(1800799024)(3023799007)(18002099003)(56012099003)(5023799004)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xOlsKaBPSeaAI1dSdlYUzqmh2Gc8bd92J6GFAXCUF5V4Cw0NQdXLQJG5ZcO3?=
 =?us-ascii?Q?1LSxRGvYxwnPs8UCI2GEcVpQJjJgOBNx6NRgC70lIina/a00sLbv/8mzywSO?=
 =?us-ascii?Q?HLDy+p9fdWTf/3Hprh1YW4Bc8DehE0wxV1758QFj7TOe8PeSDE3661qPkhFK?=
 =?us-ascii?Q?En04FlHT/Ru8mFAhyTeuhOK45FGuK1mHTRXj3lQ/UQeE+MZRMgaUEuolLU6k?=
 =?us-ascii?Q?d/KB/+fRktMuuWpLn3culIy/nIhLKF3D7ZGKEeIYPYiQThVKd56tF83qybxV?=
 =?us-ascii?Q?BFBuzerEOX69hfttNJZT6dCj/vHzI4Fy9pm8sMx/aXTDJmXNka47sE+C0UmF?=
 =?us-ascii?Q?4osy4WUYUga5nEH+UKWhAeYEbxLd5mn+4jOTOqX8wPlZdpB+2rBzskAr7uJ8?=
 =?us-ascii?Q?ZGyLpctND9vql++h8qH2e2hqRQOpPqR6TopnqERkKkbHRO3EweoAML7GcdWD?=
 =?us-ascii?Q?7F7llX93I9G7O659TDoJ2hOFuePeBby3boWi3U9tHX9QnMhq8scMHFTlhMX4?=
 =?us-ascii?Q?tv8SLXJ0KdyYtUTr6l2CRuIpUheQqKxndSvwLDHeCcCvORHnDH1MXP7+sYvf?=
 =?us-ascii?Q?yhUyxSjf4np0BBBZG7nR6ASNSwcg1ZLHK4RugsdbbmGTSJWlFT5SuzZsI7ZV?=
 =?us-ascii?Q?lyf5HYdqb1b+800kExR9WQSpwqSOb5iXscVfZZuHdJd9qVxhKw1bZGGKFbsc?=
 =?us-ascii?Q?kitV/3Cw5SC8EVNDE9OOsuCJ9Mnx+v/rdGewgb2Mr6ccnlj67r9txQThz43K?=
 =?us-ascii?Q?oJWHPzXsSFt9olLPxUBsvCZr7Wll6FROZvledEzkI242pNJSIHMJUpqsZRbG?=
 =?us-ascii?Q?gjXolKb62pW9k1D9DajdTv5bG+HqNmmJ5Qik4MFaXagkhZfiUB6od4Fs1/pO?=
 =?us-ascii?Q?kqi5uOu2yhcLOmP7x1x1lw6Fu9eG9k+Kqc0tCRFW7Rw/b97gQUcJY6peiFVu?=
 =?us-ascii?Q?2mnYURxOJJ48DdmWMpweUjBe4wibrAf9jpptMrcmZVVh/fcJ6KkwvUUYfpTF?=
 =?us-ascii?Q?d2s2VEr/0gCKvsHlkZOsmuAMG4qilIst9LdDkBT5OHZm3v/SmJtSi+sLVP3p?=
 =?us-ascii?Q?044US78um63XNL77dAkBeHhVgSgU5v16SVeOQF9lIs8l7ijdrUmqEvJM70A5?=
 =?us-ascii?Q?nIIv8mpMFKSMb55CGRRI1sqAjQl/93Vn5P+Ps0Vh/3FlCR4Ie3rzPk54cI/+?=
 =?us-ascii?Q?78qOZ3IbiJQTyAEY6koL53ojECWTpHSkcYq2icTGoMsef5Zr0NN0bfVOXH+r?=
 =?us-ascii?Q?QCZQESask7spiC6ZN/S/3j/V0j4BezNq9FsqEZ3UGNGAoMaG++xmpP/ATfli?=
 =?us-ascii?Q?hX55DBIvKqh/V4ol9lj4nJgaSbKevMFq7jQX1Os6pSFheoB3UY+JXdWDLqaj?=
 =?us-ascii?Q?txXSmMdNtN0LrAF0zTmISpWf6tLqsjeWPbJ5ct5RQMlJ8pZck/7fEpBtIHZL?=
 =?us-ascii?Q?spzprIObAMcazTb00upPiRqes+VM2tGi3D6Qh97PRuimLJs+D7NZn0ha8Pwg?=
 =?us-ascii?Q?QnYPf628nwpw8GyvvA7LGCmJtK6MnSuG7kzEp/9m8eyuJ2KuYRccQXj/ENIx?=
 =?us-ascii?Q?XcGTStP/V5KZ/25RRQd7EifKjirg0/pa87VZI8idHXIGzdD3aEG6t43fI3mv?=
 =?us-ascii?Q?/nynT8DFTo2vb3pKjEiM8mEYTqfvg/1Sx8ThSg71GCLMEdUJ0/cg5muOdewF?=
 =?us-ascii?Q?1NEISyXXeMwccNEpyeYtsKx8oLArocEJNIdxvc37rpnN02C9lTkM+CuXwvfj?=
 =?us-ascii?Q?UN0NMOhE45qX2OZ2vnQAZ9T0LEFu3Afu2HGjfQ675Bsq2O63p0aU9nkNy/Q6?=
X-MS-Exchange-AntiSpam-MessageData-1: rHnmGvXlZiq9SQ==
X-Exchange-RoutingPolicyChecked: 
	Z4qR7zlNL7EfY7f+0I3xclEYb2ifTRjPUmJYAUwPlwhXIPU82UywuxVFRNv6vofxYBrXQbVJn5HN8WwEZloo3NUKvCvAnBVRVWZpwCvZ3G0mY/lehyPbebOZfuOxHvW841we8fqnd4sPE9FDW9Ji2wPChSNFPTmPZLhEQ686/qmBFgFd16SJxQX/NKH2diRTFVl3LEqWGpi9r5jxQGxVfcSDlP1gAGWEX7QYbRvZy/UiIaDEnnxSz1E6JEJ0uhCMF7FTUL13Q6B6wljg8lcQLX+2aIXBSwsNEYKqeJ2VxRmJE5eN7AxHYsL7YHloYVIDyRLfMwLPXq2Yes3jjxWPIQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	+8XU2cYUiALGueN9AYciJZNFGoJ6kZki80ZyQLYVxObOtyVJVWw+chI/0/hfBrU+iPNmyehDXcFyV7oMyoqeLHXEsWxLdBKe7xKZwMse0jJITXoSLDtKQsyRIMrTFgTOVryqQFhAU5hgyAUoFcfAwnpF5G3SEzLppr1xvrMmMegJ+faiwo+kU9lnsEvkpo3f8ug0yOj3p/dQ0pF6lo9vH2SKMMFHqXefevkexxtIGyxNWHS3lWtMbuevcAFHT66/XOsx0xWVQbQCDP/Qont0F4RQcToeua5L6WoQ/2KllCHqgD006k1AM7qqiyyEzxgonCj4Xz2B+u2KH7iccGcuZYb3iVHydTgz7eNWGFeUy3I0i3ZMO4GPEzGorer5fSPDw0ufkamo4bNfbg8wMLdANpokNpMOkK4+wRLHg5SHzJRy9ur6WrIj5dPyB2UI08+S9yhhDRqrjmmAtCBVdP56aIg/F+nj87R9WTbT5u4JfvUaDWXmmRR0MagNQRdZkOdUaPk3q+crWiNI79CEihBjUl/wCR+txnVnA3k/sxkvXqyBZuFlP+ri7kvScFnkzwpIS342u+7uC51qS0hQIMEdVO1ZBP4qCHwah2zsjsFOWin3hxFTk5BdYPxR30iQNfE9
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c05bab3-d328-44d2-8160-08deb71dd80e
X-MS-Exchange-CrossTenant-AuthSource: MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 09:46:34.0885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yPcBq05u69+4yrZAzoMT3myqiAqx+LIFHeFk5KJMiFJ5hO9bOAYooJa021/UcTySyGeYFwJVGBm42pR8AzBixA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4P192MB2786
X-cloud-security-sender: hsimeliere@witekio.com
X-cloud-security-recipient: meta-arm@lists.yoctoproject.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: hsimeliere.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate06-hz1 with 4gLk7y1llkz4PJMW
X-cloud-security-connect: mail-northeuropeazon11022088.outbound.protection.outlook.com[52.101.66.88], TLS=1, IP=52.101.66.88
X-cloud-security-Digest: ddc6abd9e1fd7930d7c8c58910987c42
X-cloud-security: scantime:1.202
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 21 May 2026 09:46:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7058

From: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>

Pick patches from [1], [2] and [3] as mentioned in Debian report in [4].

[1] https://github.com/OP-TEE/optee_os/commit/e031c4e562023fd9f199e39fd2e85797e4cbdca9
[2] https://github.com/OP-TEE/optee_os/commit/16926d5a46934c46e6656246b4fc18385a246900
[3] https://github.com/OP-TEE/optee_os/commit/149e8d7ecc4ef8bb00ab4a37fd2ccede6d79e1ca
[4] https://security-tracker.debian.org/tracker/CVE-2026-33317

Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
Reviewed-by: Bruno VERNAY <bruno.vernay@se.com>
---
 .../optee/optee-os/CVE-2026-33317-1.patch     | 51 ++++++++++++++++++
 .../optee/optee-os/CVE-2026-33317-2.patch     | 52 +++++++++++++++++++
 .../optee/optee-os/CVE-2026-33317-3.patch     | 46 ++++++++++++++++
 .../recipes-security/optee/optee-os_4.1.0.bb  |  3 ++
 4 files changed, 152 insertions(+)
 create mode 100644 meta-arm/recipes-security/optee/optee-os/CVE-2026-33317-1.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-os/CVE-2026-33317-2.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-os/CVE-2026-33317-3.patch

diff --git a/meta-arm/recipes-security/optee/optee-os/CVE-2026-33317-1.patch b/meta-arm/recipes-security/optee/optee-os/CVE-2026-33317-1.patch
new file mode 100644
index 00000000..2e693209
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os/CVE-2026-33317-1.patch
@@ -0,0 +1,51 @@
+From fcacaa1f80c601907299b8f9de8b57cc35cd5a68 Mon Sep 17 00:00:00 2001
+From: Etienne Carriere <etienne.carriere@st.com>
+Date: Wed, 21 Jan 2026 13:55:33 +0100
+Subject: [PATCH 1/3] ta: pkcs11: check output buffer size on get attribute
+ value
+
+Check client output buffer input size and update its output
+size on PKCS11_CMD_GET_ATTRIBUTE_VALUE command.
+
+CVE: CVE-2026-33317
+Upstream-Status: Backport [https://github.com/OP-TEE/optee_os/commit/e031c4e562023fd9f199e39fd2e85797e4cbdca9]
+
+Fixes: 783c1515c2f9 ("ta: pkcs11: Add support for getting object size and attribute value")
+Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
+Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
+Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
+---
+ ta/pkcs11/src/object.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/ta/pkcs11/src/object.c b/ta/pkcs11/src/object.c
+index c9a95e1b2..ba3be7a71 100644
+--- a/ta/pkcs11/src/object.c
++++ b/ta/pkcs11/src/object.c
+@@ -800,6 +800,15 @@ enum pkcs11_rc entry_get_attribute_value(struct pkcs11_client *client,
+ 		goto out;
+ 	}
+ 
++	/*
++	 * We will update the template with relevant data, without resizing it.
++	 * Upon completion, it will be copied to client output buffer.
++	 */
++	if (out->memref.size < sizeof(*template) + template->attrs_size) {
++		rc = PKCS11_CKR_ARGUMENTS_BAD;
++		goto out;
++	}
++
+ 	/* Iterate over attributes and set their values */
+ 	/*
+ 	 * 1. If the specified attribute (i.e., the attribute specified by the
+@@ -912,6 +921,7 @@ enum pkcs11_rc entry_get_attribute_value(struct pkcs11_client *client,
+ 		rc = PKCS11_CKR_BUFFER_TOO_SMALL;
+ 
+ 	/* Move updated template to out buffer */
++	out->memref.size = sizeof(*template) + template->attrs_size;
+ 	TEE_MemMove(out->memref.buffer, template, out->memref.size);
+ 
+ 	DMSG("PKCS11 session %"PRIu32": get attributes %#"PRIx32,
+-- 
+2.43.0
+
diff --git a/meta-arm/recipes-security/optee/optee-os/CVE-2026-33317-2.patch b/meta-arm/recipes-security/optee/optee-os/CVE-2026-33317-2.patch
new file mode 100644
index 00000000..f77ca4bc
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os/CVE-2026-33317-2.patch
@@ -0,0 +1,52 @@
+From 7e57efa90820489f123708f8ae5ee13706e8f4ce Mon Sep 17 00:00:00 2001
+From: Etienne Carriere <etienne.carriere@st.com>
+Date: Wed, 21 Jan 2026 13:58:09 +0100
+Subject: [PATCH 2/3] ta: pkcs11: check template consistency on get attribute
+ value
+
+Check client template holds consistent attribute area sizes
+value on PKCS11_CMD_GET_ATTRIBUTE_SIZE.
+
+CVE: CVE-2026-33317
+Upstream-Status: Backport [https://github.com/OP-TEE/optee_os/commit/16926d5a46934c46e6656246b4fc18385a246900]
+
+Fixes: 783c1515c2f9 ("ta: pkcs11: Add support for getting object size and attribute value")
+Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
+Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
+Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
+---
+ ta/pkcs11/src/object.c | 13 ++++++++++++-
+ 1 file changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/ta/pkcs11/src/object.c b/ta/pkcs11/src/object.c
+index ba3be7a71..470eeb247 100644
+--- a/ta/pkcs11/src/object.c
++++ b/ta/pkcs11/src/object.c
+@@ -840,12 +840,23 @@ enum pkcs11_rc entry_get_attribute_value(struct pkcs11_client *client,
+ 	for (; cur < end; cur += len) {
+ 		struct pkcs11_attribute_head *cli_ref = (void *)cur;
+ 		struct pkcs11_attribute_head cli_head = { };
++		uintptr_t cli_end = 0;
+ 		void *data_ptr = NULL;
+ 
++		if ((char *)(cli_ref + 1) > end) {
++			rc = PKCS11_CKR_ARGUMENTS_BAD;
++			goto out;
++		}
++
+ 		/* Make copy of header so that is aligned properly. */
+ 		TEE_MemMove(&cli_head, cli_ref, sizeof(cli_head));
+ 
+-		len = sizeof(*cli_ref) + cli_head.size;
++		if (ADD_OVERFLOW(sizeof(*cli_ref), cli_head.size, &len) ||
++		    ADD_OVERFLOW((uintptr_t)cur, len, &cli_end) ||
++		    (char *)cli_end > end) {
++			rc = PKCS11_CKR_ARGUMENTS_BAD;
++			goto out;
++		}
+ 
+ 		/* Treat hidden attributes as missing attributes */
+ 		if (attribute_is_hidden(&cli_head)) {
+-- 
+2.43.0
+
diff --git a/meta-arm/recipes-security/optee/optee-os/CVE-2026-33317-3.patch b/meta-arm/recipes-security/optee/optee-os/CVE-2026-33317-3.patch
new file mode 100644
index 00000000..2481a81c
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os/CVE-2026-33317-3.patch
@@ -0,0 +1,46 @@
+From 75c1a999d6b51520234276b207ceefbd5e18ed02 Mon Sep 17 00:00:00 2001
+From: Etienne Carriere <etienne.carriere@st.com>
+Date: Wed, 21 Jan 2026 14:03:26 +0100
+Subject: [PATCH 3/3] ta: pkcs11: fix attribute output size if too small on get
+ attribute value
+
+Correct the size field output value for attributes fetched with
+PKCS11_CMD_GET_ATTRIBUTE_VALUE where a too short buffer was provided.
+As per the PKCS#11 specification, in such case, the related attributes
+size field should be filled with CK_UNAVAILABLE_INFORMATION and the
+function to return an non-true-error code like CKR_BUFFER_TOO_SMALL.
+The implementation complied for the return value but was loading the
+required attribute data value size instead in CK_UNAVAILABLE_INFORMATION
+in the attribute size field.
+
+CVE: CVE-2026-33317
+Upstream-Status: Backport [https://github.com/OP-TEE/optee_os/commit/149e8d7ecc4ef8bb00ab4a37fd2ccede6d79e1ca]
+
+Fixes: 783c1515c2f9 ("ta: pkcs11: Add support for getting object size and attribute value")
+Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
+Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
+Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
+---
+ ta/pkcs11/src/object.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/ta/pkcs11/src/object.c b/ta/pkcs11/src/object.c
+index 470eeb247..ed2ce2a95 100644
+--- a/ta/pkcs11/src/object.c
++++ b/ta/pkcs11/src/object.c
+@@ -900,8 +900,11 @@ enum pkcs11_rc entry_get_attribute_value(struct pkcs11_client *client,
+ 			attr_type_invalid = 1;
+ 			break;
+ 		case PKCS11_CKR_BUFFER_TOO_SMALL:
+-			if (data_ptr)
++			if (data_ptr) {
++				cli_head.size =
++					PKCS11_CK_UNAVAILABLE_INFORMATION;
+ 				buffer_too_small = 1;
++			}
+ 			break;
+ 		default:
+ 			rc = PKCS11_CKR_GENERAL_ERROR;
+-- 
+2.43.0
+
diff --git a/meta-arm/recipes-security/optee/optee-os_4.1.0.bb b/meta-arm/recipes-security/optee/optee-os_4.1.0.bb
index bfb61eb2..1846baf0 100644
--- a/meta-arm/recipes-security/optee/optee-os_4.1.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os_4.1.0.bb
@@ -7,4 +7,7 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 SRCREV = "18b424c23aa5a798dfe2e4d20b4bde3919dc4e99"
 SRC_URI += " \
     file://0003-optee-enable-clang-support.patch \
+    file://CVE-2026-33317-1.patch \
+    file://CVE-2026-33317-2.patch \
+    file://CVE-2026-33317-3.patch \
    "
-- 
2.43.0



Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA3FAC87FCB
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 08:48:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.30599.1753865330326167331
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 30 Jul 2025 01:48:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0306b5c689=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56U5N16w2061461
	for <meta-arm@lists.yoctoproject.org>; Wed, 30 Jul 2025 08:48:49 GMT
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 484m7xktbx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-arm@lists.yoctoproject.org>; Wed, 30 Jul 2025 08:48:48 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 30 Jul 2025 01:48:46 -0700
Received: from ala-lpggp7.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Wed, 30 Jul 2025 01:48:46 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <meta-arm@lists.yoctoproject.org>
Subject: [PATCH] optee-os_4.4.0: fix CVE-2025-46733
Date: Wed, 30 Jul 2025 01:48:51 -0700
Message-ID: <20250730084851.783798-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA2MSBTYWx0ZWRfX/0E29r3tMFdD
 dutvVRzduDugGeNyZ7WHku2TLAmJLTYkJJtueu2ifcMQX4OPXwYys10Rm+B+/rHrz0XnAp3xB5n
 OAr6bbpqHdDl7w1lyJlDqVvoauZieAj7m3j92EKVxeby/DShdFTYYHSwwdRWnYT8D04jvVNZDUS
 b/6N5uOxzWTQ6TTcSoT5fWNcddvP4Z/iuietKnL9opfjwPycjEYCMtl4h8ncYoKB8LqkHW2P/ZR
 YYcrFFArl829ljvBiBP1UWgRY1GpxX8S+C+5+MZYZXZqcj/NBEuXvyP7MPmqq53rxl0c7XA7Wsz
 qoZwpVY9Z8UgsJVm3BIWxR4HoD745sZGxBYMF/ngL7zqSfhExHe6VMout9gl0aTHhhUOM8fGlWQ
 EymcLSXp
X-Proofpoint-ORIG-GUID: Fys7b6eeayWlHioOp5lPdljNzJ53k-eH
X-Proofpoint-GUID: Fys7b6eeayWlHioOp5lPdljNzJ53k-eH
X-Authority-Analysis: v=2.4 cv=Y9v4sgeN c=1 sm=1 tr=0 ts=6889dc71 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=KKAkSRfTAAAA:8
 a=DfNHnWVPAAAA:8 a=8b9GpE9nAAAA:8 a=WXWfoxid4xo9Dc6-xPMA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=cvBusfyB2V15izCimMoJ:22 a=rjTVMONInIDnV1a_A2c_:22
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_03,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1011 malwarescore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507210000 definitions=main-2507250208
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 30 Jul 2025 08:48:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6634

Backport a patch from upstream [1] to fix CVE-2025-46733

[1] https://github.com/OP-TEE/optee_os/commit/941a58d78c99c4754fbd4ec3079ec9e1d596af8f

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../optee/optee-os/CVE-2025-46733.patch       | 95 +++++++++++++++++++
 .../recipes-security/optee/optee-os_4.4.0.bb  |  1 +
 2 files changed, 96 insertions(+)
 create mode 100644 meta-arm/recipes-security/optee/optee-os/CVE-2025-46733.patch

diff --git a/meta-arm/recipes-security/optee/optee-os/CVE-2025-46733.patch b/meta-arm/recipes-security/optee/optee-os/CVE-2025-46733.patch
new file mode 100644
index 00000000..e0752473
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os/CVE-2025-46733.patch
@@ -0,0 +1,95 @@
+From 1cd82c9df9bf86f6e2a48e6964db188dd15ed1f5 Mon Sep 17 00:00:00 2001
+From: Jens Wiklander <jens.wiklander@linaro.org>
+Date: Fri, 4 Apr 2025 10:24:34 +0200
+Subject: [PATCH] Add optee.ta.instanceKeepCrashed property
+
+Add the optee.ta.instanceKeepCrashed property to prevent a TA with
+gpd.ta.instanceKeepAlive=true to be restarted. This prevents unexpected
+resetting of the state of the TA.
+
+Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
+Reviewed-by: Jerome Forissier <jerome.forissier@linaro.org>
+Reviewed-by: Alex Lewontin <alex.lewontin@canonical.com>
+Reviewed-by: Etienne Carriere <etienne.carriere@foss.st.com>
+
+CVE: CVE-2025-46733
+Upstream-Status: Backport [https://github.com/OP-TEE/optee_os/commit/941a58d78c99c4754fbd4ec3079ec9e1d596af8f]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ core/kernel/tee_ta_manager.c         | 10 +++++++---
+ lib/libutee/include/user_ta_header.h |  8 +++++++-
+ ta/user_ta_header.c                  |  3 +++
+ 3 files changed, 17 insertions(+), 4 deletions(-)
+
+diff --git a/core/kernel/tee_ta_manager.c b/core/kernel/tee_ta_manager.c
+index e47404688..75e55a8e4 100644
+--- a/core/kernel/tee_ta_manager.c
++++ b/core/kernel/tee_ta_manager.c
+@@ -455,6 +455,7 @@ TEE_Result tee_ta_close_session(struct tee_ta_session *csess,
+ 	struct tee_ta_session *sess = NULL;
+ 	struct tee_ta_ctx *ctx = NULL;
+ 	struct ts_ctx *ts_ctx = NULL;
++	bool keep_crashed = false;
+ 	bool keep_alive = false;
+ 
+ 	DMSG("csess 0x%" PRIxVA " id %u",
+@@ -501,9 +502,12 @@ TEE_Result tee_ta_close_session(struct tee_ta_session *csess,
+ 		panic();
+ 
+ 	ctx->ref_count--;
+-	keep_alive = (ctx->flags & TA_FLAG_INSTANCE_KEEP_ALIVE) &&
+-			(ctx->flags & TA_FLAG_SINGLE_INSTANCE);
+-	if (!ctx->ref_count && (ctx->panicked || !keep_alive)) {
++	if (ctx->flags & TA_FLAG_SINGLE_INSTANCE)
++		keep_alive = ctx->flags & TA_FLAG_INSTANCE_KEEP_ALIVE;
++	if (keep_alive)
++		keep_crashed = ctx->flags & TA_FLAG_INSTANCE_KEEP_CRASHED;
++	if (!ctx->ref_count &&
++	    ((ctx->panicked && !keep_crashed) || !keep_alive)) {
+ 		if (!ctx->is_releasing) {
+ 			TAILQ_REMOVE(&tee_ctxes, ctx, link);
+ 			ctx->is_releasing = true;
+diff --git a/lib/libutee/include/user_ta_header.h b/lib/libutee/include/user_ta_header.h
+index 0336c64b2..c5622982f 100644
+--- a/lib/libutee/include/user_ta_header.h
++++ b/lib/libutee/include/user_ta_header.h
+@@ -52,8 +52,13 @@
+ 					BIT32(11)
+ #define TA_FLAG_DEVICE_ENUM_TEE_STORAGE_PRIVATE	\
+ 					BIT32(12) /* with TEE_STORAGE_PRIVATE */
++/*
++ * Don't restart a TA with TA_FLAG_INSTANCE_KEEP_ALIVE set if it has
++ * crashed.
++ */
++#define TA_FLAG_INSTANCE_KEEP_CRASHED	BIT32(13)
+ 
+-#define TA_FLAGS_MASK			GENMASK_32(12, 0)
++#define TA_FLAGS_MASK			GENMASK_32(13, 0)
+ 
+ struct ta_head {
+ 	TEE_UUID uuid;
+@@ -133,6 +138,7 @@ extern struct __elf_phdr_info __elf_phdr_info;
+ #define TA_PROP_STR_SINGLE_INSTANCE	"gpd.ta.singleInstance"
+ #define TA_PROP_STR_MULTI_SESSION	"gpd.ta.multiSession"
+ #define TA_PROP_STR_KEEP_ALIVE		"gpd.ta.instanceKeepAlive"
++#define TA_PROP_STR_KEEP_CRASHED	"optee.ta.instanceKeepCrashed"
+ #define TA_PROP_STR_DATA_SIZE		"gpd.ta.dataSize"
+ #define TA_PROP_STR_STACK_SIZE		"gpd.ta.stackSize"
+ #define TA_PROP_STR_VERSION		"gpd.ta.version"
+diff --git a/ta/user_ta_header.c b/ta/user_ta_header.c
+index 3125af55c..aa804c1ef 100644
+--- a/ta/user_ta_header.c
++++ b/ta/user_ta_header.c
+@@ -142,6 +142,9 @@ const struct user_ta_property ta_props[] = {
+ 	{TA_PROP_STR_KEEP_ALIVE, USER_TA_PROP_TYPE_BOOL,
+ 	 &(const bool){(TA_FLAGS & TA_FLAG_INSTANCE_KEEP_ALIVE) != 0}},
+ 
++	{TA_PROP_STR_KEEP_CRASHED, USER_TA_PROP_TYPE_BOOL,
++	 &(const bool){(TA_FLAGS & TA_FLAG_INSTANCE_KEEP_CRASHED) != 0}},
++
+ 	{TA_PROP_STR_DATA_SIZE, USER_TA_PROP_TYPE_U32,
+ 	 &(const uint32_t){TA_DATA_SIZE}},
+ 
+-- 
+2.49.0
+
diff --git a/meta-arm/recipes-security/optee/optee-os_4.4.0.bb b/meta-arm/recipes-security/optee/optee-os_4.4.0.bb
index bd031ef7..f24f8a3a 100644
--- a/meta-arm/recipes-security/optee/optee-os_4.4.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os_4.4.0.bb
@@ -8,4 +8,5 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 SRCREV = "8f645256efc0dc66bd5c118778b0b50c44469ae1"
 SRC_URI += " \
     file://0003-optee-enable-clang-support.patch \
+    file://CVE-2025-46733.patch \
    "
-- 
2.49.0



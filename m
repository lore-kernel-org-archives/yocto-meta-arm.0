Return-Path: <ali.oezaslan@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6A44C54791
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 20:13:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6181.1710360823497085610
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 Mar 2024 13:13:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ali.oezaslan@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CAF621007;
	Wed, 13 Mar 2024 13:14:19 -0700 (PDT)
Received: from PW05BKJD.arm.com (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 38ECE3F64C;
	Wed, 13 Mar 2024 13:13:42 -0700 (PDT)
From: ali.oezaslan@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Ali Can Ozaslan <ali.oezaslan@arm.com>,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 2/3] arm-bsp/trusted-services: corstone1000: Client Id adjustments after TF-M 2.0
Date: Wed, 13 Mar 2024 20:13:24 +0000
Message-Id: <20240313201325.27043-3-ali.oezaslan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240313201325.27043-1-ali.oezaslan@arm.com>
References: <20240313201325.27043-1-ali.oezaslan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 13 Mar 2024 20:13:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5435

From: Ali Can Ozaslan <ali.oezaslan@arm.com>

Corstone-1000 uses trusted-firmware-m as secure enclave software
component. Due to the changes in TF-M 2.0, psa services requires
a seperate client_id now. This commit adds smm-gateway-sp client id to
the FMP services since FMP structure accessed by u-boot via
smm-gateway-sp.

Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 ...0009-plat-corstone1000-fmp-client-id.patch | 45 +++++++++++++++++++
 .../trusted-services/ts-arm-platforms.inc     |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0009-plat-corstone1000-fmp-client-id.patch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0009-plat-corstone1000-fmp-client-id.patch b/meta-arm-bsp/recipes-securit=
y/trusted-services/corstone1000/0009-plat-corstone1000-fmp-client-id.patc=
h
new file mode 100644
index 00000000..2fb91f62
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0009-pl=
at-corstone1000-fmp-client-id.patch
@@ -0,0 +1,45 @@
+From 52d962239207bd06827c18d0ed21abdc2002337f Mon Sep 17 00:00:00 2001
+From: emeara01 <emekcan.aras@arm.com>
+Date: Thu, 7 Mar 2024 10:24:42 +0000
+Subject: [PATCH] plat: corstone1000: add client_id for FMP service
+
+Corstone1000 uses trusted-firmware-m as secure enclave software componen=
t. Due
+to the changes in TF-M 2.0, psa services requires a seperate client_id n=
ow.
+This commit adds smm-gateway-sp client id to the FMP services since FMP =
structure
+accessed by u-boot via smm-gateway-sp.
+
+Signed-off-by: emeara01 <emekcan.aras@arm.com>
+Upstream-Status: Inappropriate [Design is to revisted]
+---
+ .../capsule_update/provider/corstone1000_fmp_service.c     | 5 ++++---
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/components/service/capsule_update/provider/corstone1000_fmp=
_service.c b/components/service/capsule_update/provider/corstone1000_fmp_=
service.c
+index d811af9f..354d025f 100644
+--- a/components/service/capsule_update/provider/corstone1000_fmp_servic=
e.c
++++ b/components/service/capsule_update/provider/corstone1000_fmp_servic=
e.c
+@@ -33,6 +33,7 @@
+ 	 EFI_VARIABLE_APPEND_WRITE)
+=20
+ #define FMP_VARIABLES_COUNT	6
++#define SMM_GW_SP_ID		0x8003
+=20
+ static struct variable_metadata fmp_variables_metadata[FMP_VARIABLES_CO=
UNT] =3D {
+     {
+@@ -91,7 +92,7 @@ static psa_status_t protected_storage_set(struct rpc_c=
aller *caller,
+ 		{ .base =3D psa_ptr_to_u32(&create_flags), .len =3D sizeof(create_fla=
gs) },
+ 	};
+=20
+-	psa_status =3D psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE, =
TFM_PS_ITS_SET,
++	psa_status =3D psa_call_client_id(caller, TFM_PROTECTED_STORAGE_SERVIC=
E_HANDLE, SMM_GW_SP_ID,TFM_PS_ITS_SET,
+ 			      in_vec, IOVEC_LEN(in_vec), NULL, 0);
+ 	if (psa_status < 0)
+ 		EMSG("ipc_set: psa_call failed: %d", psa_status);
+@@ -114,7 +115,7 @@ static psa_status_t protected_storage_get(struct rpc=
_caller *caller,
+ 		{ .base =3D psa_ptr_to_u32(p_data), .len =3D data_size },
+ 	};
+=20
+-	psa_status =3D psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE,
++	psa_status =3D psa_call_client_id(caller, TFM_PROTECTED_STORAGE_SERVIC=
E_HANDLE, SMM_GW_SP_ID,
+ 			      TFM_PS_ITS_GET, in_vec, IOVEC_LEN(in_vec),
+ 			      out_vec, IOVEC_LEN(out_vec));
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platfo=
rms.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms=
.inc
index 3c7e94e6..80a58056 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
@@ -10,6 +10,7 @@ SRC_URI:append:corstone1000  =3D " \
     file://0006-plat-corstone1000-Use-the-stateless-platform-service.pat=
ch \
     file://0007-plat-corstone1000-Initialize-capsule-update-provider.pat=
ch \
     file://0008-platform-corstone1000-fix-synchronization-issue.patch \
+    file://0009-plat-corstone1000-fmp-client-id.patch \
     "
=20
=20
--=20
2.34.1



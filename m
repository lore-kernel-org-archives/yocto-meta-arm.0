Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94F03C4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 19:20:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.16241.1639077600347888997
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 11:20:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B5DE11B3;
	Thu,  9 Dec 2021 11:20:00 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.6.225])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 906483F73B;
	Thu,  9 Dec 2021 11:19:58 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>,
	Rui Miguel Silva <rui.silva@arm.com>
Subject: [PATCH 9/9] arm-bsp/secure-partitions: Use secure storage ipc and
 openamp for se_proxy
Date: Thu,  9 Dec 2021 19:19:35 +0000
Message-Id: <20211209191935.26017-10-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211209191935.26017-1-abdellatif.elkhlifi@arm.com>
References: <20211209191935.26017-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 09 Dec 2021 19:20:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2598

From: Vishnu Banavath <vishnu.banavath@arm.com>

Remove mock up backend for secure storage in se proxy
deployment and use instead the secure storage ipc backend with
openamp as rpc to secure enclave side.

Change-Id: I5225966ec621be9fa126b5af6ede0a1f6bbf469b
Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
---
 ...storage-ipc-and-openamp-for-se_proxy.patch | 61 +++++++++++++++++++
 .../trusted-services/ts-corstone1000.inc      |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0013-Use-secure-storage-ipc-and-openamp-for-se_proxy.patch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0013-Use-secure-storage-ipc-and-openamp-for-se_proxy.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0013-Use-secure-storage-ipc-and-openamp-for-se_proxy.patch
new file mode 100644
index 0000000..7055599
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0013-Use-secure-storage-ipc-and-openamp-for-se_proxy.patch
@@ -0,0 +1,61 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+From e336129cb0c9615fb978d0f555a4b5c1a544dc46 Mon Sep 17 00:00:00 2001
+From: Vishnu Banavath <vishnu.banavath@arm.com>
+Date: Fri, 3 Dec 2021 19:25:34 +0000
+Subject: [PATCH] Use secure storage ipc and openamp for se_proxy
+
+Remove mock up backend for secure storage in se proxy
+deployment and use instead the secure storage ipc backend with
+openamp as rpc to secure enclave side.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
+
+diff --git a/deployments/se-proxy/opteesp/service_proxy_factory.c b/deployments/se-proxy/opteesp/service_proxy_factory.c
+index acfb6e8..5729005 100644
+--- a/deployments/se-proxy/opteesp/service_proxy_factory.c
++++ b/deployments/se-proxy/opteesp/service_proxy_factory.c
+@@ -6,15 +6,20 @@
+ 
+ #include <stddef.h>
+ #include <rpc/common/endpoint/rpc_interface.h>
++#include <rpc/openamp/caller/sp/openamp_caller.h>
+ #include <service/attestation/provider/attest_provider.h>
+ #include <service/attestation/provider/serializer/packed-c/packedc_attest_provider_serializer.h>
+ #include <service/crypto/factory/crypto_provider_factory.h>
+ #include <service/secure_storage/frontend/secure_storage_provider/secure_storage_provider.h>
++#include <trace.h>
+ 
+ /* Stub backends */
+ #include <service/crypto/backend/stub/stub_crypto_backend.h>
++#include <service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.h>
+ #include <service/secure_storage/backend/mock_store/mock_store.h>
+ 
++struct openamp_caller openamp;
++
+ struct rpc_interface *attest_proxy_create(void)
+ {
+ 	struct rpc_interface *attest_iface;
+@@ -47,10 +52,15 @@ struct rpc_interface *crypto_proxy_create(void)
+ 
+ struct rpc_interface *ps_proxy_create(void)
+ {
+-	static struct mock_store ps_backend;
+ 	static struct secure_storage_provider ps_provider;
+-
+-	struct storage_backend *backend = mock_store_init(&ps_backend);
++	static struct secure_storage_ipc ps_backend;
++	static struct rpc_caller *storage_caller;
++	struct storage_backend *backend;
++
++	storage_caller = openamp_caller_init(&openamp);
++	if (!storage_caller)
++		return NULL;
++	backend = secure_storage_ipc_init(&ps_backend, &openamp.rpc_caller);
+ 
+ 	return secure_storage_provider_init(&ps_provider, backend);
+ }
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
index 8c6dbf2..7d36476 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
@@ -23,6 +23,7 @@ SRC_URI:append = " \
                   file://0010-add-psa-client-definitions-for-ff-m.patch \
                   file://0011-Add-common-service-component-to-ipc-support.patch \
                   file://0012-Add-secure-storage-ipc-backend.patch \
+                  file://0013-Use-secure-storage-ipc-and-openamp-for-se_proxy.patch \
                   "
 
 SRCREV_ts = "882a2db4f9181fc6ddb505b82262f82e5a0c2fd5"
-- 
2.17.1



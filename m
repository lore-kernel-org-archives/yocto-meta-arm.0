Return-Path: <Philip.Puk@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9701DC02180
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 16:38:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.21957.1736786296202785997
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Jan 2025 08:38:16 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: philip.puk@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 298B91424;
	Mon, 13 Jan 2025 08:38:44 -0800 (PST)
Received: from e125751.cambridge.arm.com (e125751.cambridge.arm.com [10.1.199.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6834B3F673;
	Mon, 13 Jan 2025 08:38:15 -0800 (PST)
From: philip.puk@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Philip Puk <philip.puk@arm.com>
Subject: [PATCH 1/1] arm-bsp/recipes-security: Add protobuf interface to crypto-sp in corstone1000
Date: Mon, 13 Jan 2025 16:34:27 +0000
Message-Id: <20250113163427.564404-2-philip.puk@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250113163427.564404-1-philip.puk@arm.com>
References: <20250113163427.564404-1-philip.puk@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 13 Jan 2025 16:38:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6320

From: Philip Puk <philip.puk@arm.com>

Adds protobuf interface to se-proxy-sp as the main crypto-sp uses it and
parsec service 1.4 also switch using protobuf interface.

Signed-off-by: Philip Puk <philip.puk@arm.com>
---
 .../0020-se-proxy-protobuf-change.patch       | 65 +++++++++++++++++++
 .../trusted-services/ts-arm-platforms.inc     |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0020-se-proxy-protobuf-change.patch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0020-se-proxy-protobuf-change.patch b/meta-arm-bsp/recipes-security/trust=
ed-services/corstone1000/0020-se-proxy-protobuf-change.patch
new file mode 100644
index 00000000..cfe0e693
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0020-se=
-proxy-protobuf-change.patch
@@ -0,0 +1,65 @@
+From e5a4487e2b757d0063148691c7d06ae1c7e15b9a Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <emekcan.aras@arm.com>
+Date: Tue, 18 Jun 2024 11:52:43 +0100
+Subject: [PATCH] protobuf fix
+
+Upstream-Status: Pending (not yet submitted to upstream)
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+---
+ .../se-proxy/env/commonsp/se_proxy_sp.c       | 25 ++++++++++++++++++-
+ 1 file changed, 24 insertions(+), 1 deletion(-)
+
+diff --git a/deployments/se-proxy/env/commonsp/se_proxy_sp.c b/deploymen=
ts/se-proxy/env/commonsp/se_proxy_sp.c
+index a0eb03b6f..e2774c135 100644
+--- a/deployments/se-proxy/env/commonsp/se_proxy_sp.c
++++ b/deployments/se-proxy/env/commonsp/se_proxy_sp.c
+@@ -13,6 +13,7 @@
+ #include "trace.h"
+ #include "deployments/se-proxy/infra/service_proxy_factory.h"
+ #include "deployments/se-proxy/se_proxy_interfaces.h"
++#include <service/crypto/factory/crypto_provider_factory.h>
+=20
+ static bool sp_init(uint16_t *own_sp_id);
+=20
+@@ -39,7 +40,7 @@ void __noreturn sp_main(union ffa_boot_info *boot_info=
)
+ 		goto fatal_error;
+ 	}
+=20
+-	rpc_status =3D ts_rpc_endpoint_sp_init(&rpc_endpoint, 5, 16);
++	rpc_status =3D ts_rpc_endpoint_sp_init(&rpc_endpoint, 6, 16);
+ 	if (rpc_status !=3D RPC_SUCCESS) {
+ 		EMSG("Failed to initialize RPC endpoint: %d", rpc_status);
+ 		goto fatal_error;
+@@ -129,6 +130,28 @@ void __noreturn sp_main(union ffa_boot_info *boot_i=
nfo)
+ 		goto fatal_error;
+ 	}
+=20
++	struct rpc_service_interface *crypto_iface_protobuf =3D NULL;
++	struct crypto_provider *crypto_protobuf_provider =3D NULL;
++
++	crypto_protobuf_provider =3D crypto_protobuf_provider_factory_create()=
;
++	if (!crypto_protobuf_provider) {
++		EMSG("Failed to create crypto protobuf provider factory");
++		goto fatal_error;
++	}
++
++	crypto_iface_protobuf =3D service_provider_get_rpc_interface(
++		&crypto_protobuf_provider->base_provider);
++	if (!crypto_iface_protobuf) {
++		EMSG("Failed to create service provider RPC interface");
++		goto fatal_error;
++	}
++
++	rpc_status =3D ts_rpc_endpoint_sp_add_service(&rpc_endpoint, crypto_if=
ace_protobuf);
++	if (rpc_status !=3D RPC_SUCCESS) {
++		EMSG("Failed to add service to RPC endpoint: %d", rpc_status);
++		goto fatal_error;
++	}
++
+	while (1) {
+		ts_rpc_endpoint_sp_receive(&rpc_endpoint, &req_msg, &resp_msg);
+
+--=20
+2.25.1
+
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platfo=
rms.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms=
.inc
index af313f44..770c47ab 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
@@ -21,6 +21,7 @@ SRC_URI:append:corstone1000  =3D " \
     file://0017-Implement-Private-Authenticated-Variable-verificatio.pat=
ch \
     file://0018-Make-RSS-and-MHU-sizes-compile-time-definitions-user.pat=
ch \
     file://0019-Align-PSA-Crypto-with-TF-Mv2.1.patch \
+    file://0020-se-proxy-protobuf-change.patch \
     "
=20
 # The patches above introduce errors with GCC 14.1, silence them for now
--=20
2.25.1



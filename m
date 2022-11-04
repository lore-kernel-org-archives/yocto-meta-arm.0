Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C9F3C43219
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 14:55:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.12161.1667573693391899345
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 07:54:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C9DA23A;
	Fri,  4 Nov 2022 07:54:59 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F29173F703;
	Fri,  4 Nov 2022 07:54:51 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 1/3] arm/trusted-services: check before applying patches
Date: Fri,  4 Nov 2022 14:54:44 +0000
Message-Id: <20221104145446.26551-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221104145446.26551-1-emekcan.aras@arm.com>
References: <20221104145446.26551-1-emekcan.aras@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 04 Nov 2022 14:55:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4078

From: Rui Miguel Silva <rui.silva@linaro.org>

At the apply ts patch stage, first check if they are patches
to be applied. Because if not, this would break the apply
patch stage with an error.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 .../trusted-services/ts-psa-api-test-common_git.inc         | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-arm/recipes-security/trusted-services/ts-psa-api-test-common_git.inc b/meta-arm/recipes-security/trusted-services/ts-psa-api-test-common_git.inc
index dfd47163..94d1403b 100644
--- a/meta-arm/recipes-security/trusted-services/ts-psa-api-test-common_git.inc
+++ b/meta-arm/recipes-security/trusted-services/ts-psa-api-test-common_git.inc
@@ -18,11 +18,9 @@ EXTRA_OECMAKE += "\
                   -DPSA_ARCH_TESTS_SOURCE_DIR=${WORKDIR}/git/psatest \
                  "
 
-# TS ships patches that need to be applied to psa-arch-tests
+# TS check if there are patches to apply to psa-arch-tests, if so apply them
 apply_ts_patch() {
-    for p in ${S}/external/psa_arch_tests/*.patch; do
-        patch -p1 -d ${WORKDIR}/git/psatest < ${p}
-    done
+    find ${S}/external/psa_arch_tests -type f -name '*.patch' -exec patch -d ${WORKDIR}/git/psatest -i {} \;
 }
 do_patch[postfuncs] += "apply_ts_patch"
 
-- 
2.17.1



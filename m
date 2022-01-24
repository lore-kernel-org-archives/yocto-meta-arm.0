Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38960C4332F
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 17:40:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.92.1643046016021246497
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Jan 2022 09:40:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83DE0101E
	for <meta-arm@lists.yoctoproject.org>; Mon, 24 Jan 2022 09:40:15 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F7E13F766
	for <meta-arm@lists.yoctoproject.org>; Mon, 24 Jan 2022 09:40:15 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] CI: fix check-layer indeterminism
Date: Mon, 24 Jan 2022 17:40:12 +0000
Message-Id: <20220124174012.3916927-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124174012.3916927-1-ross.burton@arm.com>
References: <20220124174012.3916927-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 24 Jan 2022 17:40:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2903

yocto-check-layers is very greedy when searching for layers, and will
find the test layers in Bitbake if given the chance, for example:

bitbake/lib/layerindexlib/tests/testdata/layer4

This layer has the collection name openembedded-layer and is only
compatible with Sumo.  The selection of layer from collection name is
not deterministic, so it's possible that this layer is selected which
then fails the check as it isn't compatible.

Solve this by restricting the dependency layers in meta-arm to just
meta-arm/meta-*, so it doesn't recurse into meta-arm/work/poky/bitbake.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 9a60f672..4c5d74e9 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -79,7 +79,7 @@ check-layers:
   extends: .setup
   script:
     - kas shell --update --force-checkout ci/base.yml:ci/meta-openembedd=
ed.yml --command \
-      "yocto-check-layer-wrapper $CI_PROJECT_DIR/$LAYER --dependency $CI=
_PROJECT_DIR $KAS_WORK_DIR/meta-openembedded/meta-oe --no-auto-dependency=
"
+      "yocto-check-layer-wrapper $CI_PROJECT_DIR/$LAYER --dependency $CI=
_PROJECT_DIR/meta-* $KAS_WORK_DIR/meta-openembedded/meta-oe --no-auto-dep=
endency"
   parallel:
     matrix:
       - LAYER: [meta-arm, meta-arm-bsp, meta-arm-toolchain, meta-gem5]
--=20
2.25.1



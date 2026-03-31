Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6A55109B46C
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 13:07:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19559.1774962424414233693
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 31 Mar 2026 06:07:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=XrHSkJH0;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27DC2493B
	for <meta-arm@lists.yoctoproject.org>; Tue, 31 Mar 2026 06:06:58 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DAC953F7D8
	for <meta-arm@lists.yoctoproject.org>; Tue, 31 Mar 2026 06:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774962424; bh=dehEkhl/b3DKlQ9EAdKrIlbjzIH0yMgZSpHuug3Vvt8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XrHSkJH019/WiG7gv6RCZfY98Kt/LsCBLKdMYDEhkJlwJ86D8byd2GtlZd9OGxYkC
	 akbTo+TQpLr/zbCWJQ53eNeaf6okTm7yXcwHA+u5VmDhFdq0gSA25yJS+/6l/0dYoF
	 vdS1p8Wau62lltzjzSzncl5RwpcDnADW7Umq/FDo=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/6] arm/fvps: rename rdv3-r1
Date: Tue, 31 Mar 2026 09:06:59 -0400
Message-ID: <20260331130702.56223-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260331130702.56223-1-jon.mason@arm.com>
References: <20260331130702.56223-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 31 Mar 2026 13:07:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6991

Rename rdv3-r1 to be more consistent with other machines and match
documentation/website.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/fvps.yml                                                   | 4 ++--
 .../recipes-devtools/fvp/{fvp-rd-v3-r1.bb =3D> fvp-rdv3-r1.bb}  | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-arm/recipes-devtools/fvp/{fvp-rd-v3-r1.bb =3D> fvp-rdv3-r1.b=
b} (100%)

diff --git a/ci/fvps.yml b/ci/fvps.yml
index f64885a35c9a..8ec22a30f6af 100644
--- a/ci/fvps.yml
+++ b/ci/fvps.yml
@@ -32,8 +32,8 @@ target:
   - nativesdk-fvp-rd1-ae
=20
   # Infrastructure FVPs
-  - fvp-rd-v3-r1
-  - nativesdk-fvp-rd-v3-r1
+  - fvp-rdv3-r1
+  - nativesdk-fvp-rdv3-r1
   # These are x86 only... :(
   - nativesdk-fvp-sgi575
=20
diff --git a/meta-arm/recipes-devtools/fvp/fvp-rd-v3-r1.bb b/meta-arm/rec=
ipes-devtools/fvp/fvp-rdv3-r1.bb
similarity index 100%
rename from meta-arm/recipes-devtools/fvp/fvp-rd-v3-r1.bb
rename to meta-arm/recipes-devtools/fvp/fvp-rdv3-r1.bb
--=20
2.50.1 (Apple Git-155)



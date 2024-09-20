Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B06BFCF9C51
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 15:23:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.21024.1726845802608842412
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 20 Sep 2024 08:23:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 969F41007;
	Fri, 20 Sep 2024 08:23:51 -0700 (PDT)
Received: from e132995.arm.com (unknown [10.57.85.137])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 91B9C3F64C;
	Fri, 20 Sep 2024 08:23:21 -0700 (PDT)
From: harsimransingh.tungal@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 0/1] arm-bsp/trusted-services: corstone1000: Update Trusted-Services patches
Date: Fri, 20 Sep 2024 16:23:13 +0100
Message-Id: <20240920152314.1752155-1-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 20 Sep 2024 15:23:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6095

From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>

Modify the upstream status and commit descriptions of Trusted-Services pa=
tches.
Few patches have been been upstreamed to external Trusted-Services gerrit=
 repository
for review. So, update upstream status of those patches accordingly.

Harsimran Singh Tungal (1):
  arm-bsp/trusted-services: corstone1000: Update Trusted-Services
    patches

 ...ub-capsule-update-service-components.patch |  2 +-
 ...2-Fix-in-AEAD-for-psa-arch-test-254.patch} | 42 +++++++++++--------
 .../0005-Fix-psa-api-crypto-test-no-243.patch | 31 ++++++++++++++
 ...0-add-compile-definitions-for-ECP_DP.patch | 28 -------------
 ...sizes-compile-time-definitions-user.patch} | 17 ++++----
 ...0019-Align-PSA-Crypto-with-TF-Mv2.1.patch} |  6 +--
 .../trusted-services/ts-arm-platforms.inc     |  8 ++--
 7 files changed, 74 insertions(+), 60 deletions(-)
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0002=
-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch =3D> 0002-Fix-in-AEAD-fo=
r-psa-arch-test-254.patch} (80%)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0005-Fix-psa-api-crypto-test-no-243.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0005-plat-corstone1000-add-compile-definitions-for-ECP_DP.patch
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0018=
-Change-RSS_COMMS-cmake-variables-to-cahce-vars.patch =3D> 0018-Make-RSS-=
and-MHU-sizes-compile-time-definitions-user.patch} (68%)
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0019=
-Align-PSA-Crypto-structs-with-TF-Mv2.1.patch =3D> 0019-Align-PSA-Crypto-=
with-TF-Mv2.1.patch} (98%)

--=20
2.25.1



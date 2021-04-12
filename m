Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.30494.1618225303578997675
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 12 Apr 2021 04:01:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 130FD31B
	for <meta-arm@lists.yoctoproject.org>; Mon, 12 Apr 2021 04:01:42 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B0C233F694
	for <meta-arm@lists.yoctoproject.org>; Mon, 12 Apr 2021 04:01:41 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/sbsa-acs: update patch status
Date: Mon, 12 Apr 2021 12:01:39 +0100
Message-Id: <20210412110139.543958-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Change-Id: I75d7c6c098edaa30b009c9586ed7ce23994b0f2a
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../sbsa-acs/sbsa-acs/0001-pal_uefi-Fix-enum-conversion.patch  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-arm/recipes-test/sbsa-acs/sbsa-acs/0001-pal_uefi-Fix-en=
um-conversion.patch b/meta-arm/recipes-test/sbsa-acs/sbsa-acs/0001-pal_ue=
fi-Fix-enum-conversion.patch
index f517ed6..5a874e3 100644
--- a/meta-arm/recipes-test/sbsa-acs/sbsa-acs/0001-pal_uefi-Fix-enum-conv=
ersion.patch
+++ b/meta-arm/recipes-test/sbsa-acs/sbsa-acs/0001-pal_uefi-Fix-enum-conv=
ersion.patch
@@ -6,8 +6,7 @@ Subject: [PATCH] pal_uefi: Fix enum conversion
 clang complains about enum type mismatches
 al_uefi/src/pal_gic.c:224:20: error: implicit conversion from enumeratio=
n type 'INTR_TRIGGER_INFO_TYPE_e' to different enumeration type 'EFI_HARD=
WARE_INTERRUPT2_TRIGGER_TYPE' [-Werror,-Wenum-conversion]
=20
-Upstream-Status: Pending
-
+Upstream-Status: Backport [a68f6bc5933d912a938baf841304b8637ff923ce]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  platform/pal_uefi/src/pal_gic.c | 2 +-
--=20
2.25.1


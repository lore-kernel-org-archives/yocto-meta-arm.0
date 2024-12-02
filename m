Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4865BD3B7F7
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 10:02:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.171044.1733133740480937456
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 02 Dec 2024 02:02:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACC79FEC;
	Mon,  2 Dec 2024 02:02:48 -0800 (PST)
Received: from e129527.arm.com (unknown [10.57.90.181])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C7B93F58B;
	Mon,  2 Dec 2024 02:02:19 -0800 (PST)
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH styhead] arm-bsp/trusted-firmware-m: corstone1000: Fix Secure Debug connection due to token version mismatch
Date: Mon,  2 Dec 2024 10:02:15 +0000
Message-Id: <20241202100215.945453-1-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 02 Dec 2024 10:02:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6261

From: Bence Balogh <bence.balogh@arm.com>

Due to a mismatch between the ADAC dummy token major version and the vers=
ion
in the secure-debug-manager repository [1]'s submodule [2], the secure de=
bug connection was denied.
Update the ADAC token major and minor versions in TF-M to align with the =
expected
dummy token.

[1] https://github.com/ARM-software/secure-debug-manager/
[2] https://git.trustedfirmware.org/plugins/gitiles/shared/psa-adac.git/+=
/refs/heads/master/psa-adac/core/include/psa_adac.h

Fixes: 7e9466 ("arm-bsp/trusted-firmware-m: corstone1000: add Secure Debu=
g")
Signed-off-by: Bence Balogh <bence.balogh@arm.com>
---
 .../0001-PSA-revert-header-versions.patch     | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/psa-adac/0001-PSA-revert-header-versions.patch b/meta-arm-bsp/recipes-=
bsp/trusted-firmware-m/files/corstone1000/psa-adac/0001-PSA-revert-header=
-versions.patch
index 5bc65c40..47db1866 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/psa-=
adac/0001-PSA-revert-header-versions.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/psa-=
adac/0001-PSA-revert-header-versions.patch
@@ -14,28 +14,25 @@ certificate/token versions.
 Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
 Upstream-Status: Inappropriate [Add newer dummy token and cert]
 ---
- psa-adac/core/include/psa_adac.h | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
+ psa-adac/core/include/psa_adac.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
=20
 diff --git a/psa-adac/core/include/psa_adac.h b/psa-adac/core/include/ps=
a_adac.h
-index b190992..b026607 100644
+index b190992..6c3feb2 100644
 --- a/psa-adac/core/include/psa_adac.h
 +++ b/psa-adac/core/include/psa_adac.h
-@@ -30,10 +30,10 @@ extern "C" {
+@@ -30,8 +30,8 @@ extern "C" {
   *
   * Current version numbers for certificate and token format.
   */
 -#define ADAC_CERT_MAJOR 1u
 -#define ADAC_CERT_MINOR 0u
--#define ADAC_TOKEN_MAJOR 1u
--#define ADAC_TOKEN_MINOR 0u
 +#define ADAC_CERT_MAJOR 0u
 +#define ADAC_CERT_MINOR 1u
-+#define ADAC_TOKEN_MAJOR 0u
-+#define ADAC_TOKEN_MINOR 1u
+ #define ADAC_TOKEN_MAJOR 1u
+ #define ADAC_TOKEN_MINOR 0u
 =20
- /** \brief Key options
-  *
 --=20
-2.17.1
+2.25.1
+
=20


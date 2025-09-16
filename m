Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0B97CAC59B
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 15:00:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.633.1758034818772790284
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Sep 2025 08:00:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 093C2FEC;
	Tue, 16 Sep 2025 08:00:10 -0700 (PDT)
Received: from LXKV206JHX.arm.com (unknown [10.57.80.132])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9BA9C3F694;
	Tue, 16 Sep 2025 08:00:17 -0700 (PDT)
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: [PATCH 0/4] arm/trusted-services: Upgrade Trusted Services to v1.2
Date: Tue, 16 Sep 2025 16:00:09 +0100
Message-ID: <20250916150013.30666-1-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 16 Sep 2025 15:00:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6710

* Bump Trusted Services BB recipe to v1.2
* Mirror Corstone-1000 related out of tree patches sent upstream
* Update Corstone-1000 patches upstream status
* Remove Corstone-1000 patches that are no longer applicable

Hugues KAMBA MPIANA (4):
  arm/trusted-services:corstone1000: Pass Corstone-1000 target type
  arm/trusted-services: Upgrade Trusted Services to v1.2.0
  arm-bsp/ts:corstone1000: Remove obsolete patches
  arm-bsp/ts:corstone1000: Rename patches

 .../conf/machine/corstone1000-fvp.conf        |   2 +-
 .../conf/machine/corstone1000-mps3.conf       |   6 +-
 ...01-Fix-in-AEAD-for-psa-arch-test-254.patch | 129 ---
 ...e1000-Add-CORSTONE_1000_TYPE-variabl.patch |  66 ++
 .../0002-Fix-psa-api-crypto-test-no-243.patch |  31 -
 ...e1000-Add-event-provider-proxy-for-b.patch | 304 +++++++
 .../0003-Remove-Werror-flag.patch             |  83 --
 ...ow-platform-override-of-FWU-mapping-.patch | 245 +++++
 ...UCCESS_REBOOT-and-PSA_SUCCESS_RESTAR.patch |  74 ++
 ...-sizes-compile-time-definitions-user.patch |  40 -
 ...1000-Add-MM-communication-buffer-co.patch} |  31 +-
 .../0006-Align-PSA-Crypto-with-TF-Mv2.1.patch | 298 ------
 ...pport-for-ESRT-v1-in-PSA-FWU-M-agent.patch | 290 ++++++
 ...ting-warnings-as-errors-configurable.patch | 194 ++++
 .../0008-se-proxy-protobuf-change.patch       |  71 --
 ...-config-Remove-Werror-compile-option.patch |  46 +
 ...e1000-Add-PLATFORM_IS_FVP-toggle-for.patch |  77 --
 ...009-fwu-proxy-refactor-image-mapping.patch | 856 ++++++++++++++++++
 ...-FWU-IPC-framework-for-Corstone-1000.patch | 436 ---------
 ...store-UEFI-variable-index-in-chunks.patch} |  26 +-
 ...mage-state-in-PSA-FWU-M-update-agent.patch | 188 ----
 ..._HAS_ATTEST_PK-define-from-IAT-test.patch} |  17 +-
 ...fine-PSA-FWU-image-mapping-structure.patch | 128 ---
 ...crypto-fix-AEAD-block-cypher-support.patch |  73 ++
 ...C-psa_fwu_install-return-value-check.patch |  31 -
 .../0014-fwu-Add-EFI-ESRT-v1-support.patch    | 178 ----
 ...orm-corstone1000-Enable-ESRT-support.patch | 129 ---
 ...orstone1000-Add-event-provider-proxy.patch | 289 ------
 ...ne1000-Define-GUID-for-each-payloads.patch | 141 ---
 ...n-PSA-Crypto-structs-with-TF-Mv2.1.1.patch |  29 -
 .../trusted-services/ts-arm-platforms.inc     |  38 +-
 .../trusted-services/trusted-services-src.inc |   3 +-
 32 files changed, 2221 insertions(+), 2328 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0001-Fix-in-AEAD-for-psa-arch-test-254.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0001-platform-corstone1000-Add-CORSTONE_1000_TYPE-variabl.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0002-Fix-psa-api-crypto-test-no-243.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0002-platform-corstone1000-Add-event-provider-proxy-for-b.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0003-Remove-Werror-flag.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0003-fwu-se-proxy-Allow-platform-override-of-FWU-mapping-.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0004-fwu-Coerce-PSA_SUCCESS_REBOOT-and-PSA_SUCCESS_RESTAR.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0005-Make-RSS-and-MHU-sizes-compile-time-definitions-user.patch
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0018=
-Add-the-com-buffer-address-and-page-count.patch =3D> 0005-platform-corst=
one1000-Add-MM-communication-buffer-co.patch} (53%)
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0006-Align-PSA-Crypto-with-TF-Mv2.1.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0006-fwu-Add-support-for-ESRT-v1-in-PSA-FWU-M-agent.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0007-Make-treating-warnings-as-errors-configurable.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0008-se-proxy-protobuf-change.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0008-smm-gateway-config-Remove-Werror-compile-option.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0009-Platform-Corstone1000-Add-PLATFORM_IS_FVP-toggle-for.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0009-fwu-proxy-refactor-image-mapping.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0010-Integrate-PSA-FWU-IPC-framework-for-Corstone-1000.patch
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0007=
-Revert-Load-and-store-UEFI-variable-index-in-chunks.patch =3D> 0010-Reve=
rt-Load-and-store-UEFI-variable-index-in-chunks.patch} (92%)
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0011-Load-initial-image-state-in-PSA-FWU-M-update-agent.patch
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0004=
-Remove-PLATFORM_HAS_ATTEST_PK-define-from-IAT-test.patch =3D> 0011-Remov=
e-PLATFORM_HAS_ATTEST_PK-define-from-IAT-test.patch} (63%)
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0012-Corstone1000-Define-PSA-FWU-image-mapping-structure.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0012-psa-crypto-fix-AEAD-block-cypher-support.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0013-Fix-PSA-FWU-IPC-psa_fwu_install-return-value-check.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0014-fwu-Add-EFI-ESRT-v1-support.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0015-platform-corstone1000-Enable-ESRT-support.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0016-platform-corstone1000-Add-event-provider-proxy.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0017-platform-corstone1000-Define-GUID-for-each-payloads.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0021-Align-PSA-Crypto-structs-with-TF-Mv2.1.1.patch



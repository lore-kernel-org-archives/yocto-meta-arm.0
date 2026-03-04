Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D2F0EB7EA7
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 08:28:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13679.1772612889549303501
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 Mar 2026 00:28:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6090339;
	Wed,  4 Mar 2026 00:28:02 -0800 (PST)
Received: from gyoszi01-yocto.budapest.arm.com (ubul2.budapest.arm.com [10.42.55.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 58F9F3F7BD;
	Wed,  4 Mar 2026 00:28:08 -0800 (PST)
From: Gyorgy Szing <gyorgy.szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Gyorgy Szing <gyorgy.szing@arm.com>
Subject: [PATCH 0/5] arm/trusted-services: Update TS and enable fTPM SP.
Date: Wed,  4 Mar 2026 09:27:07 +0100
Message-ID: <20260304082718.2126340-1-gyorgy.szing@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 04 Mar 2026 08:28:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6935

This patch stack makes ths following changes:
  - Update TS and its dependencies.
  - Remove the -fzero-init-padding-bits=3Dunions fix which was needed due=
 to=20
    MbedTLS.
  - Rebase and clean up Corstone1000 patch files.
  - Enable the fTPMC SP. (Experimental).
      - Enable testing with tpm2-tools.
  - Add a kas file to help building and running the TS fTPM SP on fvp-bas=
e.
  - Update documentation.

Gabor Toth (2):
  arm/trusted-services: Enable the fTPM SP
  arm/trusted-services: Enable tpm2-tool self tests

Gyorgy Szing (3):
  arm/trusted-services: Update to v1.3.0
  arm-bsp/corstone1000: Rebase TS patches.
  arm/trusted-services: update documentation

 ci/fvp-base-ts-ftpm.yml                       |  27 +
 documentation/trusted-services.md             |  84 +-
 .../0002-Add-TPM-CRB-FF-A-DT-support.patch    | 297 ++++++
 .../linux/files/fvp-base/tpm-crb.cfg          |   3 +
 .../linux/linux-arm-platforms.inc             |   9 +
 ...store-UEFI-variable-index-in-chunks.patch} |  14 +-
 ...e1000-Add-CORSTONE_1000_TYPE-variabl.patch |  66 --
 ..._HAS_ATTEST_PK-define-from-IAT-test.patch} |   6 +-
 ...e1000-Add-event-provider-proxy-for-b.patch | 304 -------
 ...ow-platform-override-of-FWU-mapping-.patch | 245 -----
 ...UCCESS_REBOOT-and-PSA_SUCCESS_RESTAR.patch |  74 --
 ...e1000-Add-MM-communication-buffer-co.patch |  35 -
 ...pport-for-ESRT-v1-in-PSA-FWU-M-agent.patch | 290 ------
 ...ting-warnings-as-errors-configurable.patch | 194 ----
 ...-config-Remove-Werror-compile-option.patch |  46 -
 ...009-fwu-proxy-refactor-image-mapping.patch | 856 ------------------
 ...crypto-fix-AEAD-block-cypher-support.patch |  73 --
 ...n-PSA-Crypto-structs-with-TF-Mv2.1.1.patch |  40 -
 .../trusted-services/ts-arm-platforms.inc     |  15 +-
 .../trusted-services/ts-sp-ftpm_%.bbappend    |   1 +
 meta-arm/conf/layer.conf                      |   5 +
 ...1-Remove-simulator-and-abrmd-startup.patch |  55 ++
 ...icysigned_sh-fix-error-clear-lockout.patch |  56 ++
 .../recipes-tpm/tpm2-tools/files/tpm2-test    |   8 +
 .../tpm2-tools/files/tpm2-test-all            | 123 +++
 .../tpm2-tools/tpm2-tools_5.7.bbappend        |  27 +
 .../oeqa/runtime/cases/trusted_services.py    |   9 +
 .../recipes-security/optee/optee-os-ts.inc    |   7 +
 .../files/0001-fTPM-add-go_idle-support.patch |  84 ++
 ...cpputest-fix-cmake-4.0-compatibility.patch |  81 --
 .../trusted-services/trusted-services-src.inc |  11 +-
 .../trusted-services/ts-ms-tpm20-ref_git.inc  |  16 +
 .../trusted-services/ts-sp-common.inc         |   4 -
 .../trusted-services/ts-sp-ftpm_git.bb        |   9 +
 .../trusted-services/ts-uuid.inc              |   1 +
 35 files changed, 830 insertions(+), 2345 deletions(-)
 create mode 100644 ci/fvp-base-ts-ftpm.yml
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/fvp-base/0002=
-Add-TPM-CRB-FF-A-DT-support.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/fvp-base/tpm-=
crb.cfg
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0010=
-Revert-Load-and-store-UEFI-variable-index-in-chunks.patch =3D> 0001-Reve=
rt-Load-and-store-UEFI-variable-index-in-chunks.patch} (97%)
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0001-platform-corstone1000-Add-CORSTONE_1000_TYPE-variabl.patch
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0011=
-Remove-PLATFORM_HAS_ATTEST_PK-define-from-IAT-test.patch =3D> 0002-Remov=
e-PLATFORM_HAS_ATTEST_PK-define-from-IAT-test.patch} (92%)
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0002-platform-corstone1000-Add-event-provider-proxy-for-b.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0003-fwu-se-proxy-Allow-platform-override-of-FWU-mapping-.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0004-fwu-Coerce-PSA_SUCCESS_REBOOT-and-PSA_SUCCESS_RESTAR.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0005-platform-corstone1000-Add-MM-communication-buffer-co.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0006-fwu-Add-support-for-ESRT-v1-in-PSA-FWU-M-agent.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0007-Make-treating-warnings-as-errors-configurable.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0008-smm-gateway-config-Remove-Werror-compile-option.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0009-fwu-proxy-refactor-image-mapping.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0012-psa-crypto-fix-AEAD-block-cypher-support.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0013-Align-PSA-Crypto-structs-with-TF-Mv2.1.1.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/ts-sp-=
ftpm_%.bbappend
 create mode 100644 meta-arm/dynamic-layers/meta-tpm2/recipes-tpm/tpm2-to=
ols/files/0001-Remove-simulator-and-abrmd-startup.patch
 create mode 100644 meta-arm/dynamic-layers/meta-tpm2/recipes-tpm/tpm2-to=
ols/files/0003-abrmd_policysigned_sh-fix-error-clear-lockout.patch
 create mode 100644 meta-arm/dynamic-layers/meta-tpm2/recipes-tpm/tpm2-to=
ols/files/tpm2-test
 create mode 100644 meta-arm/dynamic-layers/meta-tpm2/recipes-tpm/tpm2-to=
ols/files/tpm2-test-all
 create mode 100644 meta-arm/dynamic-layers/meta-tpm2/recipes-tpm/tpm2-to=
ols/tpm2-tools_5.7.bbappend
 create mode 100644 meta-arm/recipes-security/trusted-services/files/0001=
-fTPM-add-go_idle-support.patch
 delete mode 100644 meta-arm/recipes-security/trusted-services/files/0005=
-cpputest-fix-cmake-4.0-compatibility.patch
 create mode 100644 meta-arm/recipes-security/trusted-services/ts-ms-tpm2=
0-ref_git.inc
 create mode 100644 meta-arm/recipes-security/trusted-services/ts-sp-ftpm=
_git.bb

--=20
2.43.0



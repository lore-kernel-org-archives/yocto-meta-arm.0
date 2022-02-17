Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAC79C433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 16:00:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1628.1645113601223435895
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Feb 2022 08:00:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4BEC113E;
	Thu, 17 Feb 2022 08:00:00 -0800 (PST)
Received: from e126835.arm.com (unknown [10.57.40.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA06E3F718;
	Thu, 17 Feb 2022 07:59:59 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	jon.mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <Emekcan.Aras@arm.com>
Subject: [PATCH honister 0/3] arm-bsp/security: drop psa-arch-tests recipe
Date: Thu, 17 Feb 2022 15:59:50 +0000
Message-Id: <20220217155953.2569183-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 17 Feb 2022 16:00:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3011

From: Emekcan Aras <Emekcan.Aras@arm.com>

This change is to build and install psa-arch-tests using trusted-services=
 code and drop psa-arch-tests recipe.

Signed-off-by: Vishnu Banavath vishnu.banavath@arm.com

Emekcan Aras (1):
  kas/corstone1000-base: update meta-arm-image SHA

Vishnu Banavath (2):
  arm-bsp/security: drop psa-arch-tests recipe
  arm-bsp/security: trusted-services to fix psa-arch-tests

 kas/corstone1000-base.yml                     |    2 +-
 .../psa-arch-tests-corstone1000.inc           |   45 -
 ...arch-test-sysroot_compiler_flags_fix.patch |   68 --
 ...rch-test-Fixing-psa-arch-tests-cmake.patch |   49 -
 .../psa-arch-tests_%.bbappend                 |    6 -
 ...0003-corstone1000-port-crypto-config.patch |    0
 .../0033-Enhance-mbedtls-fetch-process.patch  |  258 ++++
 ...x-format-specifier-in-logging_caller.patch |   41 +
 ...for-mbedtls-and-psa-arch-tests-for-v.patch |   65 +
 ...n-verify-message-and-hash-operations.patch | 1080 +++++++++++++++++
 ...nst-uninitialised-multi-part-transac.patch |  124 ++
 ...038-Integrate-AEAD-operation-support.patch |  521 ++++++++
 ...eration-to-one-shot-cipher-operation.patch |   96 ++
 ...-Fix-multi-part-termination-on-error.patch |  241 ++++
 ...tion-if-client-provided-buffer-is-to.patch |   50 +
 ...g-to-updated-t_cose-version-fc3a4b2c.patch |   95 ++
 .../0043-pass-sysroot_yocto.patch             |  111 ++
 ...face-structure-aligned-with-tf-m-cha.patch |   30 +
 ...egrate-remaining-psa-ipc-client-APIs.patch |  494 ++++++++
 ...et_key_usage_flags-definition-to-the.patch |   40 +
 ...-in-AEAD-for-psa-arch-test-54-and-58.patch |  120 ++
 .../trusted-services/ts-corstone1000.inc      |   59 +-
 .../trusted-services/psa-arch-tests_git.bb    |   26 -
 .../trusted-services/secure-partitions_git.bb |    2 +-
 24 files changed, 3426 insertions(+), 197 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/psa-ar=
ch-tests-corstone1000.inc
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/psa-ar=
ch-tests/corstone1000/0001-psa-arch-test-sysroot_compiler_flags_fix.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/psa-ar=
ch-tests/corstone1000/0002-arm-bsp-psa-arch-test-Fixing-psa-arch-tests-cm=
ake.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/psa-ar=
ch-tests_%.bbappend
 rename meta-arm-bsp/recipes-security/trusted-services/{psa-arch-tests =3D=
> secure-partitions}/corstone1000/0003-corstone1000-port-crypto-config.pa=
tch (100%)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0033-Enhance-mbedtls-fetch-process.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0034-Fix-format-specifier-in-logging_caller.patc=
h
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0035-Update-refspecs-for-mbedtls-and-psa-arch-te=
sts-for-v.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0036-Separate-sign-verify-message-and-hash-opera=
tions.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0037-Add-defence-against-uninitialised-multi-par=
t-transac.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0038-Integrate-AEAD-operation-support.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0039-Add-IV-generation-to-one-shot-cipher-operat=
ion.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0040-Fix-multi-part-termination-on-error.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0041-Abort-AEAD-operation-if-client-provided-buf=
fer-is-to.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0042-Peg-to-updated-t_cose-version-fc3a4b2c.patc=
h
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0043-pass-sysroot_yocto.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0044-Fix-Crypto-interface-structure-aligned-with=
-tf-m-cha.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0045-Integrate-remaining-psa-ipc-client-APIs.pat=
ch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0046-Fix-update-psa_set_key_usage_flags-definiti=
on-to-the.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0047-Fixes-in-AEAD-for-psa-arch-test-54-and-58.p=
atch
 delete mode 100644 meta-arm/recipes-security/trusted-services/psa-arch-t=
ests_git.bb

--=20
2.25.1



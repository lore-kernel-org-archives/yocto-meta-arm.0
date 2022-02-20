Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC9BC433EF
	for <webhook@archiver.kernel.org>; Sun, 20 Feb 2022 13:30:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.21495.1645363820808926807
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 20 Feb 2022 05:30:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 795EF1063;
	Sun, 20 Feb 2022 05:30:20 -0800 (PST)
Received: from e126835.arm.com (unknown [10.57.18.180])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23F403F718;
	Sun, 20 Feb 2022 05:30:18 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	jon.mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <Emekcan.Aras@arm.com>,
	Vishnu Banavath's avatarVishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH honister 0/1] arm-bsp/security: move TS patches to
 corstone1000 directory
Date: Sun, 20 Feb 2022 13:30:08 +0000
Message-Id: <20220220133009.20560-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 20 Feb 2022 13:30:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3027

From: Emekcan Aras <Emekcan.Aras@arm.com>

This commit moves all the trusted-services patches to a new
corstone1000 directory which is much more cleaner way to
hold platform specific patches

Signed-off-by: Vishnu Banavath's avatarVishnu Banavath <vishnu.banavath@a=
rm.com>

Emekcan Aras (1):
  arm-bsp/security: move TS patches to corstone1000 directory

 ...ols-cmake-common-applying-lowercase-project-convention.patch | 0
 .../0002-fix-EARLY_TA_PATHS-env-variable.patch                  | 0
 .../0003-se-proxy-dts-add-se-proxy-as-child-node.patch          | 0
 .../0004-Update-mm-comm-buffer-region-in-dts-file.patch         | 0
 .../{ =3D> corstone1000}/0005-Configure-NV-storage-macro.patch    | 0
 .../{ =3D> corstone1000}/0006-Use-device-region.patch             | 0
 .../0007-Add-openamp-to-SE-proxy-deployment.patch               | 0
 ...8-Implement-mhu-driver-and-the-OpenAmp-conversion-laye.patch | 0
 .../{ =3D> corstone1000}/0009-Add-openamp-rpc-caller.patch        | 0
 .../0010-add-psa-client-definitions-for-ff-m.patch              | 0
 .../0011-Add-common-service-component-to-ipc-support.patch      | 0
 .../0012-Add-secure-storage-ipc-backend.patch                   | 0
 .../0013-Use-secure-storage-ipc-and-openamp-for-se_proxy.patch  | 0
 .../0014-Add-uefi-variable-append-write-support.patch           | 0
 .../0015-Add-UEFI-variable-support-for-QueryVariableInfo.patch  | 0
 .../{ =3D> corstone1000}/0016-Add-uefi-test-deployment.patch      | 0
 ...7-Fix-interface-ID-parameter-setting-in-sp-ffarpc_call.patch | 0
 ...018-Support-FFARPC-call-requests-with-no-shared-buffer.patch | 0
 .../{ =3D> corstone1000}/0019-Run-psa-arch-test.patch             | 0
 .../0020-Use-address-instead-of-pointers.patch                  | 0
 .../0021-Add-psa-ipc-attestation-to-se-proxy.patch              | 0
 ...2-Setup-its-backend-as-openamp-rpc-using-secure-storag.patch | 0
 .../{ =3D> corstone1000}/0023-add-psa-ipc-crypto-backend.patch    | 0
 .../0024-Increase-SMM-gateway-UEFI-variable-macro-value.patch   | 0
 .../0025-Add-stub-capsule-update-service-components.patch       | 0
 .../0026-Add-logs-to-functions-in-SMM-gateway-SP.patch          | 0
 .../{ =3D> corstone1000}/0027-Configure-storage-size.patch        | 0
 .../0028-Revert-Add-uefi-variable-append-write-support.patch    | 0
 .../0029-Change-UID-of-variable-index-in-SMM.patch              | 0
 .../0030-Add-missing-features-to-setVariable.patch              | 0
 ...031-Add-invalid-parameter-check-in-getNextVariableName.patch | 0
 .../0032-smm_gateway-add-checks-for-null-attributes.patch       | 0
 .../recipes-security/trusted-services/ts-corstone1000.inc       | 2 +-
 33 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-arm-bsp/recipes-security/trusted-services/secure-partitions/=
{ =3D> corstone1000}/0001-tools-cmake-common-applying-lowercase-project-c=
onvention.patch (100%)
 rename meta-arm-bsp/recipes-security/trusted-services/secure-partitions/=
{ =3D> corstone1000}/0002-fix-EARLY_TA_PATHS-env-variable.patch (100%)
 rename meta-arm-bsp/recipes-security/trusted-services/secure-partitions/=
{ =3D> corstone1000}/0003-se-proxy-dts-add-se-proxy-as-child-node.patch (=
100%)
 rename meta-arm-bsp/recipes-security/trusted-services/secure-partitions/=
{ =3D> corstone1000}/0004-Update-mm-comm-buffer-region-in-dts-file.patch =
(100%)
 rename meta-arm-bsp/recipes-security/trusted-services/secure-partitions/=
{ =3D> corstone1000}/0005-Configure-NV-storage-macro.patch (100%)
 rename meta-arm-bsp/recipes-security/trusted-services/secure-partitions/=
{ =3D> corstone1000}/0006-Use-device-region.patch (100%)
 rename meta-arm-bsp/recipes-security/trusted-services/secure-partitions/=
{ =3D> corstone1000}/0007-Add-openamp-to-SE-proxy-deployment.patch (100%)
 rename meta-arm-bsp/recipes-security/trusted-services/secure-partitions/=
{ =3D> corstone1000}/0008-Implement-mhu-driver-and-the-OpenAmp-conversion=
-laye.patch (100%)
 rename meta-arm-bsp/recipes-security/trusted-services/secure-partitions/=
{ =3D> corstone1000}/0009-Add-openamp-rpc-caller.patch (100%)
 rename meta-arm-bsp/recipes-security/trusted-services/secure-partitions/=
{ =3D> corstone1000}/0010-add-psa-client-definitions-for-ff-m.patch (100%=
)
 rename meta-arm-bsp/recipes-security/trusted-services/secure-partitions/=
{ =3D> corstone1000}/0011-Add-common-service-component-to-ipc-support.pat=
ch (100%)
 rename meta-arm-bsp/recipes-security/trusted-services/secure-partitions/=
{ =3D> corstone1000}/0012-Add-secure-storage-ipc-backend.patch (100%)
 rename meta-arm-bsp/recipes-security/trusted-services/secure-partitions/=
{ =3D> corstone1000}/0013-Use-secure-storage-ipc-and-openamp-for-se_proxy=
.patch (100%)
 rename meta-arm-bsp/recipes-security/trusted-services/secure-partitions/=
{ =3D> corstone1000}/0014-Add-uefi-variable-append-write-support.patch (1=
00%)
 rename meta-arm-bsp/recipes-security/trusted-services/secure-partitions/=
{ =3D> corstone1000}/0015-Add-UEFI-variable-support-for-QueryVariableInfo=
.patch (100%)
 rename meta-arm-bsp/recipes-security/trusted-services/secure-partitions/=
{ =3D> corstone1000}/0016-Add-uefi-test-deployment.patch (100%)
 rename meta-arm-bsp/recipes-security/trusted-services/secure-partitions/=
{ =3D> corstone1000}/0017-Fix-interface-ID-parameter-setting-in-sp-ffarpc=
_call.patch (100%)
 rename meta-arm-bsp/recipes-security/trusted-services/secure-partitions/=
{ =3D> corstone1000}/0018-Support-FFARPC-call-requests-with-no-shared-buf=
fer.patch (100%)
 rename meta-arm-bsp/recipes-security/trusted-services/secure-partitions/=
{ =3D> corstone1000}/0019-Run-psa-arch-test.patch (100%)
 rename meta-arm-bsp/recipes-security/trusted-services/secure-partitions/=
{ =3D> corstone1000}/0020-Use-address-instead-of-pointers.patch (100%)
 rename meta-arm-bsp/recipes-security/trusted-services/secure-partitions/=
{ =3D> corstone1000}/0021-Add-psa-ipc-attestation-to-se-proxy.patch (100%=
)
 rename meta-arm-bsp/recipes-security/trusted-services/secure-partitions/=
{ =3D> corstone1000}/0022-Setup-its-backend-as-openamp-rpc-using-secure-s=
torag.patch (100%)
 rename meta-arm-bsp/recipes-security/trusted-services/secure-partitions/=
{ =3D> corstone1000}/0023-add-psa-ipc-crypto-backend.patch (100%)
 rename meta-arm-bsp/recipes-security/trusted-services/secure-partitions/=
{ =3D> corstone1000}/0024-Increase-SMM-gateway-UEFI-variable-macro-value.=
patch (100%)
 rename meta-arm-bsp/recipes-security/trusted-services/secure-partitions/=
{ =3D> corstone1000}/0025-Add-stub-capsule-update-service-components.patc=
h (100%)
 rename meta-arm-bsp/recipes-security/trusted-services/secure-partitions/=
{ =3D> corstone1000}/0026-Add-logs-to-functions-in-SMM-gateway-SP.patch (=
100%)
 rename meta-arm-bsp/recipes-security/trusted-services/secure-partitions/=
{ =3D> corstone1000}/0027-Configure-storage-size.patch (100%)
 rename meta-arm-bsp/recipes-security/trusted-services/secure-partitions/=
{ =3D> corstone1000}/0028-Revert-Add-uefi-variable-append-write-support.p=
atch (100%)
 rename meta-arm-bsp/recipes-security/trusted-services/secure-partitions/=
{ =3D> corstone1000}/0029-Change-UID-of-variable-index-in-SMM.patch (100%=
)
 rename meta-arm-bsp/recipes-security/trusted-services/secure-partitions/=
{ =3D> corstone1000}/0030-Add-missing-features-to-setVariable.patch (100%=
)
 rename meta-arm-bsp/recipes-security/trusted-services/secure-partitions/=
{ =3D> corstone1000}/0031-Add-invalid-parameter-check-in-getNextVariableN=
ame.patch (100%)
 rename meta-arm-bsp/recipes-security/trusted-services/secure-partitions/=
{ =3D> corstone1000}/0032-smm_gateway-add-checks-for-null-attributes.patc=
h (100%)

--=20
2.25.1



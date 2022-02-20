Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8B92C433EF
	for <webhook@archiver.kernel.org>; Sun, 20 Feb 2022 13:28:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.21476.1645363719318961343
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 20 Feb 2022 05:28:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2FB90113E;
	Sun, 20 Feb 2022 05:28:38 -0800 (PST)
Received: from e126835.arm.com (unknown [10.57.18.180])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF0683F718;
	Sun, 20 Feb 2022 05:28:36 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	jon.mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <Emekcan.Aras@arm.com>,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH 1/1] arm-bsp/security: move TS patches to corstone1000
 directory
Date: Sun, 20 Feb 2022 13:28:27 +0000
Message-Id: <20220220132827.19402-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220220132827.19402-1-emekcan.aras@arm.com>
References: <20220220132827.19402-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 20 Feb 2022 13:28:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3026

From: Emekcan Aras <Emekcan.Aras@arm.com>

This commit moves all the trusted-services patches to a new
corstone1000 directory.

Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
---
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

diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/0001-tools-cmake-common-applying-lowercase-project-convention.patch =
b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corsto=
ne1000/0001-tools-cmake-common-applying-lowercase-project-convention.patc=
h
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/secure-partiti=
ons/0001-tools-cmake-common-applying-lowercase-project-convention.patch
rename to meta-arm-bsp/recipes-security/trusted-services/secure-partition=
s/corstone1000/0001-tools-cmake-common-applying-lowercase-project-convent=
ion.patch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/0002-fix-EARLY_TA_PATHS-env-variable.patch b/meta-arm-bsp/recipes-se=
curity/trusted-services/secure-partitions/corstone1000/0002-fix-EARLY_TA_=
PATHS-env-variable.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/secure-partiti=
ons/0002-fix-EARLY_TA_PATHS-env-variable.patch
rename to meta-arm-bsp/recipes-security/trusted-services/secure-partition=
s/corstone1000/0002-fix-EARLY_TA_PATHS-env-variable.patch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/0003-se-proxy-dts-add-se-proxy-as-child-node.patch b/meta-arm-bsp/re=
cipes-security/trusted-services/secure-partitions/corstone1000/0003-se-pr=
oxy-dts-add-se-proxy-as-child-node.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/secure-partiti=
ons/0003-se-proxy-dts-add-se-proxy-as-child-node.patch
rename to meta-arm-bsp/recipes-security/trusted-services/secure-partition=
s/corstone1000/0003-se-proxy-dts-add-se-proxy-as-child-node.patch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/0004-Update-mm-comm-buffer-region-in-dts-file.patch b/meta-arm-bsp/r=
ecipes-security/trusted-services/secure-partitions/corstone1000/0004-Upda=
te-mm-comm-buffer-region-in-dts-file.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/secure-partiti=
ons/0004-Update-mm-comm-buffer-region-in-dts-file.patch
rename to meta-arm-bsp/recipes-security/trusted-services/secure-partition=
s/corstone1000/0004-Update-mm-comm-buffer-region-in-dts-file.patch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/0005-Configure-NV-storage-macro.patch b/meta-arm-bsp/recipes-securit=
y/trusted-services/secure-partitions/corstone1000/0005-Configure-NV-stora=
ge-macro.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/secure-partiti=
ons/0005-Configure-NV-storage-macro.patch
rename to meta-arm-bsp/recipes-security/trusted-services/secure-partition=
s/corstone1000/0005-Configure-NV-storage-macro.patch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/0006-Use-device-region.patch b/meta-arm-bsp/recipes-security/trusted=
-services/secure-partitions/corstone1000/0006-Use-device-region.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/secure-partiti=
ons/0006-Use-device-region.patch
rename to meta-arm-bsp/recipes-security/trusted-services/secure-partition=
s/corstone1000/0006-Use-device-region.patch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/0007-Add-openamp-to-SE-proxy-deployment.patch b/meta-arm-bsp/recipes=
-security/trusted-services/secure-partitions/corstone1000/0007-Add-openam=
p-to-SE-proxy-deployment.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/secure-partiti=
ons/0007-Add-openamp-to-SE-proxy-deployment.patch
rename to meta-arm-bsp/recipes-security/trusted-services/secure-partition=
s/corstone1000/0007-Add-openamp-to-SE-proxy-deployment.patch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/0008-Implement-mhu-driver-and-the-OpenAmp-conversion-laye.patch b/me=
ta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone10=
00/0008-Implement-mhu-driver-and-the-OpenAmp-conversion-laye.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/secure-partiti=
ons/0008-Implement-mhu-driver-and-the-OpenAmp-conversion-laye.patch
rename to meta-arm-bsp/recipes-security/trusted-services/secure-partition=
s/corstone1000/0008-Implement-mhu-driver-and-the-OpenAmp-conversion-laye.=
patch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/0009-Add-openamp-rpc-caller.patch b/meta-arm-bsp/recipes-security/tr=
usted-services/secure-partitions/corstone1000/0009-Add-openamp-rpc-caller=
.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/secure-partiti=
ons/0009-Add-openamp-rpc-caller.patch
rename to meta-arm-bsp/recipes-security/trusted-services/secure-partition=
s/corstone1000/0009-Add-openamp-rpc-caller.patch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/0010-add-psa-client-definitions-for-ff-m.patch b/meta-arm-bsp/recipe=
s-security/trusted-services/secure-partitions/corstone1000/0010-add-psa-c=
lient-definitions-for-ff-m.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/secure-partiti=
ons/0010-add-psa-client-definitions-for-ff-m.patch
rename to meta-arm-bsp/recipes-security/trusted-services/secure-partition=
s/corstone1000/0010-add-psa-client-definitions-for-ff-m.patch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/0011-Add-common-service-component-to-ipc-support.patch b/meta-arm-bs=
p/recipes-security/trusted-services/secure-partitions/corstone1000/0011-A=
dd-common-service-component-to-ipc-support.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/secure-partiti=
ons/0011-Add-common-service-component-to-ipc-support.patch
rename to meta-arm-bsp/recipes-security/trusted-services/secure-partition=
s/corstone1000/0011-Add-common-service-component-to-ipc-support.patch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/0012-Add-secure-storage-ipc-backend.patch b/meta-arm-bsp/recipes-sec=
urity/trusted-services/secure-partitions/corstone1000/0012-Add-secure-sto=
rage-ipc-backend.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/secure-partiti=
ons/0012-Add-secure-storage-ipc-backend.patch
rename to meta-arm-bsp/recipes-security/trusted-services/secure-partition=
s/corstone1000/0012-Add-secure-storage-ipc-backend.patch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/0013-Use-secure-storage-ipc-and-openamp-for-se_proxy.patch b/meta-ar=
m-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/00=
13-Use-secure-storage-ipc-and-openamp-for-se_proxy.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/secure-partiti=
ons/0013-Use-secure-storage-ipc-and-openamp-for-se_proxy.patch
rename to meta-arm-bsp/recipes-security/trusted-services/secure-partition=
s/corstone1000/0013-Use-secure-storage-ipc-and-openamp-for-se_proxy.patch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/0014-Add-uefi-variable-append-write-support.patch b/meta-arm-bsp/rec=
ipes-security/trusted-services/secure-partitions/corstone1000/0014-Add-ue=
fi-variable-append-write-support.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/secure-partiti=
ons/0014-Add-uefi-variable-append-write-support.patch
rename to meta-arm-bsp/recipes-security/trusted-services/secure-partition=
s/corstone1000/0014-Add-uefi-variable-append-write-support.patch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/0015-Add-UEFI-variable-support-for-QueryVariableInfo.patch b/meta-ar=
m-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/00=
15-Add-UEFI-variable-support-for-QueryVariableInfo.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/secure-partiti=
ons/0015-Add-UEFI-variable-support-for-QueryVariableInfo.patch
rename to meta-arm-bsp/recipes-security/trusted-services/secure-partition=
s/corstone1000/0015-Add-UEFI-variable-support-for-QueryVariableInfo.patch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/0016-Add-uefi-test-deployment.patch b/meta-arm-bsp/recipes-security/=
trusted-services/secure-partitions/corstone1000/0016-Add-uefi-test-deploy=
ment.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/secure-partiti=
ons/0016-Add-uefi-test-deployment.patch
rename to meta-arm-bsp/recipes-security/trusted-services/secure-partition=
s/corstone1000/0016-Add-uefi-test-deployment.patch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/0017-Fix-interface-ID-parameter-setting-in-sp-ffarpc_call.patch b/me=
ta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone10=
00/0017-Fix-interface-ID-parameter-setting-in-sp-ffarpc_call.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/secure-partiti=
ons/0017-Fix-interface-ID-parameter-setting-in-sp-ffarpc_call.patch
rename to meta-arm-bsp/recipes-security/trusted-services/secure-partition=
s/corstone1000/0017-Fix-interface-ID-parameter-setting-in-sp-ffarpc_call.=
patch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/0018-Support-FFARPC-call-requests-with-no-shared-buffer.patch b/meta=
-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000=
/0018-Support-FFARPC-call-requests-with-no-shared-buffer.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/secure-partiti=
ons/0018-Support-FFARPC-call-requests-with-no-shared-buffer.patch
rename to meta-arm-bsp/recipes-security/trusted-services/secure-partition=
s/corstone1000/0018-Support-FFARPC-call-requests-with-no-shared-buffer.pa=
tch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/0019-Run-psa-arch-test.patch b/meta-arm-bsp/recipes-security/trusted=
-services/secure-partitions/corstone1000/0019-Run-psa-arch-test.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/secure-partiti=
ons/0019-Run-psa-arch-test.patch
rename to meta-arm-bsp/recipes-security/trusted-services/secure-partition=
s/corstone1000/0019-Run-psa-arch-test.patch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/0020-Use-address-instead-of-pointers.patch b/meta-arm-bsp/recipes-se=
curity/trusted-services/secure-partitions/corstone1000/0020-Use-address-i=
nstead-of-pointers.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/secure-partiti=
ons/0020-Use-address-instead-of-pointers.patch
rename to meta-arm-bsp/recipes-security/trusted-services/secure-partition=
s/corstone1000/0020-Use-address-instead-of-pointers.patch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/0021-Add-psa-ipc-attestation-to-se-proxy.patch b/meta-arm-bsp/recipe=
s-security/trusted-services/secure-partitions/corstone1000/0021-Add-psa-i=
pc-attestation-to-se-proxy.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/secure-partiti=
ons/0021-Add-psa-ipc-attestation-to-se-proxy.patch
rename to meta-arm-bsp/recipes-security/trusted-services/secure-partition=
s/corstone1000/0021-Add-psa-ipc-attestation-to-se-proxy.patch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/0022-Setup-its-backend-as-openamp-rpc-using-secure-storag.patch b/me=
ta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone10=
00/0022-Setup-its-backend-as-openamp-rpc-using-secure-storag.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/secure-partiti=
ons/0022-Setup-its-backend-as-openamp-rpc-using-secure-storag.patch
rename to meta-arm-bsp/recipes-security/trusted-services/secure-partition=
s/corstone1000/0022-Setup-its-backend-as-openamp-rpc-using-secure-storag.=
patch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/0023-add-psa-ipc-crypto-backend.patch b/meta-arm-bsp/recipes-securit=
y/trusted-services/secure-partitions/corstone1000/0023-add-psa-ipc-crypto=
-backend.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/secure-partiti=
ons/0023-add-psa-ipc-crypto-backend.patch
rename to meta-arm-bsp/recipes-security/trusted-services/secure-partition=
s/corstone1000/0023-add-psa-ipc-crypto-backend.patch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/0024-Increase-SMM-gateway-UEFI-variable-macro-value.patch b/meta-arm=
-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/002=
4-Increase-SMM-gateway-UEFI-variable-macro-value.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/secure-partiti=
ons/0024-Increase-SMM-gateway-UEFI-variable-macro-value.patch
rename to meta-arm-bsp/recipes-security/trusted-services/secure-partition=
s/corstone1000/0024-Increase-SMM-gateway-UEFI-variable-macro-value.patch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/0025-Add-stub-capsule-update-service-components.patch b/meta-arm-bsp=
/recipes-security/trusted-services/secure-partitions/corstone1000/0025-Ad=
d-stub-capsule-update-service-components.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/secure-partiti=
ons/0025-Add-stub-capsule-update-service-components.patch
rename to meta-arm-bsp/recipes-security/trusted-services/secure-partition=
s/corstone1000/0025-Add-stub-capsule-update-service-components.patch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/0026-Add-logs-to-functions-in-SMM-gateway-SP.patch b/meta-arm-bsp/re=
cipes-security/trusted-services/secure-partitions/corstone1000/0026-Add-l=
ogs-to-functions-in-SMM-gateway-SP.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/secure-partiti=
ons/0026-Add-logs-to-functions-in-SMM-gateway-SP.patch
rename to meta-arm-bsp/recipes-security/trusted-services/secure-partition=
s/corstone1000/0026-Add-logs-to-functions-in-SMM-gateway-SP.patch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/0027-Configure-storage-size.patch b/meta-arm-bsp/recipes-security/tr=
usted-services/secure-partitions/corstone1000/0027-Configure-storage-size=
.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/secure-partiti=
ons/0027-Configure-storage-size.patch
rename to meta-arm-bsp/recipes-security/trusted-services/secure-partition=
s/corstone1000/0027-Configure-storage-size.patch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/0028-Revert-Add-uefi-variable-append-write-support.patch b/meta-arm-=
bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0028=
-Revert-Add-uefi-variable-append-write-support.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/secure-partiti=
ons/0028-Revert-Add-uefi-variable-append-write-support.patch
rename to meta-arm-bsp/recipes-security/trusted-services/secure-partition=
s/corstone1000/0028-Revert-Add-uefi-variable-append-write-support.patch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/0029-Change-UID-of-variable-index-in-SMM.patch b/meta-arm-bsp/recipe=
s-security/trusted-services/secure-partitions/corstone1000/0029-Change-UI=
D-of-variable-index-in-SMM.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/secure-partiti=
ons/0029-Change-UID-of-variable-index-in-SMM.patch
rename to meta-arm-bsp/recipes-security/trusted-services/secure-partition=
s/corstone1000/0029-Change-UID-of-variable-index-in-SMM.patch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/0030-Add-missing-features-to-setVariable.patch b/meta-arm-bsp/recipe=
s-security/trusted-services/secure-partitions/corstone1000/0030-Add-missi=
ng-features-to-setVariable.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/secure-partiti=
ons/0030-Add-missing-features-to-setVariable.patch
rename to meta-arm-bsp/recipes-security/trusted-services/secure-partition=
s/corstone1000/0030-Add-missing-features-to-setVariable.patch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/0031-Add-invalid-parameter-check-in-getNextVariableName.patch b/meta=
-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000=
/0031-Add-invalid-parameter-check-in-getNextVariableName.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/secure-partiti=
ons/0031-Add-invalid-parameter-check-in-getNextVariableName.patch
rename to meta-arm-bsp/recipes-security/trusted-services/secure-partition=
s/corstone1000/0031-Add-invalid-parameter-check-in-getNextVariableName.pa=
tch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/0032-smm_gateway-add-checks-for-null-attributes.patch b/meta-arm-bsp=
/recipes-security/trusted-services/secure-partitions/corstone1000/0032-sm=
m_gateway-add-checks-for-null-attributes.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/secure-partiti=
ons/0032-smm_gateway-add-checks-for-null-attributes.patch
rename to meta-arm-bsp/recipes-security/trusted-services/secure-partition=
s/corstone1000/0032-smm_gateway-add-checks-for-null-attributes.patch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone10=
00.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.i=
nc
index 27315430..78986dbb 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
@@ -1,4 +1,4 @@
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/secure-partitions:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/secure-partitions/corstone1000:=
"
=20
 COMPATIBLE_MACHINE =3D "corstone1000"
=20
--=20
2.25.1



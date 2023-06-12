Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7A0CC7EE43
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 21:43:55 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.72632.1686606228907898692
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 12 Jun 2023 14:43:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9B9E640C16;
	Mon, 12 Jun 2023 21:43:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qIaVcAB_6HFx; Mon, 12 Jun 2023 21:43:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5AE1B40C06;
	Mon, 12 Jun 2023 21:43:45 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 33F02163A56; Mon, 12 Jun 2023 17:42:56 -0400 (EDT)
Date: Mon, 12 Jun 2023 17:42:56 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Gyorgy Szing <gyorgy.szing@arm.com>
Cc: meta-arm@lists.yoctoproject.org,
	Rui Miguel Silva <rui.silva@linaro.org>
Subject: Re: [meta-arm] [PATCH 01/16] arm/trusted-services: update TS
 version
Message-ID: <20230612214256.GS9226@denix.org>
References: <20230519112400.340-1-Gyorgy.Szing@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230519112400.340-1-Gyorgy.Szing@arm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 12 Jun 2023 21:43:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4763

I would like to propose reverting this series ASAP due to the breakage caused 
to downstream layers and platforms.


On Fri, May 19, 2023 at 01:23:45PM +0200, Gyorgy Szing wrote:
> This change updates to latest available version of Trusted Services.
> List of changes:
>   - adapt SP recipes to file structure changes and support for
>     "configurations". In TS each SP can be built in various different
>     setups to allow adapting to platform and integration specific
>     differences.
>   - MbedTLS dependency has been updated to v3.3.0.
>       - This needs new python dependencies are required in the build
>         environment.
>       - psa-acs was updated to a matching version.
>       - do_patch() has been updated to support the MbedTLS patch added
>         in TS.
>   - Update TS dependency patching method to use git instead of patch.
>   - Downgrade nanopb to match up-stream dependency version.
> 
> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> Signed-off-by: Gyorgy Szing <Gyorgy.Szing@arm.com>
> ---
>  .../trusted-services/trusted-services-src.inc | 27 +++++++++----------
>  .../trusted-services/ts-demo_git.bb           |  1 +
>  .../trusted-services/ts-newlib_4.1.0.bb       |  4 +--
>  .../ts-psa-api-test-common_git.inc            |  4 ++-
>  .../trusted-services/ts-sp-attestation_git.bb |  3 ++-
>  .../trusted-services/ts-sp-crypto_git.bb      |  5 ++--
>  .../trusted-services/ts-sp-env-test_git.bb    |  3 ++-
>  .../trusted-services/ts-sp-its_git.bb         |  3 ++-
>  .../trusted-services/ts-sp-se-proxy_git.bb    |  3 ++-
>  .../trusted-services/ts-sp-smm-gateway_git.bb |  3 ++-
>  .../trusted-services/ts-sp-storage_git.bb     |  3 ++-
>  11 files changed, 32 insertions(+), 27 deletions(-)
> 
> diff --git a/meta-arm/recipes-security/trusted-services/trusted-services-src.inc b/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
> index dc295506..c3ab7867 100644
> --- a/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
> +++ b/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
> @@ -5,8 +5,8 @@ LICENSE = "Apache-2.0 & BSD-3-Clause & BSD-2-Clause & Zlib"
>  SRC_URI = "git://git.trustedfirmware.org/TS/trusted-services.git;protocol=https;branch=integration;name=trusted-services;destsuffix=git/trusted-services \
>  "
>  
> -#latest on 12.10.22.
> -SRCREV_trusted-services = "3d4956770f89eb9ae0a73257901ae6277c078da6"
> +#Latest on 2023 April 25
> +SRCREV="0d292e7c879076ea36cc39e30e0ac930b71e8cd8"
>  LIC_FILES_CHKSUM = "file://${S}/license.rst;md5=ea160bac7f690a069c608516b17997f4"
>  
>  S = "${WORKDIR}/git/trusted-services"
> @@ -17,14 +17,14 @@ SRC_URI += "git://github.com/dgibson/dtc;name=dtc;protocol=https;branch=main;des
>  SRCREV_dtc = "b6910bec11614980a21e46fbccc35934b671bd81"
>  LIC_FILES_CHKSUM += "file://../dtc/README.license;md5=a1eb22e37f09df5b5511b8a278992d0e"
>  
> -# MbedTLS, tag "mbedtls-3.1.0"
> +# MbedTLS, tag "mbedtls-3.3.0"
>  SRC_URI += "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=https;branch=master;destsuffix=git/mbedtls"
> -SRCREV_mbedtls = "d65aeb37349ad1a50e0f6c9b694d4b5290d60e49"
> +SRCREV_mbedtls = "8c89224991adff88d53cd380f42a2baa36f91454"
>  LIC_FILES_CHKSUM += "file://../mbedtls/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>  
> -# Nanopb, tag "nanopb-0.4.6"
> +# Nanopb, tag "nanopb-0.4.2"
>  SRC_URI += "git://github.com/nanopb/nanopb.git;name=nanopb;protocol=https;branch=master;destsuffix=git/nanopb"
> -SRCREV_nanopb = "afc499f9a410fc9bbf6c9c48cdd8d8b199d49eb4"
> +SRCREV_nanopb = "df0e92f474f9cca704fe2b31483f0b4d1b1715a4"
>  LIC_FILES_CHKSUM += "file://../nanopb/LICENSE.txt;md5=9db4b73a55a3994384112efcdb37c01f"
>  
>  # qcbor, tag "v1.0.0"
> @@ -54,15 +54,12 @@ LIC_FILES_CHKSUM += "file://../openamp/LICENSE.md;md5=a8d8cf662ef6bf9936a1e14135
>  
>  # TS ships patches for external dependencies that needs to be applied
>  apply_ts_patches() {
> -    for p in ${S}/external/qcbor/*.patch; do
> -        patch -p1 -N -d ${WORKDIR}/git/qcbor < ${p} || true
> -    done
> -    for p in ${S}/external/t_cose/*.patch; do
> -        patch -p1 -N -d ${WORKDIR}/git/tcose < ${p} || true
> -    done
> -    for p in ${S}/external/CppUTest/*.patch; do
> -        patch -p1 -d ${WORKDIR}/git/cpputest < ${p}
> -    done
> +    ( cd ${WORKDIR}/git/qcbor;    git stash; git branch -f bf_am; git am ${S}/external/qcbor/*.patch; git reset bf_am )
> +    ( cd ${WORKDIR}/git/tcose;    git stash; git branch -f bf_am; git am ${S}/external/t_cose/*.patch; git reset bf_am )
> +    ( cd ${WORKDIR}/git/mbedtls;  git stash; git branch -f bf_am; git am ${S}/external/MbedTLS/*.patch; git reset bf_am )
> +    ( cd ${WORKDIR}/git/cpputest; git stash; git apply ${S}/external/CppUTest/*.patch )
> +    ( cd ${WORKDIR}/git/dtc;      git stash; git apply ${S}/external/libfdt/*.patch )
> +    ( cd ${WORKDIR}/git/nanopb;   git stash; git apply ${S}/external/nanopb/*.patch )
>  }
>  do_patch[postfuncs] += "apply_ts_patches"
>  
> diff --git a/meta-arm/recipes-security/trusted-services/ts-demo_git.bb b/meta-arm/recipes-security/trusted-services/ts-demo_git.bb
> index a9f7b65f..668bde56 100644
> --- a/meta-arm/recipes-security/trusted-services/ts-demo_git.bb
> +++ b/meta-arm/recipes-security/trusted-services/ts-demo_git.bb
> @@ -6,6 +6,7 @@ TS_ENV = "arm-linux"
>  
>  require trusted-services.inc
>  
> +DEPENDS        += "python3-jsonschema-native python3-jinja2-native"
>  DEPENDS        += "libts"
>  RDEPENDS:${PN} += "libts"
>  
> diff --git a/meta-arm/recipes-security/trusted-services/ts-newlib_4.1.0.bb b/meta-arm/recipes-security/trusted-services/ts-newlib_4.1.0.bb
> index 408c7d3c..24a724a4 100644
> --- a/meta-arm/recipes-security/trusted-services/ts-newlib_4.1.0.bb
> +++ b/meta-arm/recipes-security/trusted-services/ts-newlib_4.1.0.bb
> @@ -22,9 +22,7 @@ OECMAKE_SOURCEPATH = "${S}/deployments/newlib/${TS_ENV}/"
>  
>  # TS ships a patch that needs to be applied to newlib
>  apply_ts_patch() {
> -    for p in ${S}/external/newlib/*.patch; do
> -        patch -p1 -d ${WORKDIR}/git/newlib < ${p}
> -    done
> +    ( cd ${WORKDIR}/git/newlib;    git stash; git branch -f bf_am; git am ${S}/external/newlib/*.patch; git reset bf_am )
>  }
>  do_patch[postfuncs] += "apply_ts_patch"
>  
> diff --git a/meta-arm/recipes-security/trusted-services/ts-psa-api-test-common_git.inc b/meta-arm/recipes-security/trusted-services/ts-psa-api-test-common_git.inc
> index 41cb0c08..8a7b0e5c 100644
> --- a/meta-arm/recipes-security/trusted-services/ts-psa-api-test-common_git.inc
> +++ b/meta-arm/recipes-security/trusted-services/ts-psa-api-test-common_git.inc
> @@ -4,6 +4,8 @@ TS_ENV = "arm-linux"
>  
>  require trusted-services.inc
>  
> +DEPENDS        += "python3-jsonschema-native python3-jinja2-native"
> +
>  DEPENDS        += "libts"
>  RDEPENDS:${PN} += "libts"
>  
> @@ -11,7 +13,7 @@ SRC_URI += "git://github.com/ARM-software/psa-arch-tests.git;name=psatest;protoc
>              file://0001-Pass-Yocto-build-settings-to-psa-arch-tests-native.patch;patchdir=../psatest \
>             "
>  
> -SRCREV_psatest = "451aa087a40d02c7d04778235014c5619d126471"
> +SRCREV_psatest = "38cb53a4d9e292435ddf7899960b15af62decfbe"
>  LIC_FILES_CHKSUM += "file://../psatest/LICENSE.md;md5=2a944942e1496af1886903d274dedb13"
>  
>  EXTRA_OECMAKE += "\
> diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-attestation_git.bb b/meta-arm/recipes-security/trusted-services/ts-sp-attestation_git.bb
> index eef05fe3..6cddfb03 100644
> --- a/meta-arm/recipes-security/trusted-services/ts-sp-attestation_git.bb
> +++ b/meta-arm/recipes-security/trusted-services/ts-sp-attestation_git.bb
> @@ -3,5 +3,6 @@ DESCRIPTION = "Trusted Services attestation service provider"
>  require ts-sp-common.inc
>  
>  SP_UUID = "${ATTESTATION_UUID}"
> +TS_SP_IAT_CONFIG ?= "default"
>  
> -OECMAKE_SOURCEPATH="${S}/deployments/attestation/${TS_ENV}"
> +OECMAKE_SOURCEPATH="${S}/deployments/attestation/config/${TS_SP_IAT_CONFIG}-${TS_ENV}"
> diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-crypto_git.bb b/meta-arm/recipes-security/trusted-services/ts-sp-crypto_git.bb
> index 77a28557..867e4a81 100644
> --- a/meta-arm/recipes-security/trusted-services/ts-sp-crypto_git.bb
> +++ b/meta-arm/recipes-security/trusted-services/ts-sp-crypto_git.bb
> @@ -3,7 +3,8 @@ DESCRIPTION = "Trusted Services crypto service provider"
>  require ts-sp-common.inc
>  
>  SP_UUID = "${CRYPTO_UUID}"
> +TS_SP_CRYPTO_CONFIG ?= "default"
>  
> -DEPENDS += "python3-protobuf-native"
> +DEPENDS += "python3-protobuf-native python3-jsonschema-native python3-jinja2-native"
>  
> -OECMAKE_SOURCEPATH="${S}/deployments/crypto/${TS_ENV}"
> +OECMAKE_SOURCEPATH="${S}/deployments/crypto/config/${TS_SP_CRYPTO_CONFIG}-${TS_ENV}"
> diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-env-test_git.bb b/meta-arm/recipes-security/trusted-services/ts-sp-env-test_git.bb
> index 040fd4d1..5551a4de 100644
> --- a/meta-arm/recipes-security/trusted-services/ts-sp-env-test_git.bb
> +++ b/meta-arm/recipes-security/trusted-services/ts-sp-env-test_git.bb
> @@ -6,5 +6,6 @@ require ts-sp-common.inc
>  COMPATIBLE_MACHINE ?= "invalid"
>  
>  SP_UUID = "${ENV_TEST_UUID}"
> +TS_SP_ENVTEST_CONFIG ?= "baremetal-fvp_base_revc"
>  
> -OECMAKE_SOURCEPATH="${S}/deployments/env-test/${TS_ENV}"
> +OECMAKE_SOURCEPATH="${S}/deployments/env-test/config/${TS_SP_ENVTEST_CONFIG}-${TS_ENV}"
> diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-its_git.bb b/meta-arm/recipes-security/trusted-services/ts-sp-its_git.bb
> index 4eb5dc5e..5472dbda 100644
> --- a/meta-arm/recipes-security/trusted-services/ts-sp-its_git.bb
> +++ b/meta-arm/recipes-security/trusted-services/ts-sp-its_git.bb
> @@ -3,5 +3,6 @@ DESCRIPTION = "Trusted Services internal secure storage service provider"
>  require ts-sp-common.inc
>  
>  SP_UUID = "${ITS_UUID}"
> +TS_SP_ITS_CONFIG ?= "default"
>  
> -OECMAKE_SOURCEPATH="${S}/deployments/internal-trusted-storage/${TS_ENV}"
> +OECMAKE_SOURCEPATH="${S}/deployments/internal-trusted-storage/config/${TS_SP_ITS_CONFIG}-${TS_ENV}"
> diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-se-proxy_git.bb b/meta-arm/recipes-security/trusted-services/ts-sp-se-proxy_git.bb
> index b9246418..26781434 100644
> --- a/meta-arm/recipes-security/trusted-services/ts-sp-se-proxy_git.bb
> +++ b/meta-arm/recipes-security/trusted-services/ts-sp-se-proxy_git.bb
> @@ -3,7 +3,8 @@ DESCRIPTION = "Trusted Services proxy service providers"
>  require ts-sp-common.inc
>  
>  SP_UUID = "${SE_PROXY_UUID}"
> +TS_SP_SE_PROXY_CONFIG ?= "default"
>  
>  DEPENDS += "python3-protobuf-native"
>  
> -OECMAKE_SOURCEPATH="${S}/deployments/se-proxy/${TS_ENV}"
> +OECMAKE_SOURCEPATH="${S}/deployments/se-proxy/config/${TS_SP_SE_PROXY_CONFIG}-${TS_ENV}"
> diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-smm-gateway_git.bb b/meta-arm/recipes-security/trusted-services/ts-sp-smm-gateway_git.bb
> index 06ca6bd1..752f7fe7 100644
> --- a/meta-arm/recipes-security/trusted-services/ts-sp-smm-gateway_git.bb
> +++ b/meta-arm/recipes-security/trusted-services/ts-sp-smm-gateway_git.bb
> @@ -3,5 +3,6 @@ DESCRIPTION = "Trusted Services service provider for UEFI SMM services"
>  require ts-sp-common.inc
>  
>  SP_UUID = "${SMM_GATEWAY_UUID}"
> +TS_SP_SMM_GATEWAY_CONFIG ?= "default"
>  
> -OECMAKE_SOURCEPATH="${S}/deployments/smm-gateway/${TS_ENV}"
> +OECMAKE_SOURCEPATH="${S}/deployments/smm-gateway/config/${TS_SP_SMM_GATEWAY_CONFIG}-${TS_ENV}"
> diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-storage_git.bb b/meta-arm/recipes-security/trusted-services/ts-sp-storage_git.bb
> index c8937546..5b2f47b3 100644
> --- a/meta-arm/recipes-security/trusted-services/ts-sp-storage_git.bb
> +++ b/meta-arm/recipes-security/trusted-services/ts-sp-storage_git.bb
> @@ -3,5 +3,6 @@ DESCRIPTION = "Trusted Services secure storage service provider"
>  require ts-sp-common.inc
>  
>  SP_UUID = "${STORAGE_UUID}"
> +TS_SP_PS_CONFIG ?= "default"
>  
> -OECMAKE_SOURCEPATH="${S}/deployments/protected-storage/${TS_ENV}"
> +OECMAKE_SOURCEPATH="${S}/deployments/protected-storage/config/${TS_SP_PS_CONFIG}-${TS_ENV}"
> -- 
> 2.39.1.windows.1


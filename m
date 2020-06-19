Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.3415.1592538382407021255
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Jun 2020 20:46:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B0CDA40B96
	for <meta-arm@lists.yoctoproject.org>; Fri, 19 Jun 2020 03:46:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6VFOsiG34gbe for <meta-arm@lists.yoctoproject.org>;
	Fri, 19 Jun 2020 03:46:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9B2CB40A9E
	for <meta-arm@lists.yoctoproject.org>; Fri, 19 Jun 2020 03:46:21 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 01B6517320C; Thu, 18 Jun 2020 23:46:20 -0400 (EDT)
Date: Thu, 18 Jun 2020 23:46:20 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH v3 0/5] external-arm-toolchain: Add prebuilt SDK support
Message-ID: <20200619034620.GE17660@denix.org>
References: <1619CAD238DC8DE5.13914@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <1619CAD238DC8DE5.13914@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 18, 2020 at 08:35:32PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> This series adds a recipe with supporting enhancements and settings to package
> existing cross-compile binaries from external toolchain to be used for SDK.
> 
> This approach provides a benefit of full re-use of external toolchain and uses
> the same set of binaries when cross-compiling on development host, as well as
> SDK host.
> 
> The limitation is that the SDK host architecture cannot be different from the
> development host architecture and be the one supported by the external toolchain
> releases, currently x86_64 and aarch64, which should cover >95% of use cases.
> 
> For the remaining use cases when the above limitation cannot be met, the default
> configuration for cross-canadian gcc/gdb/binutils uses weak assignment and can
> be easily overwritten, which would result in building those components from
> sources.
> 
> Generated SDK has been tested using testsdk as follows:

A little catch - this series was developed before the other got merged, so it 
currently conflicts with patch #3 from there. It can be quickly tested by 
reverting patch #3 from the other series, as this expects the use of the 
original EAT_TARGET_SYS and not OE TARGET_SYS. We need to decide what is the 
default. If we decide to default to all prebuilt binaries even for SDK, then 
using EAT_TARGET_SYS is easier and requires less adjustments. But if the 
default should be to rebuild SDK binaries, then maybe defaulting to OE 
TARGET_SYS is fine, as just got merged to master. Either way some extra 
symlinking would be necessary and I can take care of it. Please speak up.

-- 
Denys


> $ bitbake core-image-base -c testsdk
> 
> Results:
> 
> SDK testing environment: cortexa57-poky-linux
> GalculatorTest class: SDK doesn't contain gettext
> No python package in the SDK
> RESULTS:
> RESULTS - assimp.BuildAssimp.test_assimp: PASSED (100.40s)
> RESULTS - buildcpio.BuildCpioTest.test_cpio: PASSED (45.63s)
> RESULTS - buildepoxy.EpoxyTest.test_epoxy: PASSED (22.28s)
> RESULTS - buildlzip.BuildLzipTest.test_lzip: PASSED (3.93s)
> RESULTS - gcc.GccCompileTest.test_gcc_compile: PASSED (0.13s)
> RESULTS - gcc.GccCompileTest.test_gpp2_compile: PASSED (0.13s)
> RESULTS - gcc.GccCompileTest.test_gpp_compile: PASSED (0.21s)
> RESULTS - gcc.GccCompileTest.test_make: PASSED (0.12s)
> RESULTS - perl.PerlTest.test_perl: PASSED (0.03s)
> RESULTS - python.Python3Test.test_python3: PASSED (0.05s)
> RESULTS - buildgalculator.GalculatorTest.test_galculator: SKIPPED (0.00s)
> RESULTS - python.Python2Test.test_python2: SKIPPED (0.00s)
> SUMMARY:
> core-image-base sdk (poky-glibc-x86_64-core-image-base-cortexa57-qemuarm64-toolchain-3.1+snapshot.sh:environment-setup-cortexa57-poky-linux) - Ran 12 tests in 172.918s
> core-image-base sdk - OK - All required tests passed (successes=10, skipped=2, failures=0, errors=0)
> NOTE: Tasks Summary: Attempted 1 tasks of which 0 didn't need to be rerun and all succeeded.
> 
> Changes in v3:
> - Add patch #5 with SDK fixup code to symlink include directory between
>   native and target sysroots, so external toolchain can find headers.
> 
> Changes in v2:
> - Remove conditional code in patch #2 to select GPL/LGPL license version
>   based on toolchain component version, as old GPLv2 toolchains are no
>   longer supported.
> - In patch #4 in addition to INSANE_SKIP, use SKIP_FILEDEPS for RPM to
>   skip rdeps checks.
> 
> Denys Dmytriyenko (5):
>   external-arm-toolchain-versions: also collect binutils/bfd version
>   external-arm-toolchain-versions: set per-components license based on
>     version
>   external-arm-toolchain: check for TCLIBC being glibc
>   external-arm-sdk-toolchain: add recipe to package gcc/gdb/binutils
>     cross binaries
>   tcmode-external-arm: fixup headers location in external toolchain SDK
> 
>  .../include/external-arm-toolchain-versions.inc    |  38 ++++++
>  .../conf/distro/include/tcmode-external-arm.inc    |  15 +++
>  .../external-arm-sdk-toolchain.bb                  | 140 +++++++++++++++++++++
>  .../external-arm-toolchain.bb                      |   8 +-
>  4 files changed, 195 insertions(+), 6 deletions(-)
>  create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb
> 
> -- 
> 2.7.4
> 

> 


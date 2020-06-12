Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.11822.1591928346568289375
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Jun 2020 19:19:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F2B6040B7F;
	Fri, 12 Jun 2020 02:19:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z5mvbo07ZINe; Fri, 12 Jun 2020 02:19:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 700E440AB5;
	Fri, 12 Jun 2020 02:18:59 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C440C173217; Thu, 11 Jun 2020 22:18:58 -0400 (EDT)
Date: Thu, 11 Jun 2020 22:18:58 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, pbarker@konsulko.com, wmills@ti.com,
	richard.purdie@linuxfoundation.org, daniel.thompson@linaro.org
Subject: Re: [PATCH v2 0/5] external-arm-toolchain: Add support for SDK generation
Message-ID: <20200612021858.GG17660@denix.org>
References: <1591796582-5015-1-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1591796582-5015-1-git-send-email-sumit.garg@linaro.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 10, 2020 at 07:12:57PM +0530, Sumit Garg wrote:
> Patch #1 #2 and #3 adds impprovements in external-arm-toolchain recipe in order
> to support SDK generation. SDK generation has been tested using:
> 
> $ bitbake core-image-base -c populate_sdk
> 
> Currently generated SDK only uses glibc provided by pre-built toolchain. The
> cross compiler, binutils, gdb/gdbserver etc. are built from source. This is
> something we would like to improve in future to package most of the components
> from pre-built toolchain instead.
> 
> Generated SDK has been tested using testsdk as follows:
> 
> $ bitbake core-image-base -c testsdk
> 
> Results:
> 
> SDK testing environment: aarch64-poky-linux
> GalculatorTest class: SDK doesn't contain gettext
> No python package in the SDK
> RESULTS:
> RESULTS - assimp.BuildAssimp.test_assimp: PASSED (97.93s)
> RESULTS - buildcpio.BuildCpioTest.test_cpio: PASSED (22.51s)
> RESULTS - buildepoxy.EpoxyTest.test_epoxy: PASSED (17.40s)
> RESULTS - buildlzip.BuildLzipTest.test_lzip: PASSED (2.52s)
> RESULTS - gcc.GccCompileTest.test_gcc_compile: PASSED (0.06s)
> RESULTS - gcc.GccCompileTest.test_gpp2_compile: PASSED (0.08s)
> RESULTS - gcc.GccCompileTest.test_gpp_compile: PASSED (0.10s)
> RESULTS - gcc.GccCompileTest.test_make: PASSED (0.06s)
> RESULTS - perl.PerlTest.test_perl: PASSED (0.23s)
> RESULTS - python.Python3Test.test_python3: PASSED (0.03s)
> RESULTS - buildgalculator.GalculatorTest.test_galculator: SKIPPED (0.00s)
> RESULTS - python.Python2Test.test_python2: SKIPPED (0.00s)
> SUMMARY:
> core-image-base sdk (poky-glibc-x86_64-core-image-base-aarch64-qemuarm64-toolchain-3.1+snapshot.sh:environment-setup-aarch64-poky-linux) - Ran 12 tests in 140.936s
> core-image-base sdk - OK - All required tests passed (successes=10, skipped=2, failures=0, errors=0)

Thank you very much for publishing test results! This is a huge improvement! 
We should definitely do this more often for our patch submissions.


> Patch #4 adds a README for meta-arm-toolchain layer.
> 
> Patch #5 adds package specific licences for external-arm-toolchain recipe.
> 
> Changes in v2:
> - Adds a new patch #3 which fixes issues reported by testsdk.
> - Define FILES_${PN}-dev from scratch which additionally refines packaging
>   for dev headers as well.
> - Make README common for whole meta-arm-toolchain layer rather than specific
>   to pre-built toolchain. Add myself as layer maintainer although I would
>   be happy to add another co-maintainer if someone is willing to volunteer.
> - Update README with testing info for external-arm-toolchain.
> - Misc. fixups.
> 
> Sumit Garg (5):
>   external-arm-toolchain: Remove glibc locale dependency
>   external-arm-toolchain: Refine dev libraries/headers packaging
>   external-arm-toolchain: Align glibc packaging to OE TARGET_SYS
>   meta-arm-toolchain: Add README
>   external-arm-toolchain: Add package specific licenses
> 
>  meta-arm-toolchain/README.md                       | 113 +++++++++++++++++++++
>  .../conf/distro/include/tcmode-external-arm.inc    |   1 +
>  .../external-arm-toolchain.bb                      |  70 +++++++++++--
>  .../external-arm-toolchain/license.inc             |  76 ++++++++++++++
>  .../recipes-devtools/gcc/gcc-arm-common.inc        |   2 +-
>  5 files changed, 251 insertions(+), 11 deletions(-)
>  create mode 100644 meta-arm-toolchain/README.md
>  create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
> 
> -- 
> 2.7.4
> 

Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web12.9638.1591888331068129544
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Jun 2020 08:12:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=ZmhEaWWa;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.193, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f193.google.com with SMTP id l17so5850175qki.9
        for <meta-arm@lists.yoctoproject.org>; Thu, 11 Jun 2020 08:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=evt2A530TTpfXmZebHCOWXOFdKilSSwVsRR+/RlPoNY=;
        b=ZmhEaWWacU00YqXQ26d1//OgLCt1sfurTZVgZM0rdEaAP5OrCC2ips7tv9g5p/bj44
         2xMTCBsUbyGmm5Dczr6M5Owt3CeacYU1D4r8bpHE23rr+oy54vcVCdBru3EFIDJ1tWRc
         yrtBVrDme0heobtCn6omv9z8aokX9M22kwKh6aE10tkd8YOiaDq5pJhpwykKIxBqytWa
         ZwQ8ZwKafiYTZmXeY2krXG+dugsOCZpMyE5tEhDOU4CkAFZe4mRlluarpEBPjFuau1up
         S1NKG2YkHlZUE1s16kky82TTB0ulH3nF38LHjqwo8aYVg2KB1LHmDsEV4fTPvw8JXYyV
         M9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=evt2A530TTpfXmZebHCOWXOFdKilSSwVsRR+/RlPoNY=;
        b=liYWKRISK3w0ejrTosgjJJabjBmoX8Il1EzlsCcaMauxcfRHM/ABjW9uRFs1Q1qi0a
         Dc9LbR7jBiUGLgS5uA5+Y/9L8m9xC6gKFCBHXGs6h6P11XTneISIaNsI/rigQbXbwVtz
         NjFdbDHwk6bFM/PNYw+iuyzD0Fz/wQyQiqE1/hpCsyM/7gduDeN3o8F9LGDdUxugqevm
         jZ1K62Urf6R8me6tQp7gr3XBmETHFeBu94XDYKjtxMyhTyBQpPSnKLbHOt4/ebA8T0w0
         FP5UPyvF7gVlRyAAvUELae935U7EMFeQZJbvpomKpk9ul46bGDjrfO2cYaRMtr6yo1CL
         4YoA==
X-Gm-Message-State: AOAM532MWJcighwf788KS0jBPOQp9up5vQkZBl/9P59dbvX3JvvTbEQl
	Gv7j/Q0+CdMjrYGTQCZm48yyiA==
X-Google-Smtp-Source: ABdhPJwLqwAooBlV8JNMbYckipg4LIim4f7TevDqms+SxvJnEBykdF0BlwhWIMGaZoCxdtdyiGhr+A==
X-Received: by 2002:a37:4e03:: with SMTP id c3mr9055772qkb.169.1591888330188;
        Thu, 11 Jun 2020 08:12:10 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:e01b:52c7:6d78:8385])
        by smtp.gmail.com with ESMTPSA id z60sm2936822qtc.30.2020.06.11.08.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 08:12:09 -0700 (PDT)
Date: Thu, 11 Jun 2020 11:12:08 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, pbarker@konsulko.com, denis@denix.org,
	wmills@ti.com, richard.purdie@linuxfoundation.org,
	daniel.thompson@linaro.org
Subject: Re: [meta-arm] [PATCH v2 0/5] external-arm-toolchain: Add support for SDK generation
Message-ID: <20200611151207.GA20403@kudzu.us>
References: <1591796582-5015-1-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1591796582-5015-1-git-send-email-sumit.garg@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
> 
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

Given Denys and Paul's comments on the previous series, I would like
their ack/nack before pulling in.

Thanks,
Jon

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

> 


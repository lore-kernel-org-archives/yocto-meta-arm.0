Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6347C433F5
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 03:52:19 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web10.17921.1636948339113455879
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 14 Nov 2021 19:52:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=nBsx5BgJ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.170,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f170.google.com with SMTP id l8so14399578qtk.6
        for <meta-arm@lists.yoctoproject.org>;
 Sun, 14 Nov 2021 19:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0pC3VcotgITbqibPlrJf4tGwkMHqgnx5v6ZIoFJklSo=;
        b=nBsx5BgJvSLNTJdBkItuPAVdxQssEMjwVEaRyLsJu96JALloyms+5DK7VIq25FAuYX
         TyQ4U+iI9T17B2TZ0r2MilMDfj0b5khem926HU7FHRZrCEdvnCLzJtGWpiqfARGvvRTc
         s0/aPUnKxiAlh6PLb2vRrcKPeRQQZtDge8I2C2silofKPXAExOGGXFZA3NqQdMCAyPXc
         9wZzAHn4EL6TDcYrU/CUtQOMsjGBmhsHCo3BV4hOn/3DxrfGiOEMdib73Lpfyk9INe3D
         ugwxzzoWDYKfplsBO0UqAzwPU5f187aTQWtb/d28fuDO5BRPFQgODJjeOrHI41fm8l8f
         cPqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0pC3VcotgITbqibPlrJf4tGwkMHqgnx5v6ZIoFJklSo=;
        b=rqPEHK7T1DRuK20DmxlHfZsM7yDS4Au6qvqJ3BjyUX3/2q5Y8i5ZyjmPrDtXb3O6W0
         XZsPXBpYom4BGZ+G9EqE++y2gbYr57HcyYiRCc3ylLhKdvCz5ewgiolrR93DdoDc9oXs
         9IbQuQ0BbUGWd9QiFb4Y48imj8vAeRF89WzcKb8wFab3NzP6TfwzBUzLTQVjqteeMyWk
         xgi+nY44oLifr4KBmu72mWxIbhntLics53/xmDBbO+ay+kQQ5QUFCkB/00t+7iM68zFl
         10g5/aY3YyNORdABB3B0R2POcmpqaxhV4PpSzb25QEB9whVrv5ae+HlayGE30LIMdEHq
         pcbg==
X-Gm-Message-State: AOAM530EsH1LNu1VnlEi2chPxwhbS+gWu8ssgB5kk+rtigHWuzumnsU3
	+hNpIzWLKt23tHk8KrZ8hdBfo0eZGfsAaZZ74C+itg==
X-Google-Smtp-Source: 
 ABdhPJzqBFBtLfxs2vONCXArQuS+oF8vnSk2lBsGlMhiZal7v5cKR+5pRc7FX41nKgrw31W0/0lFZgXBCjfjyeWUTrU=
X-Received: by 2002:ac8:5946:: with SMTP id 6mr6241405qtz.373.1636948338133;
 Sun, 14 Nov 2021 19:52:18 -0800 (PST)
MIME-Version: 1.0
References: <20211111131615.16972-1-maxim.uvarov@linaro.org>
In-Reply-To: <20211111131615.16972-1-maxim.uvarov@linaro.org>
From: Jon Mason <jdmason@kudzu.us>
Date: Sun, 14 Nov 2021 22:52:07 -0500
Message-ID: 
 <CAPoiz9w+dmYeUwqiVf9d95xfOo1MBP5GjSbSN3WKWLDyikkVAA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCHv2 1/3] optee: updae optee-os.inc to support
 external TAs
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, jon.mason@arm.com, ross.burton@arm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 Nov 2021 03:52:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2383

On Thu, Nov 11, 2021 at 8:16 AM Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
>
> Separate recipe for TA devkit is needed to solve
> circular dependency to build TAs withthe devkit
> and integrate it inside optee-os.
>
> Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>

On this series, I'm seeing:
ERROR: Nothing PROVIDES 'optee-os-tadevkit' (but
/builds/jonmason00/meta-arm/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
DEPENDS on or otherwise requires it)
optee-os-tadevkit was skipped: incompatible with machine tc0 (not in
COMPATIBLE_MACHINE)
https://gitlab.com/jonmason00/meta-arm/-/jobs/1779328692

Issue on tc0, tc1, and corstone1000 (and check-patch)

I'm also seeing:
ERROR: Nothing PROVIDES 'compiler-rtoptee-ftpm' (but
/builds/jonmason00/meta-arm/meta-arm/recipes-security/optee/optee-os_3.14.0.bb
DEPENDS on or otherwise requires it)
https://gitlab.com/jonmason00/meta-arm/-/jobs/1779328682

Issue on qemuarm64-secureboot

Thanks,
Jon






> ---
>  .../recipes-security/optee/optee-examples.inc |  2 +-
>  .../optee/optee-os-tadevkit_3.14.0.bb         | 20 +++++++++++++++++++
>  meta-arm/recipes-security/optee/optee-os.inc  |  7 -------
>  3 files changed, 21 insertions(+), 8 deletions(-)
>  create mode 100644 meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb
>
> diff --git a/meta-arm/recipes-security/optee/optee-examples.inc b/meta-arm/recipes-security/optee/optee-examples.inc
> index 921fa18..656722e 100644
> --- a/meta-arm/recipes-security/optee/optee-examples.inc
> +++ b/meta-arm/recipes-security/optee/optee-examples.inc
> @@ -5,7 +5,7 @@ HOMEPAGE = "https://github.com/linaro-swg/optee_examples"
>  LICENSE = "BSD-2-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=cd95ab417e23b94f381dafc453d70c30"
>
> -DEPENDS = "optee-client optee-os python3-pycryptodome-native"
> +DEPENDS = "optee-client optee-os-tadevkit python3-pycryptodome-native"
>
>  inherit python3native
>
> diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb
> new file mode 100644
> index 0000000..0d37a52
> --- /dev/null
> +++ b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb
> @@ -0,0 +1,20 @@
> +FILESEXTRAPATHS:prepend := "${THISDIR}/optee-os:"
> +require optee-os_3.14.0.bb
> +
> +SUMMARY = "OP-TEE Trusted OS TA devkit"
> +DESCRIPTION = "OP-TEE TA devkit for build TAs"
> +HOMEPAGE = "https://www.op-tee.org/"
> +
> +do_install() {
> +    #install TA devkit
> +    install -d ${D}${includedir}/optee/export-user_ta/
> +    for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
> +        cp -aR $f ${D}${includedir}/optee/export-user_ta/
> +    done
> +}
> +
> +do_deploy() {
> +       echo "Do not inherit do_deploy from optee-os."
> +}
> +
> +FILES:${PN} = "${includedir}/optee/"
> diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/recipes-security/optee/optee-os.inc
> index 277646e..1506a58 100644
> --- a/meta-arm/recipes-security/optee/optee-os.inc
> +++ b/meta-arm/recipes-security/optee/optee-os.inc
> @@ -46,12 +46,6 @@ do_install() {
>      #install core in firmware
>      install -d ${D}${nonarch_base_libdir}/firmware/
>      install -m 644 ${B}/core/*.bin ${B}/core/tee.elf ${D}${nonarch_base_libdir}/firmware/
> -
> -    #install TA devkit
> -    install -d ${D}${includedir}/optee/export-user_ta/
> -    for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
> -        cp -aR $f ${D}${includedir}/optee/export-user_ta/
> -    done
>  }
>
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> @@ -66,7 +60,6 @@ addtask deploy before do_build after do_install
>  SYSROOT_DIRS += "${nonarch_base_libdir}/firmware"
>
>  FILES:${PN} = "${nonarch_base_libdir}/firmware/"
> -FILES:${PN}-dev = "${includedir}/optee/"
>
>  # note: "textrel" is not triggered on all archs
>  INSANE_SKIP:${PN} = "textrel"
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2362): https://lists.yoctoproject.org/g/meta-arm/message/2362
> Mute This Topic: https://lists.yoctoproject.org/mt/86981076/3616920
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [jdmason@kudzu.us]
> -=-=-=-=-=-=-=-=-=-=-=-
>


Return-Path: <sumit.garg@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0731C43217
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 10:39:09 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.17397.1664793546140212208
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 03 Oct 2022 03:39:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=JDbKIKm9;
 spf=pass (domain: linaro.org, ip: 209.85.218.42,
 mailfrom: sumit.garg@linaro.org)
Received: by mail-ej1-f42.google.com with SMTP id b2so21194947eja.6
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 03 Oct 2022 03:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=UnNuBkgEVLD3Ml/pbhfeIJVDJXnAg6Zl5jt7l3xXJYA=;
        b=JDbKIKm9iOf3QxsEkaV3VvTVLR8TzcdQckbVLq2BB953t65FkuHin/eIAuxRYyEUeF
         x6mkfqIcTJwVwb334GbmWtDNGan+LIeMwRETEPy7dnhsniTGgvHL0Ub4yD9orzJW+ymy
         TYw3CKGZe5i9CkCvL4bqUYmhq8WrI5mryGgljcfRgSfeZYL0dUz1ESr7sWCqe5Leakpr
         FBDjtTedUNOTNRsVvO067FfdIxuhDsogOiI9ZqfjbH0iQAVWFkF6WqV625OhAZ9lL99f
         8lGb+W5CItgt+iQv6XoK8YktPUpvynMtFgPuFaTH9sfAsHF4cdKARmoQJsH9lGoZ6++q
         5jiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=UnNuBkgEVLD3Ml/pbhfeIJVDJXnAg6Zl5jt7l3xXJYA=;
        b=KeeM1imzdp9IWHSw56rNNPQwJCwqp0Vr05VEXaYuqgj0W6vY50zfBMPbXC6wbozcUd
         iOp1L4AFmvgGPYRhteJk/C4H/vw68+1hpyT3R9VooduDfsUydVjjjnpymXj/sB2lErfO
         q2gzH2P2xcKaDxIe9lc7Hm2XiJTtqmhfipJzmWxpaU2DVeE3FqqMX1sxk0VyGC+o35tn
         NVKAQDEUyc06ODzX8d1a+YutWZ7ycMRZk9iVQCZ/lt+zoehC0HR/zH04n9n7n8BPZ9zL
         kEY6Pv4KxAlX0xc+E1UsAB703osCkHP76tlaPOrafpAx5Qi2nQZI4HCqJ08sz4xhNWKx
         aMlg==
X-Gm-Message-State: ACrzQf1iLN3p2uhXz4+ckI0TtJLzoSYpwu7uvb1+uLXwM1OKCBzrBQgz
	ybK5wAohufM8vQTCp0AKqYGA0dWaIG7kgI8fWepKQg==
X-Google-Smtp-Source: 
 AMsMyM7ao8b0RtzGhkNnRjmrT/zznXlTw8K72u2KHJd/N8wWFYHYxuBlDeN6U6Oj+mEg7wZay5L4DQ85HCzMIAgzdTA=
X-Received: by 2002:a17:906:9753:b0:787:8e6a:103c with SMTP id
 o19-20020a170906975300b007878e6a103cmr14746370ejy.337.1664793544007; Mon, 03
 Oct 2022 03:39:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220926071605.123085-1-sumit.garg@linaro.org>
 <20220926071605.123085-2-sumit.garg@linaro.org>
 <20220927233546.GX18429@denix.org>
In-Reply-To: <20220927233546.GX18429@denix.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 3 Oct 2022 16:08:52 +0530
Message-ID: 
 <CAFA6WYNkJ3F9ReeM1oN13r=e8+ZyZ8QPoKBchev8_t7TdZkbxQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] external-arm-toolchain: Enable 11.3.rel1 support
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org, jon.mason@arm.com, ross.burton@arm.com,
	daniel.thompson@linaro.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 03 Oct 2022 10:39:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3890

Hi Denys,

Apologies for the delayed response as I was on leave for the last few days.

On Wed, 28 Sept 2022 at 05:05, Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Mon, Sep 26, 2022 at 12:46:05PM +0530, Sumit Garg wrote:
> > Enable support for 11.3.rel1 binary toolchain release. Also, update CI
> > to use it.
> >
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
>
> Well, the good news is this patch series does build and I was about to send
> out my Tested-by:

Thanks for testing it.

>
> But, I think, there's quite a mess in the naming/versioning area. See below...
>

Yeah I understand your concerns below but this has been caused by
renaming of toolchain releases from Arm here [1], so we need to adapt
accordingly:

11.2-2022.02 -> 11.3.Rel1

[1] https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads

>
> > ---
> >  ci/get-binary-toolchains                       | 18 +++++++++---------
> >  .../external-arm-toolchain-versions.inc        |  7 +++++--
> >  2 files changed, 14 insertions(+), 11 deletions(-)
> >
> > diff --git a/ci/get-binary-toolchains b/ci/get-binary-toolchains
> > index bfdd8c57..ed334bf3 100755
> > --- a/ci/get-binary-toolchains
> > +++ b/ci/get-binary-toolchains
> > @@ -2,7 +2,7 @@
> >  set -u
> >
> >  HOST_ARCH=$(uname -m)
> > -VER="11.2-2022.02"
> > +VER="11.3.rel1"
>
> Here, it says 11.3.rel1 (note lower case)
>

It comes from the toolchain download path being:

https://developer.arm.com/-/media/Files/downloads/gnu/11.3.rel1/binrel/arm-gnu-toolchain-11.3.rel1-x86_64-aarch64-none-linux-gnu.tar.xz

>
> >  DOWNLOAD_DIR=$1
> >  TOOLCHAIN_DIR=$2
>
> <skip>
>
> > -# Extract the YYYY.MM version
> > +# Extract the YYYY.MM or release version
> >  def eat_get_main_version(d):
> >      version = eat_get_version(d)
> >      bb.debug(2, 'Trying for parse version info from: %s' % version)
> >      if version != 'UNKNOWN':
> > -        if version.split()[4] == '(GNU':
> > +        if version.split()[4] == '(Arm':
> > +            # gcc version 11.3.1 20220712 (Arm GNU Toolchain 11.3.Rel1)
> > +            return version.split()[7].split(')')[0]
>
> Here, it ends up picking up the uppercase version and external-arm-toolchain
> package ends up getting "11.3.Rel1" version, which doesn't sort well with the
> package feed already containing previous versions like 2018.11, 2019.12 and
> 2022.02
>

As I mentioned above, we need to adapt to the Arm toolchain release
naming convention.

> Moreover, gcc now builds a package versioned as "arm-11.3-r2022.08", so it's
> all over the place.

How about following additional changes to bring consistency?

diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3.inc
b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3.inc
index 8eba959..15a87d8 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3.inc
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3.inc
@@ -10,9 +10,7 @@ CVE_VERSION = "11.3"

 BINV = "11.3.1"

-MMYY = "22.08"
-RELEASE = "20${MMYY}"
-PR = "r${RELEASE}"
+PR = "Rel1"

> Not sure where ARM_GCC_SUB_VERSION comes into play,
> certainly not in the package version.

It's currently only used in toolchain source download path which uses lowercase:

BASEURI ?= "https://developer.arm.com/-/media/Files/downloads/gnu/${ARM_GCC_VERSION}.${ARM_GCC_SUB_VERSION}/srcrel/arm-gnu-toolchain-src-snapshot-${ARM_GCC_VERSION}.${ARM_GCC_SUB_VERSION}.tar.xz"

>
> Should we try to standardize/unify these versioning mess here? I'd be happy to
> stick to 2022.08 notation, if possible...
>

The 2022.08 isn't embedded within the toolchain build version: "gcc
version 11.3.1 20220712 (Arm GNU Toolchain 11.3.Rel1)". So I am not
sure if there is any alternative location within the pre-built
toolchain to provide "2022.08" info.

-Sumit

>
> > +        elif version.split()[4] == '(GNU':
> >              # gcc version 9.2.1 20191025 (GNU Toolchain for the A-profile Architecture 9.2-2019.12 (arm-9.10))
> >              # gcc version 8.2.1 20180802 (GNU Toolchain for the A-profile Architecture 8.2-2018.11 (arm-rel-8.26))
> >              return version.split()[10].split('-')[1]
> > --
> > 2.17.1
> >
>
> --
> Regards,
> Denys Dmytriyenko <denis@denix.org>
> PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
> Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964


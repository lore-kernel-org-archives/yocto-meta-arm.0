Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B51FAC433FE
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 13:14:57 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web08.10336.1664889290186869090
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Oct 2022 06:14:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=DlIKYHR2;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.176,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f176.google.com with SMTP id s18so8067491qtx.6
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Oct 2022 06:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=EhVDqFf6j/oOiUm5013UufZYeW7558OBoR2dEuqNa/k=;
        b=DlIKYHR2ItJhWAIa62d4Jo74eIJfbsdNdKjkFi7iFNPFVdNP9uY43CiNIWq8cAbJkp
         pJ9rJIYTaoao699yS/Rbqd8aqD8+s2kFkVdgDp32PfOmwH6cArDGxPS4ELj0OAaiQhlH
         UVVY19RxFscMON74pqHTj4NnHrlxh+dT2nJKUOnkxXXTjLrAyFnAMVYT2vr5P4UnFuZ9
         bZFeOYKHDslQzz7wpO4bSLB6o7f61OS5ateUgI9Mpf6Q2yhmZBJF/lXy3C97vufUzd9Q
         APZJK4FRCUZoJ9kEitioPlrK03HygXFSLQ6Kk0WLfWAjyQNjPn0FAGkMsVMuVWz5bhZ2
         /brg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=EhVDqFf6j/oOiUm5013UufZYeW7558OBoR2dEuqNa/k=;
        b=f4W6N9qqy9zjNBz9fE4yxFjB/jBXspx7Vp3yMi/L8a0WYSu1fZptqkyRZA1Lt86I0M
         jFbXmFxye4LpiM0KFJ6PMHDrY49Cj7Qi+2ps2DMa/ENpqlNoWJInqKkeId3UvM3S5dY0
         MwfCAGVH5asyy2HCF1h37JN5I1GtiWxOS/WnP39/nvj8BwnhPMFAiq3B04sIbDWb2MQP
         14wrCHXNeknH1D3Y4JsBskjcc3J0woVogiZImxqokw7nrbLZX/5digX+UnPVIInx65aU
         OeujDtKBR6BF1T/U5jFvm6E8kOh7xmPXae43+FG9qUVh/VU0ZZJ/XuI4c1twX3W+nVgR
         t23w==
X-Gm-Message-State: ACrzQf3i5qPjHguhjmwWm55QqKIdzDQ0Phgmq+CG24iwexc6Qgvg0Vq1
	aWvB0dclD6N9g4HvNkF7JbL9KCPCaDKC0WMa
X-Google-Smtp-Source: 
 AMsMyM5ZLYnl7AWtlaszXiKI4uJ+jOgJx3FftkaNEAEalmPAEV1Zitv1TcqfBqLHGSR0fanFWabHQA==
X-Received: by 2002:ac8:578c:0:b0:35c:d9fe:98f7 with SMTP id
 v12-20020ac8578c000000b0035cd9fe98f7mr19196208qta.360.1664889289219;
        Tue, 04 Oct 2022 06:14:49 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 h13-20020a05620a21cd00b006cf36d46902sm13312663qka.66.2022.10.04.06.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 06:14:48 -0700 (PDT)
Date: Tue, 4 Oct 2022 09:14:46 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: Denys Dmytriyenko <denis@denix.org>, meta-arm@lists.yoctoproject.org,
	jon.mason@arm.com, ross.burton@arm.com, daniel.thompson@linaro.org
Subject: Re: [PATCH 2/2] external-arm-toolchain: Enable 11.3.rel1 support
Message-ID: <Yzwxxt/TtTeZOlM9@kudzu.us>
References: <20220926071605.123085-1-sumit.garg@linaro.org>
 <20220926071605.123085-2-sumit.garg@linaro.org>
 <20220927233546.GX18429@denix.org>
 <CAFA6WYNkJ3F9ReeM1oN13r=e8+ZyZ8QPoKBchev8_t7TdZkbxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAFA6WYNkJ3F9ReeM1oN13r=e8+ZyZ8QPoKBchev8_t7TdZkbxQ@mail.gmail.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 04 Oct 2022 13:14:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3916

On Mon, Oct 03, 2022 at 04:08:52PM +0530, Sumit Garg wrote:
> Hi Denys,
> 
> Apologies for the delayed response as I was on leave for the last few days.
> 
> On Wed, 28 Sept 2022 at 05:05, Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > On Mon, Sep 26, 2022 at 12:46:05PM +0530, Sumit Garg wrote:
> > > Enable support for 11.3.rel1 binary toolchain release. Also, update CI
> > > to use it.
> > >
> > > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> >
> > Well, the good news is this patch series does build and I was about to send
> > out my Tested-by:
> 
> Thanks for testing it.
> 
> >
> > But, I think, there's quite a mess in the naming/versioning area. See below...
> >
> 
> Yeah I understand your concerns below but this has been caused by
> renaming of toolchain releases from Arm here [1], so we need to adapt
> accordingly:
> 
> 11.2-2022.02 -> 11.3.Rel1
> 
> [1] https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads
> 
> >
> > > ---
> > >  ci/get-binary-toolchains                       | 18 +++++++++---------
> > >  .../external-arm-toolchain-versions.inc        |  7 +++++--
> > >  2 files changed, 14 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/ci/get-binary-toolchains b/ci/get-binary-toolchains
> > > index bfdd8c57..ed334bf3 100755
> > > --- a/ci/get-binary-toolchains
> > > +++ b/ci/get-binary-toolchains
> > > @@ -2,7 +2,7 @@
> > >  set -u
> > >
> > >  HOST_ARCH=$(uname -m)
> > > -VER="11.2-2022.02"
> > > +VER="11.3.rel1"
> >
> > Here, it says 11.3.rel1 (note lower case)
> >
> 
> It comes from the toolchain download path being:
> 
> https://developer.arm.com/-/media/Files/downloads/gnu/11.3.rel1/binrel/arm-gnu-toolchain-11.3.rel1-x86_64-aarch64-none-linux-gnu.tar.xz
> 
> >
> > >  DOWNLOAD_DIR=$1
> > >  TOOLCHAIN_DIR=$2
> >
> > <skip>
> >
> > > -# Extract the YYYY.MM version
> > > +# Extract the YYYY.MM or release version
> > >  def eat_get_main_version(d):
> > >      version = eat_get_version(d)
> > >      bb.debug(2, 'Trying for parse version info from: %s' % version)
> > >      if version != 'UNKNOWN':
> > > -        if version.split()[4] == '(GNU':
> > > +        if version.split()[4] == '(Arm':
> > > +            # gcc version 11.3.1 20220712 (Arm GNU Toolchain 11.3.Rel1)
> > > +            return version.split()[7].split(')')[0]
> >
> > Here, it ends up picking up the uppercase version and external-arm-toolchain
> > package ends up getting "11.3.Rel1" version, which doesn't sort well with the
> > package feed already containing previous versions like 2018.11, 2019.12 and
> > 2022.02
> >
> 
> As I mentioned above, we need to adapt to the Arm toolchain release
> naming convention.
> 
> > Moreover, gcc now builds a package versioned as "arm-11.3-r2022.08", so it's
> > all over the place.
> 
> How about following additional changes to bring consistency?
> 
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3.inc
> b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3.inc
> index 8eba959..15a87d8 100644
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3.inc
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.3.inc
> @@ -10,9 +10,7 @@ CVE_VERSION = "11.3"
> 
>  BINV = "11.3.1"
> 
> -MMYY = "22.08"
> -RELEASE = "20${MMYY}"
> -PR = "r${RELEASE}"
> +PR = "Rel1"

I'm going to pull in the patches as they currently are.  Let's do
whatever fix-ups you two agree on with a follow-on patch.

Thanks,
Jon

> 
> > Not sure where ARM_GCC_SUB_VERSION comes into play,
> > certainly not in the package version.
> 
> It's currently only used in toolchain source download path which uses lowercase:
> 
> BASEURI ?= "https://developer.arm.com/-/media/Files/downloads/gnu/${ARM_GCC_VERSION}.${ARM_GCC_SUB_VERSION}/srcrel/arm-gnu-toolchain-src-snapshot-${ARM_GCC_VERSION}.${ARM_GCC_SUB_VERSION}.tar.xz"
> 
> >
> > Should we try to standardize/unify these versioning mess here? I'd be happy to
> > stick to 2022.08 notation, if possible...
> >
> 
> The 2022.08 isn't embedded within the toolchain build version: "gcc
> version 11.3.1 20220712 (Arm GNU Toolchain 11.3.Rel1)". So I am not
> sure if there is any alternative location within the pre-built
> toolchain to provide "2022.08" info.
> 
> -Sumit
> 
> >
> > > +        elif version.split()[4] == '(GNU':
> > >              # gcc version 9.2.1 20191025 (GNU Toolchain for the A-profile Architecture 9.2-2019.12 (arm-9.10))
> > >              # gcc version 8.2.1 20180802 (GNU Toolchain for the A-profile Architecture 8.2-2018.11 (arm-rel-8.26))
> > >              return version.split()[10].split('-')[1]
> > > --
> > > 2.17.1
> > >
> >
> > --
> > Regards,
> > Denys Dmytriyenko <denis@denix.org>
> > PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
> > Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
> 


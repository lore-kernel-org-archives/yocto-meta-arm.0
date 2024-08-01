Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5A6DC3DA4A
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 05:43:14 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.61716.1722490993462593762
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 31 Jul 2024 22:43:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=un6aG5gG;
 spf=pass (domain: linaro.org, ip: 209.85.167.52, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52fc4388a64so10968850e87.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 31 Jul 2024 22:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722490992; x=1723095792; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=utOHZF/sfmPBbmSulKTSB7Q6mttubqcqO+j8UsNoSfE=;
        b=un6aG5gGuhNZ6LHfJn7+U4H49qJgxifZYGIL016dMXeqfidukuXYANT1EoWNs04qI2
         3ts6iO27JwGYJQbf0Z+Indq9+an4GMPYlXXvksASyLgJly1bh7WM7fyf7mj50mIqAxR7
         scr1dyCWrYX+chgUkvsQIpXYTb5T1n0mcrqHbGGplhYKHn/k19heF/yFALXMSvgX0jyB
         /Bqi3BzcbttF8MzVTv2ITfS1t7+sSNOJmJbNg6f9VqnVrsNv3H5AiyjD3qsPfpXlyj+f
         dEtLQNn6lgT4MMSmbFJF9OZAIZBLZAwDLButYsVuXqjwPQsOkz+rBKE3AkI9i9istmc0
         VnmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722490992; x=1723095792;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=utOHZF/sfmPBbmSulKTSB7Q6mttubqcqO+j8UsNoSfE=;
        b=SCdNyeSpwKtE9o0QdG+UdF+WL7YjUL/oNkyCBOEL9sSIspg2KBFcAbjFmGQEFFMPBC
         5Bb6/agcwmSvmcoUlu2wxpbrKnN9KLRHiZuDihOtbE31fjuaz47jk9vqJe3t4hTiV6cv
         L15g9FRD+uPJQWnJVE1Sxo+lPH/WUtCjAnSQ5RCyxsxtt3RsN9CbFZgzm9VZa50GWD05
         qYVetwS6kjI/FUK+ozzpykfkkBuMDRhm0+9LCIYHUXmmWyvcj+TyW9Nft+vLm8E1I+Dq
         ZnN0xPFK0+f9XNmep4aW3QkZXjXiIlOr/a1TMlBuEIFhylN+ykO6SuVwZQ4/n4w9J3Bi
         r9bw==
X-Gm-Message-State: AOJu0Yxaz9LDvJfMcLvBXWEIbkqxf9jtDYSCRO8AAPdQZNS50Ef/7hgh
	1JQzHrt5b0aJuC0XQDmYeshh5h0emx7w6aDRc0f6UwsBjxCT3rZfSq2/0MhMe50=
X-Google-Smtp-Source: AGHT+IGFonRnghLDE/p9e9GPyaZtnVUU7SqjUO3uOmf/I5KX7+PuDsKFs8IlksdR26J0DIKYACLr5w==
X-Received: by 2002:ac2:5dc1:0:b0:52e:f950:31f7 with SMTP id 2adb3069b0e04-530b61b847amr603522e87.28.1722490991307;
        Wed, 31 Jul 2024 22:43:11 -0700 (PDT)
Received: from nuoska (drt4d6yyyyyyyyyyyyhlt-3.rev.dnainternet.fi. [2001:14ba:7430:3d00::193])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5bc3e82sm2470755e87.7.2024.07.31.22.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 22:43:10 -0700 (PDT)
Date: Thu, 1 Aug 2024 08:43:08 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [PATCH 1/4] optee-os: asm debug prefix fixes
Message-ID: <ZqsgbHBa4KORmdRc@nuoska>
References: <20240718134152.38721-1-mikko.rapeli@linaro.org>
 <ZqizD72goWGzQjGw@nuoska>
 <ZqmrjL-EKud5PJSn@kudzu.us>
 <ZqnbTSo2JxV2m6wr@nuoska>
 <Zqo0r0wEzuD2LpQj@kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zqo0r0wEzuD2LpQj@kudzu.us>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 01 Aug 2024 05:43:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5940

Hi,

On Wed, Jul 31, 2024 at 08:57:19AM -0400, Jon Mason wrote:
> On Wed, Jul 31, 2024 at 09:35:57AM +0300, Mikko Rapeli wrote:
> > Hi,
> > 
> > On Tue, Jul 30, 2024 at 11:12:12PM -0400, Jon Mason wrote:
> > > On Tue, Jul 30, 2024 at 12:31:59PM +0300, Mikko Rapeli wrote:
> > > > Hi,
> > > > 
> > > > Is there something in these patches that is not ok for merging?
> > > 
> > > Sorry for the delay.
> > > 
> > > Something in CI was breaking and I was trying to isolate it to the
> > > individual patches, but the CI I'm running that is publicly available
> > > has been having issues (which I think are now resolved) and the
> > > internal one has been bogged down with a large number of reviews.
> > > 
> > > v2 that you just sent is now in master-next and hopefully will be
> > > happy when I get up tomorrow morning.
> > 
> > Ok then these optee changes are likely not causing issues, good to know.
> > 
> > I'll wait for the master branch update, can't see master-next changes.
> 
> I only do master-next (and actually all of the '-next' branches) on my
> personal gitlab.  I do this because I'm constantly applying and
> removing patches from it.  You can see it at
> https://gitlab.com/jonmason00/meta-arm/-/pipelines
> 
> I do this in an attempt to have our CI being public and to make it
> easier for people to see when there are issues.

Sadly I see that optee-test/xtest timed out on qemuarm-secureboot

https://gitlab.com/jonmason00/meta-arm/-/jobs/7472950337

and buildpaths QA test failing on corstone1000 with musl

https://gitlab.com/jonmason00/meta-arm/-/jobs/7472950196

2024-08-01 02:23:30 - ERROR    - Command "/builds/jonmason00/meta-arm/work/build$ /builds/jonmason00/meta-arm/work/poky/bitbake/bin/bitbake -c build arm-systemready-firmware" failed
--- Error summary ---
ERROR: mc:firmware:optee-os-4.2.0-r0 do_package_qa: QA Issue: File /lib/firmware/tee.elf in package optee-os contains reference to TMPDIR [buildpaths]
ERROR: mc:firmware:optee-os-4.2.0-r0 do_package_qa: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /builds/jonmason00/meta-arm/work/build/tmp-musl_corstone1000-fvp/work/corstone1000_fvp-oe-linux-musl/optee-os/4.2.0/temp/log.do_package_qa.65026
ERROR: Task (mc:firmware:/builds/jonmason00/meta-arm/work/build/../../meta-arm/recipes-security/optee/optee-os_4.2.0.bb:do_package_qa) failed with exit code '1'
2024-08-01 02:23:30 - ERROR    - Command "/builds/jonmason00/meta-arm/work/poky/bitbake/bin/bitbake -c build arm-systemready-firmware" failed with error 1

https://gitlab.com/jonmason00/meta-arm/-/jobs/7472950159

2024-08-01 02:04:59 - ERROR    - ERROR: mc:firmware:optee-os-4.2.0-r0 do_package_qa: QA Issue: File /lib/firmware/tee.elf in package optee-os contains reference to TMPDIR [buildpaths]
2024-08-01 02:04:59 - ERROR    - ERROR: mc:firmware:optee-os-4.2.0-r0 do_package_qa: Fatal QA errors were found, failing task.
2024-08-01 02:04:59 - ERROR    - ERROR: Logfile of failure stored in: /builds/jonmason00/meta-arm/work/build/tmp-musl_corstone1000-fvp/work/corstone1000_fvp-oe-linux-musl/optee-os/4.2.0/temp/log.do_package_qa.111505

I'll try to reproduce these and fix them. Sorry for not testing these
beforehand. I was only testing with:

$ kas build ci/qemuarm64-secureboot.yml:ci/testimage.yml

and that clearly is not enough for all variants.

Cheers,

-Mikko

